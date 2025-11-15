@echo off
title Oratória Feminina - Jogo de Cartas
color 0A

echo ========================================
echo   Oratoria Feminina - Jogo de Cartas
echo ========================================
echo.

REM Verificar se Python está instalado
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Python nao encontrado!
    echo.
    echo Por favor, instale Python de: https://www.python.org/downloads/
    echo.
    echo Após instalar o Python, execute este arquivo novamente.
    echo.
    pause
    exit /b 1
)

echo [OK] Python encontrado!
echo.
echo ========================================
echo   Iniciando servidor local...
echo ========================================
echo.
echo O jogo vai abrir automaticamente no seu navegador!
echo.
echo Acesse em: http://localhost:8000
echo.
echo IMPORTANTE:
echo - Mantenha esta janela aberta enquanto jogar
echo - Pressione Ctrl+C para parar o servidor
echo.
echo ========================================
echo.

REM Iniciar servidor e abrir navegador
start http://localhost:8000
python -m http.server 8000

