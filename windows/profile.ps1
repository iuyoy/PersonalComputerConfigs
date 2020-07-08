# Oh my posh Themes
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Sorin

# Emacs edit mode
Set-PSReadLineOption -EditMode Emacs

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Move cursor to end when using HistorySearch
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Syntax Highlighting
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function ForwardWord


# show function, alias, or cmdlet content, it is like 'which' command in linux
function which {
    if ($args) {
        $temp_command = Get-Command $args[0]; 
        $temp_command; 
        Write-Output("`nDefinition: " + $temp_command.Definition); 
    }
    else {
        Write-Output("List details and definition of any cmdlet, function, or alias. 
Usages: 
  which cmdlet
  which function
  which alias
"); 
    }
}
New-Alias wh which

# open file by default app
New-Alias open Invoke-Item # another alias is ii

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

## Conda
function act { conda activate $args[0] }
function dea { conda deactivate }

## K8s
New-Alias kb kubectl
New-Alias dk docker

## Fast commands
function hosts { code C:\Windows\System32\drivers\etc\hosts }

. {path_to_alias}\git-alias.ps1