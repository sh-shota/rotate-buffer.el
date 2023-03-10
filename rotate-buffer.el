(defun right-rotate-buffer()
  "M-] : right rotate visble buffers"
  (interactive)
  (setq buffers (cons (window-buffer) `()))
  (setq windows (cons (selected-window) `()))
  (setq itr 0)

  (while (not (eq (nth itr windows) (next-window (nth 0 windows))))
    (setq itr (1+ itr))
    (setq windows (cons (next-window (nth 0 windows)) windows))
    (setq buffers (cons (window-buffer (nth 0 windows)) buffers))
    )
  (setq num itr)

  (setq windows (reverse windows))
  (setq newbuff (cons (pop buffers) `()))
  (setq newbuff (append newbuff (reverse buffers)))
  
  (setq itr 0)
  (while (<= itr num)
    (set-window-buffer (nth itr windows) (nth itr newbuff))
    (setq itr (1+ itr))
    )
  )

(defun left-rotate-buffer()
  "M-[ : right rotate visble buffers"
  (interactive)
  (setq buffers (cons (window-buffer) `()))
  (setq windows (cons (selected-window) `()))
  (setq itr 0)

  (while (not (eq (nth itr windows) (next-window (nth 0 windows))))
    (setq itr (1+ itr))
    (setq windows (cons (next-window (nth 0 windows)) windows))
    (setq buffers (cons (window-buffer (nth 0 windows)) buffers))
    )
  (setq num itr)

  (setq windows (reverse windows))
  (setq revbuff (reverse buffers))
  (setq newbuff (cons (pop revbuff) `()))
  (setq newbuff (append  revbuff newbuff))
  
  (setq itr 0)
  (while (<= itr num)
    (set-window-buffer (nth itr windows) (nth itr newbuff))
    (setq itr (1+ itr))
    )
  )

(global-set-key "\M-]" `right-rotate-buffer)
(global-set-key "\M-[" `left-rotate-buffer)
