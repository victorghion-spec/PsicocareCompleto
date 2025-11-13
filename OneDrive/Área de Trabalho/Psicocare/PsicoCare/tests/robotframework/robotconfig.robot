*** Settings ***
Documentation    Configuração global para testes do PsicoCare
...              Este arquivo contém configurações compartilhadas entre todos os testes

# Configurações de execução
Suite Setup      Log    Iniciando suite de testes do PsicoCare
Suite Teardown   Log    Finalizando suite de testes do PsicoCare
Test Timeout     5 minutes

# Bibliotecas padrão
Library          SeleniumLibrary    timeout=10s    implicit_wait=5s
Library          Collections
Library          String
Library          DateTime

# Recursos compartilhados
Resource         locators.robot
Resource         resources/psicocare_resources.robot

# Configurações de variáveis de ambiente
Variables        variables.py

# Configurações de output
Default Tags     psicocare
Metadata         Version    1.0
Metadata         Author     Equipe PsicoCare
Metadata         Description    Testes automatizados do PsicoCare usando Robot Framework

# Configurações de relatório
Test Template    NONE

