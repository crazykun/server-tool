#!/bin/bash

#默认前缀
prefix="test-"
#当前分支
branch="dev"
#是否切换分支
switch_branch=0
if `git status | grep "dev" &>/dev/null`; then
    branch="dev"
    echo "当前分支dev, 如果想打dev分支请输入no:"
    read -p "请确认否自动切换到master分支(yes/no)? " YES
    case $YES in
    [yY]|[Yy][Ee][Ss])
        echo "YES"
        switch_branch=1
        git checkout master
        ;;
    [Nn]|[Nn][Oo])
        echo "即将打包当前分支..."
        ;;
    *)    
        echo "Yes"
        switch_branch=1
        git checkout master
        ;;
    esac
fi


if `git status | grep "master" &>/dev/null`; then
    prefix="pro-"
fi

function do-tag() {
    git push
    git pull --tags
    local new_tag=$(echo ${prefix}df-$(date +'%Y%m%d')-$(git tag -l "${prefix}df-$(date +'%Y%m%d')-*" | wc -l | xargs printf '%02d'))
    echo ${new_tag}
    git tag ${new_tag}
    git push origin $new_tag
}
do-tag;

if (( $switch_branch == 1 )); then
    echo "打包成功, 切换回开发分支..."
    git checkout ${branch}
fi