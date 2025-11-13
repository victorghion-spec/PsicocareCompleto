# Automação de Testes do PsicoCare com Robot Framework

Este diretório contém a estrutura completa de automação de testes para o aplicativo PsicoCare usando Robot Framework, SeleniumLibrary e SikuliLibrary.

## 📁 Estrutura de Arquivos

```
tests/robotframework/
├── locators.robot                    # Locators e variáveis de elementos
├── robotconfig.robot                 # Configuração global dos testes
├── variables.py                      # Variáveis de ambiente Python
├── requirements.txt                  # Dependências Python
├── README.md                         # Este arquivo
├── resources/
│   ├── psicocare_resources.robot    # Keywords reutilizáveis principais
│   └── sikuli_resources.robot       # Keywords para automação por imagem
├── sikuli_images/                    # Imagens para reconhecimento Sikuli
│   ├── btn_entrar.png
│   ├── btn_cadastrar.png
│   └── tela_login.png
└── test_*.robot                      # Arquivos de teste por funcionalidade
    ├── test_autenticacao.robot
    ├── test_agendamentos.robot
    ├── test_acompanhamento.robot
    ├── test_avaliacoes.robot
    └── test_psicologo.robot
```

## 🚀 Instalação

### 1. Instalar Python (3.8 ou superior)

```bash
python --version
```

### 2. Instalar dependências

```bash
cd tests/robotframework
pip install -r requirements.txt
```

### 3. Instalar drivers do navegador

O SeleniumLibrary pode usar o webdrivermanager automaticamente, ou você pode instalar manualmente:

**Chrome:**
- Baixar ChromeDriver de https://chromedriver.chromium.org/
- Adicionar ao PATH do sistema

**Firefox:**
- Baixar GeckoDriver de https://github.com/mozilla/geckodriver/releases
- Adicionar ao PATH do sistema

### 4. Instalar Sikuli (Opcional - para automação por imagem)

**Windows:**
```bash
pip install robotframework-sikulilibrary
# Baixar SikuliX de https://raiman.github.io/SikuliX1/downloads.html
# Configurar variável de ambiente SIKULI_HOME
```

**Linux/Mac:**
```bash
pip install robotframework-sikulilibrary
# Instalar dependências do sistema conforme documentação do SikuliX
```

## ⚙️ Configuração

### Variáveis de Ambiente

Crie um arquivo `.env` ou configure as variáveis de ambiente:

```bash
# URLs
export PSICOCARE_BASE_URL=http://localhost:19006
export PSICOCARE_API_URL=http://localhost:3000

# Navegador
export BROWSER=chrome
export HEADLESS=False

# Credenciais de teste
export TEST_EMAIL_PACIENTE=paciente@teste.com
export TEST_SENHA_PACIENTE=senha123
export TEST_EMAIL_PSICOLOGO=psicologo@teste.com
export TEST_SENHA_PSICOLOGO=senha456

# Sikuli (se necessário)
export SIKULI_IMAGES_PATH=./tests/robotframework/sikuli_images
```

### Configurar IDs e Locators

Os locators estão definidos em `locators.robot`. Se o seu aplicativo usar IDs específicos, atualize os locators:

```robot
${LOGIN_EMAIL_INPUT}    id=email-input
${LOGIN_SENHA_INPUT}    id=senha-input
${LOGIN_BTN_ENTAR}      id=btn-entrar
```

## 🧪 Executando os Testes

### Executar todos os testes

```bash
robot tests/robotframework/
```

### Executar testes específicos

```bash
# Apenas testes de autenticação
robot tests/robotframework/test_autenticacao.robot

# Apenas testes com tag "smoke"
robot --include smoke tests/robotframework/

# Apenas testes de agendamento
robot tests/robotframework/test_agendamentos.robot
```

### Executar com opções específicas

```bash
# Executar em modo headless
robot --variable BROWSER:headlesschrome tests/robotframework/

# Executar com timeout customizado
robot --variable TIMEOUT_MEDIUM:20s tests/robotframework/

# Gerar relatório HTML detalhado
robot --outputdir results --log log.html --report report.html tests/robotframework/
```

### Executar testes paralelos (se instalado pytest-parallel)

```bash
pabot --processes 4 tests/robotframework/
```

## 📋 Locators e Elementos

