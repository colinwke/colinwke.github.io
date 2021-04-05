#!/usr/bin/env bash
# @time: 2021/4/3 10:23
# @author: Wang Ke
# @contact: wangke09@58.com
# ================================================================
# hexo new md post and open with typera with alfred workflow

if [[ $# != 1 ]]; then echo "[ERROR] args(file name) need!" && exit 1; fi

md_dir="/Users/wangke/blog/content/posts"
md_name=$(echo "$1" | tr " " "-")

found=$(find ${md_dir} -maxdepth 1 -type f -name "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]-${md_name}.md")

if [[ ${found} ]]; then
    open -a "Typora" "${found}"
else
    runtime_flag=$(date '+%y%m%d%H%M')
    runtime_flag_show=$(date '+%Y-%m-%dT%H:%M:%S+08:00')
    md_abs_path="${md_dir}/${runtime_flag}-${md_name}.md"
    info="\
---
title: \"$(echo "${md_name}" | tr ' ' '-')\"

categories: [\"unsort\"]
tags: [\"unsort\"]
author: \"wangke\"
email: \"wangkest@qq.com\"
homepage: \"colinwke.github.io\"
date: \"${runtime_flag_show}\"
toc: false
draft: false
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
