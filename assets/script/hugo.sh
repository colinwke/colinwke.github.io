#!/usr/bin/env bash
# @time: 2021/4/3 10:42
# @author: Wang Ke
# @contact: wangke09@58.com
# ================================================================
# hugo 启动脚本
# sudo lsof -i :4000 # https://stackoverflow.com/a/18706913

if [[ $# -ne 1 ]]; then echo "[ERROR] args(option<s, d>) need!" && exit 1; fi
op=$1

cd "/Users/wangke/blog" || exit
if [[ ${op} == "s" ]]; then
    find ./public ! -name '.git' -mindepth 1 -maxdepth 1 -print0 -exec rm -rf {} +
    hugo && hugo server -D
elif [[ ${op} == "d" ]]; then
    find ./public ! -name '.git' -mindepth 1 -maxdepth 1 -print0 -exec rm -rf {} +
    hugo && cd public && git add . && git commit -m "update online $(date "+%F %T")" && git push -f
else
    sh /Users/wangke/blog/static/assets/script/hugo_new.sh "${op}"
fi
