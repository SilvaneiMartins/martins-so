ECHO OFF
cls

echo Montando o arquivo "Bootloader"
nasm -f bin bootloader.asm -o Binary/bootloader.bin

echo Montando o arquivo "Kernel"
nasm -f bin kernel.asm -o Binary/kernel.bin
pause
