#!/bin/bash

# @Name: autoPush2github.sh
# @Desc: 无交互自动提交并推送修改到github
# @Author: kuangheng
# @Date: 2018.07.05
# TODO:
#   通过find查找需要提交推送的目录

# git add commit push
function handleGit(){
    commitFlagStr="nothing to commit, working directory clean"
    res=$(git status)

    # 没有需要提交的文件结果返回1
    if [[ "$res" =~ "$commitFlagStr" ]];then
        #echo "========= Nothing To Commit ========="
        #echo -e "\r"
        return 1
    fi

    git pull
    #echo -e "\r"

    if [ $? -eq 0 ];then
        git add .
    fi

    if [ $? -eq 0 ];then
        #echo "commitMsg('auto push github'):"
        #read commitMsg
        git commit -m "auto push github"
    fi

    if [ $? -eq 0 ];then
        git push origin master
    fi

    #if [ $? -eq 0 ];then
        #echo -e "\r"
        #echo "=== End:Push To Complete ==="
        #echo -e "\r"
    #fi

}
# 需要push的目录 gitDir为数组
gitDir=("/home/hikwang/github/Hi-config-files" "/home/hikwang/github/hikwang.github.io/_posts" "/home/hikwang/github/Hi-script-tool" "/home/hikwang/github/KHSummaries" "/home/hikwang/bin" "/home/hikwang/github/FELib" "/home/hikwang/github/Practice-Demo" "/home/hikwang/github/mybasebak")

# 检查git是否有需要提交的文件
for((i=0; i<${#gitDir[*]}; i++))
do
    # 依次进入相应目录
    #echo "=== Start:${gitDir[$i]} ==="
    cd ${gitDir[$i]}
    if [ $? -eq 0 ];then
        handleGit

        if [ $? -eq 1 ];then
            continue;
        fi
    fi
done
