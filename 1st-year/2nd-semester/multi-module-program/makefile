run: a.exe
	./a.exe
rules.o: rules.asm
	nasm -f win32 rules.asm -o rules.o
textConv.o: textConv.c textConv.h
	gcc -m32 -c textConv.c -o textConv.o
a.exe: textConv.o rules.o
	gcc -m32 textConv.o rules.o
