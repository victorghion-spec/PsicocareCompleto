# Testes de API do PsicoCare com Postman/Newman

Este diretório contém a coleção Postman e scripts para executar testes automatizados da API do PsicoCare.

## 📋 Estrutura

```
tests/postman/
├── PsicoCare_API.postman_collection.json    # Coleção de testes
├── PsicoCare_API.postman_environment.json   # Variáveis de ambiente
├── package.json                              # Dependências Node.js
├── run_postman_tests.sh                     # Script Linux/Mac
├── run_postman_tests.bat                    # Script Windows
└── README.md                                 # Este arquivo
```

## 🚀 Instalação

### 1. Instalar Node.js

Certifique-se de ter Node.js instalado (versão 12 ou superior).

### 2. Instalar Newman

```bash
npm install -g newman newman-reporter-html newman-reporter-htmlextra newman-reporter-junit
```

Ou instalar localmente:

```bash
cd tests/postman
npm install
```

## 🧪 Executando os Testes

### Executar via Script

**Linux/Mac:**
```bash
chmod +x run_postman_tests.sh
./run_postman_tests.sh
```

**Windows:**
```bash
run_postman_tests.bat
```

### Executar via Newman Diretamente

```bash
newman run PsicoCare_API.postman_collection.json \
    -e PsicoCare_API.postman_environment.json \
    --env-var "base_url=http://localhost:3000" \
    -r html,cli,json,junit \
    --reporter-html-export results/postman-report.html \
    --reporter-json-export results/postman-report.json \
    --reporter-junit-export results/postman-report.xml
```

### Executar via npm

```bash
npm test              # Execução básica
npm run test:html     # Com relatório HTML
npm run test:json     # Com relatório JSON
npm run test:junit    # Com relatório JUnit
```

## 📊 Relatórios

Os relatórios são gerados no diretório `results/`:

- `postman-report.html` - Relatório HTML visual
- `postman-report.json` - Relatório em JSON (para processamento)
- `postman-report.xml` - Relatório JUnit (para CI/CD)

## 🔧 Configuração

### Variáveis de Ambiente

Edite `PsicoCare_API.postman_environment.json` ou defina variáveis de ambiente:

```bash
export PSICOCARE_API_URL=http://localhost:3000
export TEST_EMAIL_PACIENTE=paciente@teste.com
export TEST_SENHA_PACIENTE=senha123
```

### URLs

Por padrão, a API está configurada para `http://localhost:3000`. Para alterar:

1. Edite o arquivo de ambiente
2. Ou use `--env-var` no comando newman
3. Ou defina a variável de ambiente `PSICOCARE_API_URL`

## 📝 Endpoints Testados

### Autenticação
- ✅ POST `/auth/login` - Login de paciente
- ✅ POST `/auth/login` - Login de psicólogo
- ✅ POST `/auth/login` - Login com credenciais inválidas

### Agendamentos
- ✅ GET `/agendamentos` - Listar agendamentos (autenticado)
- ✅ POST `/agendamentos` - Criar agendamento
- ✅ POST `/agendamentos` - Criar agendamento sem autenticação (deve falhar)

### Avaliações
- ✅ POST `/avaliacoes` - Criar avaliação
- ✅ GET `/avaliacoes/publicas` - Listar avaliações públicas

### Profissionais
- ✅ GET `/profissionais` - Listar profissionais

### Acompanhamentos
- ✅ POST `/acompanhamentos` - Criar acompanhamento
- ✅ GET `/acompanhamentos` - Listar acompanhamentos (autenticado)

## 🔗 Integração com Jenkins

Os testes podem ser executados no Jenkins usando o `Jenkinsfile` na raiz do projeto. O relatório JUnit é automaticamente processado pelo Jenkins.

## 📚 Recursos Adicionais

- [Documentação Newman](https://github.com/postmanlabs/newman)
- [Postman Collection Format](https://schema.getpostman.com/json/collection/v2.1.0/docs/index.html)
- [Newman Reporters](https://github.com/postmanlabs/newman#reporters)

