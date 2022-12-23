.MODEL SMALL
.CODE
ORG 100h

start:
	jmp pesan
	
	nama		db 13,10,' Nama Lengkap : $'
	email		db 13,10,' Alamat Email : $'
	hp 		    db 13,10,' No.HP/Telp   : $'
	konfir	    db 13,10,' Konfirmasi data sudah benar? Tekan Y untuk konfirmasi = $'
	data_nama	db 30,?,30 dup(?)
	data_email	db 30,?,30 dup(?)
	data_hp	    db 13,?,13 dup(?)
	data_konfir db 13,?,10 dup(?)


	daftar	db 13,10,'+=============================================================+'
			db 13,10,'||		    	MUSEUM MUHAMMADIYAH	     	           ||'
			db 13,10,'+=============================================================+'
			db 13,10,'||	  	  PESAN TIKET KUNJUNGAN MUSEUM		           ||'
			db 13,10,'+=============================================================+'
			db 13,10,'||NO	|| SESI ||	   JAM 		||  HARGA TIKET         ||'
			db 13,10,'+=============================================================+'
			db 13,10,'||01	|| 01   ||	09:00-10:00 	||   Rp.5000	       ||'
			db 13,10,'+=============================================================+'
			db 13,10,'||02	|| 02   ||	10:00-11:00 	||   Rp.5000	       ||'
			db 13,10,'+=============================================================+'
			db 13,10,'||03	|| 03   ||	11:00-12:00 	||   Rp.5000	       ||'
			db 13,10,'+=============================================================+'
			db 13,10,'||04	|| 04   ||	12:00-13:00 	||   Rp.5000	       ||'
			db 13,10,'+=============================================================+'
			db 13,10,'||05	|| 05   ||	14:00-15:00 	||   Rp.5000	       ||'
			db 13,10,'+=============================================================+'
			db 13,10,'||06	|| 06   ||	15:00-16:00 	||   Rp.5000	       ||'
			db 13,10,'+=============================================================+'
			db 13,10,'||07	|| 07   ||	16:00-17:00 	||   Rp.5000	       ||'
			db 13,10,'+=============================================================+','$'

	error		db 13,10,'NOMER YANG ANDA MASUKAN SALAH $'
	pesan_tkt	db 13,10
	            db 13,10,'Silahkan masukan Nomer Sesi Museum : $'
	success	    db 13,10,'Pemesanan Berhasil! $'

pesan:

	MOV AH,09h
	LEA DX,nama
	INT 21h
	MOV AH,0Ah
	LEA DX,data_nama
	INT 21h
	PUSH DX

	MOV AH,09h
	LEA DX,email
	INT 21h
	MOV AH,0Ah
	LEA DX,data_email
	INT 21h
	PUSH DX

	MOV AH,9h
	LEA DX,hp
	INT 21h
	MOV AH,0Ah
	LEA DX,data_hp
	INT 21h
	PUSH DX

	MOV AH,09h
	MOV DX,offset konfir
	INT 21h
	MOV AH,01h
	INT 21h
	CMP AL,'Y'
	MOV AH,09h
	MOV DX,offset daftar
	INT 21h
	JMP proses
	JNE error_tkt


error_tkt:
	MOV AH,09h
	MOV DX,offset error
	INT 21h
	INT 20h

proses:

	MOV AH,09h
	MOV DX,offset pesan_tkt
	INT 21h

	MOV AH,1
	INT 21h
	MOV BH,AL
	MOV AH,1
	INT 21h
	MOV BL,AL
	CMP BH,'0'
	CMP BL,'1'
	JE pesan1
	
	CMP BH,'0'
	CMP BL,'2'
	JE pesan2

	CMP BH,'0'
	CMP BL,'3'
	JE pesan3

	CMP BH,'0'
	CMP BL,'4'
	JE pesan4

	CMP BH,'0'
	CMP BL,'5'
	JE pesan5

	CMP BH,'0'
	CMP BL,'6'
	JE pesan6

	CMP BH,'0'
	CMP BL,'7'
	JE pesan7
	JNE error_tkt

pesan1:
	MOV AH,09h
	LEA DX,tiket1
	INT 21h
	INT 20h

pesan2:
	MOV AH,09h
	LEA DX,tiket2
	INT 21h
	INT 20h

pesan3:
	MOV AH,09h
	LEA DX,tiket3
	INT 21h
	INT 20h

pesan4:
	MOV AH,09h
	LEA DX,tiket4
	INT 21h
	INT 20h

pesan5:
	MOV AH,09h
	LEA DX,tiket5
	INT 21h
	INT 20h

pesan6:
	MOV AH,09h
	LEA DX,tiket6
	INT 21h
	INT 20h

