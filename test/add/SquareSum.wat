(module
    (func (export "SquareSum") 
    (param $value_1 i32) (param $value_2 i32)
    (result i32)
    (local $sum i32)
        ;;linear instruction list style
    (;  local.get $value_1
        local.get $value_2
        i32.add 

        local.set $sum

        local.get $sum
        local.get $sum
        i32.mul
    ;)
        ;; S-expressions
        (i32.add (local.get $value_1)(local.get $value_2))
        local.set $sum
        (i32.mul (local.get $sum)(local.get $sum))
    )    
)

