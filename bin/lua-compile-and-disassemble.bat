@echo off

echo Start compile lua code to [./test/test.out]
luac -o ./test/test.out ./test/test.lua
echo Start disassemble lua bytecode to [./test/test.lst]
lua ./ChunkSpy.lua -o ./test/test.lst ./test/test.out 