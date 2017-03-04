@echo off

setlocal
call "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat"

cd vendor/sqlcipher

git clean -dfx && git checkout -f

nmake /f Makefile.msc sqlite3.c

rm -f ../../src/c/sqlite3.c
rm -f ../../src/headers/sqlite3.h
cp sqlite3.c ../../src/c/
cp sqlite3.h ../../src/headers/

git clean -dfx && git checkout -f
cd ../../
endlocal