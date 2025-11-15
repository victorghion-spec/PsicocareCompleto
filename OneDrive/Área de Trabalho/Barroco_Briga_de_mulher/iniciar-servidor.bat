@echo off
echo ========================================
echo   Oratoria Feminina - Servidor Local
echo ========================================
echo.

REM Verificar se Python está instalado
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Python nao encontrado!
    echo.
    echo Por favor, instale Python de: https://www.python.org/downloads/
    echo Ou use outro metodo de teste (veja TESTE.md)
    pause
    exit /b 1
)

echo [OK] Python encontrado!
echo.

REM Obter IP local
echo Obtendo seu endereco IP...
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
    set IP=%%a
    goto :found
)
:found
set IP=%IP:~1%

echo.
echo ========================================
echo   Servidor iniciado!
echo ========================================
echo.
echo Acesse no PC: http://localhost:8000
echo.
if not "%IP%"=="" (
    echo Acesse no Android: http://%IP%:8000
    echo.
    echo IMPORTANTE: Certifique-se de que:
    echo - PC e Android estao na mesma rede Wi-Fi
    echo - Firewall permite conexoes na porta 8000
    echo.
) else (
    echo Nao foi possivel detectar o IP automaticamente.
    echo Execute 'ipconfig' para ver seu IP manualmente.
    echo.
)

echo Pressione Ctrl+C para parar o servidor
echo ========================================
echo.

python -m http.server 8000

