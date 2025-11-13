# Guia de Configuração do Jenkins para PsicoCare

Este guia explica como configurar o Jenkins para executar os testes automatizados do PsicoCare e gerar relatórios consolidados.

## 📋 Pré-requisitos

1. **Jenkins instalado** (versão 2.300 ou superior)
2. **Plugins necessários:**
   - HTML Publisher Plugin
   - JUnit Plugin
   - Pipeline Plugin
   - Email Extension Plugin (opcional, para notificações)

## 🔧 Configuração Inicial

### 1. Instalar Plugins

1. Acesse **Jenkins** → **Manage Jenkins** → **Manage Plugins**
2. Na aba **Available**, instale:
   - `HTML Publisher Plugin`
   - `JUnit Plugin`
   - `Pipeline Plugin`
   - `Email Extension Plugin` (opcional)

### 2. Configurar Credenciais (Opcional)

Se você quiser usar credenciais seguras para os testes:

1. Acesse **Jenkins** → **Manage Jenkins** → **Manage Credentials**
2. Adicione as seguintes credenciais:
   - `test-email-paciente` (Secret text) - Email do paciente de teste
   - `test-senha-paciente` (Secret text) - Senha do paciente de teste
   - `test-email-psicologo` (Secret text) - Email do psicólogo de teste
   - `test-senha-psicologo` (Secret text) - Senha do psicólogo de teste

### 3. Configurar Ferramentas

1. Acesse **Jenkins** → **Manage Jenkins** → **Global Tool Configuration**

2. **Python:**
   - Adicione instalação do Python (se necessário)
   - Ou use o Python do sistema

3. **Node.js:**
   - Adicione instalação do Node.js
   - Versão recomendada: 16.x ou superior

## 🚀 Criar Pipeline

### Opção 1: Pipeline via Jenkinsfile (Recomendado)

1. No Jenkins, clique em **New Item**
2. Escolha **Pipeline**
3. Nome: `PsicoCare-Tests`
4. Em **Pipeline**, selecione:
   - **Definition**: Pipeline script from SCM
   - **SCM**: Git
   - **Repository URL**: URL do seu repositório
   - **Script Path**: `Jenkinsfile`
5. Clique em **Save**

### Opção 2: Pipeline Manual

1. No Jenkins, clique em **New Item**
2. Escolha **Pipeline**
3. Nome: `PsicoCare-Tests`
4. Em **Pipeline**, cole o conteúdo do `Jenkinsfile`
5. Clique em **Save**

## ⚙️ Configuração do Pipeline

### Variáveis de Ambiente

Edite o `Jenkinsfile` ou configure no Jenkins:

```groovy
environment {
    PSICOCARE_BASE_URL = 'http://localhost:19006'
    PSICOCARE_API_URL = 'http://localhost:3000'
}
```

### URLs dos Serviços

Certifique-se de que os serviços estão rodando antes de executar os testes:

- **Frontend**: `http://localhost:19006` (ou sua URL)
- **API**: `http://localhost:3000` (ou sua URL)

## 🏃 Executar Pipeline

1. Acesse o pipeline `PsicoCare-Tests`
2. Clique em **Build Now**
3. Acompanhe o progresso em **Build History**

## 📊 Visualizar Relatórios

Após a execução, os relatórios estarão disponíveis em:

1. **Build** → **HTML Reports**:
   - Robot Framework Report
   - Postman API Report
   - Consolidated Report

2. **Build** → **Test Result**:
   - Resultados JUnit consolidados

## 🔔 Configurar Notificações por Email

### 1. Configurar SMTP

1. Acesse **Jenkins** → **Manage Jenkins** → **Configure System**
2. Em **Extended E-mail Notification**, configure:
   - SMTP server
   - Default user e-mail suffix
   - Use SMTP Authentication (se necessário)

### 2. Configurar no Pipeline

O `Jenkinsfile` já inclui notificações por email. Ajuste os destinatários:

```groovy
to: "${env.CHANGE_AUTHOR_EMAIL ?: 'team@psicocare.com'}"
```

## 🐳 Executar em Container Docker (Opcional)

Se você quiser executar os testes em containers Docker:

### Dockerfile para Testes

```dockerfile
FROM node:16-alpine

# Instalar Python e dependências
RUN apk add --no-cache python3 py3-pip chromium chromium-chromedriver

# Instalar Newman
RUN npm install -g newman newman-reporter-html newman-reporter-htmlextra

# Instalar Robot Framework
RUN pip3 install robotframework robotframework-seleniumlibrary selenium

WORKDIR /workspace
```

### Atualizar Jenkinsfile

Adicione um stage para build da imagem Docker:

```groovy
stage('Build Docker Image') {
    steps {
        sh 'docker build -t psicocare-tests -f Dockerfile.tests .'
    }
}
```

## 🔍 Troubleshooting

### Erro: "Command not found: newman"

**Solução:** Instale o Newman no agente Jenkins:
```bash
npm install -g newman newman-reporter-html
```

### Erro: "Command not found: robot"

**Solução:** Instale o Robot Framework:
```bash
pip3 install robotframework robotframework-seleniumlibrary
```

### Erro: "Connection refused" nos testes

**Solução:** Verifique se os serviços estão rodando:
- Frontend: `curl http://localhost:19006`
- API: `curl http://localhost:3000`

### Relatórios não aparecem

**Solução:** 
1. Verifique se os plugins HTML Publisher e JUnit estão instalados
2. Verifique os caminhos dos relatórios no `Jenkinsfile`
3. Verifique as permissões de arquivo

## 📈 Melhorias Futuras

- [ ] Executar testes em paralelo em múltiplos agentes
- [ ] Integração com Slack/Teams
- [ ] Dashboard de métricas de testes
- [ ] Execução automática em commits
- [ ] Testes de performance com K6 ou JMeter

## 📚 Recursos Adicionais

- [Documentação Jenkins](https://www.jenkins.io/doc/)
- [Jenkins Pipeline Syntax](https://www.jenkins.io/doc/book/pipeline/syntax/)
- [HTML Publisher Plugin](https://plugins.jenkins.io/htmlpublisher/)
- [JUnit Plugin](https://plugins.jenkins.io/junit/)

