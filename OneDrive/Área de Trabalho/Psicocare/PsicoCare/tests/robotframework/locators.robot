*** Settings ***
Documentation    Locators e variáveis para automação do PsicoCare
...              Este arquivo contém todos os seletores, IDs e nomes de elementos
...              necessários para automação com Robot Framework

*** Variables ***

# ============================================================================
# URLs E ENDPOINTS
# ============================================================================
${BASE_URL}                    http://localhost:19006
${API_URL}                     http://localhost:3000
${LOGIN_URL}                   ${BASE_URL}/login
${REGISTER_URL}                ${BASE_URL}/register
${HOME_URL}                    ${BASE_URL}/
${AGENDAMENTOS_URL}            ${BASE_URL}/agendamentos
${PSICOLOGOS_URL}              ${BASE_URL}/psicologos
${ACOMPANHAMENTO_URL}          ${BASE_URL}/avaliacoes
${HOME_PSICOLOGO_URL}          ${BASE_URL}/home-psicologo
${SOLICITACOES_URL}            ${BASE_URL}/solicitacoes-psicologo

# ============================================================================
# LOCATORS - TELA DE LOGIN
# ============================================================================
${LOGIN_TITLE}                 xpath=//*[contains(text(), 'Login')]
${LOGIN_EMAIL_INPUT}           xpath=//input[@placeholder='Email' or @type='email']
${LOGIN_SENHA_INPUT}           xpath=//input[@type='password' or @placeholder='Senha']
${LOGIN_BTN_ENTRAR}            xpath=//button[contains(text(), 'Entrar')] | //*[contains(text(), 'Entrar')]/parent::*
${LOGIN_LINK_CADASTRAR}        xpath=//a[contains(text(), 'Criar conta')] | //*[contains(text(), 'Criar conta')]
${LOGIN_LINK_ESQUECI_SENHA}    xpath=//a[contains(text(), 'Esqueci minha senha')] | //*[contains(text(), 'Esqueci minha senha')]
${LOGIN_MSG_ERRO}              xpath=//*[contains(text(), 'Credenciais inválidas') or contains(text(), 'Erro')]

# ============================================================================
# LOCATORS - TELA DE CADASTRO
# ============================================================================
${REGISTER_TITLE}              xpath=//*[contains(text(), 'Criar Conta')]
${REGISTER_BTN_PACIENTE}       xpath=//*[contains(text(), 'Sou Paciente')]/parent::*
${REGISTER_BTN_PSICOLOGO}      xpath=//*[contains(text(), 'Sou Psicólogo')]/parent::*
${REGISTER_NOME_INPUT}         xpath=//input[@placeholder='Nome Completo']
${REGISTER_EMAIL_INPUT}        xpath=//input[@placeholder='Email' and @type='email']
${REGISTER_SENHA_INPUT}        xpath=//input[@placeholder='Senha' and @type='password']
${REGISTER_TELEFONE_INPUT}     xpath=//input[@placeholder='Telefone']
${REGISTER_NASCIMENTO_INPUT}   xpath=//input[@placeholder*='nascimento' or @placeholder*='AAAA-MM-DD']
${REGISTER_CRP_INPUT}          xpath=//input[@placeholder='Número do CRP']
${REGISTER_ESPECIALIDADE_INPUT}    xpath=//input[@placeholder='Especialidade']
${REGISTER_BTN_CADASTRAR}      xpath=//button[contains(text(), 'Cadastrar')] | //*[contains(text(), 'Cadastrar')]/parent::*
${REGISTER_LINK_LOGIN}         xpath=//*[contains(text(), 'Já tenho conta')]

# ============================================================================
# LOCATORS - DASHBOARD/HOME PACIENTE
# ============================================================================
${HOME_HEADER_TITLE}           xpath=//*[contains(text(), 'Início') or contains(text(), 'Painel do Paciente')]
${HOME_BTN_AGENDAMENTOS}       xpath=//*[contains(text(), 'Agendamentos')]/parent::*
${HOME_BTN_ACOMPANHAMENTO}     xpath=//*[contains(text(), 'Acompanhamento')]/parent::*
${HOME_BTN_EMERGENCIA}         xpath=//*[contains(text(), 'Emergência')]/parent::*
${HOME_PROXIMO_AGENDAMENTO}    xpath=//*[contains(text(), 'Próximo agendamento')]/following-sibling::*
${HOME_ULTIMO_ACOMPANHAMENTO}  xpath=//*[contains(text(), 'Último acompanhamento')]/following-sibling::*

