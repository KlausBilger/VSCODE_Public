# FITS VScode Profile
# 2020-02-13 BKP / WP
Function prompt {
    # .Description
    # This custom version of the PowerShell prompt will present a colorized location value based on the current provider. It w
    # .Link
    # https://go.microsoft.com/fwlink/?LinkID=225750
    # .ExternalHelp System.Management.Automation.dll-help.xml
    function Get-LastCmdTime {
        $diffPromptTime = $null
        $lastCmd = Get-History -Count 1
        if ($lastCmd -ne $null) {
               ("{0:HH\:mm\:ss\.ffff}" -f ([datetime](New-TimeSpan -end $lastCmd.EndExecutionTime -start $lastCmd.StartExecutionTime).Ticks))
        }
    }
    $user = [Security.Principal.WindowsIdentity]::GetCurrent()
    if ( (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
        $adminfg = "Red"
    }
    else {
        $adminfg = $host.ui.rawui.ForegroundColor
    }
    Switch ((get-location).provider.name) {
        "FileSystem" { $fg = "green" }
        "Registry" { $fg = "magenta" }
        "wsman" { $fg = "cyan" }
        "Environment" { $fg = "yellow" }
        "Certificate" { $fg = "darkcyan" }
        "Function" { $fg = "gray" }
        "alias" { $fg = "darkgray" }
        "variable" { $fg = "darkgreen" }
        "CMSite" { $fg = "darkyellow" }
        Default { $fg = $host.ui.rawui.ForegroundColor }
    }

    if ($adminfg -eq -1) { $adminfg = 'DarkGray' }

    if ($fg -eq -1) { $adminfg = 'DarkGray' }

    Write-host '[' -NoNewline
    Write-Host "$((Get-Date).timeofday.tostring().substring(0,8))-" -foregroundcolor cyan  -NoNewline
    write-host "$(Get-LastCmdTime)" -NoNewline -ForegroundColor Yellow
    Write-Host "] " -nonewline
    Write-Host "PS " -nonewline -ForegroundColor $adminfg
    Write-Host "$($executionContext.SessionState.Path.CurrentLocation)" -foregroundcolor $fg -nonewline
    Write-Output "$('>' * ($nestedPromptLevel + 1)) "
}
$host.PrivateData.ErrorForegroundColor = 'Yellow'
write-host "Hallo $env:UserName on $env:ComputerName" -ForegroundColor Green -NoNewline
$user = [Security.Principal.WindowsIdentity]::GetCurrent()
if ( (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    write-host " as ADMIN" -foregroundcolor yellow -NoNewline
}
write-host " (v2020-02-12)" -ForegroundColor DarkGray
#region
#Regin Systemspezifische Variablen automatisch setzen
	write-host "nothing at the moment to set."
#endregion

Get-Date
