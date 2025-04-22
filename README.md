# 使用裸仓库管理Dotfiles

这个仓库使用Git裸仓库（bare repository）方法管理dotfiles，可以轻松地在多台机器间同步配置文件。

## 初始设置

### 创建裸仓库

```bash
# 创建裸仓库
git init --bare ~/.dotfiles

# 创建alias以简化操作
echo "alias config='/usr/bin/git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'" >> ~/.zshrc
source ~/.zshrc

# 配置仓库不显示未跟踪文件
config config --local status.showUntrackedFiles no

# 将.dotfiles添加到.gitignore中
echo ".dotfiles" >> ~/.gitignore
```

### 设置Windows配置文件

```bash
# 创建Windows配置文件目录
mkdir ~/.winprofile

# 安装rsync（用于同步文件）
sudo pacman -S rsync

# 复制Windows相关配置文件
cp "/mnt/c/Users/vladelaina/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/Shortcut keys.ahk" ~/.winprofile/shortcut_keys.ahk
cp -r "/mnt/c/Users/vladelaina/.config/wezterm" ~/.winprofile/wezterm
cp -r "/mnt/d/Date/tool/Mouselnc" ~/.winprofile/Mouselnc
```

### 添加文件并提交

```bash
# 添加需要管理的配置文件
config add ~/.zshrc
config add ~/.config/nvim
config add ~/.winprofile

# 初始提交
config commit -m "Initial commit"

# 添加远程仓库
config remote add origin git@github.com:vladelaina/dotfiles.git
config push -u origin main
```

## 日常使用（快捷键con）

```bash
# 同步Windows配置文件到Linux
rsync -u "/mnt/c/Users/vladelaina/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/Shortcut keys.ahk" ~/.winprofile/shortcut_keys.ahk
rsync -ru "/mnt/c/Users/vladelaina/.config/wezterm/" ~/.winprofile/wezterm/
rsync -ru "/mnt/d/Date/tool/Mouselnc/" ~/.winprofile/Mouselnc/

# 提交修改（使用日期时间作为提交信息）
config commit -am "$(date '+%Y-%m-%d %H:%M:%S')"

# 推送到远程仓库
config push -u origin main
```

## 为什么使用裸仓库？

裸仓库方法允许我们直接在主目录中管理文件，无需复制或创建符号链接。这种方法的优点包括：

1. 简化配置文件管理
2. 轻松跟踪更改
3. 方便在多台设备间同步
4. 避免工作目录内的嵌套Git仓库问题

## 在新机器上恢复配置

要在新机器上恢复您的dotfiles，请遵循以下步骤：

```bash
# 克隆仓库
git clone --bare git@github.com:vladelaina/dotfiles.git $HOME/.dotfiles

# 创建alias
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# 备份已存在的配置文件
mkdir -p .config-backup
config checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}

# 检出最新版本
config checkout

# 设置本地仓库不显示未跟踪文件
config config --local status.showUntrackedFiles no
```

