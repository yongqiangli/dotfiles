;; 个人信息
(setq user-full-name "Yongqiang Li")
(setq user-mail-address "yongqiangli37@gmail.com")

;; 路径
(add-to-list 'load-path "~/.emacs.d")

;; 支持emacs和外部程序的拷贝粘贴
(setq x-select-enable-clipboard t)

;; 关闭出错时的提示声
(setq visible-bell t)

;; 显示行列号
(setq column-number-mode t)
(setq line-number-mode t)

;; 显示行号
;(global-linum-mode 1)

;; 关闭起动时的开机画面
(setq inhibit-startup-message t)

;; 不要在鼠标点击的那个地方插入剪贴板内容
(setq mouse-yank-at-point t)

;; 用一个很大的 kill ring
(setq kill-ring-max 200)

;; 递归使用 minibuffer
(setq enable-recursive-minibuffers t)

;; 防止页面滚动时跳动
(setq scroll-margin 3
      scroll-conservatively 10000)

;; 不产生备份文件
(setq make-backup-files nil) 

;; 把缺省的 major mode 设置为 text-mode
(setq default-major-mode 'text-mode)

;; 显示括号匹配
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 光标靠近鼠标指针时，让鼠标指针自动让开
(mouse-avoidance-mode 'animate)

;; 在标题栏显示buffer的名字
;(setq frame-title-format "emacs@%b")

;; 直接打开和显示图片
(auto-image-file-mode)

;; 语法加亮
(global-font-lock-mode t)

;; 以 y/n 代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示时间
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; 高亮显示选中的区域
(transient-mark-mode t)

;; 默认显示 80 列就换行
(setq default-fill-column 80)

;; org-mode 自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; 去掉工具栏
(tool-bar-mode 0)

;; 去掉菜单栏
(menu-bar-mode 0)

;; 去掉滚动栏
(scroll-bar-mode 0)

;; 使用黑色背景,白色前景,区域前景颜色设为绿色,区域背景色设为蓝色
(set-background-color "black")
(set-foreground-color "grey")
(set-face-foreground 'region "green")
(set-face-background 'region "blue")

;; 自动的在文件末增加一新行
(setq require-final-newline t)

;; 设置home键指向buffer开头，end键指向buffer结尾
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)

;; 设置默认编码格式
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; 字体
(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

;; 支持 ANSI color
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

;; fvwm mode
(require 'fvwm-mode)

(require 'org-publish)
(setq org-publish-project-alist
      '(
        ("blog-notes"
         :base-directory "~/Project/blog/org/"
         :base-extension "org"
         :publishing-directory "~/Project/blog/"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4
         :table-of-contents nil
         :section-numbers nil
         :html-preamble nil
         :html-postamble nil
         :style "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/main.css\"/>"
         )
        ("blog-static"
         :base-directory "~/Project/blog/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/Project/blog/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("blog-notes" "blog-static"))
       ))
