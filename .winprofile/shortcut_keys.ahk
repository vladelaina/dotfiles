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
^!m::Run, chrome.exe --app="https://open.spotify.com/"
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

Delete::Run, "C:\Users\vladelaina\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Autosave.bat.lnk"
^!+x::Run, C:\Users\vladelaina\AppData\Local\Programs\cursor\cursor-id.exe

;===================================
; 特殊功能
;===================================
^+!r::
    Run *RunAs %ComSpec% /c powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://aizaozao.com/accelerate.php/https://raw.githubusercontent.com/yuaotian/go-cursor-help/refs/heads/master/scripts/run/cursor_win_id_modifier.ps1 | iex"
return

^!/::  ; 英语单词提取与翻译
    ClipSaved := ClipboardAll
    Clipboard := ""
    Send ^c
    ClipWait, 1
    if ErrorLevel {
        return
    }

    text := Clipboard
    wordList := {}
    result := ""

    result .= "Extract the most difficult 10% of the words from the middle and come with English-Chinese translation (format such as: programming - Chinese translation), without adding sequence numbers in front, just a translation, just give me the words and translation, no extra content, no explanation for the translation:`n"

    Loop, Parse, text, %A_Space%%A_Tab%`r`n.,;!?()[]{}"- 
    {
        word := Trim(A_LoopField)
        if (word != "") {
            if InStr(word, "'") || InStr(word, ":") || InStr(word, """") || InStr(word, ",")
                continue

            StringLower, wordLower, word

            if (RegExMatch(wordLower, "\d"))
                continue

            if (StrLen(wordLower) <= 3)
                continue

            if (!wordList.HasKey(wordLower)) {
                wordList[wordLower] := true
                result .= wordLower "`n"
            }
        }
    }

    Clipboard := RTrim(result)
return