pesan7:
	MOV AH,09h
	LEA DX,tiket7
	INT 21h
	INT 20h

tiket1	db 13,10
        db 13,10,'=========================================================='
        db 13,10,'||              TIKET MUSEUM MUHAMMADIYAH               ||'
        db 13,10,'=========================================================='
        db 13,10,'||    SESI    ||      JAM KUNJUNG     ||   TOTAL HARGA  ||'
        db 13,10,'=========================================================='
        db 13,10,'||     1      ||      09:00-10:00     ||    Rp.5000     ||'
        db 13,10,'=========================================================='
        db 13,10
		db 13,10,'Terimakasih'
		db 13,10,'Selamat Menikmati Kunjungan Anda di Museum Muhammadiyah $'

tiket2	db 13,10
        db 13,10,'=========================================================='
        db 13,10,'||              TIKET MUSEUM MUHAMMADIYAH               ||'
        db 13,10,'=========================================================='
        db 13,10,'||    SESI    ||      JAM KUNJUNG     ||   TOTAL HARGA  ||'
        db 13,10,'=========================================================='
        db 13,10,'||     2      ||      10:00-11:00     ||    Rp.5000     ||'
        db 13,10,'=========================================================='
        db 13,10
		db 13,10,'Terimakasih'
		db 13,10,'Selamat Menikmati Kunjungan Anda di Museum Muhammadiyah $'

tiket3	db 13,10
        db 13,10,'=========================================================='
        db 13,10,'||              TIKET MUSEUM MUHAMMADIYAH               ||'
        db 13,10,'=========================================================='
        db 13,10,'||    SESI    ||      JAM KUNJUNG     ||   TOTAL HARGA  ||'
        db 13,10,'=========================================================='
        db 13,10,'||     3      ||      11:00-12:00     ||    Rp.5000     ||'
        db 13,10,'=========================================================='
        db 13,10
		db 13,10,'Terimakasih'
		db 13,10,'Selamat Menikmati Kunjungan Anda di Museum Muhammadiyah $'

tiket4	db 13,10
        db 13,10,'=========================================================='
        db 13,10,'||              TIKET MUSEUM MUHAMMADIYAH               ||'
        db 13,10,'=========================================================='
        db 13,10,'||    SESI    ||      JAM KUNJUNG     ||   TOTAL HARGA  ||'
        db 13,10,'=========================================================='
        db 13,10,'||     4      ||      12:00-13:00     ||    Rp.5000     ||'
        db 13,10,'=========================================================='
        db 13,10
		db 13,10,'Terimakasih'
		db 13,10,'Selamat Menikmati Kunjungan Anda di Museum Muhammadiyah $'

tiket5	db 13,10
        db 13,10,'=========================================================='
        db 13,10,'||              TIKET MUSEUM MUHAMMADIYAH               ||'
        db 13,10,'=========================================================='
        db 13,10,'||    SESI    ||      JAM KUNJUNG     ||   TOTAL HARGA  ||'
        db 13,10,'=========================================================='
        db 13,10,'||     5      ||      14:00-15:00     ||    Rp.5000     ||'
        db 13,10,'=========================================================='
        db 13,10
		db 13,10,'Terimakasih'
		db 13,10,'Selamat Menikmati Kunjungan Anda di Museum Muhammadiyah $'

tiket6	db 13,10
        db 13,10,'=========================================================='
        db 13,10,'||              TIKET MUSEUM MUHAMMADIYAH               ||'
        db 13,10,'=========================================================='
        db 13,10,'||    SESI    ||      JAM KUNJUNG     ||   TOTAL HARGA  ||'
        db 13,10,'=========================================================='
        db 13,10,'||     6      ||      15:00-16:00     ||    Rp.5000     ||'
        db 13,10,'=========================================================='
        db 13,10
		db 13,10,'Terimakasih'
		db 13,10,'Selamat Menikmati Kunjungan Anda di Museum Muhammadiyah $'

tiket7	db 13,10
        db 13,10,'=========================================================='
        db 13,10,'||              TIKET MUSEUM MUHAMMADIYAH               ||'
        db 13,10,'=========================================================='
        db 13,10,'||    SESI    ||      JAM KUNJUNG     ||   TOTAL HARGA  ||'
        db 13,10,'=========================================================='
        db 13,10,'||     7      ||      16:00-17:00     ||    Rp.5000     ||'
        db 13,10,'=========================================================='
        db 13,10
		db 13,10,'Terimakasih'
		db 13,10,'Selamat Menikmati Kunjungan Anda di Museum Muhammadiyah $'

end start
        
        
        

	

	