# ============================================================================
# LOCATORS - AGENDAMENTOS
# ============================================================================
${AGENDAMENTOS_TITLE}          xpath=//*[contains(text(), 'Agendamentos')]
${AGENDAMENTOS_HEADER}         xpath=//*[contains(text(), 'Os Seus Agendamentos')]
${AGENDAMENTOS_SELECIONAR_PROF}    xpath=//*[contains(text(), 'Agendar com')]/following-sibling::*//*[contains(@class, 'humorBtn') or contains(@class, 'card')]
${AGENDAMENTOS_INPUT_DATA}     xpath=//input[@placeholder*='AAAA-MM-DD' or @placeholder*='2025-12-31']
${AGENDAMENTOS_INPUT_HORA}     xpath=//input[@placeholder*='HH:MM' or @placeholder*='14:30']
${AGENDAMENTOS_BTN_CRIAR}      xpath=//*[contains(text(), 'Criar Agendamento')]/parent::*
${AGENDAMENTOS_BTN_CONFIRMAR}  xpath=//*[contains(text(), 'Confirmar Agendamento')]/parent::*
${AGENDAMENTOS_LISTA}          xpath=//*[contains(@class, 'card')]//*[contains(text(), 'Data') or contains(text(), 'Sessão')]
${AGENDAMENTOS_MSG_ERRO}       xpath=//*[contains(text(), 'Horário indisponível') or contains(text(), 'indisponível')]

# ============================================================================
# LOCATORS - LISTA DE PSICÓLOGOS
# ============================================================================
${PSICOLOGOS_TITLE}            xpath=//*[contains(text(), 'Psicólogos disponíveis')]
${PSICOLOGOS_CARD}             xpath=//*[contains(@class, 'card')]//*[contains(text(), 'Agendar')]/ancestor::*[contains(@class, 'card')]
${PSICOLOGOS_NOME}             xpath=//*[contains(@class, 'name')]
${PSICOLOGOS_ESPECIALIDADE}    xpath=//*[contains(@class, 'meta')]
${PSICOLOGOS_BTN_AGENDAR}      xpath=//*[contains(text(), 'Agendar')]/parent::*
${PSICOLOGOS_INDISPONIVEL}     xpath=//*[contains(text(), 'Indisponível') or contains(text(), 'indisponível')]

# ============================================================================
# LOCATORS - ACOMPANHAMENTO DIÁRIO
# ============================================================================
${ACOMPANHAMENTO_TITLE}        xpath=//*[contains(text(), 'Acompanhamento Diário')]
${ACOMPANHAMENTO_TEXTAREA}     xpath=//textarea[@placeholder*='sintomas' or @placeholder*='observações'] | //input[@placeholder*='sintomas' or @placeholder*='observações']
${ACOMPANHAMENTO_SONO_1}       xpath=//*[contains(@class, 'sonoBtn')]//*[text()='1']
${ACOMPANHAMENTO_SONO_2}       xpath=//*[contains(@class, 'sonoBtn')]//*[text()='2']
${ACOMPANHAMENTO_SONO_3}       xpath=//*[contains(@class, 'sonoBtn')]//*[text()='3']
${ACOMPANHAMENTO_SONO_4}       xpath=//*[contains(@class, 'sonoBtn')]//*[text()='4']
${ACOMPANHAMENTO_SONO_5}       xpath=//*[contains(@class, 'sonoBtn')]//*[text()='5']
${ACOMPANHAMENTO_HUMOR_ESTAVEL}    xpath=//*[contains(text(), 'Estável') or contains(text(), '🙂')]/parent::*
${ACOMPANHAMENTO_HUMOR_ANSIOSO}    xpath=//*[contains(text(), 'Ansioso') or contains(text(), '😰')]/parent::*
${ACOMPANHAMENTO_HUMOR_TRISTE}     xpath=//*[contains(text(), 'Triste') or contains(text(), '😢')]/parent::*
${ACOMPANHAMENTO_HUMOR_IRRITADO}   xpath=//*[contains(text(), 'Irritado') or contains(text(), '😡')]/parent::*
${ACOMPANHAMENTO_HUMOR_OUTRO}      xpath=//*[contains(text(), 'Outro') or contains(text(), '🤔')]/parent::*
${ACOMPANHAMENTO_BTN_SALVAR}       xpath=//*[contains(text(), 'Salvar registro') or contains(text(), 'Salvar Acompanhamento')]/parent::*
${ACOMPANHAMENTO_HISTORICO}        xpath=//*[contains(text(), 'Histórico de acompanhamentos')]/following-sibling::*
${ACOMPANHAMENTO_MSG_SUCESSO}      xpath=//*[contains(text(), 'Registro salvo') or contains(text(), 'salvo')]

