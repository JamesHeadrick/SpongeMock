#c::
  If SavedCapsLock=
  {
    GetKeyState,SavedCapsLock,CapsLock,T
    SetTimer, RandomCL, 25
  }
  Else
  {
    SetTimer, RandomCL, Off
    If SavedCapsLock=D
      SetCapsLockState,On
    Else
      SetCapsLockState,Off
    SavedCapsLock=
  }
Return  

#v::
  KeyWait, LWin
  KeyWait, RWin
  rand := True
  StringLower, Clipboard, Clipboard
  Loop, parse, Clipboard
  {
    
    if (rand and (RegExMatch(A_LoopField, "[a-zA-Z]")))
    {
      SendInput, +%A_LoopField%
      rand := False
    }
    else 
    {
      SendInput, {Raw}%A_LoopField%
      rand := True
    }
  }
  Return

RandomCL:
  Random, rand, 0, 1
  if (rand)
     SetCapslockState, On
  else
     SetCapslockState, Off
return

