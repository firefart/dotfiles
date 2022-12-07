# WSL Config

## Setup
- Install Fonts: https://github.com/microsoft/cascadia-code/releases
- Install powerline-go: `go install github.com/justjanne/powerline-go@latest`

## /etc/wsl.conf
```
[automount]
enabled = true
options = "metadata,umask=2,fmask=11"
# needed for docker mounts
root = /
```

## Change permissions after umask change
```bash
sudo chmod 0664 -R * # rw-rw-r--
sudo find . -type d -exec chmod 0774 {} \; # rwxrwxr--
sudo find . -type f -name *.sh -exec chmod 0774 {} \; # rwxrwxr--
```

## ~/.firefart.zshconfig
```bash
export GPG_TTY=$(tty)
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export ANSIBLE_NOCOWS=1
export GOPATH=$HOME/go
export DOTNET_CLI_TELEMETRY_OPTOUT=1
```

## Terminal Config

```powershell
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "$env:OneDrive\Personal Vault\settings.json" -Force
```
