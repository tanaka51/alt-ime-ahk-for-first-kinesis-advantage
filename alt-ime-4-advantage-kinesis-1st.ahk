/*****************************************************************************
  初代 Kinesis Advantage 向けの、Alt 空打ちで日本語・英語切り替えできるくん。

  # モチベーション&このスクリプトは何か
  初代 Kinesis Advantage の Windows モードは、Alt が左しかない！
  というわけで、素朴にやるとオリジナルの alt-ime-ahk は使えない。
  なので、non-windows mode にした上で、page up と page down を Windows キーにすることで対応する。
  それをやるスクリプト。

  # 要求
  想定しているキーレイアウトは以下(TODO)

  * PC(non-windows)Mode
    * hint: `=p` で設定可能
  * 親指キーの左側、小さいキーを、左上から時計回りに 1 ~ 4 までの番号をふったとき、以下に remap する
    * 1: (Left) Ctrl
    * 2: PageUp
    * 3: Left Alt
    * 4: Home
  * 親指キーの右側、小さいキーを、右上から反時計回りに 1 ~ 4 までの番号をふったとき、以下に remap する
    * 1: (Right) Ctrl
    * 2: PageDown
    * 3: Right Alt
    * 4: End
  * (option) CapsLock -> Esc

*/

; 左右 Alt キーの空打ちで IME の OFF/ON を切り替える
;
; 左 Alt キーの空打ちで IME を「英数」に切り替え
; 右 Alt キーの空打ちで IME を「かな」に切り替え
; Alt キーを押している間に他のキーを打つと通常の Alt キーとして動作
;
; Author:     karakaram   http://www.karakaram.com/alt-ime-on-off

#Include IME.ahk

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
#MaxHotkeysPerInterval 350

; 主要なキーを HotKey に設定し、何もせずパススルーする
*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
*~Space::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
    Return

PgUp::LWin
PgDn::RWin

; 上部メニューがアクティブになるのを抑制
*~LAlt::Send {Blind}{vk07}
*~RAlt::Send {Blind}{vk07}

; 左 Alt 空打ちで IME を OFF
LAlt up::
    if (A_PriorHotkey == "*~LAlt")
    {
        IME_SET(0)
    }
    Return

; 右 Alt 空打ちで IME を ON
RAlt up::
    if (A_PriorHotkey == "*~RAlt")
    {
        IME_SET(1)
    }
    Return
