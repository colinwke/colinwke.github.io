#!/usr/bin/env bash
# @time: 2021/4/3 10:42
# @author: Wang Ke
# @contact: wangke09@58.com
# ================================================================
# hugo 启动脚本
# sudo lsof -i :4000 # https://stackoverflow.com/a/18706913

if [[ $# -ne 1 ]]; then echo "[ERROR] args(option<s, d>) need!" && exit 1; fi
op=$1

cd "/Users/wangke/wk/wk_blog" || exit
if [[ ${op} == "s" || ${op} == "d" ]]; then
    sed -i '' -E "s/updateDate = \"[0-9]{4}-[0-9]{2}-[0-9]{2}\"/updateDate = \"$(date +%F)\"/g" config.toml
    find ./public ! -name '.git' -mindepth 1 -maxdepth 1 -print0 -exec rm -rf {} +
    if [[ ${op} == "s" ]]; then
        hugo && hugo server --disableFastRender
    elif [[ ${op} == "d" ]]; then
        # git remote add origin git@github.com:colinwke/colinwke.github.io.git
        hugo && cd public && git add . && git commit -m "update online $(date "+%F %T")" && git push -f --set-upstream origin main
    fi
else
    sh /Users/wangke/wk_blog/static/assets/script/hugo_new.sh "${op}"
fi
