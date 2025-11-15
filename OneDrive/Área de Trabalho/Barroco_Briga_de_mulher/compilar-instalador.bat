@echo off
echo ========================================
echo   Compilando Instalador - Oratoria Feminina
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
    echo.
    echo Ou edite este arquivo e informe o caminho correto do ISCC.exe
    echo.
    pause
    exit /b 1
)

echo [OK] Inno Setup encontrado!
echo.

REM Verificar se os arquivos necessários existem
if not exist "index.html" (
    echo [ERRO] Arquivo index.html nao encontrado!
    pause
    exit /b 1
)

if not exist "game.js" (
    echo [ERRO] Arquivo game.js nao encontrado!
    pause
    exit /b 1
)

if not exist "iniciar-jogo.bat" (
    echo [ERRO] Arquivo iniciar-jogo.bat nao encontrado!
    pause
    exit /b 1
)

echo [OK] Arquivos necessarios encontrados!
echo.

REM Criar pasta dist se não existir
if not exist "dist" (
    mkdir dist
    echo [OK] Pasta dist criada!
)

echo ========================================
echo   Compilando instalador...
echo ========================================
echo.

REM Compilar setup-simples.iss (versão simplificada)
echo Compilando setup-simples.iss...
%INNO_PATH% "setup-simples.iss"

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   COMPILACAO CONCLUIDA COM SUCESSO!
    echo ========================================
    echo.
    echo Instalador criado em: dist\OratoriaFeminina-Setup.exe
    echo.
    echo Deseja testar o instalador agora? (S/N)
    set /p testar="> "
    
    if /i "%testar%"=="S" (
        echo.
        echo Abrindo instalador para teste...
        start "" "dist\OratoriaFeminina-Setup.exe"
    )
) else (
    echo.
    echo ========================================
    echo   ERRO NA COMPILACAO!
    echo ========================================
    echo.
    echo Verifique os erros acima e tente novamente.
)

echo.
pause

