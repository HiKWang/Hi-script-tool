# Vundle的安装和配置
*创建时间：星期日, 08. 十月 2017 11:49上午*
***星期三, 11. 十月 2017 09:54上午***

[TOC]

## 安装Vundle
~~~
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
~~~
## 配置Vundle
Vundle的配置内容需写在.vimrc的最前面，然后才是其他的配置内容。
### 原始配置
```vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" 启用vundle来管理vim插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 安装插件写在这之后

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 安装插件写在这之前
call vundle#end()            " required
filetype plugin on    " required

" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可

" h: vundle         - 获取帮助

" vundle的配置到此结束，下面是你自己的配置

作者：许宏川
链接：http://www.jianshu.com/p/8d416ac4ad11
來源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
```

### 我的配置
包含插件的配置(持续补充中...)

```vim
set nocompatible              " be iMproved, required
filetype off                  " required

" 启用vundle来管理vim插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 安装插件写在这之后

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" JSON的编辑插件
Plugin 'JSON.vim'

" html补全插件
Plugin 'mattn/emmet-vim'

" CSS语法高亮
Plugin 'hail2u/vim-css3-syntax'

" 括号引号自动补全和智能匹配
Plugin 'Raimondi/delimitMate'

" 代码自动补全
Plugin 'Valloric/YouCompleteMe'

" js自动补全
Plugin 'marijnh/tern_for_vim'

" 安装插件写在这之前
call vundle#end()            " required
filetype plugin on    " required

" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可

" h: vundle         - 获取帮助

" vundle的配置到此结束，下面是你自己的配置

"设置行号
set nu
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
"将制表符扩展为空格
set expandtab
"设置编辑时制表符占用空格数
set tabstop=4
"设置格式化时制表符占用空格数
set shiftwidth=4
"让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
"开启自动缩进
set ai
"开启智能对齐
set smartindent
"禁止光标闪烁
set gcr=a:block-blinkon0
"禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
"总是显示状态栏
set laststatus=2
"高亮显示当前行/列
"set cursorline
"set cursorcolumn
" 设置 vim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 基于缩进或语法进行代码折叠"
set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
colorscheme desert

" 解决vim-css3-syntax不支持某些属性高亮的问题
augroup VimCSS3Syntax
    autocmd!

    autocmd FileType css setlocal iskeyword+=-
augroup END
```
### 插件说明
1.代码自动补全插件-YouCompleteMe(YCM)
2.YCM+tern补全javascript
可参考：
[VIM的JavaScript补全 | EFE Tech](http://efe.baidu.com/blog/vim-javascript-completion/)
[Tern＋YouCompleteMe实现vim中JS自动补全](http://www.jianshu.com/p/4a8b0e3503fa)