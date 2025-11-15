@echo off
echo ========================================
echo   Compilando Instalador COMPLETO
echo ========================================
echo.

REM Verificar se Inno Setup está instalado
set INNO_PATH="C:\Program Files (x86)\Inno Setup 6\ISCC.exe"
if not exist %INNO_PATH% (
    set INNO_PATH="C:\Program Files\Inno Setup 6\ISCC.exe"
)

if not exist %INNO_PATH% (
    echo [ERRO] Inno Setup nao encontrado!
    echo.
    echo Por favor, instale o Inno Setup de: https://jrsoftware.org/isdl.php
    pause
    exit /b 1
)

echo [OK] Inno Setup encontrado!
echo.

REM Criar pasta dist se não existir
if not exist "dist" (
    mkdir dist
)

echo ========================================
echo   Compilando instalador completo...
echo ========================================
echo.

REM Compilar setup.iss (versão completa)
%INNO_PATH% "setup.iss"

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   COMPILACAO CONCLUIDA COM SUCESSO!
    echo ========================================
    echo.
    echo Instalador criado em: dist\OratoriaFeminina-Setup.exe
) else (
    echo.
    echo ========================================
    echo   ERRO NA COMPILACAO!
    echo ========================================
)

echo.
pause