### Principais Locators Definidos

#### Autenticação
- `${LOGIN_EMAIL_INPUT}` - Campo de email
- `${LOGIN_SENHA_INPUT}` - Campo de senha
- `${LOGIN_BTN_ENTRAR}` - Botão Entrar
- `${LOGIN_MSG_ERRO}` - Mensagem de erro

#### Cadastro
- `${REGISTER_NOME_INPUT}` - Campo nome
- `${REGISTER_EMAIL_INPUT}` - Campo email
- `${REGISTER_SENHA_INPUT}` - Campo senha
- `${REGISTER_BTN_CADASTRAR}` - Botão Cadastrar

#### Agendamentos
- `${AGENDAMENTOS_INPUT_DATA}` - Campo data
- `${AGENDAMENTOS_INPUT_HORA}` - Campo hora
- `${AGENDAMENTOS_BTN_CRIAR}` - Botão criar agendamento

#### Acompanhamento
- `${ACOMPANHAMENTO_TEXTAREA}` - Campo de texto
- `${ACOMPANHAMENTO_SONO_1}` a `${ACOMPANHAMENTO_SONO_5}` - Botões qualidade sono
- `${ACOMPANHAMENTO_HUMOR_ESTAVEL}` - Botão humor estável

## 🖼️ Usando Sikuli para Automação por Imagem

Se alguns elementos não puderem ser identificados por locators tradicionais, use Sikuli:

### 1. Capturar imagens dos elementos

Use a ferramenta Sikuli IDE ou capture screenshots dos elementos:
- Botões
- Ícones
- Elementos visuais específicos

### 2. Salvar imagens em `sikuli_images/`

```
sikuli_images/
├── btn_entrar.png
├── btn_cadastrar.png
├── campo_email.png
└── tela_login.png
```

### 3. Usar nos testes

```robot
*** Settings ***
Resource    resources/sikuli_resources.robot

*** Test Cases ***
Teste Com Sikuli
    Inicializar Sikuli
    Clicar Em Elemento Por Imagem    btn_entrar.png
    Verificar Elemento Visivel Por Imagem    tela_login.png
```

## 📊 Relatórios

Após a execução, os relatórios são gerados em:
- `log.html` - Log detalhado da execução
- `report.html` - Relatório de resultados
- `output.xml` - Saída em XML para integração CI/CD

## 🔧 Troubleshooting

### Elemento não encontrado

1. Verifique se o locator está correto em `locators.robot`
2. Aumente o timeout: `--variable TIMEOUT_MEDIUM:20s`
3. Use Sikuli para elementos difíceis de localizar

### Navegador não abre

1. Verifique se o driver está instalado e no PATH
2. Tente usar `webdrivermanager` automaticamente
3. Verifique permissões do sistema

### Erros de autenticação

1. Verifique as credenciais em `variables.py` ou variáveis de ambiente
2. Certifique-se de que o usuário de teste existe no banco de dados
3. Verifique se a API está rodando

## 📝 Adicionando Novos Testes

1. Crie um novo arquivo `test_nova_funcionalidade.robot`
2. Importe os recursos necessários:
   ```robot
   *** Settings ***
   Resource    resources/psicocare_resources.robot
   Resource    locators.robot
   ```
3. Adicione locators em `locators.robot` se necessário
4. Adicione keywords reutilizáveis em `resources/psicocare_resources.robot`

## 🔗 Integração CI/CD

### GitHub Actions

```yaml
name: Robot Framework Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: '3.9'
      - name: Install dependencies
        run: |
          pip install -r tests/robotframework/requirements.txt
      - name: Run tests
        run: |
          robot --outputdir results tests/robotframework/
      - name: Upload results
        uses: actions/upload-artifact@v2
        with:
          name: test-results
          path: results/
```

## 📚 Recursos Adicionais

- [Documentação Robot Framework](https://robotframework.org/)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [SikuliLibrary Documentation](https://github.com/rainmanwy/robotframework-SikuliLibrary)

## 👥 Contribuindo

Ao adicionar novos testes:
1. Siga o padrão dos testes existentes
2. Use tags apropriadas (`smoke`, `regression`, etc.)
3. Documente keywords complexas
4. Mantenha os locators atualizados

## 📄 Licença

Este projeto faz parte do PsicoCare.

