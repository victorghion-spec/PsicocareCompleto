# Cenários de Teste em Gherkin para o PsicoCare

Este documento apresenta cenários de teste escritos na linguagem Gherkin (utilizada pelo Cucumber, Behave, etc.) para cobrir os principais fluxos de funcionalidade do aplicativo PsicoCare, conforme solicitado. O objetivo é descrever o comportamento do sistema de uma forma clara e legível, servindo como base para a automação de testes de aceitação.

---

## 1. Funcionalidade: Autenticação e Cadastro de Usuários

**Como um usuário do PsicoCare**
**Eu quero me autenticar e me cadastrar no sistema**
**Para ter acesso às funcionalidades do meu perfil (paciente ou psicólogo)**

### Cenário: Login de Paciente com Sucesso
\`\`\`gherkin
Cenário: Login de Paciente com Sucesso
  Dado que um paciente com o email "paciente@teste.com" e a senha "senha123" está cadastrado no sistema
  Quando o paciente insere o email "paciente@teste.com" no campo de email
  E insere a senha "senha123" no campo de senha
  E clica no botão "Entrar"
  Então o sistema deve autenticar o paciente com sucesso
  E o paciente deve ser redirecionado para a tela inicial do paciente
  E o sistema deve armazenar o token de autenticação
\`\`\`

### Cenário: Login de Psicólogo com Sucesso
\`\`\`gherkin
Cenário: Login de Psicólogo com Sucesso
  Dado que um psicólogo com o email "psicologo@teste.com" e a senha "senha456" está cadastrado no sistema
  Quando o psicólogo insere o email "psicologo@teste.com" no campo de email
  E insere a senha "senha456" no campo de senha
  E clica no botão "Entrar"
  Então o sistema deve autenticar o psicólogo com sucesso
  E o psicólogo deve ser redirecionado para a tela inicial do psicólogo (Dashboard)
  E o sistema deve armazenar o token de autenticação
\`\`\`

### Cenário: Tentativa de Login com Credenciais Inválidas
\`\`\`gherkin
Cenário: Tentativa de Login com Credenciais Inválidas
  Dado que o usuário está na tela de login
  Quando o usuário insere o email "usuario@invalido.com" no campo de email
  E insere a senha "senhaerrada" no campo de senha
  E clica no botão "Entrar"
  Então uma mensagem de erro "Credenciais inválidas" deve ser exibida
  E o usuário deve permanecer na tela de login
\`\`\`

### Cenário: Cadastro de Novo Paciente
\`\`\`gherkin
Cenário: Cadastro de Novo Paciente
  Dado que o usuário está na tela de cadastro
  Quando o usuário preenche o formulário de cadastro com o tipo "paciente"
  | Campo      | Valor             |
  | Nome       | Maria Silva       |
  | Email      | maria@novo.com    |
  | Senha      | novaSenha123      |
  | Telefone   | 99999-9999        |
  | Nascimento | 01/01/1990        |
  E clica no botão "Cadastrar"
  Então o sistema deve criar o novo usuário com sucesso
  E o paciente deve ser redirecionado para a tela de login
\`\`\`

---

## 2. Funcionalidade: Agendamento de Consultas

**Como um Paciente**
**Eu quero agendar uma consulta com um Psicólogo disponível**
**Para receber o atendimento necessário**

### Cenário: Paciente Agenda uma Consulta com Sucesso
\`\`\`gherkin
Cenário: Paciente Agenda uma Consulta com Sucesso
  Dado que o Paciente "paciente@teste.com" está logado
  E existe um Psicólogo "psicologo@teste.com" disponível para agendamento
  Quando o paciente navega para a lista de profissionais
  E seleciona o Psicólogo "psicologo@teste.com"
  E escolhe a data e hora "2025-11-10 14:00:00"
  E clica no botão "Confirmar Agendamento"
  Então o sistema deve registrar o agendamento
  E o paciente deve ver o agendamento na sua lista de "Meus Agendamentos"
  E o psicólogo deve receber uma notificação de novo agendamento
\`\`\`

### Cenário: Tentativa de Agendamento em Horário Indisponível
\`\`\`gherkin
Cenário: Tentativa de Agendamento em Horário Indisponível
  Dado que o Paciente "paciente@teste.com" está logado
  E o horário "2025-11-10 14:00:00" com o Psicólogo "psicologo@teste.com" já está ocupado
  Quando o paciente tenta agendar para a data e hora "2025-11-10 14:00:00"
  E clica no botão "Confirmar Agendamento"
  Então uma mensagem de erro "Horário indisponível" deve ser exibida
  E o agendamento não deve ser registrado
\`\`\`

---

## 3. Funcionalidade: Acompanhamento Diário

**Como um Paciente**
**Eu quero registrar meu estado emocional e de sono diariamente**
**Para acompanhar minha evolução e compartilhar com meu psicólogo**

### Cenário: Paciente Registra um Acompanhamento Diário com Sucesso
\`\`\`gherkin
Cenário: Paciente Registra um Acompanhamento Diário com Sucesso
  Dado que o Paciente "paciente@teste.com" está logado
  Quando o paciente navega para a tela de "Acompanhamento Diário"
  E insere o texto "Tive um dia tranquilo, mas com um pouco de ansiedade."
  E seleciona a qualidade de sono como "4" (de 5)
  E seleciona o humor como "Neutro"
  E clica no botão "Salvar Acompanhamento"
  Então o sistema deve registrar o acompanhamento com a data e hora atuais
  E o paciente deve ver o registro na sua lista de histórico de acompanhamentos
\`\`\`

---

## 4. Funcionalidade: Avaliação de Psicólogos

**Como um Paciente**
**Eu quero avaliar o Psicólogo após uma consulta**
**Para ajudar outros usuários e fornecer feedback**

### Cenário: Paciente Envia uma Avaliação com Nota e Comentário
\`\`\`gherkin
Cenário: Paciente Envia uma Avaliação com Nota e Comentário
  Dado que o Paciente "paciente@teste.com" está logado
  E o paciente teve uma consulta recente com o Psicólogo "psicologo@teste.com"
  Quando o paciente navega para a tela de avaliação do psicólogo
  E seleciona a nota "5" (de 5)
  E insere o comentário "Excelente profissional, muito atencioso."
  E clica no botão "Enviar Avaliação"
  Então o sistema deve registrar a avaliação
  E a nota média do Psicólogo "psicologo@teste.com" deve ser atualizada
  E a avaliação deve estar visível na lista de avaliações públicas
\`\`\`

---

## 5. Funcionalidade: Gerenciamento do Psicólogo

**Como um Psicólogo**
**Eu quero gerenciar minhas solicitações de pacientes e minha disponibilidade**
**Para organizar minha agenda de trabalho**

### Cenário: Psicólogo Aceita uma Solicitação de Paciente
\`\`\`gherkin
Cenário: Psicólogo Aceita uma Solicitação de Paciente
  Dado que o Psicólogo "psicologo@teste.com" está logado
  E existe uma solicitação pendente do Paciente "paciente@teste.com"
  Quando o psicólogo navega para a tela de "Solicitações Pendentes"
  E clica no botão "Aceitar" na solicitação do Paciente "paciente@teste.com"
  Então a solicitação deve ser marcada como "Aceita"
  E o Paciente "paciente@teste.com" deve ser notificado sobre a aceitação
  E o paciente e o psicólogo devem estar vinculados para futuros agendamentos
\`\`\`

### Cenário: Psicólogo Altera sua Disponibilidade para Indisponível
\`\`\`gherkin
Cenário: Psicólogo Altera sua Disponibilidade para Indisponível
  Dado que o Psicólogo "psicologo@teste.com" está logado
  E sua disponibilidade atual está como "Disponível"
  Quando o psicólogo navega para o seu perfil
  E desativa o botão de "Disponibilidade"
  Então o sistema deve atualizar o status do psicólogo para "Indisponível"
  E o psicólogo não deve aparecer nas buscas de novos pacientes
\`\`\`
