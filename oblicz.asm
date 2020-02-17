.686
.model flat
public _oblicz_kat
.data
g dd 9.80665
liczba dd 180
.code

_oblicz_kat PROC
	push ebp
	mov ebp, esp
	finit
	fld dword ptr [ebp + 8] ; st(0) = v
	fld dword ptr g ; st(0) = g st(1) = v
	fld dword ptr [ebp + 12] ; st(0) = h st(1) = g st(2) = v
	fld1
	fadd st(0), st(0) ; st(0) = 2 st(1) = h st(2) = g st(3) = v
	fmulp st(2), st(0) ; st(0) = h st(1) = 2g st(2) = v
	fmulp st(1), st(0) ; st(0) = 2gh st(1) = v
	fxch ; st(0) = v st(1) = 2gh

	fmul st(0), st(0) ; st(0) = v^2 st(1) = 2gh
	;fxch  ; st(0) = 2gh st(1) = v^2 
	fdivp  ; st(0) = 2gh/v^2 
	fld st(0) ; st(0) = 2gh/v^2 st(1)  = 2gh/v^2 
	fsqrt ; st(0) = sqrt(2gh/v^2) 
	fxch
	
	fchs 
	fld1
	faddp
	fsqrt
	
	fpatan
	fild dword ptr liczba
	fmulp 
	fldpi
	fdivp


	pop ebp
	ret
_oblicz_kat ENDP
end