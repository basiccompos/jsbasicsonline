For repet = 1 To 1000
    HCOLOR = Int(Rnd * 3 + 1)
    M = Int(Rnd * 10 + 1)
    N = Int(Rnd * 5 + 1)

    Screen 12: Cls
    : PSet (140, 95), HCOLOR

    For A = 0 To 100 Step Rnd + .01
        R = Sin((M / N) * A) * 95
        Line -(140 + R * Sin(A), 95 + R * Cos(A)), HCOLOR
    Next A
    If A <= 99 Then
        Locate 10, 10
        Print "M="; M
        Print "N="; N
    End If
    Input p$
Next
