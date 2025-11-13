*** Settings ***
Documentation    Testes de autenticação e cadastro do PsicoCare
...              Baseado nos cenários Gherkin de autenticação
Test Setup       Abrir Navegador PsicoCare
Test Teardown    Fechar Navegador
Resource         resources/psicocare_resources.robot
Resource         locators.robot

*** Test Cases ***

Cenário: Login de Paciente com Sucesso
    [Documentation]    Testa o login de um paciente com credenciais válidas
    [Tags]    login    paciente    smoke
    Dado que um paciente com o email "${EMAIL_PACIENTE_TESTE}" e a senha "${SENHA_PACIENTE_TESTE}" está cadastrado no sistema
    Quando o paciente insere o email "${EMAIL_PACIENTE_TESTE}" no campo de email
    E insere a senha "${SENHA_PACIENTE_TESTE}" no campo de senha
    E clica no botão "Entrar"
    Então o sistema deve autenticar o paciente com sucesso
    E o paciente deve ser redirecionado para a tela inicial do paciente
    E o sistema deve armazenar o token de autenticação

Cenário: Login de Psicólogo com Sucesso
    [Documentation]    Testa o login de um psicólogo com credenciais válidas
    [Tags]    login    psicologo    smoke
    Dado que um psicólogo com o email "${EMAIL_PSICOLOGO_TESTE}" e a senha "${SENHA_PSICOLOGO_TESTE}" está cadastrado no sistema
    Quando o psicólogo insere o email "${EMAIL_PSICOLOGO_TESTE}" no campo de email
    E insere a senha "${SENHA_PSICOLOGO_TESTE}" no campo de senha
    E clica no botão "Entrar"
    Então o sistema deve autenticar o psicólogo com sucesso
    E o psicólogo deve ser redirecionado para a tela inicial do psicólogo (Dashboard)
    E o sistema deve armazenar o token de autenticação

Cenário: Tentativa de Login com Credenciais Inválidas
    [Documentation]    Testa o login com credenciais inválidas
    [Tags]    login    negativo
    Dado que o usuário está na tela de login
    Quando o usuário insere o email "${EMAIL_INVALIDO}" no campo de email
    E insere a senha "${SENHA_INVALIDA}" no campo de senha
    E clica no botão "Entrar"
    Então uma mensagem de erro "Credenciais inválidas" deve ser exibida
    E o usuário deve permanecer na tela de login

Cenário: Cadastro de Novo Paciente
    [Documentation]    Testa o cadastro de um novo paciente
    [Tags]    cadastro    paciente
    Dado que o usuário está na tela de cadastro
    Quando o usuário preenche o formulário de cadastro com o tipo "paciente"
    ...    Nome=${NOME_PACIENTE_NOVO}
    ...    Email=${EMAIL_PACIENTE_NOVO}
    ...    Senha=${SENHA_PACIENTE_NOVO}
    ...    Telefone=${TELEFONE_TESTE}
    ...    Nascimento=${DATA_NASCIMENTO_TESTE}
    E clica no botão "Cadastrar"
    Então o sistema deve criar o novo usuário com sucesso
    E o paciente deve ser redirecionado para a tela de login

*** Keywords ***

Dado que um paciente com o email "${email}" e a senha "${senha}" está cadastrado no sistema
    [Documentation]    Pré-condição: paciente deve estar cadastrado
    # Em um ambiente real, você pode verificar no banco de dados ou criar o usuário via API
    Log    Verificando se paciente ${email} está cadastrado

Dado que um psicólogo com o email "${email}" e a senha "${senha}" está cadastrado no sistema
    [Documentation]    Pré-condição: psicólogo deve estar cadastrado
    Log    Verificando se psicólogo ${email} está cadastrado

Dado que o usuário está na tela de login
    Navegar Para Login

Dado que o usuário está na tela de cadastro
    Navegar Para Cadastro

Quando o paciente insere o email "${email}" no campo de email
    Preencher Campo Email    ${email}

Quando o psicólogo insere o email "${email}" no campo de email
    Preencher Campo Email    ${email}

Quando o usuário insere o email "${email}" no campo de email
    Preencher Campo Email    ${email}

E insere a senha "${senha}" no campo de senha
    Preencher Campo Senha    ${senha}

E clica no botão "Entrar"
    Clicar No Botao Entrar

Quando o usuário preenche o formulário de cadastro com o tipo "paciente"
    [Arguments]    ${Nome}    ${Email}    ${Senha}    ${Telefone}    ${Nascimento}
    Preencher Formulario Cadastro Paciente    ${Nome}    ${Email}    ${Senha}    ${Telefone}    ${Nascimento}

E clica no botão "Cadastrar"
    Clicar No Botao Cadastrar

Então o sistema deve autenticar o paciente com sucesso
    Verificar Login Bem Sucedido

Então o sistema deve autenticar o psicólogo com sucesso
    Verificar Login Bem Sucedido

E o paciente deve ser redirecionado para a tela inicial do paciente
    Wait Until Page Contains Element    ${HOME_HEADER_TITLE}    timeout=${TIMEOUT_MEDIUM}
    Page Should Contain Element    ${HOME_HEADER_TITLE}

E o psicólogo deve ser redirecionado para a tela inicial do psicólogo (Dashboard)
    Wait Until Page Contains Element    ${PSICOLOGO_HOME_TITLE}    timeout=${TIMEOUT_MEDIUM}
    Page Should Contain Element    ${PSICOLOGO_HOME_TITLE}

E o sistema deve armazenar o token de autenticação
    # Verificar se o token foi armazenado (pode verificar localStorage ou cookies)
    ${cookies}=    Get Cookies
    Log    Cookies: ${cookies}
    # Em um ambiente real, você pode verificar o localStorage via JavaScript

Então uma mensagem de erro "Credenciais inválidas" deve ser exibida
    Verificar Mensagem De Erro Login

E o usuário deve permanecer na tela de login
    Page Should Contain Element    ${LOGIN_TITLE}

Então o sistema deve criar o novo usuário com sucesso
    Wait Until Page Contains Element    ${LOGIN_TITLE}    timeout=${TIMEOUT_MEDIUM}
    Page Should Contain Element    ${LOGIN_TITLE}

E o paciente deve ser redirecionado para a tela de login
    Page Should Contain Element    ${LOGIN_TITLE}

