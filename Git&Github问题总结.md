# Git&Github问题总结
*创建时间:星期一, 06. 十一月 2017 03:25下午*
***更新时间:星期一, 06. 十一月 2017 03:25下午***

## `git clone`报错: signing failed
```
# 问题
$ git clone git@github.com:HiKWang/KHSummaries.git
Cloning into 'KHSummaries'...
sign_and_send_pubkey: signing failed: agent refused operation
Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

# Run ssh-add on the client machine, that will add the SSH key to the agent.
# Confirm with ssh-add -l (again on the client) that it was indeed added.

$ ssh-add
Identity added: /home/hikwang/.ssh/id_rsa (/home/hikwang/.ssh/id_rsa)

$ ssh-add -l
2048 SHA256:AqjYQWXji7sBoBJ2zI3RpGIDFGNPrg+ZQrcrnFKWvEA /home/hikwang/.ssh/id_rsa (RSA)
2048 SHA256:AqjYQWXji7sBoBJ2zI3RpGIDFGNPrg+ZQrcrnFKWvEA hikwang@foxmail.com (RSA)

```

## Error with renamed repo in github, “remote: This repository moved. Please use the new location”

> git remote set-url origin [updated link url https://........git]
> or
> git remote rm origin
> git remote add origin [updated link]
> [Changing a remote's URL](https://help.github.com/articles/changing-a-remote-s-url/) github documentation goes into further detail.

## Error: Key already in use
- 原因：
通常情况是因为某个repo占用了这个key。导致其他repo不能使用。

- 解决方法：
将这个多数repo都会用到的key[放到账号设置下](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)。
账号下设置的key对账号下所有repo通用。

[github官方帮助文档](https://help.github.com/articles/error-key-already-in-use/)
