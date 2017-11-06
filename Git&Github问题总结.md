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