;; org export to html
(setq org-publish-project-alist
      '(
        ("blog-notes"
         :base-directory "~/blog/org/"
         :base-extension "org"
         :publishing-directory "~/blog/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :with-toc nil
         :section-numbers nil
         :html-link-up "index.html"
         :html-link-home "../index.html"
         :html-preamble nil
         :html-postamble "<footer> Built with <a href=\"http://www.gnu.org/software/emacs/\">Emacs</a> (<a href=\"http://orgmode.org\">Org Mode</a>) | Licensed under <a href=\"http://creativecommons.org/licenses/by-nc-sa/4.0/\">CC BY-NC-SA 4.0</a> </footer>"
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/main.css\"/>"
         )
        ("blog-static"
         :base-directory "~/blog/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/blog/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("blog-notes" "blog-static"))
       ))

;; org export to latex and pdf
(require 'ox-latex)

(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
			      "xelatex -interaction nonstopmode %f"))

;; #+LaTeX_CLASS: article
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass[10pt,a4paper]{article}
                \\parindent=0pt
                \\usepackage{amssymb}
                \\usepackage{graphicx}
                \\usepackage{xcolor}
                \\usepackage{verbatim}
                \\usepackage{longtable}
                \\usepackage{float}
                \\usepackage{moreverb}
                \\usepackage{enumerate}
                \\usepackage{wrapfig}
                \\usepackage{listings}
                \\usepackage[colorlinks,linkcolor=blue,bookmarksnumbered]{hyperref}
                \\usepackage{fontspec,xunicode,xltxtra}
                \\usepackage{xeCJK}
                \\setmainfont{DejaVu Serif}
                \\setsansfont{DejaVu Sans}
                \\setmonofont{DejaVu Sans Mono}
                \\setCJKmainfont{WenQuanYi Micro Hei}
                \\setCJKsansfont{WenQuanYi Micro Hei}
                \\setCJKmonofont{WenQuanYi Micro Hei Mono}
                [NO-DEFAULT-PACKAGES]
                [NO-PACKAGES]"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; #+LaTeX_CLASS: beamer
(add-to-list 'org-latex-classes
             ;; beamer class, for presentations
             '("beamer"
               "\\documentclass{beamer}
                \\usetheme{AnnArbor}
                \\usecolortheme{beaver}
                \\parindent=0pt
                \\usepackage{amssymb}
                \\usepackage{graphicx}
                \\usepackage{xcolor}
                \\usepackage{verbatim}
                \\usepackage{float}
                \\usepackage{moreverb}
                \\usepackage{enumerate}
                \\usepackage{wrapfig}
                \\usepackage{listings}
                \\usepackage[colorlinks,linkcolor=blue,bookmarksnumbered]{hyperref}
                \\usepackage{fontspec,xunicode,xltxtra}
                \\usepackage{xeCJK}
                \\setmainfont{DejaVu Serif}
                \\setsansfont{DejaVu Sans}
                \\setmonofont{DejaVu Sans Mono}
                \\setCJKmainfont{WenQuanYi Micro Hei}
                \\setCJKsansfont{WenQuanYi Micro Hei}
                \\setCJKmonofont{WenQuanYi Micro Hei Mono}"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\begin{frame}[fragile]\\frametitle{%s}"
                 "\\end{frame}"
                 "\\begin{frame}[fragile]\\frametitle{%s}"
                 "\\end{frame}")))

(add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "color"))

(provide 'org-export)
