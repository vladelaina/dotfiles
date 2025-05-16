;快捷键说明
;Ctrl -> ^
;Alt -> !
;Shift -> +
;Windows -> #

;===================================
; 常用应用程序
;===================================
#w::Run, "D:\Date\rare\WezTerm\wezterm-gui.exe"
^!w::Run, "D:\Date\rare\WezTerm\wezterm-gui.exe"
+!c::Run, "C:\Program Files\Google\Chrome\Application\chrome.exe"
^+g::Run, "D:\Date\Tool\geek.exe"
^!u::Run, "D:\Date\rare\Upscayl\Upscayl.exe"
^!j::Run, "D:\Date\Software\Ifrequently used\bilidown\bilidown.exe"

;===================================
; 文件夹快捷方式
;===================================
^!d::Run, "C:\Users\vladelaina\Downloads"
^!t::Run, D:\Date\tool
^!s::Run, "D:\Date"
^!q::Run, "C:\Users\vladelaina\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
^+!b::Run, "E:\book"

;===================================
; 网站快捷方式
;===================================
^!n::
    Run, chrome.exe --app="https://www.notion.so/Catime-TO-Do-19117eaa76e480bab172e9e70309bee5"
    WinWaitActive, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
    WinMove, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe,, 0, 0, 960, 1080
return

^!+c::Run, chrome.exe --app=https://calendar.notion.so/
^!b::Run, chrome.exe "https://space.bilibili.com/1862395225/favlist?fid=3228957325&ftype=create"
^!g::Run, chrome.exe "https://github.com/vladelaina/Catime"
^!k::Run, chrome.exe "https://www.perplexity.ai/"
^!y::Run, chrome.exe "https://www.youtube.com/"
+^!y::Run, chrome.exe "https://ywyj.cn/"
^!f::Run, chrome.exe --app="https://k021q39fc0u.feishu.cn/mindnotes/ZUDYbJAaOmhBAmn1H4Lc3rI3nGc#mindmap"

^!c::
    Run, chrome.exe --app="https://chatgpt.com/"
    WinWaitActive, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
    WinMove, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe,, 0, 0, 960, 1080
return

^!r::Run, chrome.exe --app="https://zh-cn.text-to-speech.online/"

;===================================
; 系统工具
;===================================
^!l::
    Run, "C:\Users\vladelaina\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Lively.lnk"
    WinWait, Lively Wallpaper
    WinMove, Lively Wallpaper, , 405, 85, 114, 914
return


;===================================
; 特殊功能
;===================================
^+!r::
    Run *RunAs %ComSpec% /c powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://aizaozao.com/accelerate.php/https://raw.githubusercontent.com/yuaotian/go-cursor-help/refs/heads/master/scripts/run/cursor_win_id_modifier.ps1 | iex"
return


^!/:: ; 热键 Ctrl + Alt + / 触发脚本
    ; 保存当前剪贴板内容
    ClipSaved := ClipboardAll
    Clipboard := ""
    
    ; 复制选中的内容到剪贴板
    Send ^c
    ClipWait, 1
    if ErrorLevel {
        return
    }

    ; 获取剪贴板中的文本
    text := Clipboard
    wordList := {}
    result := ""

    ; 提示信息
    result .= "Extract the most difficult 10% of the words from the middle and come with English-Chinese translation:`n"

    ; 遍历文本中的单词
    Loop, Parse, text, %A_Space%%A_Tab%`r`n.,;!?()[]{}"- 
    {
        word := Trim(A_LoopField)
        if (word != "") {
            ; 忽略包含特殊字符的单词
            if InStr(word, "'") || InStr(word, ":") || InStr(word, """") || InStr(word, ",")
                continue

            ; 转为小写字母
            StringLower, wordLower, word

            ; 忽略数字和长度小于等于3个字符的单词
            if (RegExMatch(wordLower, "\d"))
                continue

            if (StrLen(wordLower) <= 3)
                continue

            ; 处理唯一的单词
            if (!wordList.HasKey(wordLower)) {
                wordList[wordLower] := true
                result .= wordLower "`n"
            }
        }
    }

    ; 将结果赋值给剪贴板
    Clipboard := RTrim(result)

    ; 打开 ChatGPT 使用 --app 参数
    Run, "C:\Program Files\Google\Chrome\Application\chrome.exe" --app=https://chatgpt.com/
    ; 等待页面加载（这里可以根据实际情况调整等待时间）
    Sleep, 3000  ; 等待3秒

    ; 将 ChatGPT 浏览器窗口切换到前台
    ; 如果你使用的是 Chrome，可以查找 Chrome 窗口来激活它
    SetTitleMatchMode, 2  ; 模糊匹配窗口标题
    IfWinExist, ChatGPT
    {
        WinActivate  ; 激活窗口
    }
    else
    {
        MsgBox, 未能找到 ChatGPT 网页窗口，请确保浏览器窗口已打开！
        return
    }

    ; 等待输入框加载完成（根据实际网页速度调整等待时间）
    Sleep, 300  ; 等待0.3秒

    ; 粘贴剪贴板中的内容到输入框
    Send ^v

    ; 等待粘贴操作完成
    Sleep, 200

    ; 模拟按键发送消息
    Send {Enter}

    ; 恢复剪贴板内容
    Clipboard := ClipSaved
return
