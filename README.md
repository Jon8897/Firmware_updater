# Firmware_updater

- This is a Firmware updater built with powershell to update drayteks firmware 
- Command to run cd "C: path " Invoke-Expression ".\draytek.ps1"

### Bugs

1. The XAML file was named "DraytekUpdaterGUI.xaml" but the root element in the file was not named "DraytekUpdaterGUI". This caused an error when attempting to load the XAML file with the following line of code: **`$window = [Windows.Markup.XamlReader]::Load($reader)`**. To fix this, you can either remove the **`x:Class`** attribute from the root element of the XAML file or rename the root element to "DraytekUpdaterGUI".
2. After loading the XAML file, the script attempted to find several controls using the **`FindName`** method, but these controls were not found. This caused errors when attempting to call methods on these null references. To fix this, ensure that the names of the controls in the XAML file match the names used in the script.
3. There was an error in the script when attempting to add event handlers to the "Download Backup" and "Update Firmware" buttons. The error occurred because the controls were not found and were therefore null. To fix this, ensure that the names of the controls in the XAML file match the names used in the script. Also, make sure that the event handlers are enclosed in braces **`{}`** instead of parentheses **`()`**.
4. Finally, there was an error when attempting to display the window using the **`ShowDialog()`** method. This error occurred because the **`Window`** object was null. This was caused by the errors in the previous steps which prevented the XAML file from being loaded correctly and the controls from being initialized.
 

 ### Possible fixes

 These errors suggest that the $window variable is null and therefore unable to find the UI elements that are defined using $window.FindName(). This could be due to an issue with loading the XAML file or a problem with the XAML file itself.

 You can try the following steps to troubleshoot the issue:

   - Verify that the XAML file exists in the correct location.
   - Ensure that the XAML file is valid and doesn't contain any syntax errors.
   - Check if the XAML file is set to "Build Action: Resource" in the Visual Studio project properties.
   - Try rebuilding the project to ensure that the XAML file is properly included in the build output.
   - Verify that the XAML namespace is defined correctly in the PowerShell script.
   - Add some debug statements to check the value of $window and see if it is null or not.
