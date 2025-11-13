@echo off
REM Script para executar testes do PsicoCare no Windows

echo === Executando Testes do PsicoCare ===

REM Verificar se Python está instalado
python --version >nul 2>&1
if errorlevel 1 (
    echo Python nao encontrado. Por favor, instale Python 3.8 ou superior.
    exit /b 1
)

REM Verificar se pip está instalado
pip --version >nul 2>&1
if errorlevel 1 (
    echo pip nao encontrado. Por favor, instale pip.
    exit /b 1
)

REM Instalar dependências se necessário
echo Verificando dependencias...
pip install -r requirements.txt --quiet

REM Criar diretório de resultados
if not exist results mkdir results

REM Executar testes
echo Iniciando execucao dos testes...

REM Verificar argumentos
if "%1"=="smoke" (
    echo Executando apenas testes smoke...
    robot --include smoke --outputdir results --log log.html --report report.html .
) else if "%1"=="auth" (
    echo Executando apenas testes de autenticacao...
    robot --outputdir results --log log.html --report report.html test_autenticacao.robot
) else if "%1"=="all" (
    echo Executando todos os testes...
    robot --outputdir results --log log.html --report report.html .
) else if "%1"=="" (
    echo Executando todos os testes...
    robot --outputdir results --log log.html --report report.html .
) else (
    echo Executando testes: %1
    robot --outputdir results --log log.html --report report.html %1
)

REM Verificar resultado
if errorlevel 1 (
    echo === Alguns testes falharam ===
    echo Verifique o log em: results\log.html
    exit /b 1
) else (
    echo === Testes concluidos com sucesso! ===
    echo Relatorio disponivel em: results\report.html
)

