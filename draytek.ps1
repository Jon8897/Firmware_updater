# Load GUI from XAML
[xml]$xaml = Get-Content "DraytekUpdaterGUI.xaml"
$reader = New-Object System.Xml.XmlNodeReader($xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# Get UI elements
$txtDeviceIP = $window.FindName("txtDeviceIP")
$txtUsername = $window.FindName("txtUsername")
$txtPassword = $window.FindName("txtPassword")
$txtFirmwareUrl = $window.FindName("txtFirmwareUrl")
$btnDownloadBackup = $window.FindName("btnDownloadBackup")
$btnUpdateFirmware = $window.FindName("btnUpdateFirmware")

# Event handlers
$btnDownloadBackup.Add_Click({
    # Set variables from GUI input
    $deviceIP = $txtDeviceIP.Text
    $deviceUsername = $txtUsername.Text
    $devicePassword = $txtPassword.Password
    $firmwareUrl = $txtFirmwareUrl.Text

    # Configuration
$firmwareUrl = "https://www.example.com/path/to/firmware.bin" # Replace with the correct firmware URL
$downloadPath = "C:\temp\firmware.bin"
$deviceIP = "192.168.1.1" # Replace with the IP address of your Draytek device
$deviceUsername = "admin" # Replace with the username for your Draytek device
$devicePassword = "password" # Replace with the password for your Draytek device
$logFile = "C:\temp\DraytekUpdater.log"
$backupConfigPath = "C:\temp\draytek_config_backup.cfg"

function Get-BackupConfiguration {
    param (
        [string]$deviceIP,
        [System.Management.Automation.PSCredential]$deviceCredential,
        [string]$backupConfigPath
    )

    # Download backup configuration
    Invoke-WebRequest -Uri "http://$deviceIP/cgi-bin/export_config.exp" -Credential $deviceCredential -OutFile $backupConfigPath
    # Download backup configuration
    Get-BackupConfiguration -deviceIP $deviceIP -deviceCredential $deviceCredential -backupConfigPath $backupConfigPath
}
})

$btnUpdateFirmware.Add_Click({
    # Set variables from GUI input
    $deviceIP = $txtDeviceIP.Text
    $deviceUsername = $txtUsername.Text
    $devicePassword = $txtPassword.Password
    $firmwareUrl = $txtFirmwareUrl.Text

    # Create PSCredential object
    $deviceCredential = New-Object System.Management.Automation.PSCredential($deviceUsername, ($devicePassword | ConvertTo-SecureString -AsPlainText -Force))

    # Download firmware file
    Invoke-WebRequest -Uri $firmwareUrl -OutFile $downloadPath

    # Update firmware
    Invoke-WebRequest -Uri "http://$deviceIP/cgi-bin/upgrade.cgi" -Credential $deviceCredential -Method POST -InFile $downloadPath -ContentType "application/octet-stream"

    # Check device firmware version
    $deviceInfo = Invoke-WebRequest -Uri "http://$deviceIP/cgi-bin/Maintenance/device_status_info" -Credential $deviceCredential

    # Extract firmware version from the response
    $deviceFirmwareVersion = $deviceInfo.Content -replace '(?s).*Firmware Version\s*:\s*([^\s]*).*','$1'

    # Log results
    $logEntry = "$(Get-Date) - Firmware updated to version: $deviceFirmwareVersion"
    Add-Content -Path $logFile -Value $logEntry
})

# Create PSCredential object
$deviceCredential = New-Object System.Management.Automation.PSCredential($deviceUsername, ($devicePassword | ConvertTo-SecureString -AsPlainText -Force))

# Download backup configuration
Get-BackupConfiguration -deviceIP $deviceIP -deviceCredential $deviceCredential -backupConfigPath $backupConfigPath

# Download firmware file
Invoke-WebRequest -Uri $firmwareUrl -OutFile $downloadPath

# Check device firmware version
$deviceInfo = Invoke-WebRequest -Uri "http://$deviceIP/cgi-bin/Maintenance/device_status_info" -Credential $deviceCredential

# Extract firmware version from the response
$deviceFirmwareVersion = $deviceInfo.Content -replace '(?s).*Firmware Version\s*:\s*([^\s]*).*','$1'

# Compare downloaded firmware version with device firmware version
$isNewerFirmware = $false # Replace with a function that compares firmware versions
if ($isNewerFirmware) {
    # Update Draytek device
    # You may need to refer to the Draytek API or use a different method to update the firmware
    $updateResult = "Firmware updated successfully" # Replace with the actual update result

    # Log results
    $logEntry = "$(Get-Date) - Downloaded firmware version: $downloadedFirmwareVersion - Device firmware version: $deviceFirmwareVersion - Update result: $updateResult"
    Add-Content -Path $logFile -Value $logEntry
} else {
    # Log results
    $logEntry = "$(Get-Date) - Downloaded firmware version: $downloadedFirmwareVersion - Device firmware version: $deviceFirmwareVersion - Update not needed"
    Add-Content -Path $logFile -Value $logEntry
}

# Show GUI
$window.ShowDialog() | Out-Null