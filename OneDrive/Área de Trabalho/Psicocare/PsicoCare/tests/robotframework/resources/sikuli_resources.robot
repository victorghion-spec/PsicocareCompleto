*** Settings ***
Documentation    Recursos para automação baseada em imagem usando Sikuli
...              Use este arquivo quando precisar identificar elementos por imagem
Library          SikuliLibrary    mode=NEW

*** Variables ***
${SIKULI_IMAGES_PATH}    ${CURDIR}/../sikuli_images

*** Keywords ***

Inicializar Sikuli
    [Documentation]    Inicializa o Sikuli para automação baseada em imagem
    Add Image Path    ${SIKULI_IMAGES_PATH}
    Set Min Similarity    0.8

Clicar Em Elemento Por Imagem
    [Documentation]    Clica em um elemento identificado por imagem
    [Arguments]    ${imagem}    ${timeout}=10
    Wait Until Screen Contains    ${imagem}    ${timeout}
    Click    ${imagem}

Verificar Elemento Visivel Por Imagem
    [Documentation]    Verifica se um elemento está visível na tela
    [Arguments]    ${imagem}    ${timeout}=10
    Wait Until Screen Contains    ${imagem}    ${timeout}
    Screen Should Contain    ${imagem}

Preencher Campo Por Imagem
    [Documentation]    Preenche um campo identificado por imagem
    [Arguments]    ${imagem_campo}    ${texto}    ${timeout}=10
    Wait Until Screen Contains    ${imagem_campo}    ${timeout}
    Click    ${imagem_campo}
    Type    ${texto}

Capturar Regiao Por Imagem
    [Documentation]    Captura uma região da tela baseada em uma imagem de referência
    [Arguments]    ${imagem_referencia}    ${offset_x}=0    ${offset_y}=0    ${width}=100    ${height}=100
    ${region}=    Find    ${imagem_referencia}
    ${captured}=    Capture    ${region}
    [Return]    ${captured}

# Exemplos de uso para elementos específicos do PsicoCare

Clicar Botao Entrar Por Imagem
    [Documentation]    Clica no botão Entrar usando reconhecimento de imagem
    Clicar Em Elemento Por Imagem    btn_entrar.png

Clicar Botao Cadastrar Por Imagem
    [Documentation]    Clica no botão Cadastrar usando reconhecimento de imagem
    Clicar Em Elemento Por Imagem    btn_cadastrar.png

Verificar Tela Login Por Imagem
    [Documentation]    Verifica se está na tela de login usando reconhecimento de imagem
    Verificar Elemento Visivel Por Imagem    tela_login.png

