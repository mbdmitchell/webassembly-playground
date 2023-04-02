(;
---------------------------------
|      CFG       |     PATH     |
---------------------------------
        %0              |
        |               |
        |               |
        %1              1
       /  \            / \
      /    \          /   \
    %2     %3       00     01
      \    /          \   /
       \  /            \ /
        %4              1
        |               |
        |               |

---------------------------------
|           EXAMPLE             |
---------------------------------
$ node ifelse.js 0
PATH: 1011

$ node ifelse.js 1
PATH: 1101
;)

(module
  (func (export "OutputPath")
    (param $node_1_direction i32)
    (result i32)

    ;; --------
    ;; node %1 traversed
    ;; --------

    (local $path i32)
    (i32.const 1)
    (i32.const 1)
    (i32.shl)
    (local.set $path) ;; path = "10" 
    
    ;; check if $node_1_direction is equal to 1
    (local.get $node_1_direction)
    (if (result i32) ;; if 1 (or non-zero) then %2, else %3
      (then      
        ;; --------
        ;; node %2 traversed, node %3 not traversed | path = "110"
        ;; --------
        (local.get $path)
        (i32.const 1) 
        (i32.add) ;; 11
        (i32.const 1) 
        (i32.shl)
        (local.set $path) ;; 110
        (local.get $path)
      )
      (else
        ;; --------
        ;; node %3 traversed, node %2 not traversed | path = "101"
        ;; --------
        (local.get $path)
        (i32.const 1)
        (i32.shl) ;; 100
        (i32.const 1)
        (i32.add) 
        (local.set $path) ;; 101
        (local.get $path)
      )
    )
    ;; --------
    ;; node %4 traversed 
    ;; --------
    (i32.const 1)
    (i32.shl) 
    (i32.const 1)
    (i32.add) ;; 1101/1011
  )
)