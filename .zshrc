# ================================================== 🏡 裸仓库配置管理 (dotfiles) ================================================== 
# 定义裸仓库管理命令
# ================================================== export PATH="$HOME/.local/bin:$PATH"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# 同步并提交配置文件
alias con='
  rsync -u \
    "/mnt/c/Users/vladelaina/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/Shortcut keys.ahk" \
    ~/.winprofile/shortcut_keys.ahk &&

  rsync -ru \
    "/mnt/c/Users/vladelaina/.config/wezterm/" \
    ~/.winprofile/wezterm/ &&

  rsync -ru \
    "/mnt/d/Date/tool/backup/" \
    ~/.winprofile/backup/ &&

  rsync -ru \
    "/mnt/d/Date/rare/Mouselnc/" \
    ~/.winprofile/Mouselnc/ &&
    
  rsync -u \
    "/mnt/d/Date/tool/ublock-static-filters.txt" \
    ~/.winprofile/ublock-static-filters.txt &&

  rsync -u \
    "/mnt/c/Users/vladelaina/.wslconfig" \
    ~/.winprofile/.wslconfig &&

  config commit -am "$(date "+%Y-%m-%d %H:%M:%S")" &&

  config push -u origin main
  config log --oneline --all --decorate --reverse -n 12
'

# 查看配置仓库状态
cs() {
  rsync -u "/mnt/c/Users/vladelaina/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/Shortcut keys.ahk" ~/.winprofile/shortcut_keys.ahk
  rsync -ru "/mnt/c/Users/vladelaina/.config/wezterm/" ~/.winprofile/wezterm/
  rsync -ru "/mnt/d/Date/rare/Mouselnc/" ~/.winprofile/Mouselnc/
  rsync -u "/mnt/d/Date/tool/ublock-static-filters.txt" ~/.winprofile/ublock-static-filters.txt
  rsync -u "/mnt/c/Users/vladelaina/.wslconfig" ~/.winprofile/.wslconfig
  config status
}

# 硬重置并同步配置
ch() {
    rsync -u "/mnt/c/Users/vladelaina/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/Shortcut keys.ahk" ~/.winprofile/shortcut_keys.ahk
    rsync -ru "/mnt/c/Users/vladelaina/.config/wezterm/" ~/.winprofile/wezterm/
    rsync -ru "/mnt/d/Date/tool/Mouselnc/" ~/.winprofile/Mouselnc/
    rsync -u "/mnt/d/Date/tool/ublock-static-filters.txt" ~/.winprofile/ublock-static-filters.txt
    rsync -u "/mnt/c/Users/vladelaina/.wslconfig" ~/.winprofile/.wslconfig
    config reset --hard HEAD
    rsync -u ~/.winprofile/shortcut_keys.ahk "/mnt/c/Users/vladelaina/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/Shortcut keys.ahk"
    rsync -ru ~/.winprofile/wezterm/ "/mnt/c/Users/vladelaina/.config/wezterm/"
    rsync -ru ~/.winprofile/Mouselnc/ "/mnt/d/Date/tool/Mouselnc/"
    rsync -u ~/.winprofile/ublock-static-filters.txt "/mnt/d/Date/tool/ublock-static-filters.txt"
    rsync -u ~/.winprofile/.wslconfig "/mnt/c/Users/vladelaina/.wslconfig"
    config status
}

# 查看配置仓库日志
alias cr='config log --oneline --all --decorate --reverse -n 12'

# 回退到上一个提交
crhh() {
    config reset --hard HEAD^
}

# 回退到指定的提交
crh() {
    config reset --hard "$1"
}

# ==================================================
# 🚀软件清单
# ==================================================
# lsd - 一个现代的 ls 替代工具，带有图标和颜色 
# Starship - 一个简洁、快速、可自定义的命令提示符 

# ==================================================
# 🔧 快捷命令定义
# ==================================================
alias sz='source ~/.zshrc'                      # 重新加载配置
alias zs='nvim ~/.zshrc'                        # 编辑配置文件

