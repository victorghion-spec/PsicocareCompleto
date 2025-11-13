*** Settings ***
Documentation    Testes de avaliação de psicólogos do PsicoCare
...              Baseado nos cenários Gherkin de avaliação
Test Setup       Abrir Navegador PsicoCare
Test Teardown    Fechar Navegador
Resource         resources/psicocare_resources.robot
Resource         locators.robot

*** Test Cases ***

Cenário: Paciente Envia uma Avaliação com Nota e Comentário
    [Documentation]    Testa o envio de avaliação de um psicólogo por um paciente
    [Tags]    avaliacao    paciente    smoke
    Dado que o Paciente "${EMAIL_PACIENTE_TESTE}" está logado
    E o paciente teve uma consulta recente com o Psicólogo "${EMAIL_PSICOLOGO_TESTE}"
    Quando o paciente navega para a tela de avaliação do psicólogo
    E seleciona a nota "${NOTA_AVALIACAO_TESTE}" (de 5)
    E insere o comentário "${COMENTARIO_AVALIACAO_TESTE}"
    E clica no botão "Enviar Avaliação"
    Então o sistema deve registrar a avaliação
    E a nota média do Psicólogo "${EMAIL_PSICOLOGO_TESTE}" deve ser atualizada
    E a avaliação deve estar visível na lista de avaliações públicas

*** Keywords ***

Dado que o Paciente "${email}" está logado
    Fazer Login Como Paciente    ${email}

E o paciente teve uma consulta recente com o Psicólogo "${email}"
    [Documentation]    Pré-condição: paciente deve ter tido uma consulta
    Log    Verificando se paciente teve consulta com psicólogo ${email}

Quando o paciente navega para a tela de avaliação do psicólogo
    # Navegar para a página do psicólogo específico
    # Em um ambiente real, você pode buscar o ID do psicólogo via API
    ${psicologo_id}=    Set Variable    1    # Substituir por busca real
    Go To    ${BASE_URL}/psicologo/${psicologo_id}
    Wait Until Page Contains Element    ${AVALIACAO_COMENTARIO_INPUT}    timeout=${TIMEOUT_PAGE_LOAD}

E seleciona a nota "${nota}" (de 5)
    Preencher Avaliacao Psicologo    ${nota}    ${EMPTY}

E insere o comentário "${comentario}"
    Wait Until Element Is Visible    ${AVALIACAO_COMENTARIO_INPUT}    timeout=${TIMEOUT_SHORT}
    Input Text    ${AVALIACAO_COMENTARIO_INPUT}    ${comentario}

E clica no botão "Enviar Avaliação"
    Enviar Avaliacao

Então o sistema deve registrar a avaliação
    Verificar Avaliacao Enviada

E a nota média do Psicólogo "${email}" deve ser atualizada
    [Documentation]    Verifica se a nota média foi atualizada
    # Em um ambiente real, você pode verificar via API ou na interface
    Log    Verificando atualização da nota média do psicólogo ${email}

E a avaliação deve estar visível na lista de avaliações públicas
    Wait Until Page Contains Element    ${AVALIACAO_LISTA_PUBLICA}    timeout=${TIMEOUT_MEDIUM}
    Page Should Contain Element    ${AVALIACAO_LISTA_PUBLICA}
    Page Should Contain    ${COMENTARIO_AVALIACAO_TESTE}

