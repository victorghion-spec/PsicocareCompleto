# Integração de Testes - PsicoCare

Este documento explica como usar a integração completa de testes do PsicoCare, incluindo Robot Framework (UI) e Postman/Newman (API), com relatórios consolidados e integração com Jenkins.

## 📋 Visão Geral

O sistema de testes do PsicoCare inclui:

1. **Testes de UI** - Robot Framework + SeleniumLibrary
2. **Testes de API** - Postman/Newman
3. **Relatórios Consolidados** - HTML combinando ambos
4. **Integração CI/CD** - Jenkins Pipeline

## 🗂️ Estrutura de Diretórios

```
tests/
├── robotframework/          # Testes de UI
│   ├── locators.robot
│   ├── resources/
│   ├── test_*.robot
│   └── ...
├── postman/                 # Testes de API
│   ├── PsicoCare_API.postman_collection.json
│   ├── PsicoCare_API.postman_environment.json
│   └── ...
├── scripts/                 # Scripts utilitários
│   ├── generate_consolidated_report.py
│   ├── run_all_tests.sh
│   └── run_all_tests.bat
├── JENKINS_SETUP.md        # Guia de configuração Jenkins
└── README_INTEGRACAO.md    # Este arquivo
```

## 🚀 Execução Rápida

### Executar Todos os Testes

**Linux/Mac:**
```bash
chmod +x tests/scripts/run_all_tests.sh
./tests/scripts/run_all_tests.sh
```

**Windows:**
```bash
tests\scripts\run_all_tests.bat
```

### Executar Apenas Testes de UI

```bash
cd tests/robotframework
robot .
```

### Executar Apenas Testes de API

```bash
cd tests/postman
newman run PsicoCare_API.postman_collection.json -e PsicoCare_API.postman_environment.json
```

## 📊 Relatórios Gerados

Após a execução, os relatórios estarão em `test-results/`:

### Relatórios Individuais

- **UI (Robot Framework):**
  - `test-results/robotframework/report.html` - Relatório principal
  - `test-results/robotframework/log.html` - Log detalhado
  - `test-results/robotframework/output.xml` - Saída XML

- **API (Postman):**
  - `test-results/postman/postman-report.html` - Relatório HTML
  - `test-results/postman/postman-report.json` - Relatório JSON
  - `test-results/postman/postman-report.xml` - Relatório JUnit

### Relatório Consolidado

- `test-results/consolidated-report.html` - **Relatório combinado de UI + API**

## 🔧 Configuração

### Variáveis de Ambiente

Configure as URLs dos serviços:

```bash
export PSICOCARE_BASE_URL=http://localhost:19006
export PSICOCARE_API_URL=http://localhost:3000
```

### Credenciais de Teste

As credenciais padrão estão nos arquivos de configuração. Para alterar:

**Robot Framework:**
Edite `tests/robotframework/locators.robot`:
```robot
${EMAIL_PACIENTE_TESTE}    paciente@teste.com
${SENHA_PACIENTE_TESTE}    senha123
```

**Postman:**
Edite `tests/postman/PsicoCare_API.postman_environment.json`:
```json
{
  "key": "paciente_email",
  "value": "paciente@teste.com"
}
```

## 🔄 Integração com Jenkins

### Configuração Básica

1. **Instalar Plugins:**
   - HTML Publisher Plugin
   - JUnit Plugin
   - Pipeline Plugin

2. **Criar Pipeline:**
   - Use o `Jenkinsfile` na raiz do projeto
   - Configure as variáveis de ambiente

3. **Executar:**
   - O pipeline executa automaticamente UI + API
   - Gera relatórios consolidados
   - Publica no Jenkins

Veja `tests/JENKINS_SETUP.md` para detalhes completos.

## 📈 Fluxo de Execução

```
┌─────────────────┐
│  Início         │
└────────┬────────┘
         │
         ├─────────────────┬─────────────────┐
         │                 │                 │
         ▼                 ▼                 ▼
┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│ Setup        │  │ Instalar     │  │ Verificar    │
│ Ambiente     │  │ Dependências │  │ Serviços     │
└──────────────┘  └──────────────┘  └──────────────┘
         │                 │                 │
         └─────────────────┴─────────────────┘
                           │
         ┌─────────────────┴─────────────────┐
         │                                   │
         ▼                                   ▼
┌──────────────────┐            ┌──────────────────┐
│ Testes de UI     │            │ Testes de API    │
│ (Robot Framework)│            │ (Postman/Newman) │
└────────┬─────────┘            └────────┬─────────┘
         │                               │
         └───────────────┬───────────────┘
                         │
                         ▼
              ┌──────────────────────┐
              │ Gerar Relatório      │
              │ Consolidado          │
              └──────────┬───────────┘
                         │
                         ▼
              ┌──────────────────────┐
              │ Publicar Relatórios  │
              │ (Jenkins/Local)      │
              └──────────────────────┘
```

## 🎯 Cenários de Uso

### 1. Desenvolvimento Local

```bash
# Executar todos os testes
./tests/scripts/run_all_tests.sh

# Abrir relatório consolidado
open test-results/consolidated-report.html
```

### 2. CI/CD (Jenkins)

```groovy
// O Jenkinsfile já está configurado
// Apenas configure o pipeline no Jenkins
```

### 3. Testes Específicos

```bash
# Apenas testes de autenticação (UI)
cd tests/robotframework
robot --include auth .

# Apenas testes de API de autenticação
cd tests/postman
newman run PsicoCare_API.postman_collection.json \
    --folder "Autenticação"
```

## 📊 Métricas e Estatísticas

O relatório consolidado inclui:

- ✅ Total de testes executados
- ✅ Testes que passaram
- ❌ Testes que falharam
- ⏭️ Testes que foram pulados
- 📈 Taxa de sucesso (%)
- 📋 Detalhes por tipo (UI/API)

## 🔍 Troubleshooting

### Erro: Serviços não estão rodando

**Solução:** Inicie os serviços antes de executar os testes:
```bash
# Terminal 1 - API
cd API/PsicoCare-API-main
npm start

# Terminal 2 - Frontend
cd Front/PsicoCare-Front-main
npm start
```

### Erro: Dependências não instaladas

**Solução:** Instale as dependências:
```bash
# Robot Framework
cd tests/robotframework
pip install -r requirements.txt

# Postman/Newman
cd tests/postman
npm install -g newman newman-reporter-html
```

### Erro: Relatório consolidado não gerado

**Solução:** Verifique se o Python está instalado:
```bash
python3 --version
# Ou
python --version
```

## 📚 Documentação Adicional

- [README Robot Framework](tests/robotframework/README.md)
- [README Postman](tests/postman/README.md)
- [Guia Jenkins](tests/JENKINS_SETUP.md)
- [Elementos Identificados](tests/robotframework/ELEMENTOS_IDENTIFICADOS.md)

## 🎉 Próximos Passos

1. ✅ Executar testes localmente
2. ✅ Configurar Jenkins (se necessário)
3. ✅ Adicionar mais testes conforme necessário
4. ✅ Integrar com notificações (Slack, Email, etc.)
5. ✅ Configurar execução automática em commits

## 💡 Dicas

- Execute os testes regularmente durante o desenvolvimento
- Mantenha os relatórios para análise de tendências
- Use tags para organizar testes (`smoke`, `regression`, etc.)
- Configure notificações para falhas críticas

---

**Desenvolvido para PsicoCare** 🧠💙