# ==================================================
# 📝 编辑器 & 项目快捷打开
# ==================================================
alias i='nvim'                                  # 启动 nvim 编辑器
alias ff='fastfetch'                             # 显示系统信息
alias we='nvim /mnt/c/Users/vladelaina/.config/wezterm/wezterm.lua'  # 编辑 wezterm 配置
alias si='sudo nvim'                            # 以 root 权限打开 nvim
alias iM='nvim Makefile'                        # 快速打开 Makefile
alias im='nvim ./src/main.c'                        # 快速打开 Makefile


# ==================================================
# 📁 文件 & 目录操作
# ==================================================
alias web='cd /mnt/e/Catime.github.io/'
alias c='cd'                                    # 简化 cd 命令
alias cd..='cd ..'                              # 返回上一级目录
alias de='cd /mnt/c/Users/vladelaina/Desktop'   # 快速进入桌面目录
alias code='cd /home/vladelaina/code'           # 快速进入 code 目录
alias ca='cd /home/vladelaina/code/Catime/'     # 快速进入项目目录
alias cas='cd /home/vladelaina/code/Catime/ && git status'  # 快速进入 Catime 目录并查看 git 状态
alias cap='cd /home/vladelaina/code/Catime-Plugins'  # 快速进入 Catime-Plugins 目录
alias catime-plugins='cd /mnt/c/Users/vladelaina/AppData/Local/Catime/resources/plugins' # 快速进入 Catime Plugins 目录
alias wca='cd /mnt/d/Date/code/Catime'          # 快速进入 Windows 端 Catime 目录
alias caw='cd /home/vladelaina/code/web/Catime'  # 快速进入 web/Catime 目录
alias le='cd /home/vladelaina/code/Learn/'
alias vl='cd /home/vladelaina/code/vladelaina'
alias mem='cd /home/vladelaina/code/MemeTray'  # 快速进入 MemeTray 项目目录
alias ne='cd /mnt/d/code/NekoTick'               # 快速进入 NekoTick 目录
alias nc='cd /mnt/d/code/NekoTick/worktrees/calendar'
alias nt='cd /mnt/d/code/NekoTick/worktrees/todo'
alias nn='cd /mnt/d/code/NekoTick/worktrees/notes'
alias na='cd /mnt/d/code/NekoTick/worktrees/ai'

# NekoTick 开发模式：开关控制（有则关，无则开），后台静默运行
unalias nek 2>/dev/null # 确保移除同名别名，避免冲突
nek() {
    powershell.exe -Command "
    if ((Get-Process -Name NekoTick -ErrorAction SilentlyContinue) -or (Get-NetTCPConnection -LocalPort 3000 -ErrorAction SilentlyContinue)) {
        Stop-Process -Name NekoTick -Force -ErrorAction SilentlyContinue;
        Get-NetTCPConnection -LocalPort 3000 -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OwningProcess | ForEach-Object { Stop-Process -Id \$_ -Force }
    } else {
        Start-Process cmd -ArgumentList '/c cd /d D:\code\NekoTick && pnpm tauri dev' -WindowStyle Hidden
    }
    "
}

unalias nelic 2>/dev/null
nelic() {
    powershell.exe -Command "
    if (Get-NetTCPConnection -LocalPort 8787 -ErrorAction SilentlyContinue) {
        Get-NetTCPConnection -LocalPort 8787 -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OwningProcess | ForEach-Object { Stop-Process -Id \$_ -Force }
    } else {
        Start-Process cmd -ArgumentList '/c cd /d D:\code\NekoTick && pnpm dev:license-server' -WindowStyle Hidden
    }
    "
}

alias wezterm='cd /mnt/c/Users/vladelaina/.config/wezterm'
alias pw='pwd'                                  # 显示当前目录路径
alias mk='mkdir'                                # 创建新目录
alias rmr='rm -rf'                               # 递归删除目录
alias ls='lsd'
alias l='ls'                                     # 简化 ls 命令
alias la='ls -a'                                 # 显示包括隐藏文件的目录列表

