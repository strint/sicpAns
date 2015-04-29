(load "2069_huffman_tree_generate.scm")

(define song-pairs (list (cons 'a 2) (cons 'get 2) (cons 'sha 3) (cons 'wah 1) (cons 'boom 1) (cons 'job 2) (cons 'na 16) (cons 'yip 9)))

(define song-message '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom))

(define song-tree (generate-huffman-tree song-pairs))

(define song-code (encode song-message song-tree))
