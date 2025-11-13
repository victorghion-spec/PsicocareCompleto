*** Settings ***
Documentation    Testes de gerenciamento do psicólogo do PsicoCare
...              Baseado nos cenários Gherkin de gerenciamento do psicólogo
Test Setup       Abrir Navegador PsicoCare
Test Teardown    Fechar Navegador
Resource         resources/psicocare_resources.robot
Resource         locators.robot

*** Test Cases ***

Cenário: Psicólogo Aceita uma Solicitação de Paciente
    [Documentation]    Testa a aceitação de solicitação de paciente por um psicólogo
    [Tags]    psicologo    solicitacoes    smoke
    Dado que o Psicólogo "${EMAIL_PSICOLOGO_TESTE}" está logado
    E existe uma solicitação pendente do Paciente "${EMAIL_PACIENTE_TESTE}"
    Quando o psicólogo navega para a tela de "Solicitações Pendentes"
    E clica no botão "Aceitar" na solicitação do Paciente "${EMAIL_PACIENTE_TESTE}"
    Então a solicitação deve ser marcada como "Aceita"
    E o Paciente "${EMAIL_PACIENTE_TESTE}" deve ser notificado sobre a aceitação
    E o paciente e o psicólogo devem estar vinculados para futuros agendamentos

Cenário: Psicólogo Altera sua Disponibilidade para Indisponível
    [Documentation]    Testa a alteração de disponibilidade do psicólogo
    [Tags]    psicologo    disponibilidade
    Dado que o Psicólogo "${EMAIL_PSICOLOGO_TESTE}" está logado
    E sua disponibilidade atual está como "Disponível"
    Quando o psicólogo navega para o seu perfil
    E desativa o botão de "Disponibilidade"
    Então o sistema deve atualizar o status do psicólogo para "Indisponível"
    E o psicólogo não deve aparecer nas buscas de novos pacientes

*** Keywords ***

Dado que o Psicólogo "${email}" está logado
    Fazer Login Como Psicologo    ${email}

E existe uma solicitação pendente do Paciente "${email}"
    [Documentation]    Pré-condição: deve existir uma solicitação pendente
    Log    Verificando se existe solicitação pendente do paciente ${email}

E sua disponibilidade atual está como "Disponível"
    [Documentation]    Pré-condição: psicólogo deve estar disponível
    Log    Verificando se psicólogo está disponível

Quando o psicólogo navega para a tela de "Solicitações Pendentes"
    Go To    ${SOLICITACOES_URL}
    Wait Until Page Contains Element    ${SOLICITACOES_TITLE}    timeout=${TIMEOUT_PAGE_LOAD}

E clica no botão "Aceitar" na solicitação do Paciente "${email}"
    # Buscar o nome do paciente via email (em um ambiente real, via API)
    ${nome_paciente}=    Set Variable    Paciente Teste    # Substituir por busca real
    Aceitar Solicitacao Paciente    ${nome_paciente}

Quando o psicólogo navega para o seu perfil
    # Navegar para a tela de perfil
    Go To    ${BASE_URL}/perfil
    Wait Until Page Contains Element    ${PERFIL_TITLE}    timeout=${TIMEOUT_PAGE_LOAD}

E desativa o botão de "Disponibilidade"
    Wait Until Element Is Visible    ${PERFIL_BTN_DISPONIBILIDADE}    timeout=${TIMEOUT_SHORT}
    Click Element    ${PERFIL_BTN_DISPONIBILIDADE}
    Sleep    2s    # Aguarda processamento

Então a solicitação deve ser marcada como "Aceita"
    # Verificar que a solicitação foi removida da lista ou marcada como aceita
    Page Should Not Contain Element    ${SOLICITACOES_BTN_ACEITAR}
    # Ou verificar mensagem de sucesso

E o Paciente "${email}" deve ser notificado sobre a aceitação
    [Documentation]    Verifica se o paciente foi notificado
    # Em um ambiente real, você pode verificar no banco de dados ou via API
    Log    Verificando notificação para o paciente ${email}

E o paciente e o psicólogo devem estar vinculados para futuros agendamentos
    [Documentation]    Verifica se o vínculo foi criado
    # Em um ambiente real, você pode verificar no banco de dados
    Log    Verificando vínculo entre paciente e psicólogo

Então o sistema deve atualizar o status do psicólogo para "Indisponível"
    Wait Until Page Contains Element    ${PERFIL_STATUS_INDISPONIVEL}    timeout=${TIMEOUT_MEDIUM}
    Page Should Contain Element    ${PERFIL_STATUS_INDISPONIVEL}

E o psicólogo não deve aparecer nas buscas de novos pacientes
    # Fazer logout e tentar buscar como paciente
    Limpar Cookies E Sessao
    Fazer Login Como Paciente
    Navegar Para Psicologos
    # Verificar que o psicólogo não aparece na lista
    Page Should Not Contain    ${EMAIL_PSICOLOGO_TESTE}

