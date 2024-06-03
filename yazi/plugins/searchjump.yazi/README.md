# searchjump.yazi

A Yazi plugin which the behavior consistent with flash.nvim in Neovim, allow search str to generate lable to jump.




https://github.com/DreamMaoMao/searchjump.yazi/assets/30348075/eec237c9-91be-4b6e-9db8-a84eb419cae5






> [!NOTE]
> The latest main branch of Yazi is required at the moment.


## Install

### Linux

```bash
git clone https://github.com/DreamMaoMao/searchjump.yazi.git ~/.config/yazi/plugins/searchjump.yazi
```

### Windows

With `Powershell` :

```powershell
if (!(Test-Path $env:APPDATA\yazi\config\plugins\)) {mkdir $env:APPDATA\yazi\config\plugins\}
git clone https://github.com/DreamMaoMao/searchjump.yazi.git $env:APPDATA\yazi\config\plugins\searchjump.yazi
```

> [!NOTE]
> The main branch version does not support chinese jump, if you want to use the chinese support version, you can use the Chinese branch

```
git clone -b chinese https://github.com/DreamMaoMao/searchjump.yazi.git ~/.config/yazi/plugins/searchjump.yazi

```

## Usage

set shortcut key to toggle searchjump mode in `~/.config/yazi/keymap.toml`. for example set `i` to toggle searchjump mode

```toml
[[manager.prepend_keymap]]
on   = [ "i" ]
run = "plugin searchjump"
desc = "searchjump mode"
```

## opts setting (~/.config/yazi/init.lua)
```lua
require("searchjump"):setup {
	opt_unmatch_fg = "#928374",
    opt_match_str_fg = "#000000",
    opt_match_str_bg = "#73AC3A",
    opt_lable_fg = "#EADFC8",
    opt_lable_bg = "#BA603D"
}
```

When you see some character singal lable in right of the entry.
Press the key of the character will jump to the corresponding entry
