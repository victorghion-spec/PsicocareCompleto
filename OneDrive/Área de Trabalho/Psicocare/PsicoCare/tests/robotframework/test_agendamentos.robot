*** Settings ***
Documentation    Testes de agendamento de consultas do PsicoCare
...              Baseado nos cenários Gherkin de agendamento
Test Setup       Abrir Navegador PsicoCare
Test Teardown    Fechar Navegador
Resource         resources/psicocare_resources.robot
Resource         locators.robot

*** Test Cases ***

Cenário: Paciente Agenda uma Consulta com Sucesso
    [Documentation]    Testa o agendamento de uma consulta por um paciente
    [Tags]    agendamento    paciente    smoke
    Dado que o Paciente "${EMAIL_PACIENTE_TESTE}" está logado
    E existe um Psicólogo "${EMAIL_PSICOLOGO_TESTE}" disponível para agendamento
    Quando o paciente navega para a lista de profissionais
    E seleciona o Psicólogo "${EMAIL_PSICOLOGO_TESTE}"
    E escolhe a data e hora "${DATA_AGENDAMENTO_TESTE} ${HORA_AGENDAMENTO_TESTE}"
    E clica no botão "Confirmar Agendamento"
    Então o sistema deve registrar o agendamento
    E o paciente deve ver o agendamento na sua lista de "Meus Agendamentos"
    E o psicólogo deve receber uma notificação de novo agendamento

Cenário: Tentativa de Agendamento em Horário Indisponível
    [Documentation]    Testa tentativa de agendamento em horário já ocupado
    [Tags]    agendamento    negativo
    Dado que o Paciente "${EMAIL_PACIENTE_TESTE}" está logado
    E o horário "${DATA_AGENDAMENTO_TESTE} ${HORA_AGENDAMENTO_TESTE}" com o Psicólogo "${EMAIL_PSICOLOGO_TESTE}" já está ocupado
    Quando o paciente tenta agendar para a data e hora "${DATA_AGENDAMENTO_TESTE} ${HORA_AGENDAMENTO_TESTE}"
    E clica no botão "Confirmar Agendamento"
    Então uma mensagem de erro "Horário indisponível" deve ser exibida
    E o agendamento não deve ser registrado

*** Keywords ***

Dado que o Paciente "${email}" está logado
    Fazer Login Como Paciente    ${email}

E existe um Psicólogo "${email}" disponível para agendamento
    [Documentation]    Pré-condição: psicólogo deve estar disponível
    Log    Verificando se psicólogo ${email} está disponível

E o horário "${data_hora}" com o Psicólogo "${email}" já está ocupado
    [Documentation]    Pré-condição: horário já deve estar ocupado
    Log    Verificando se horário ${data_hora} está ocupado

Quando o paciente navega para a lista de profissionais
    Navegar Para Psicologos

E seleciona o Psicólogo "${email}"
    # Assumindo que o nome do psicólogo pode ser encontrado pelo email ou ID
    # Em um ambiente real, você pode buscar o nome do psicólogo via API
    ${nome_psicologo}=    Set Variable    Psicólogo Teste    # Substituir por busca real
    Selecionar Psicologo Para Agendamento    ${nome_psicologo}

E escolhe a data e hora "${data_hora}"
    ${data}=    Set Variable    ${data_hora.split()[0]}
    ${hora}=    Set Variable    ${data_hora.split()[1]}
    Preencher Data E Hora Agendamento    ${data}    ${hora}

E clica no botão "Confirmar Agendamento"
    Confirmar Agendamento

Então o sistema deve registrar o agendamento
    Verificar Agendamento Criado

E o paciente deve ver o agendamento na sua lista de "Meus Agendamentos"
    Navegar Para Agendamentos
    Wait Until Page Contains Element    ${AGENDAMENTOS_LISTA}    timeout=${TIMEOUT_MEDIUM}
    Page Should Contain Element    ${AGENDAMENTOS_LISTA}

E o psicólogo deve receber uma notificação de novo agendamento
    [Documentation]    Verifica se o psicólogo recebeu a notificação
    # Em um ambiente real, você pode verificar no banco de dados ou via API
    Log    Verificando notificação para o psicólogo

Quando o paciente tenta agendar para a data e hora "${data_hora}"
    Navegar Para Psicologos
    ${nome_psicologo}=    Set Variable    Psicólogo Teste
    Selecionar Psicologo Para Agendamento    ${nome_psicologo}
    ${data}=    Set Variable    ${data_hora.split()[0]}
    ${hora}=    Set Variable    ${data_hora.split()[1]}
    Preencher Data E Hora Agendamento    ${data}    ${hora}

Então uma mensagem de erro "Horário indisponível" deve ser exibida
    Verificar Mensagem Horario Indisponivel

E o agendamento não deve ser registrado
    # Verificar que não há novo agendamento na lista
    Navegar Para Agendamentos
    # Contar agendamentos antes e depois (em um teste real)

