@echo off
cls
setlocal enabledelayedexpansion
title RandStr v3
goto start

:start
set sl=%1
set ln=%2
if "%sl%" == "" set sl=10
if "%ln%" == "" set ln=5
set cnt_length=0
set cnt_line=0
if exist Conf.c3 (
	for /f "delims== tokens=1,*" %%a in ('findstr /r "^[a-zA-Z0-9][a-zA-Z0-9]*=" "Conf.c3"') do set %%a=%%b
) else (
	break > Conf.c3
	echo useUC=true> Conf.c3
	echo useNum=true>> Conf.c3
	echo useSymbol=true>> Conf.c3
	set useUC=true
	set useNum=true
	set useSymbol=true
)
if not exist result.txt break > result.txt
echo # ---------------------> result.txt
echo # RandStr v3>> result.txt
echo # Author: Tateshiki0529>> result.txt
echo # URL: http://tslab.ml/>> result.txt
echo # --------------------->> result.txt
echo # ↓ここから↓>> result.txt
echo;>> result.txt
goto create

:create
call :lc
if %useUC% == true call :uc
if %useNum% == true call :num
if %useSymbol% == true call :symbol
cls
set resultlen=1
call :strlen %rfn2%
set rfn2=%rfn%
echo Creating...(%cnt_line%/%ln%^)
echo String(%resultlen%) "%rfn%"
set cnt_length=%resultlen%
if %cnt_length% == %sl% (
 echo %rfn2%>> result.txt
 set rfn=
 set rfn2=
 set cnt_length=0
 set /a cnt_line+=1
)
if %cnt_line% == %ln% (
 echo;>>result.txt
 echo # ↑ここまで↑>>result.txt
 echo # ---------------->>result.txt
 echo # 設定項目:>>result.txt
 echo # 大文字を使用する --^> %useUC%>>result.txt
 echo # 数字を使用する --^> %useNum%>>result.txt
 echo # 記号を使用する --^> %useSymbol%>>result.txt
 echo # ---------------->>result.txt
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

:lc
call :randomNum 1 26
if %ROLL% == 1 set rfn=%rfn2%a
if %ROLL% == 2 set rfn=%rfn2%b
if %ROLL% == 3 set rfn=%rfn2%c
if %ROLL% == 4 set rfn=%rfn2%d
if %ROLL% == 5 set rfn=%rfn2%e
if %ROLL% == 6 set rfn=%rfn2%f
if %ROLL% == 7 set rfn=%rfn2%g
if %ROLL% == 8 set rfn=%rfn2%h
if %ROLL% == 9 set rfn=%rfn2%i
if %ROLL% == 10 set rfn=%rfn2%j
if %ROLL% == 11 set rfn=%rfn2%k
if %ROLL% == 12 set rfn=%rfn2%l
if %ROLL% == 13 set rfn=%rfn2%m
if %ROLL% == 14 set rfn=%rfn2%n
if %ROLL% == 15 set rfn=%rfn2%o
if %ROLL% == 16 set rfn=%rfn2%p
if %ROLL% == 17 set rfn=%rfn2%q
if %ROLL% == 18 set rfn=%rfn2%r
if %ROLL% == 19 set rfn=%rfn2%s
if %ROLL% == 20 set rfn=%rfn2%t
if %ROLL% == 21 set rfn=%rfn2%u
if %ROLL% == 22 set rfn=%rfn2%v
if %ROLL% == 23 set rfn=%rfn2%w
if %ROLL% == 24 set rfn=%rfn2%x
if %ROLL% == 25 set rfn=%rfn2%y
if %ROLL% == 26 set rfn=%rfn2%z
exit /b

:uc
call :randomNum 27 52
if %ROLL% == 27 set rfn=%rfn2%A
if %ROLL% == 28 set rfn=%rfn2%B
if %ROLL% == 29 set rfn=%rfn2%C
if %ROLL% == 30 set rfn=%rfn2%D
if %ROLL% == 31 set rfn=%rfn2%E
if %ROLL% == 32 set rfn=%rfn2%F
if %ROLL% == 33 set rfn=%rfn2%G
if %ROLL% == 34 set rfn=%rfn2%H
if %ROLL% == 35 set rfn=%rfn2%I
if %ROLL% == 36 set rfn=%rfn2%J
if %ROLL% == 37 set rfn=%rfn2%K
if %ROLL% == 38 set rfn=%rfn2%L
if %ROLL% == 39 set rfn=%rfn2%M
if %ROLL% == 40 set rfn=%rfn2%N
if %ROLL% == 41 set rfn=%rfn2%O
if %ROLL% == 42 set rfn=%rfn2%P
if %ROLL% == 43 set rfn=%rfn2%Q
if %ROLL% == 44 set rfn=%rfn2%R
if %ROLL% == 45 set rfn=%rfn2%S
if %ROLL% == 46 set rfn=%rfn2%T
if %ROLL% == 47 set rfn=%rfn2%U
if %ROLL% == 48 set rfn=%rfn2%V
if %ROLL% == 49 set rfn=%rfn2%W
if %ROLL% == 50 set rfn=%rfn2%X
if %ROLL% == 51 set rfn=%rfn2%Y
if %ROLL% == 52 set rfn=%rfn2%Z
exit /b

:num
call :randomNum 53 62
if %ROLL% == 53 set rfn=%rfn2%0
if %ROLL% == 54 set rfn=%rfn2%1
if %ROLL% == 55 set rfn=%rfn2%2
if %ROLL% == 56 set rfn=%rfn2%3
if %ROLL% == 57 set rfn=%rfn2%4
if %ROLL% == 58 set rfn=%rfn2%5
if %ROLL% == 59 set rfn=%rfn2%6
if %ROLL% == 60 set rfn=%rfn2%7
if %ROLL% == 61 set rfn=%rfn2%8
if %ROLL% == 62 set rfn=%rfn2%9
exit /b

:symbol
call :randomNum 63 66
if %ROLL% == 63 set rfn=%rfn2%+
if %ROLL% == 64 set rfn=%rfn2%-
if %ROLL% == 65 set rfn=%rfn2%_
if %ROLL% == 66 set rfn=%rfn2%#
exit /b

:randomNum
rem randomNum
rem by koryuohproject(http://qiita.com/koryuohproject/items/e6eb3e484f4d36e4fa4c)
rem edited by Tateshiki0529

set a1=%1
set a2=%2
if "%a1%" == "" (
	set /a DMINIMUM=1 
) else (
	set /a DMINIMUM=%1
)
if "%a2%" == "" (
	set /a DMAXIMUM=6 
) else (
	set /a DMAXIMUM=%2
)
set /a ROLL=(%random%*(%DMAXIMUM%))/32768+%DMINIMUM%
exit /b