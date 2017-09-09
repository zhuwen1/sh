map <F4> ms:call AddAuthor()<cr>'s
 
function AddAuthor()
    let n=1
    while n < 11
        let line = getline(n)
        if line=~'[#]*\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
        call UpdateTitle()
        return
    endif
    let n = n + 1
    endwhile
    if &filetype == 'sh'
        call AddTitleForShell()
    elseif &filetype == 'python'
        call AddTitleForPython()
    else
        call AddTitleForC()
    endif
 
endfunction
 
"" 表示非.sh或.py结尾的文件添加此函数注释
function AddTitleForC()
    call append(0,"/* **********************************************************")
    call append(1,"")
    call append(2,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(3,"# * Filename      : ".expand("%:t"))
    call append(4,"")
    call append(5,"# ********************************************************** */")
endfunction
 
"" 表示.py添加此函数注释
function AddTitleForPython()
    call append(0,"#!/usr/bin/env python")
    call append(1,"# coding:utf-8")
    call append(2,"")
    call append(3,"# **********************************************************")
    call append(4,"# * Author        : zhuwen")
    call append(5,"# * Email         : 1140523662@qq.com")
    call append(6,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(7,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(8,"# * Filename      : ".expand("%:t"))
    call append(9,"# * Description   : ")
    call append(10,"# **********************************************************")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction
 
"" 表示.sh文件添加此行数注释
function AddTitleForShell()
    call append(0,"#!/bin/bash")
    call append(1,"# **********************************************************")
    call append(2,"# * Author        : zhuwen")
    call append(3,"# * Email         : 1140523662@qq.com")
    call append(4,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(6,"# * Filename      : ".expand("%:t"))
    call append(7,"# * Description   : ")
    call append(8,"# **********************************************************")
endfunction
set nu
