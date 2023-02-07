(package! benchmark-init
  :recipe (:host github
           :repo "kekeimiku/benchmark-init-el"))

(package! aggressive-indent)

(package! evil-cleverparens)

(package! evil-escape :disable t)

(package! evil-matchit)

(package! evil-numbers :disable t)

(package! plus-minus
  :recipe (:host github
           :repo "peterwu/plus-minus"))

(package! string-inflection)

(package! chatgpt
  :recipe (:host github :repo "joshcho/ChatGPT.el" :files ("dist" "*.el")))

(package! ruby-hash-syntax)

(package! page-break-lines)

(package! info-plus :pin "5ecd4c1e3f1384bffb386e61a8e3788652e55c25")

(package! dired-collapse)
(package! dired-narrow)
(package! dired-ranger)
(package! dired-quick-sort)
(package! dired-avfs)
(package! peep-dired)

(package! esh-autosuggest)
