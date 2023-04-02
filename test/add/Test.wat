(module
    (func (export "Test")
        (result i32)
        (local $x i32)
        (local $y i32)

        (local.set $x (i32.const -1))
        (local.set $y (i32.const 1))

        (;
        ;; S-Expression
        (if (result i32)
            (i32.and
                (i32.gt_s (local.get $x) (local.get $y)) ;; x > y
                (i32.lt_s (local.get $y) (i32.const 6)) ;; y < 6
            )
        (then
            (i32.const 1000)
        )
        (else
            (i32.const 0)
        )
        )
        ;)

        ;; Linear IL style
        local.get $x
        local.get $y
        i32.gt_s 

        local.get $y
        i32.const 6
        i32.lt_s
        
        i32.and

        if (result i32)
            (i32.const 1000)
        else
            (i32.const 0)
        end
    )
)