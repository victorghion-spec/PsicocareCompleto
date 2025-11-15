@echo off
echo ========================================
echo   Iniciando Servidor Porta 8080
echo ========================================
echo.

REM Verificar se Python está instalado
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Python nao encontrado!
    pause
    exit /b 1
)

echo [OK] Servidor iniciando na porta 8080...
echo.
echo Acesse: http://localhost:8080
echo.
echo Pressione Ctrl+C para parar o servidor
echo ========================================
echo.

REM Iniciar servidor e abrir navegador
start http://localhost:8080
python -m http.server 8080