# ==================================================
# ⚙️ 系统 & 终端工具
# ==================================================
alias ex='exit'                                  # 快速退出 shell
alias ba='bash'                                  # 启动 bash 终端
alias top='htop'                                 # 启动 htop 资源管理器
alias goo='curl -so /dev/null -w "DNS: %{time_namelookup}s | Connect: %{time_connect}s | Total: %{time_total}s\n" https://www.google.com --connect-timeout 5'  # 测试访问 Google 速度 (带超时和详情)

# ==================================================
# 🪟 Windows 集成
# ==================================================
alias e='explorer.exe .'                       # 打开当前目录
alias e..='explorer.exe ..'                     # 打开上一级目录
alias not='notepad.exe'                          # 启动记事本
alias nzs='notepad.exe ~/.zshrc'                 # 用记事本编辑 .zshrc

wps() {
  local target_path="$PWD"
  local win_user
  win_user=$(cmd.exe /c echo %USERNAME% 2>/dev/null | tr -d '\r')
  local win_home="C:\\Users\\${win_user:-vladelaina}\\Desktop"

  # 允许通过 wps /mnt/c/... 指定起始目录
  if [[ -n "$1" ]]; then
    target_path="$1"
    shift
  fi

  if [[ "$target_path" == /mnt/[a-zA-Z]/* ]]; then
    local converted
    converted=$(wslpath -w "$target_path" 2>/dev/null)
    if [[ -n "$converted" ]]; then
      win_home=${converted//\\/\\\\}
    fi
  fi

  powershell.exe -NoLogo -NoExit -Command "Set-Location -LiteralPath \"$win_home\""
}

# ==================================================
# 📦 pacman 包管理（Arch Linux）
# ==================================================
alias sp='sudo pacman'                           # pacman 简写
alias spy='sudo pacman -Syu'                     # 更新所有包
alias spyu='sudo pacman -Syu'                    # 同上（备用）
alias sps='sudo pacman -S'                       # 安装包
alias spr='sudo pacman -R'                       # 删除包

# ==================================================
# 📦 yay AUR 助手
# ==================================================
alias ys='yay -S'                                # 安装 AUR 包
alias yr='yay -R'                                # 删除包

# ==================================================
# ♊ Gemini API 配置切换
# ==================================================
# 从单独的文件中加载 token（安全起见，不直接存储在 .zshrc）
[ -f ~/.config/tokens/gemini_tokens ] && source ~/.config/tokens/gemini_tokens

# ==================================================
# 🌐 服务器连接
# ==================================================
alias ms='mosh $MOSH_SERVER'                     # 快速连接 mosh 服务器 (root)
alias wsv='ssh $SSH_SERVER'                      # 快速连接 ssh 服务器 (vladelaina)

# ==================================================
# 🧬 Git 快捷命令
# ==================================================
alias ga='git add .'                             # 添加所有变更
alias cl='git clone'
alias p='git push'                               # 推送到远程仓库
alias pu='git pull'                              # 拉取远程仓库内容
alias pf='git push -f'                           # 强制推送
alias pf='git push -f'                           # 强制推送
alias pf='git push -f'                           # 强制推送
alias r='git log --oneline --decorate --reverse -n 10'  # 查看最近的 12 条提交日志
alias s='git status'                             # 查看 Git 状态
alias op='git commit -am optimization'           # 提交优化日志
alias te='git commit -am temporary'              # 提交临时日志
alias ckm='git checkout main'                   # 切换到主分支
alias ckg='git checkout gh-pages'            

# ==================================================
# 🛠️ Git 配置与自定义函数
# ==================================================

# 切换 live-server 启动/停止
live() {
    if pgrep -f "live-server" > /dev/null; then
        echo "Stopping live-server..."
        pkill -f "live-server"
        echo "live-server stopped"
    else
        echo "Starting live-server..."
        local log_file="/tmp/live-server-$$.log"
        nohup live-server . > "$log_file" 2>&1 &
        disown
        sleep 1
        local url=$(grep -oP 'http://[0-9.:]+' "$log_file" | head -1)
        if [ -n "$url" ]; then
            echo "live-server started at $url"
        else
            echo "live-server started (check with 'ps aux | grep live-server')"
        fi
        rm -f "$log_file"
    fi
}

m() {
    # 关闭现有进程
    powershell.exe -Command "Stop-Process -Name catime -Force -ErrorAction SilentlyContinue"

    rm /mnt/c/Users/vladelaina/Desktop/catime.exe

    OUTPUT_DIR="/mnt/c/Users/vladelaina/Desktop"
    WINDOWS_PATH=$(echo "${OUTPUT_DIR}/catime.exe" | sed 's#/mnt/c/#C:/#' | sed 's#/#\\#g')

    # 使用 cmake 编译（通过 build.sh）
    ./build.sh Release "$OUTPUT_DIR"

    # 启动（无 UNC 警告）
    powershell.exe -Command "Start-Process -FilePath '$WINDOWS_PATH' -WorkingDirectory 'C:\Users\vladelaina\Desktop'"
}

cm() {
    # 关闭现有进程
    powershell.exe -Command "Stop-Process -Name catime -Force -ErrorAction SilentlyContinue"

    rm /mnt/c/Users/vladelaina/Desktop/catime.exe
    rm -rf build

    OUTPUT_DIR="/mnt/c/Users/vladelaina/Desktop"
    WINDOWS_PATH=$(echo "${OUTPUT_DIR}/catime.exe" | sed 's#/mnt/c/#C:/#' | sed 's#/#\\#g')

    # 使用 cmake 编译（通过 build.sh）
    ./build.sh Release "$OUTPUT_DIR"

    # 启动（无 UNC 警告）
    powershell.exe -Command "Start-Process -FilePath '$WINDOWS_PATH' -WorkingDirectory 'C:\Users\vladelaina\Desktop'"
}
alias mm='git merge main'
alias mc='git -C /mnt/d/code/NekoTick merge calendar'
alias mt='git -C /mnt/d/code/NekoTick merge todo'
alias mn='git -C /mnt/d/code/NekoTick merge notes'
alias mai='git -C /mnt/d/code/NekoTick merge ai' # ma is taken by xmake
alias mp='git -C /mnt/d/code/NekoTick push origin main'


alias ma='xmake'
alias mr='xmake run'

cam() {
    cd /home/vladelaina/code/Catime/
    cm
}

h() {
    git reset --hard HEAD
    git clean -fd
    git status
}

# 快速提交当前更改（已暂存的和修改的文件）
gc() {
    git commit -am "$*"
}


# 添加所有更改并提交
ac() {
    git add .
    git commit -am "$*"
}

# 快速提交优化信息并推送
opp() {
    git add .
    git commit -am "optimization"
    git push
}

tep() {
    git commit -am "temporary"
    git push
}

# 添加所有更改、提交并推送
ap() {
    git add .
    git commit -m "$*"
    git push
}

# 修改上一次提交信息
amend() {
    git commit --amend -m "$*"
}

# 切换分支或检出文件
gck() {
    git checkout "$@"
}

# 回退到上一个提交（硬重置）
rhh() {
    git reset --hard HEAD^
}

# 回退到指定的提交（硬重置）
rh() {
    git reset --hard "$1"
}

function t() {
  local level="${1:-5}"
  tree -L "$level"
}

t() {
  local level=5
  local path="."

  for arg in "$@"; do
    if [[ "$arg" =~ '^[0-9]+$' ]]; then
      level=$arg
    else
      path=$arg
    fi
  done

  # 使用完整路径调用 tree
  /usr/bin/tree -L "$level" "$path"
}


# ==================================================
# 🎨 WezTerm 配置函数
# ==================================================

# 随机选择一张背景图片并设置为当前背景
wii() {
  total_images=55
  random_num=$((RANDOM % total_images + 1))
  sed -i "s|local BACKGROUND_IMAGE = \".*\.jpg\"|local BACKGROUND_IMAGE = \"$random_num.jpg\"|g" /mnt/c/Users/vladelaina/.config/wezterm/wezterm.lua
  print "$random_num"
}

# 设置指定编号的背景图片
wi() {
    if [[ -z "$1" ]]; then
        cd /mnt/c/Users/vladelaina/.config/wezterm/images
        explorer.exe .
        cd -
    else
        sed -i "s|local BACKGROUND_IMAGE = \".*\.jpg\"|local BACKGROUND_IMAGE = \"$1.jpg\"|g" /mnt/c/Users/vladelaina/.config/wezterm/wezterm.lua
    fi
}

# 删除当前背景图片，并随机切换到另一张
wid() {
    config_path="/mnt/c/Users/vladelaina/.config/wezterm/wezterm.lua"
    images_dir="/mnt/c/Users/vladelaina/.config/wezterm/images"
    image_name=$(grep -oP 'local BACKGROUND_IMAGE = "\K.*(?=")' "$config_path")
    full_path="$images_dir/$image_name"
    if [[ -e "$full_path" ]]; then
        wii
        rm "$full_path"
    else
        wii
    fi
}

# ==================================================
# ⚙️ 系统设置
# ==================================================
eval "$(starship init zsh)"                      # 启动 starship 提示符

# 启用语法高亮插件
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 启用命令自动建议插件
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
HISTFILE=~/.histfile                             # 命令历史文件
HISTSIZE=1000                                    # 命令历史记录数量
SAVEHIST=1000                                    # 保存的历史记录数量
setopt autocd extendedglob notify                # 启用自动进入目录、扩展模式和通知模式
unsetopt beep nomatch                            # 关闭蜂鸣和匹配失败提示
bindkey -v                                       # 启用 vi 模式

# 自动补全配置
zstyle :compinstall filename '/home/vladelaina/.zshrc'   # 自动补全配置文件路径
autoload -Uz compinit                            # 加载补全初始化函数
compinit                                         # 初始化补全
# ==================================================
# 🌐 网络代理设置 (稳定版 - Localhost)
# ==================================================
export HOST_PROXY_PORT=10808
# 强制使用 localhost，因为 WSL 镜像模式下 localhost 互通且不受防火墙拦截
export WINDOWS_HOST_IP="127.0.0.1"

# 开启代理函数
proxy() {
    export http_proxy="http://${WINDOWS_HOST_IP}:${HOST_PROXY_PORT}"
    export https_proxy="http://${WINDOWS_HOST_IP}:${HOST_PROXY_PORT}"
    export HTTP_PROXY="http://${WINDOWS_HOST_IP}:${HOST_PROXY_PORT}"
    export HTTPS_PROXY="http://${WINDOWS_HOST_IP}:${HOST_PROXY_PORT}"
    export ALL_PROXY="socks5://${WINDOWS_HOST_IP}:${HOST_PROXY_PORT}"
    
    # 关键修复：强制 Node.js 优先使用 IPv4
    # 这解决了 localhost 被解析为 IPv6 (::1) 导致连接间歇性失败的问题
    export NODE_OPTIONS='--dns-result-order=ipv4first'
}

# 关闭代理函数
unproxy() {
    unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY NODE_OPTIONS
    echo "🚫 Proxy OFF"
}

# 默认开启代理
proxy

#===============================
# 防止多个终端冲突写入历史
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# ==================================================
# 🐮 Cowsay 随机动物函数
# ==================================================
cow() {
  # 获取所有可用的 cow 文件列表（跳过第一行标题，过滤空值）
  local cows=($(/usr/bin/cowsay -l | tail -n +2 | tr -s ' ' '\n' | grep -v '^$'))

  # 随机选择一个动物
  local random_cow=${cows[$RANDOM % ${#cows[@]} + 1]}

  # 调用 cowsay，使用随机动物和所有参数
  /usr/bin/cowsay -f "$random_cow" "$*"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ==================================================
# ♊ Gemini CLI Context Wrapper (Alias)
# ==================================================
alias gec='gemini -r latest'
alias ge='gemini'

alias neg='ne && gec'
export PATH="$HOME/.local/bin:$PATH"
