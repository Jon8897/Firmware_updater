# Load GUI from XAML
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName PresentationFramework

[xml]$xaml = Get-Content "DraytekUpdaterGUI.xaml"
$reader = New-Object System.Xml.XmlNodeReader($xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)
Add-Type -AssemblyName PresentationFramework

# Get UI elements
$txtDeviceIP = $window.FindName("txtDeviceIP")
$txtUsername = $window.FindName("txtUsername")
$txtPassword = $window.FindName("txtPassword")
$txtFirmwareUrl = $window.FindName("txtFirmwareUrl")
$btnDownloadBackup = $window.FindName("btnDownloadBackup")
$btnUpdateFirmware = $window.FindName("btnUpdateFirmware")

# Event handlers
$btnDownloadBackup.Add_Click({
    try {  
      # Set variables from GUI input
      $deviceIP = $txtDeviceIP.Text
      $deviceUsername = $txtUsername.Text
      $devicePassword = $txtPassword.Password
      $firmwareUrl = $txtFirmwareUrl.Text

      # Create PSCredential object
      $deviceCredential = New-Object System.Management.Automation.PSCredential($deviceUsername, ($devicePassword | ConvertTo-SecureString -AsPlainText -Force))

      # Configuration
      $logFile = "C:\temp\DraytekUpdater.log"
      $date = Get-date -Format ddMMyyyy
      $backupFolderPath = "C:\temp\draytek_backups\$deviceIP\$date"
      $backupConfigPath = "$backupFolderPath\draytek_config_backup.cfg"
      New-Item -ItemType Directory -Path $backupFolderPath -Force | Out-Null

      # Download backup configuration
      $url = "https://$deviceIP/cgi-bin/export_config.exp"
      Invoke-WebRequest -Uri $url -Credential $deviceCredential -OutFile $backupConfigPath
    }
    catch {
      Write-host "Error downloading backup configuration: $_"
    }
  })

$btnUpdateFirmware.Add_Click({
    try {  
      # Set variables from GUI input
      $deviceIP = $txtDeviceIP.Text
      $deviceUsername = $txtUsername.Text
      $devicePassword = $txtPassword.Password
      $firmwareUrl = $txtFirmwareUrl.Text

      # Create PSCredential object
      $deviceCredential = New-Object System.Management.Automation.PSCredential($deviceUsername, ($devicePassword | ConvertTo-SecureString -AsPlainText -Force))

      # Configuration
      $downloadPath = "C:\temp\firmware.bin"
      $logFile = "C:\temp\DraytekUpdater.log"

      # Download firmware file
      Invoke-WebRequest -Uri $firmwareUrl -OutFile $downloadPath

      # Check if firmware file exists
      if (-not (Test-Path $downloadPath)) {
        throw "Firmware file '$downloadPath' not found"
      }

      # Update firmware
      Invoke-WebRequest -Uri "http://$deviceIP/cgi-bin/upgrade.cgi" -Credential $deviceCredential -Method POST -InFile $downloadPath -ContentType "application/octet-stream"

      # Check device firmware version
      $deviceInfo = Invoke-WebRequest -Uri "http://$deviceIP/cgi-bin/Maintenance/device_status_info" -Credential $deviceCredential

      # Extract firmware version from the response
      $deviceFirmwareVersion = $deviceInfo.Content -replace '(?s).*Firmware Version\s*:\s*([^\s]*).*', '$1'

      # Log results
      $logEntry = "$(Get-Date) - Firmware updated to version: $deviceFirmwareVersion"
      Add-Content -Path $logFile -Value $logEntry
    }
    catch {
      Write-Host "Error updating firmware: $_"
    }
  })

function Get-BackupConfiguration {
  param (
    [string]$deviceIP,
    [System.Management.Automation.PSCredential]$deviceCredential,
    [string]$backupConfigPath
  )

  # Download backup configuration
  Invoke-WebRequest -Uri "http://$deviceIP/cgi-bin/export_config.exp" -Credential $deviceCredential -OutFile $backupConfigPath
}

# Show GUI
$window.ShowDialog() | Out-Null