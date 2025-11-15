# 📦 Como Compilar o Instalador - Inno Setup

## 📋 Pré-requisitos

1. **Inno Setup** instalado
   - Download: https://jrsoftware.org/isdl.php
   - Versão recomendada: Inno Setup 6.x ou superior
   - Instale o arquivo `.exe` normalmente

2. **Python** instalado (já deve estar instalado)
   - Verifique: `python --version`

3. **Arquivo do ícone**
   - Certifique-se de que `Oratoria_feminina.png` existe no diretório raiz

## 🚀 Passo a Passo para Compilar

### 1. Abrir o Inno Setup Compiler

1. Abra o **Inno Setup Compiler**
2. Vá em **File → Open**
3. Selecione o arquivo **`setup.iss`**

### 2. Verificar o Script

O arquivo `setup.iss` já está configurado com:
- ✅ Nome do aplicativo: "Oratória Feminina"
- ✅ Versão: 1.0.0
- ✅ Ícone: Oratoria_feminina.png
- ✅ Arquivos necessários incluídos
- ✅ Atalhos na área de trabalho
- ✅ Menu Iniciar

### 3. Compilar o Instalador

1. Clique em **Build → Compile** (ou pressione **Ctrl+F9**)
2. Aguarde a compilação terminar
3. O instalador será criado em: **`dist\OratoriaFeminina-Setup.exe`**

### 4. Testar o Instalador

1. Vá para a pasta **`dist`**
2. Execute **`OratoriaFeminina-Setup.exe`**
3. Instale o jogo normalmente
4. Execute o jogo pelo atalho criado

## 📁 Arquivos Incluídos no Instalador

O instalador inclui:
- ✅ `index.html` - Página principal
- ✅ `game.js` - Lógica do jogo
- ✅ `style.css` - Estilos
- ✅ `manifest.json` - Configuração PWA
- ✅ `service-worker.js` - Service Worker
- ✅ `iniciar-jogo.bat` - Script para iniciar o jogo
- ✅ `Oratoria_feminina.png` - Ícone do jogo

## ⚙️ Configurações do Instalador

### Opções Configuradas:

- **Nome**: Oratória Feminina
- **Versão**: 1.0.0
- **Pasta padrão**: `C:\Program Files\Oratória Feminina`
- **Atalhos**: Área de trabalho e Menu Iniciar (opcional)
- **Compatibilidade**: Windows 7, 8, 10, 11
- **Arquitetura**: 64-bit e 32-bit

### Personalização:

Você pode editar o arquivo `setup.iss` para:
- Mudar o nome do aplicativo
- Mudar a versão
- Mudar o ícone
- Adicionar mais arquivos
- Mudar configurações de instalação

## 🎯 Após Compilar

Após compilar, você terá:

1. **Instalador**: `dist\OratoriaFeminina-Setup.exe`
   - Este é o arquivo que você distribui
   - Execute para instalar o jogo

2. **Local de instalação**: `C:\Program Files\Oratória Feminina`
   - Onde o jogo será instalado

3. **Atalhos**:
   - Área de trabalho (se selecionado)
   - Menu Iniciar
   - Quick Launch (se selecionado)

## 🧪 Como Testar o Instalador

### 1. Teste Local:

1. Compile o instalador
2. Execute `dist\OratoriaFeminina-Setup.exe`
3. Instale em uma pasta de teste
4. Execute o jogo pelo atalho
5. Verifique se tudo funciona

### 2. Teste em Outro PC:

1. Copie `dist\OratoriaFeminina-Setup.exe` para outro PC
2. Execute o instalador
3. Instale o jogo
4. Verifique se funciona corretamente

## 📝 Notas Importantes

### Python Necessário:

- O jogo precisa do **Python** instalado para rodar
- O instalador **NÃO** instala o Python automaticamente
- O usuário precisa ter Python instalado
- O script `iniciar-jogo.bat` verifica se Python está instalado

### Servidor Local:

- O jogo roda em um servidor local (porta 8000)
- O servidor inicia automaticamente quando o jogo é executado
- O navegador abre automaticamente
- Mantenha a janela do servidor aberta enquanto jogar

## 🐛 Solução de Problemas

### Erro: "Cannot find file"
- Verifique se todos os arquivos estão no diretório raiz
- Verifique se `Oratoria_feminina.png` existe

### Erro ao compilar:
- Verifique se o Inno Setup está instalado corretamente
- Verifique se a sintaxe do `setup.iss` está correta

### Instalador não funciona:
- Verifique se o Python está instalado no PC de destino
- Verifique se a porta 8000 está disponível
- Verifique o firewall do Windows

## 📦 Criar Versão Portável (Opcional)

Se quiser criar uma versão portável (sem instalação):

1. Crie uma pasta com todos os arquivos do jogo
2. Inclua o `iniciar-jogo.bat`
3. Compacte em ZIP
4. Distribua o ZIP

## ✅ Checklist Antes de Compilar

- [ ] Todos os arquivos estão no diretório raiz
- [ ] `Oratoria_feminina.png` existe
- [ ] `setup.iss` está correto
- [ ] Inno Setup está instalado
- [ ] Python está instalado (para teste)

## 🎉 Pronto para Compilar!

1. Abra o Inno Setup Compiler
2. Abra o arquivo `setup.iss`
3. Clique em **Build → Compile**
4. Aguarde a compilação
5. Teste o instalador!

---

**Boa sorte com a compilação!** 🚀📦

