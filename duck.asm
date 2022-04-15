.code
extern fake_jmp_end:proc

asm_fake_jmp proc
	;int 3;
	db 66h
	db 0E9h
	db 00h
	db 00h
	db 00h
	db 00h
	db 90h
	db 90h
	db 90h
	jmp fake_jmp_end
	ret
	;jmp fake_jmp_end
asm_fake_jmp endp

end