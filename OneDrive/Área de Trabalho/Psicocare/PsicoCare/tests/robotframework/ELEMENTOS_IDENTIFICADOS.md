# Elementos Identificados para Automação - PsicoCare

Este documento lista todos os IDs, nomes e locators identificados para automação de testes do PsicoCare.

## 📋 Índice

1. [Tela de Login](#tela-de-login)
2. [Tela de Cadastro](#tela-de-cadastro)
3. [Dashboard/Home Paciente](#dashboardhome-paciente)
4. [Agendamentos](#agendamentos)
5. [Lista de Psicólogos](#lista-de-psicólogos)
6. [Acompanhamento Diário](#acompanhamento-diário)
7. [Avaliações](#avaliações)
8. [Home Psicólogo](#home-psicólogo)
9. [Solicitações Psicólogo](#solicitações-psicólogo)
10. [Perfil](#perfil)

---

## 🔐 Tela de Login

| Elemento | Locator XPath | Sugestão de testID | Descrição |
|----------|---------------|-------------------|-----------|
| Título "Login" | `//*[contains(text(), 'Login')]` | `login-title` | Título da página |
| Campo Email | `//input[@placeholder='Email' or @type='email']` | `login-email-input` | Campo de entrada de email |
| Campo Senha | `//input[@type='password' or @placeholder='Senha']` | `login-senha-input` | Campo de entrada de senha |
| Botão Entrar | `//button[contains(text(), 'Entrar')]` | `login-btn-entrar` | Botão para fazer login |
| Link Criar Conta | `//a[contains(text(), 'Criar conta')]` | `login-link-cadastrar` | Link para página de cadastro |
| Link Esqueci Senha | `//a[contains(text(), 'Esqueci minha senha')]` | `login-link-esqueci-senha` | Link para recuperação de senha |
| Mensagem de Erro | `//*[contains(text(), 'Credenciais inválidas')]` | `login-msg-erro` | Mensagem de erro de login |

**Variáveis de Teste:**
- Email: `paciente@teste.com` / `psicologo@teste.com`
- Senha: `senha123` / `senha456`

---

## 📝 Tela de Cadastro

| Elemento | Locator XPath | Sugestão de testID | Descrição |
|----------|---------------|-------------------|-----------|
| Título "Criar Conta" | `//*[contains(text(), 'Criar Conta')]` | `register-title` | Título da página |
| Botão Sou Paciente | `//*[contains(text(), 'Sou Paciente')]/parent::*` | `register-btn-paciente` | Seleciona tipo paciente |
| Botão Sou Psicólogo | `//*[contains(text(), 'Sou Psicólogo')]/parent::*` | `register-btn-psicologo` | Seleciona tipo psicólogo |
| Campo Nome | `//input[@placeholder='Nome Completo']` | `register-nome-input` | Campo de nome completo |
| Campo Email | `//input[@placeholder='Email' and @type='email']` | `register-email-input` | Campo de email |
| Campo Senha | `//input[@placeholder='Senha' and @type='password']` | `register-senha-input` | Campo de senha |
| Campo Telefone | `//input[@placeholder='Telefone']` | `register-telefone-input` | Campo de telefone |
| Campo Nascimento | `//input[@placeholder*='nascimento' or @placeholder*='AAAA-MM-DD']` | `register-nascimento-input` | Campo de data de nascimento |
| Campo CRP | `//input[@placeholder='Número do CRP']` | `register-crp-input` | Campo CRP (apenas psicólogo) |
| Campo Especialidade | `//input[@placeholder='Especialidade']` | `register-especialidade-input` | Campo especialidade (apenas psicólogo) |
| Botão Cadastrar | `//button[contains(text(), 'Cadastrar')]` | `register-btn-cadastrar` | Botão para cadastrar |
| Link Já Tenho Conta | `//*[contains(text(), 'Já tenho conta')]` | `register-link-login` | Link para página de login |

---

## 🏠 Dashboard/Home Paciente

| Elemento | Locator XPath | Sugestão de testID | Descrição |
|----------|---------------|-------------------|-----------|
| Título "Início" | `//*[contains(text(), 'Início')]` | `home-header-title` | Cabeçalho da página |
| Próximo Agendamento | `//*[contains(text(), 'Próximo agendamento')]/following-sibling::*` | `home-proximo-agendamento` | Card com próximo agendamento |
| Último Acompanhamento | `//*[contains(text(), 'Último acompanhamento')]/following-sibling::*` | `home-ultimo-acompanhamento` | Card com último acompanhamento |
| Botão Agendamentos | `//*[contains(text(), 'Agendamentos')]/parent::*` | `home-btn-agendamentos` | Botão para ir a agendamentos |
| Botão Acompanhamento | `//*[contains(text(), 'Acompanhamento')]/parent::*` | `home-btn-acompanhamento` | Botão para acompanhamento |
| Botão Emergência | `//*[contains(text(), 'Emergência')]/parent::*` | `home-btn-emergencia` | Botão de emergência |

---

## 📅 Agendamentos

| Elemento | Locator XPath | Sugestão de testID | Descrição |
|----------|---------------|-------------------|-----------|
| Título "Agendamentos" | `//*[contains(text(), 'Agendamentos')]` | `agendamentos-title` | Título da página |
| Header "Os Seus Agendamentos" | `//*[contains(text(), 'Os Seus Agendamentos')]` | `agendamentos-header` | Cabeçalho da seção |
| Selecionar Profissional | `//*[contains(text(), 'Agendar com')]/following-sibling::*//*[contains(@class, 'humorBtn')]` | `agendamentos-select-prof` | Lista de profissionais |
| Campo Data | `//input[@placeholder*='AAAA-MM-DD' or @placeholder*='2025-12-31']` | `agendamentos-input-data` | Campo de data (formato AAAA-MM-DD) |
| Campo Hora | `//input[@placeholder*='HH:MM' or @placeholder*='14:30']` | `agendamentos-input-hora` | Campo de hora (formato HH:MM) |
| Botão Criar Agendamento | `//*[contains(text(), 'Criar Agendamento')]/parent::*` | `agendamentos-btn-criar` | Botão para criar agendamento |
| Botão Confirmar | `//*[contains(text(), 'Confirmar Agendamento')]/parent::*` | `agendamentos-btn-confirmar` | Botão para confirmar |
| Lista de Agendamentos | `//*[contains(@class, 'card')]//*[contains(text(), 'Data')]` | `agendamentos-lista` | Lista de agendamentos criados |
| Mensagem Horário Indisponível | `//*[contains(text(), 'Horário indisponível')]` | `agendamentos-msg-erro` | Mensagem de erro |

**Formato de Data/Hora:**
- Data: `2025-11-10` (AAAA-MM-DD)
- Hora: `14:00` (HH:MM)

---

## 👨‍⚕️ Lista de Psicólogos

| Elemento | Locator XPath | Sugestão de testID | Descrição |
|----------|---------------|-------------------|-----------|
| Título "Psicólogos disponíveis" | `//*[contains(text(), 'Psicólogos disponíveis')]` | `psicologos-title` | Título da página |
| Card Psicólogo | `//*[contains(@class, 'card')]//*[contains(text(), 'Agendar')]/ancestor::*[contains(@class, 'card')]` | `psicologos-card` | Card de cada psicólogo |
| Nome Psicólogo | `//*[contains(@class, 'name')]` | `psicologos-nome` | Nome do psicólogo |
| Especialidade | `//*[contains(@class, 'meta')]` | `psicologos-especialidade` | Especialidade do psicólogo |
| Botão Agendar | `//*[contains(text(), 'Agendar')]/parent::*` | `psicologos-btn-agendar` | Botão para agendar |
| Status Indisponível | `//*[contains(text(), 'Indisponível')]` | `psicologos-indisponivel` | Indicador de indisponibilidade |

---

## 📊 Acompanhamento Diário

| Elemento | Locator XPath | Sugestão de testID | Descrição |
|----------|---------------|-------------------|-----------|
| Título "Acompanhamento Diário" | `//*[contains(text(), 'Acompanhamento Diário')]` | `acompanhamento-title` | Título da página |
| Campo Texto | `//textarea[@placeholder*='sintomas' or @placeholder*='observações']` | `acompanhamento-textarea` | Campo de texto para observações |
| Botão Sono 1 | `//*[contains(@class, 'sonoBtn')]//*[text()='1']` | `acompanhamento-sono-1` | Botão qualidade sono 1 |
| Botão Sono 2 | `//*[contains(@class, 'sonoBtn')]//*[text()='2']` | `acompanhamento-sono-2` | Botão qualidade sono 2 |
| Botão Sono 3 | `//*[contains(@class, 'sonoBtn')]//*[text()='3']` | `acompanhamento-sono-3` | Botão qualidade sono 3 |
| Botão Sono 4 | `//*[contains(@class, 'sonoBtn')]//*[text()='4']` | `acompanhamento-sono-4` | Botão qualidade sono 4 |
| Botão Sono 5 | `//*[contains(@class, 'sonoBtn')]//*[text()='5']` | `acompanhamento-sono-5` | Botão qualidade sono 5 |
| Botão Humor Estável | `//*[contains(text(), 'Estável') or contains(text(), '🙂')]/parent::*` | `acompanhamento-humor-estavel` | Botão humor estável |
| Botão Humor Ansioso | `//*[contains(text(), 'Ansioso') or contains(text(), '😰')]/parent::*` | `acompanhamento-humor-ansioso` | Botão humor ansioso |
| Botão Humor Triste | `//*[contains(text(), 'Triste') or contains(text(), '😢')]/parent::*` | `acompanhamento-humor-triste` | Botão humor triste |
| Botão Humor Irritado | `//*[contains(text(), 'Irritado') or contains(text(), '😡')]/parent::*` | `acompanhamento-humor-irritado` | Botão humor irritado |
| Botão Humor Outro | `//*[contains(text(), 'Outro') or contains(text(), '🤔')]/parent::*` | `acompanhamento-humor-outro` | Botão humor outro |
| Botão Salvar | `//*[contains(text(), 'Salvar registro')]/parent::*` | `acompanhamento-btn-salvar` | Botão para salvar |
| Histórico | `//*[contains(text(), 'Histórico de acompanhamentos')]/following-sibling::*` | `acompanhamento-historico` | Lista de histórico |

**Valores de Teste:**
- Texto: `Tive um dia tranquilo, mas com um pouco de ansiedade.`
- Qualidade Sono: `1` a `5`
- Humor: `Estável`, `Ansioso`, `Triste`, `Irritado`, `Outro`

---

## ⭐ Avaliações

| Elemento | Locator XPath | Sugestão de testID | Descrição |
|----------|---------------|-------------------|-----------|
| Campo Comentário | `//input[@placeholder='Comentário']` | `avaliacao-comentario-input` | Campo de comentário |
| Campo Nota | `//input[@placeholder*='Nota' or @placeholder*='1-5']` | `avaliacao-nota-input` | Campo de nota (1-5) |
| Botão Enviar | `//*[contains(text(), 'Enviar avaliação')]/parent::*` | `avaliacao-btn-enviar` | Botão para enviar |
| Lista Pública | `//*[contains(text(), 'Avaliações públicas')]/following-sibling::*` | `avaliacao-lista-publica` | Lista de avaliações públicas |
| Card Avaliação | `//*[contains(@class, 'card')]//*[contains(text(), 'Nota:')]` | `avaliacao-card` | Card de avaliação |

**Valores de Teste:**
- Nota: `1` a `5`
- Comentário: `Excelente profissional, muito atencioso.`

---

## 🏥 Home Psicólogo

| Elemento | Locator XPath | Sugestão de testID | Descrição |
|----------|---------------|-------------------|-----------|
| Título "Home Psicólogo" | `//*[contains(text(), 'Home Psicólogo')]` | `psicologo-home-title` | Título da página |
| Próxima Consulta | `//*[contains(text(), 'Próxima consulta')]/following-sibling::*` | `psicologo-proxima-consulta` | Card próxima consulta |
| Pacientes Aceitos | `//*[contains(text(), 'Pacientes aceitos')]/following-sibling::*` | `psicologo-pacientes-aceitos` | Lista de pacientes aceitos |

---

## 📋 Solicitações Psicólogo

| Elemento | Locator XPath | Sugestão de testID | Descrição |
|----------|---------------|-------------------|-----------|
| Título "Solicitações" | `//*[contains(text(), 'Solicitações de Pacientes')]` | `solicitacoes-title` | Título da página |
| Card Solicitação | `//*[contains(@class, 'card')]` | `solicitacoes-card` | Card de cada solicitação |
| Nome Paciente | `//*[contains(@class, 'nome')]` | `solicitacoes-nome-paciente` | Nome do paciente |
| Email Paciente | `//*[contains(text(), 'Email:')]/following-sibling::*` | `solicitacoes-email-paciente` | Email do paciente |
| Botão Aceitar | `//*[contains(text(), 'Aceitar')]/parent::*` | `solicitacoes-btn-aceitar` | Botão para aceitar |
| Mensagem Vazia | `//*[contains(text(), 'Nenhuma solicitação pendente')]` | `solicitacoes-msg-vazia` | Mensagem quando não há solicitações |

---

## 👤 Perfil

| Elemento | Locator XPath | Sugestão de testID | Descrição |
|----------|---------------|-------------------|-----------|
| Título "Perfil" | `//*[contains(text(), 'Perfil')]` | `perfil-title` | Título da página |
| Botão Disponibilidade | `//*[contains(text(), 'Disponibilidade')]/parent::*` | `perfil-btn-disponibilidade` | Botão para alterar disponibilidade |
| Status Disponível | `//*[contains(text(), 'Disponível')]` | `perfil-status-disponivel` | Indicador de disponível |
| Status Indisponível | `//*[contains(text(), 'Indisponível')]` | `perfil-status-indisponivel` | Indicador de indisponível |

---

## 🔗 URLs

| Página | URL | Variável |
|--------|-----|----------|
| Login | `http://localhost:19006/login` | `${LOGIN_URL}` |
| Cadastro | `http://localhost:19006/register` | `${REGISTER_URL}` |
| Home | `http://localhost:19006/` | `${HOME_URL}` |
| Agendamentos | `http://localhost:19006/agendamentos` | `${AGENDAMENTOS_URL}` |
| Psicólogos | `http://localhost:19006/psicologos` | `${PSICOLOGOS_URL}` |
| Acompanhamento | `http://localhost:19006/avaliacoes` | `${ACOMPANHAMENTO_URL}` |
| Home Psicólogo | `http://localhost:19006/home-psicologo` | `${HOME_PSICOLOGO_URL}` |
| Solicitações | `http://localhost:19006/solicitacoes-psicologo` | `${SOLICITACOES_URL}` |

---

## 💡 Recomendações para Melhorar Identificação

### Adicionar testID nos Componentes React Native

Para melhorar a identificação dos elementos, adicione a propriedade `testID` nos componentes:

```tsx
// Exemplo: login.tsx
<TextInput
  testID="login-email-input"
  placeholder="Email"
  value={email}
  onChangeText={setEmail}
/>

<TouchableOpacity 
  testID="login-btn-entrar"
  onPress={handleLogin}
>
  <Text>Entrar</Text>
</TouchableOpacity>
```

### Usar Locators por testID

Após adicionar testID, atualize os locators em `locators.robot`:

```robot
${LOGIN_EMAIL_INPUT}    testid=login-email-input
${LOGIN_BTN_ENTRAR}     testid=login-btn-entrar
```

### Usar Sikuli para Elementos Complexos

Para elementos que não podem ser facilmente identificados por locators, use Sikuli com imagens:

1. Capture screenshots dos elementos
2. Salve em `sikuli_images/`
3. Use as keywords em `resources/sikuli_resources.robot`

---

## 📝 Notas Importantes

1. **XPath é Sensível**: Os locators XPath podem quebrar se a estrutura HTML mudar
2. **testID é Mais Estável**: Sempre prefira usar `testID` quando possível
3. **Timeouts**: Ajuste os timeouts conforme necessário em `locators.robot`
4. **Ambiente**: Certifique-se de que o app está rodando antes de executar os testes

---

## 🔄 Atualizações Futuras

Conforme o aplicativo evolui, mantenha este documento atualizado:
- Adicione novos elementos identificados
- Remova elementos que não existem mais
- Atualize locators quando necessário
- Documente mudanças significativas