# ============================================================================
# LOCATORS - AVALIAÇÕES DE PSICÓLOGOS
# ============================================================================
${AVALIACAO_COMENTARIO_INPUT}      xpath=//input[@placeholder='Comentário'] | //textarea[@placeholder='Comentário']
${AVALIACAO_NOTA_INPUT}            xpath=//input[@placeholder*='Nota' or @placeholder*='1-5']
${AVALIACAO_BTN_ENVIAR}            xpath=//*[contains(text(), 'Enviar avaliação')]/parent::*
${AVALIACAO_LISTA_PUBLICA}         xpath=//*[contains(text(), 'Avaliações públicas')]/following-sibling::*
${AVALIACAO_CARD}                  xpath=//*[contains(@class, 'card')]//*[contains(text(), 'Nota:')]

# ============================================================================
# LOCATORS - HOME PSICÓLOGO
# ============================================================================
${PSICOLOGO_HOME_TITLE}            xpath=//*[contains(text(), 'Home Psicólogo')]
${PSICOLOGO_PROXIMA_CONSULTA}      xpath=//*[contains(text(), 'Próxima consulta')]/following-sibling::*
${PSICOLOGO_PACIENTES_ACEITOS}     xpath=//*[contains(text(), 'Pacientes aceitos')]/following-sibling::*

# ============================================================================
# LOCATORS - SOLICITAÇÕES PSICÓLOGO
# ============================================================================
${SOLICITACOES_TITLE}              xpath=//*[contains(text(), 'Solicitações de Pacientes')]
${SOLICITACOES_CARD}               xpath=//*[contains(@class, 'card')]
${SOLICITACOES_NOME_PACIENTE}      xpath=//*[contains(@class, 'nome')]
${SOLICITACOES_EMAIL_PACIENTE}     xpath=//*[contains(text(), 'Email:')]/following-sibling::*
${SOLICITACOES_BTN_ACEITAR}        xpath=//*[contains(text(), 'Aceitar')]/parent::*
${SOLICITACOES_MSG_VAZIA}          xpath=//*[contains(text(), 'Nenhuma solicitação pendente')]

# ============================================================================
# LOCATORS - PERFIL/DISPONIBILIDADE
# ============================================================================
${PERFIL_TITLE}                    xpath=//*[contains(text(), 'Perfil')]
${PERFIL_BTN_DISPONIBILIDADE}      xpath=//*[contains(text(), 'Disponibilidade')]/parent::* | //button[contains(@aria-label, 'Disponibilidade')]
${PERFIL_STATUS_DISPONIVEL}        xpath=//*[contains(text(), 'Disponível')]
${PERFIL_STATUS_INDISPONIVEL}      xpath=//*[contains(text(), 'Indisponível')]

# ============================================================================
# DADOS DE TESTE
# ============================================================================
${EMAIL_PACIENTE_TESTE}            paciente@teste.com
${SENHA_PACIENTE_TESTE}            senha123
${EMAIL_PSICOLOGO_TESTE}           psicologo@teste.com
${SENHA_PSICOLOGO_TESTE}           senha456
${EMAIL_INVALIDO}                  usuario@invalido.com
${SENHA_INVALIDA}                  senhaerrada
${NOME_PACIENTE_NOVO}              Maria Silva
${EMAIL_PACIENTE_NOVO}             maria@novo.com
${SENHA_PACIENTE_NOVO}             novaSenha123
${TELEFONE_TESTE}                  99999-9999
${DATA_NASCIMENTO_TESTE}           1990-01-01
${DATA_AGENDAMENTO_TESTE}          2025-11-10
${HORA_AGENDAMENTO_TESTE}          14:00
${TEXTO_ACOMPANHAMENTO_TESTE}      Tive um dia tranquilo, mas com um pouco de ansiedade.
${COMENTARIO_AVALIACAO_TESTE}      Excelente profissional, muito atencioso.
${NOTA_AVALIACAO_TESTE}            5

# ============================================================================
# MENSAGENS ESPERADAS
# ============================================================================
${MSG_LOGIN_SUCESSO}               Bem-vindo
${MSG_ERRO_CREDENCIAIS}            Credenciais inválidas
${MSG_ERRO_HORARIO_INDISPONIVEL}   Horário indisponível
${MSG_CADASTRO_SUCESSO}            Cadastrado com sucesso
${MSG_AGENDAMENTO_SUCESSO}         Agendamento registrado
${MSG_ACOMPANHAMENTO_SALVO}        Registro salvo
${MSG_AVALIACAO_ENVIADA}           Avaliação registrada

# ============================================================================
# TIMEOUTS
# ============================================================================
${TIMEOUT_SHORT}                   5s
${TIMEOUT_MEDIUM}                  10s
${TIMEOUT_LONG}                    30s
${TIMEOUT_PAGE_LOAD}               15s

