MsgBox, % RMS(1, 10)


;---------------------------------------------------------------------------
RMS(a, b) { ; Root Mean Square of integers a through b
;---------------------------------------------------------------------------
    n := b - a + 1
    Loop, %n%
        Sum += (a + A_Index - 1) ** 2
    Return, Sqrt(Sum / n)
}
