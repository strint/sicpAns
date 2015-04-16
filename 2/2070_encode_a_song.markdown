# Question
Exercise 2.70.

# Answer
## Codes
```scheme
(load "2069_huffman_tree_generate.scm")

(define song-pairs (list (cons 'a 2) (cons 'get 2) (cons 'sha 3) (cons 'wah 1) (cons 'boom 1) (cons 'job 2) (cons 'na 16) (cons 'yip 9)))

(define song-message '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom))

(define song-tree (generate-huffman-tree song-pairs))

(define song-code (encode song-message song-tree))
```

## Running
```
1 ]=> song-pairs

;Value 17: ((a . 2) (get . 2) (sha . 3) (wah . 1) (boom . 1) (job . 2) (na . 16) (yip . 9))

1 ]=> song-message

;Value 18: (get a job sha na na na na na na na na get a job sha na na na na na na na na wah yip yip yip yip yip yip yip yip yip sha boom)

1 ]=> song-tree

;Value 19: ((leaf na 16) ((leaf yip 9) (((leaf a 2) ((leaf boom 1) (leaf wah 1) (boom wah) 2) (a boom wah) 4) ((leaf sha 3) ((leaf job 2) (leaf get 2) (job get) 4) (sha job get) 7) (a boom wah sha job get) 11) (yip a boom wah sha job get) 20) (na yip a boom wah sha job get) 36)

1 ]=> song-code

;Value 20: (1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 0)

1 ]=> (length song-code)

;Value: 84
```
* 可知需要84个比特去编码这首歌。
* 使用定长编码，8个符号，使用3个比特来编码一个符号，歌中共有36个符号，则需要3*36=108个比特。
