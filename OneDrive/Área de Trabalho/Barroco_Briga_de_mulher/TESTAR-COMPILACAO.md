# 🚀 Como Compilar e Testar o Instalador Localmente

## ⚡ COMANDO RÁPIDO

### Opção 1: Versão Simplificada (Recomendado)
```batch
compilar-instalador.bat
```

### Opção 2: Versão Completa
```batch
compilar-instalador-completo.bat
```

## 📋 O Que o Script Faz

1. ✅ Verifica se o Inno Setup está instalado
2. ✅ Verifica se os arquivos necessários existem
3. ✅ Cria a pasta `dist` se não existir
4. ✅ Compila o instalador automaticamente
5. ✅ Pergunta se você quer testar o instalador

## 🎯 Passo a Passo

### 1. Abrir Terminal

1. Abra o PowerShell ou Prompt de Comando
2. Navegue até a pasta do projeto:
   ```batch
   cd "C:\Users\victo\OneDrive\Área de Trabalho\Oratoria_de_mulher"
   ```

### 2. Executar o Script

Execute um dos comandos:

**Versão Simplificada (Recomendada):**
```batch
compilar-instalador.bat
```

**Versão Completa:**
```batch
compilar-instalador-completo.bat
```

### 3. Aguardar Compilação

- O script vai compilar automaticamente
- Aguarde a mensagem de sucesso
- O instalador será criado em: `dist\OratoriaFeminina-Setup.exe`

### 4. Testar o Instalador

1. O script pergunta se você quer testar
2. Digite **S** para testar
3. O instalador vai abrir automaticamente
4. Instale e teste o jogo!

## 🧪 Como Testar o Instalador

### Teste 1: Instalar Localmente

1. Execute `dist\OratoriaFeminina-Setup.exe`
2. Siga o assistente de instalação
3. Instale em uma pasta de teste (ex: `C:\Teste\Oratoria Feminina`)
4. Execute o jogo pelo atalho criado
5. Verifique se funciona!

### Teste 2: Desinstalar

1. Vá no Painel de Controle → Programas
2. Desinstale "Oratória Feminina"
3. Verifique se removeu tudo corretamente

### Teste 3: Instalar em Outra Pasta

1. Execute o instalador novamente
2. Escolha outra pasta de instalação
3. Verifique se funciona

## 📁 Onde Está o Instalador?

Após compilar, o instalador estará em:
```
dist\OratoriaFeminina-Setup.exe
```

## 🐛 Se Der Erro

### Erro: "Inno Setup não encontrado"

**Solução:**
1. Instale o Inno Setup: https://jrsoftware.org/isdl.php
2. Ou edite o script e informe o caminho correto do `ISCC.exe`

### Erro: "Arquivo não encontrado"

**Solução:**
1. Verifique se você está na pasta correta do projeto
2. Verifique se todos os arquivos existem:
   - `index.html`
   - `game.js`
   - `iniciar-jogo.bat`
   - etc.

### Erro na Compilação

**Solução:**
1. Use a versão simplificada: `compilar-instalador.bat`
2. Verifique os erros na tela
3. Me informe o erro específico

## ✅ Checklist Antes de Compilar

- [ ] Inno Setup está instalado
- [ ] Você está na pasta correta do projeto
- [ ] Todos os arquivos necessários existem
- [ ] Você tem permissão para criar a pasta `dist`

## 🎯 Comandos Disponíveis

### Compilar (Versão Simplificada):
```batch
compilar-instalador.bat
```

### Compilar (Versão Completa):
```batch
compilar-instalador-completo.bat
```

### Compilar Manualmente:
```batch
"C:\Program Files (x86)\Inno Setup 6\ISCC.exe" setup-simples.iss
```

### Abrir Instalador Gerado:
```batch
start dist\OratoriaFeminina-Setup.exe
```

## 📝 Notas

- O instalador é criado na pasta `dist`
- Você pode compilar quantas vezes quiser
- O instalador anterior será substituído
- Teste sempre antes de distribuir!

## 🎉 Pronto para Compilar!

Execute agora:
```batch
compilar-instalador.bat
```

Boa sorte! 🚀

