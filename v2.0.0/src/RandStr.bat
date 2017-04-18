@echo off
cls
setlocal enabledelayedexpansion
title RandStr v2
goto start

:defaultHeader
cls
echo ---------------------
echo RandStr v2
echo Author: Tateshiki0529
echo URL: http://tslab.ml/
echo ---------------------
echo;
exit /b

:start
call :defaultHeader
echo 文字数を指定…^(5～が好ましい^)
set /p "sl=-->"
call :defaultHeader
echo 生成数を指定…
set /p "ln=-->"
set cnt_length=0
set cnt_line=0
if not exist result.txt break > result.txt
echo # ---------------------> result.txt
echo # RandStr v2>> result.txt
echo # Author: Tateshiki0529>> result.txt
echo # URL: http://tslab.ml/>> result.txt
echo # --------------------->> result.txt
echo # ↓ここから↓>> result.txt
echo;>> result.txt
goto create

:create
set /a R=%RANDOM%*67/32768
if %R% == 1 set rfn=%rfn2%a
if %R% == 2 set rfn=%rfn2%b
if %R% == 3 set rfn=%rfn2%c
if %R% == 4 set rfn=%rfn2%d
if %R% == 5 set rfn=%rfn2%e
if %R% == 6 set rfn=%rfn2%f
if %R% == 7 set rfn=%rfn2%g
if %R% == 8 set rfn=%rfn2%h
if %R% == 9 set rfn=%rfn2%i
if %R% == 10 set rfn=%rfn2%j
if %R% == 11 set rfn=%rfn2%k
if %R% == 12 set rfn=%rfn2%l
if %R% == 13 set rfn=%rfn2%m
if %R% == 14 set rfn=%rfn2%n
if %R% == 15 set rfn=%rfn2%o
if %R% == 16 set rfn=%rfn2%p
if %R% == 17 set rfn=%rfn2%q
if %R% == 18 set rfn=%rfn2%r
if %R% == 19 set rfn=%rfn2%s
if %R% == 20 set rfn=%rfn2%t
if %R% == 21 set rfn=%rfn2%u
if %R% == 22 set rfn=%rfn2%v
if %R% == 23 set rfn=%rfn2%w
if %R% == 24 set rfn=%rfn2%x
if %R% == 25 set rfn=%rfn2%y
if %R% == 26 set rfn=%rfn2%z
if %R% == 27 set rfn=%rfn2%A
if %R% == 28 set rfn=%rfn2%B
if %R% == 29 set rfn=%rfn2%C
if %R% == 30 set rfn=%rfn2%D
if %R% == 31 set rfn=%rfn2%E
if %R% == 32 set rfn=%rfn2%F
if %R% == 33 set rfn=%rfn2%G
if %R% == 34 set rfn=%rfn2%H
if %R% == 35 set rfn=%rfn2%I
if %R% == 36 set rfn=%rfn2%J
if %R% == 37 set rfn=%rfn2%K
if %R% == 38 set rfn=%rfn2%L
if %R% == 39 set rfn=%rfn2%M
if %R% == 40 set rfn=%rfn2%N
if %R% == 41 set rfn=%rfn2%O
if %R% == 42 set rfn=%rfn2%P
if %R% == 43 set rfn=%rfn2%Q
if %R% == 44 set rfn=%rfn2%R
if %R% == 45 set rfn=%rfn2%S
if %R% == 46 set rfn=%rfn2%T
if %R% == 47 set rfn=%rfn2%U
if %R% == 48 set rfn=%rfn2%V
if %R% == 49 set rfn=%rfn2%W
if %R% == 50 set rfn=%rfn2%X
if %R% == 51 set rfn=%rfn2%Y
if %R% == 52 set rfn=%rfn2%Z
if %R% == 53 set rfn=%rfn2%0
if %R% == 54 set rfn=%rfn2%1
if %R% == 55 set rfn=%rfn2%2
if %R% == 56 set rfn=%rfn2%3
if %R% == 57 set rfn=%rfn2%4
if %R% == 58 set rfn=%rfn2%5
if %R% == 59 set rfn=%rfn2%6
if %R% == 60 set rfn=%rfn2%7
if %R% == 61 set rfn=%rfn2%8
if %R% == 62 set rfn=%rfn2%9
if %R% == 63 set rfn=%rfn2%+
if %R% == 64 set rfn=%rfn2%-
if %R% == 65 set rfn=%rfn2%_
if %R% == 66 set rfn=%rfn2%#
cls
set rfn2=%rfn%
echo Creating...(%cnt_line%/%ln%^)
set resultlen=0
call :strlen %rfn2%
set cnt_length=%resultlen%
if %cnt_length% == %sl% (
 echo %rfn2%>> result.txt
 set rfn=
 set rfn2=
 set cnt_length=0
 set /a cnt_line+=1
)
if %cnt_line% == %ln% (
 echo Complete.
 pause
 exit /b
)
set /a cnt_length+=1
goto create

:strlen

set str=%1
set len=0

:strlenLoop
if not "%str%"=="" (
	set str=%str:~1%
	set /a resultlen=%resultlen%+1
	goto :strlenLoop
)

exit /b
