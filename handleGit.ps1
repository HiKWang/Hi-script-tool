# win10 利用powershell对保存在gitee/github上的库进行git操作
# @author KuangHeng
# @Date 2020.07.22

function handleGit () {
	$statusRes = $(git status)
	# $statusRes
	# 本地没有修改
	if ("nothing to commit, working tree clean" -in $statusRes) {
		git pull
		return
	}

	# 本地有修改
	git add .
	git commit -m "auto push on $(Get-Date)"
	$res = $(git pull)
	# $res
	if ($res -ne "Already up to date.") {
		git add .
		git commit -m "auto push on $(Get-Date)"
	}
	git push
}

# 对放在D:\KH\Gitee下的目录循环遍历进行git操作
$path = "D:\KH\Gitee"
if(Test-Path $path) {
	Set-Location $path
	foreach($dir in Get-ChildItem $path) {
		if($dir.Attributes -eq "Directory") {
			Set-Location ".\$($dir.Name)"
			handleGit
			# "================= The End ================="
			# " "
			Set-Location ..
		}
	}
}
