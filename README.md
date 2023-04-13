# Firmware_updater

- This is a Firmware updater built with powershell to update drayteks firmware 


### Bugs

Unable to find type [Windows.Markup.XamlReader].
At C:\Users\jonathankeefe.ASTONBERKELEY\OneDrive - Aston Berkeley Systems Ltd\Desktop\Projects\git-projects\Firmware_updater\draytek.ps1:4 char:11
+ $window = [Windows.Markup.XamlReader]::Load($reader)
+           ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (Windows.Markup.XamlReader:TypeName) [], RuntimeException
    + FullyQualifiedErrorId : TypeNotFound
 
You cannot call a method on a null-valued expression.
At C:\Users\jonathankeefe.ASTONBERKELEY\OneDrive - Aston Berkeley Systems Ltd\Desktop\Projects\git-projects\Firmware_updater\draytek.ps1:7 char:1
+ $txtDeviceIP = $window.FindName("txtDeviceIP")
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : InvokeMethodOnNull
 
You cannot call a method on a null-valued expression.
At C:\Users\jonathankeefe.ASTONBERKELEY\OneDrive - Aston Berkeley Systems Ltd\Desktop\Projects\git-projects\Firmware_updater\draytek.ps1:8 char:1
+ $txtUsername = $window.FindName("txtUsername")
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : InvokeMethodOnNull
 
You cannot call a method on a null-valued expression.
At C:\Users\jonathankeefe.ASTONBERKELEY\OneDrive - Aston Berkeley Systems Ltd\Desktop\Projects\git-projects\Firmware_updater\draytek.ps1:9 char:1
+ $txtPassword = $window.FindName("txtPassword")
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : InvokeMethodOnNull
 
You cannot call a method on a null-valued expression.
At C:\Users\jonathankeefe.ASTONBERKELEY\OneDrive - Aston Berkeley Systems Ltd\Desktop\Projects\git-projects\Firmware_updater\draytek.ps1:10 char:1
+ $txtFirmwareUrl = $window.FindName("txtFirmwareUrl")
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : InvokeMethodOnNull
 
You cannot call a method on a null-valued expression.
At C:\Users\jonathankeefe.ASTONBERKELEY\OneDrive - Aston Berkeley Systems Ltd\Desktop\Projects\git-projects\Firmware_updater\draytek.ps1:11 char:1
+ $btnDownloadBackup = $window.FindName("btnDownloadBackup")
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : InvokeMethodOnNull
 
You cannot call a method on a null-valued expression.
At C:\Users\jonathankeefe.ASTONBERKELEY\OneDrive - Aston Berkeley Systems Ltd\Desktop\Projects\git-projects\Firmware_updater\draytek.ps1:12 char:1
+ $btnUpdateFirmware = $window.FindName("btnUpdateFirmware")
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : InvokeMethodOnNull
 
You cannot call a method on a null-valued expression.
At C:\Users\jonathankeefe.ASTONBERKELEY\OneDrive - Aston Berkeley Systems Ltd\Desktop\Projects\git-projects\Firmware_updater\draytek.ps1:15 char:1
+ $btnDownloadBackup.Add_Click({
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : InvokeMethodOnNull
 
You cannot call a method on a null-valued expression.
At C:\Users\jonathankeefe.ASTONBERKELEY\OneDrive - Aston Berkeley Systems Ltd\Desktop\Projects\git-projects\Firmware_updater\draytek.ps1:33 char:1
+ $btnUpdateFirmware.Add_Click({
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : InvokeMethodOnNull
 
You cannot call a method on a null-valued expression.
At C:\Users\jonathankeefe.ASTONBERKELEY\OneDrive - Aston Berkeley Systems Ltd\Desktop\Projects\git-projects\Firmware_updater\draytek.ps1:76 char:1
+ $window.ShowDialog() | Out-Null
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : InvokeMethodOnNull
 

 ### Possible fixes

 These errors suggest that the $window variable is null and therefore unable to find the UI elements that are defined using $window.FindName(). This could be due to an issue with loading the XAML file or a problem with the XAML file itself.

 You can try the following steps to troubleshoot the issue:

   - Verify that the XAML file exists in the correct location.
   - Ensure that the XAML file is valid and doesn't contain any syntax errors.
   - Check if the XAML file is set to "Build Action: Resource" in the Visual Studio project properties.
   - Try rebuilding the project to ensure that the XAML file is properly included in the build output.
   - Verify that the XAML namespace is defined correctly in the PowerShell script.
   - Add some debug statements to check the value of $window and see if it is null or not.
