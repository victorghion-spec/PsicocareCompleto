*** Settings ***
Documentation    Testes de acompanhamento diário do PsicoCare
...              Baseado nos cenários Gherkin de acompanhamento
Test Setup       Abrir Navegador PsicoCare
Test Teardown    Fechar Navegador
Resource         resources/psicocare_resources.robot
Resource         locators.robot

*** Test Cases ***

Cenário: Paciente Registra um Acompanhamento Diário com Sucesso
    [Documentation]    Testa o registro de acompanhamento diário por um paciente
    [Tags]    acompanhamento    paciente    smoke
    Dado que o Paciente "${EMAIL_PACIENTE_TESTE}" está logado
    Quando o paciente navega para a tela de "Acompanhamento Diário"
    E insere o texto "${TEXTO_ACOMPANHAMENTO_TESTE}"
    E seleciona a qualidade de sono como "4" (de 5)
    E seleciona o humor como "Neutro"
    E clica no botão "Salvar Acompanhamento"
    Então o sistema deve registrar o acompanhamento com a data e hora atuais
    E o paciente deve ver o registro na sua lista de histórico de acompanhamentos

*** Keywords ***

Dado que o Paciente "${email}" está logado
    Fazer Login Como Paciente    ${email}

Quando o paciente navega para a tela de "Acompanhamento Diário"
    Navegar Para Acompanhamento

E insere o texto "${texto}"
    Wait Until Element Is Visible    ${ACOMPANHAMENTO_TEXTAREA}    timeout=${TIMEOUT_SHORT}
    Input Text    ${ACOMPANHAMENTO_TEXTAREA}    ${texto}

E seleciona a qualidade de sono como "${nota}" (de 5)
    Selecionar Qualidade Sono    ${nota}

E seleciona o humor como "${humor}"
    # Mapear "Neutro" para "ESTAVEL" se necessário
    ${humor_mapped}=    Set Variable If    '${humor}' == 'Neutro'    ESTAVEL    ${humor.upper()}
    Selecionar Humor    ${humor_mapped}

E clica no botão "Salvar Acompanhamento"
    Salvar Acompanhamento

Então o sistema deve registrar o acompanhamento com a data e hora atuais
    Verificar Acompanhamento Salvo

E o paciente deve ver o registro na sua lista de histórico de acompanhamentos
    Wait Until Page Contains Element    ${ACOMPANHAMENTO_HISTORICO}    timeout=${TIMEOUT_MEDIUM}
    Page Should Contain Element    ${ACOMPANHAMENTO_HISTORICO}
    Page Should Contain    ${TEXTO_ACOMPANHAMENTO_TESTE}

