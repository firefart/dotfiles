# WSL Config

## Setup
- Install Fonts: https://github.com/microsoft/cascadia-code/releases
- Install powerline-go: `go get -u github.com/justjanne/powerline-go`

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

## Windows Terminal Config:
```json
{
    "closeOnExit" : true,
    "fontFace" : "Cascadia Code PL",
    "fontSize" : 10,
    "guid" : "{2c4de342-38b7-51cf-b940-2309a097f518}",
    "hidden": false,
    "historySize" : 9001,
    "icon" : "ms-appx:///ProfileIcons/{9acb9455-ca41-5af7-950f-6bca1bc9722f}.png",
    "name" : "Ubuntu",
    "source": "Windows.Terminal.Wsl",
    "startingDirectory" : "%USERPROFILE%/code"
}
```

## Bashrc
```bash
export GPG_TTY=$(tty)
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export ANSIBLE_NOCOWS=1
export GOPATH=$HOME/go
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -path-aliases /c/Users/firefart/code=@CODE,/c/Users/firef/code=@CODE -error $?)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
```
