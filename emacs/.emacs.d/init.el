; ---
; language
; ---

;; 日本語を環境とする
(set-language-environment 'Japanese)
;; coding UTF8
(prefer-coding-system 'utf-8)

; ---
; preferences
; ---

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      use-short-answers t
      recentf-max-saved-items 200
      )

;; デーモンの起動
(server-mode 1)
;; コマンド履歴を保存
(savehist-mode 1)
;; 最後のカーソル一を記憶
(save-place-mode 1)
;; 現在の行をハイライト
(global-display-line-numbers-mode 1)
;; モードラインにカーソル上の関数名等を表示
(which-function-mode 1)

;; tabにスペース4つを利用
(setq-default tab-width 2 indent-tabs-mode nil)
;; デフォルトの起動時のメッセージを表示しない
(setq inhibit-startup-message t)
;; 行の番号
(global-display-line-numbers-mode 1)
;; 行と列の番号を表示
(column-number-mode)

;; Mac で日本語入力をするときに、自動的に英数モードに切り替える
(mac-auto-ascii-mode 1)
;; 括弧を自動的に補完する
(electric-pair-mode 1)
;; 括弧のペアをハイライトする
(show-paren-mode 1)
;; 末尾のスペースを可視化
(setq whitespace-style '(face trailing))
(global-whitespace-mode 1)
;; メニューバーを非表示にする
(menu-bar-mode -1)
;; ツールバーを非表示にする
(tool-bar-mode -1)

; ---
; key bing
; ---

;; comment out
(global-set-key "\C-c;" 'comment-dwim)
;; window operation
(global-set-key "\C-t" 'other-window)


;; ---
;; org-mode
;; ---

(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))


;; ---
;; theme
;; ---

(use-package autothemer :ensure t)

;; `straight.el`のセットアップ
(unless (featurep 'straight)
  (let ((bootstrap-file
        (expand-file-name "straight/repos/straight.el/bootstrap.el"
                          user-emacs-directory)))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
    (url-retrieve-synchronously
    "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
    'silent 'inhibit-cookies)
  (goto-char (point-max))
  (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage)))

(straight-use-package
 '(rose-pine-emacs
   :host github
   :repo "thongpv87/rose-pine-emacs"
   :branch "master"))
(load-theme 'rose-pine-moon t)

(custom-set-variables
 '(package-selected-packages '(autothemer)))
