@echo off
REM Script para executar testes Postman/Newman no Windows

echo === Executando Testes de API com Postman/Newman ===

REM Verificar se Newman está instalado
where newman >nul 2>&1
if errorlevel 1 (
    echo Newman nao encontrado. Instalando...
    npm install -g newman newman-reporter-html newman-reporter-htmlextra
)

REM Criar diretório de resultados
if not exist results mkdir results

REM Variáveis
set COLLECTION=PsicoCare_API.postman_collection.json
set ENVIRONMENT=PsicoCare_API.postman_environment.json
set BASE_URL=%PSICOCARE_API_URL%
if "%BASE_URL%"=="" set BASE_URL=http://localhost:3000

echo URL da API: %BASE_URL%

REM Executar testes
echo Executando colecao Postman...

newman run "%COLLECTION%" ^
    -e "%ENVIRONMENT%" ^
    --env-var "base_url=%BASE_URL%" ^
    -r html,cli,json,junit ^
    --reporter-html-export results\postman-report.html ^
    --reporter-json-export results\postman-report.json ^
    --reporter-junit-export results\postman-report.xml ^
    --reporter-cli-no-summary ^
    --reporter-cli-no-banner

REM Verificar resultado
if errorlevel 1 (
    echo === Alguns testes de API falharam ===
    echo Verifique o relatorio em: results\postman-report.html
    exit /b 1
) else (
    echo === Testes de API concluidos com sucesso! ===
    echo Relatorio HTML: results\postman-report.html
    echo Relatorio JSON: results\postman-report.json
    echo Relatorio JUnit: results\postman-report.xml
)

