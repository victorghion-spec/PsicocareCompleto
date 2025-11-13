@echo off
REM Script para executar todos os testes (UI + API) e gerar relatório consolidado no Windows

echo ╔════════════════════════════════════════════════════════════╗
echo ║   Executando Todos os Testes do PsicoCare                 ║
echo ╚════════════════════════════════════════════════════════════╝

REM Configurações
set BASE_DIR=%~dp0..
set RESULTS_DIR=%BASE_DIR%\test-results
set ROBOT_RESULTS=%RESULTS_DIR%\robotframework
set POSTMAN_RESULTS=%RESULTS_DIR%\postman
set CONSOLIDATED_REPORT=%RESULTS_DIR%\consolidated-report.html

REM URLs
if "%PSICOCARE_BASE_URL%"=="" set PSICOCARE_BASE_URL=http://localhost:19006
if "%PSICOCARE_API_URL%"=="" set PSICOCARE_API_URL=http://localhost:3000

REM Criar diretórios
if not exist "%RESULTS_DIR%" mkdir "%RESULTS_DIR%"
if not exist "%ROBOT_RESULTS%" mkdir "%ROBOT_RESULTS%"
if not exist "%POSTMAN_RESULTS%" mkdir "%POSTMAN_RESULTS%"

echo Configuracoes:
echo   Frontend URL: %PSICOCARE_BASE_URL%
echo   API URL: %PSICOCARE_API_URL%
echo   Resultados: %RESULTS_DIR%
echo.

REM Verificar dependências
echo Verificando dependencias...
python --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: Python nao encontrado!
    exit /b 1
)

node --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: Node.js nao encontrado!
    exit /b 1
)

where newman >nul 2>&1
if errorlevel 1 (
    echo Instalando Newman...
    npm install -g newman newman-reporter-html newman-reporter-htmlextra newman-reporter-junit
)

echo Dependencias verificadas
echo.

REM Executar testes de API
echo ════════════════════════════════════════════════════════════
echo Executando Testes de API (Postman/Newman)
echo ════════════════════════════════════════════════════════════

cd /d "%BASE_DIR%\tests\postman"
if exist "run_postman_tests.bat" (
    call run_postman_tests.bat
) else (
    newman run PsicoCare_API.postman_collection.json ^
        -e PsicoCare_API.postman_environment.json ^
        --env-var "base_url=%PSICOCARE_API_URL%" ^
        -r html,json,junit,cli ^
        --reporter-html-export "%POSTMAN_RESULTS%\postman-report.html" ^
        --reporter-json-export "%POSTMAN_RESULTS%\postman-report.json" ^
        --reporter-junit-export "%POSTMAN_RESULTS%\postman-report.xml" ^
        --reporter-cli-no-summary
)
set POSTMAN_EXIT_CODE=%ERRORLEVEL%

echo.
echo ════════════════════════════════════════════════════════════
echo Executando Testes de UI (Robot Framework)
echo ════════════════════════════════════════════════════════════

cd /d "%BASE_DIR%\tests\robotframework"
robot ^
    --variable BASE_URL:%PSICOCARE_BASE_URL% ^
    --variable API_URL:%PSICOCARE_API_URL% ^
    --outputdir "%ROBOT_RESULTS%" ^
    --log "%ROBOT_RESULTS%\log.html" ^
    --report "%ROBOT_RESULTS%\report.html" ^
    --output "%ROBOT_RESULTS%\output.xml" ^
    --xunit "%ROBOT_RESULTS%\xunit.xml" ^
    .
set ROBOT_EXIT_CODE=%ERRORLEVEL%

echo.

REM Gerar relatório consolidado
echo ════════════════════════════════════════════════════════════
echo Gerando Relatorio Consolidado
echo ════════════════════════════════════════════════════════════

cd /d "%BASE_DIR%"
if exist "tests\scripts\generate_consolidated_report.py" (
    python tests\scripts\generate_consolidated_report.py ^
        --robot-results "%ROBOT_RESULTS%" ^
        --postman-results "%POSTMAN_RESULTS%" ^
        --output "%CONSOLIDATED_REPORT%"
) else (
    echo AVISO: Script de relatorio consolidado nao encontrado
)

echo.

REM Resumo final
echo ╔════════════════════════════════════════════════════════════╗
echo ║   Resumo da Execucao                                       ║
echo ╚════════════════════════════════════════════════════════════╝

if %POSTMAN_EXIT_CODE% EQU 0 if %ROBOT_EXIT_CODE% EQU 0 (
    echo Todos os testes passaram!
    echo.
    echo Relatorios gerados:
    echo   UI: %ROBOT_RESULTS%\report.html
    echo   API: %POSTMAN_RESULTS%\postman-report.html
    echo   Consolidado: %CONSOLIDATED_REPORT%
    exit /b 0
) else (
    echo Alguns testes falharam
    echo.
    echo Relatorios gerados:
    echo   UI: %ROBOT_RESULTS%\report.html
    echo   API: %POSTMAN_RESULTS%\postman-report.html
    echo   Consolidado: %CONSOLIDATED_REPORT%
    exit /b 1
)

