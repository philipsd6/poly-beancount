;;; poly-beancount.el --- Polymode for beancount-mode -*- lexical-binding: t -*-
;;
;; Author: Philip Douglass
;; Maintainer: Philip Douglass
;; Copyright (C) 2022 Philip Douglass
;; Version: 0.0.1
;; Package-Requires: ((emacs "25") (polymode "0.2.2"))
;; URL: https://github.com/philipsd6/poly-beancount
;; Keywords: languages, multi-modes
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This file is *NOT* part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(require 'beancount)
(require 'org)
(require 'polymode)

(define-hostmode poly-beancount-hostmode
                 :mode 'beancount-mode)

(define-innermode poly-beancount-org-preamble-innermode
                  :mode 'org-mode
                  :fallback-mode 'host
                  :head-matcher "^#\\+[[:alpha:]].*?:.*$"
                  :tail-matcher "^[^#].*$"
                  :head-mode 'body
                  :tail-mode 'host)

(define-innermode poly-beancount-org-heading-innermode
                  :mode 'org-mode
                  :fallback-mode 'host
                  :head-matcher "^\\*+[ \\t].*$"
                  :tail-matcher "^[^\\*]+$"
                  :head-mode 'body
                  :tail-mode 'host)

;;;###autoload (autoload 'poly-beancount-mode "poly-beancount")
(define-polymode poly-beancount-mode
                 :hostmode 'poly-beancount-hostmode
                 :innermodes '(poly-beancount-org-preamble-innermode
                               poly-beancount-org-heading-innermode))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.beancount\\'" . poly-beancount-mode))

(provide 'poly-beancount)

;;; poly-beancount.el ends here
