# Testing This Is Needed Before Moving Forward #

## Firmware_updater

- This is a Firmware updater built with powershell to update drayteks firmware 
- Command to run Invoke-Expression ".\draytek.ps1"

### Bugs

### 24/04/2023 ###

1. Further testing is needed as looks like code is running okay 
2. Window style is set to none so the only way to close the Code is through the task bar

 ### Suggestions

### 24/04/2023 ###

- Use parameter validation: When you define a function, it's good practice to validate the input parameters to make sure they're in the expected format and range. You can use parameter attributes like [Parameter(Mandatory=$true)] and [ValidateRange()] to ensure that the input is valid.

- Use error handling: Your code doesn't currently include any error handling. If something goes wrong during the execution of a command, the script will simply terminate. You can use try-catch blocks to handle errors and provide appropriate feedback to the user.

- Add comments: It's a good practice to add comments to your code to explain what each section does. This makes it easier for others to understand your code and helps you to remember why you wrote the code in a particular way.

- Modularize your code: You can break your code into smaller functions or modules that perform specific tasks. This makes the code more readable, maintainable, and easier to test.

- Use a logging module: Instead of writing to a log file manually, you can use a logging module like Write-Log or Log4Net to manage your logs. These modules offer a lot of features, such as log rotation, log levels, and log filtering.

- Use a configuration file: Instead of hard-coding configuration parameters like log file paths and backup file paths, you can use a configuration file that stores these values. This makes it easier to manage your settings and modify them as needed.

- Use a build tool: You can use a build tool like PSake or Invoke-Build to automate your build and deployment process. These tools allow you to define tasks, dependencies, and parameters for your script and run them in a consistent way.

## Testing 

### 25/04/2023 ###
- First test on Draytek Vigor2925n-plus
- Configure Draytek
- Downloading backups
- Updating Firmware

### 26/04/2023 ###
- Update downloading backups to use a https protocol.
- Added new function 
- Added Icon

#### Result

### 25/04/2023 ###
- Downloading backups - fail - Uses http protocol
- Updating Firmware - fail - path

### 26/04/2023 ###
- Icon failed to load

#### Outcome

### 25/04/2023 ###
- Error downloading backup configuration: The server committed a protocol violation. Section=ResponseHeader Detail=Header name is invalid (downloading backups)
- Error updating firmware could not find a part of the path 'C:\temp\firmware.bin'

### 26/04/2023 ###
- Can't open cause no image has been set

## Images

![Image of GUI](https://file%2B.vscode-resource.vscode-cdn.net/c%3A/Users/jonathankeefe.ASTONBERKELEY/OneDrive%20-%20Aston%20Berkeley%20Systems%20Ltd/Pictures/Screenshots/Screenshot%202023-04-24%20140945.png?version%3D1682341856571)