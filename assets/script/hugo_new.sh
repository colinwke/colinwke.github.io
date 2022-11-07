#!/usr/bin/env bash
# @time: 2021/4/3 10:23
# @author: Wang Ke
# @contact: wangke09@58.com
# ================================================================
# hexo new md post and open with typera with alfred workflow

if [[ $# -lt 1 ]]; then echo "[ERROR] args(file name) need!" && exit 1; fi
path="/Users/wangke/wk/blog/static/assets/script"
cmd="cd ${path} && sh hugo.sh $1"
if [[ $1 == "s" || $1 == "d" ]]; then
    osascript \
        -e 'tell application \"iTerm2\" to tell current window to set newWindow to (create tab with default profile)'\
        -e "tell application \"iTerm2\" to tell current session of newWindow to write text \"${cmd}\""
    # https://apple.stackexchange.com/a/360827/423040
    exit 1
fi

md_dir="/Users/wangke/wk/blog/content/posts"
md_name=$(echo "$*" | tr " " "-")

found=$(find ${md_dir} -type f -name "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]-${md_name}.md")

if [[ ${found} ]]; then
    open -a "Typora" "${found}"
else
    runtime_flag=$(date '+%y%m%d%H%M')
    runtime_flag_show=$(date '+%Y-%m-%dT%H:%M:%S+08:00')
    md_abs_path="${md_dir}/${runtime_flag}-${md_name}.md"
    info="\
---
title: \"${*}\"
categories: [\"unsort\"]
tags: [\"unsort\"]
author: \"wangke\"
email: \"wangkest@qq.com\"
homepage: \"colinwke.github.io\"
date: \"${runtime_flag_show}\"
toc: true
draft: true
math: false
---

"
    found=$(find ${md_dir} -maxdepth 1 -type f -name "${md_name}.md")
    if [[ ${found} ]]; then
        echo "${info}$(cat "${found}")" >"${found}"
        mv "${found}" "${md_abs_path}"
    else
        echo "${info}" >"${md_abs_path}"
    fi
    open -a "Typora" "${md_abs_path}"
fi
