# 推送本地code文件夹到github中git 指令
# 初始化存储库
git init
# terminal 配置git用户名和邮箱
git config --global user.name "github用户名"
git config --global user.email "github登录邮箱" 

# 查看是否设置成功
git config --global --list

# vscode打开要上传的文件folder
# git定位到上传的文件夹子，‘./’，.指的当前一级folder，cd folder name

# 添加文件到暂存区
git add . or git add <file>
# 提交更改
git commit -m '提交的信息'

# 已创建repository,推送到remote repository
git branch -m main # 创建分支
git remote add origin <url> # 远程仓库url
git push -u origin main 


# 查看
git push #提示‘everything up-to-date'

## 查看当前状态
git status
# 查看提交历史
git log
# 拉取远程仓库的更新
git pull
# 创建新的分支
git branch <branch name>










