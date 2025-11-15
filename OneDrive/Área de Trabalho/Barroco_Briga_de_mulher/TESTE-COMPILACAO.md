# ✅ Teste de Compilação - Instruções Rápidas

## 🔧 Qual Erro Você Está Vendo?

Para eu poder ajudar melhor, preciso saber qual é o erro exato:

1. **Erro ao compilar no Inno Setup?**
   - Qual mensagem aparece?
   - Em qual linha do script?

2. **Erro ao executar o instalador?**
   - O instalador foi criado mas não funciona?
   - Qual erro aparece?

3. **Erro ao instalar?**
   - O instalador não inicia?
   - Falta algum arquivo?

## 🚀 Versões do Script Disponíveis

### Versão 1: `setup.iss` (Versão Completa)
- Com todas as funcionalidades
- Requer ícone (opcional)

### Versão 2: `setup-simples.iss` (Versão Simplificada) ⭐ RECOMENDADO
- Versão mais simples
- Não requer ícone
- Funciona mesmo sem alguns arquivos
- Mais fácil de compilar

## ✅ Como Usar a Versão Simplificada

### 1. No Inno Setup Compiler:

1. **File → Open**
2. Selecione **`setup-simples.iss`**
3. **Build → Compile** (ou Ctrl+F9)
4. Aguarde a compilação

### 2. Se Der Erro:

1. **Verifique se estes arquivos existem:**
   - ✅ `index.html`
   - ✅ `game.js`
   - ✅ `style.css`
   - ✅ `manifest.json`
   - ✅ `service-worker.js`
   - ✅ `iniciar-jogo.bat`

2. **Todos devem estar no mesmo diretório** (raiz do projeto)

## 🐛 Erros Comuns e Soluções

### Erro: "Cannot find file"
**Problema**: Arquivo não encontrado

**Solução**:
1. Verifique se todos os arquivos estão no diretório raiz
2. Verifique se os nomes dos arquivos estão corretos
3. Certifique-se de que está compilando a partir da pasta correta

### Erro: "Compile Error"
**Problema**: Erro de sintaxe no script

**Solução**:
1. Use a versão `setup-simples.iss`
2. Verifique se o Inno Setup está instalado corretamente
3. Tente compilar novamente

### Erro: "Português não encontrado"
**Problema**: Idioma português não instalado no Inno Setup

**Solução**:
1. O script `setup-simples.iss` tem inglês como fallback
2. Ou instale o pacote de idiomas do Inno Setup
3. Ou remova a linha do português no script

## 📝 Checklist Antes de Compilar

- [ ] `index.html` existe no diretório raiz
- [ ] `game.js` existe no diretório raiz
- [ ] `style.css` existe no diretório raiz
- [ ] `manifest.json` existe no diretório raiz
- [ ] `service-worker.js` existe no diretório raiz
- [ ] `iniciar-jogo.bat` existe no diretório raiz
- [ ] Inno Setup está instalado
- [ ] Você está compilando a partir da pasta correta

## 🎯 Tente Agora:

1. Abra o **Inno Setup Compiler**
2. Abra o arquivo **`setup-simples.iss`**
3. Compile (Ctrl+F9)
4. Me diga se funcionou ou qual erro apareceu!

---

**Me informe qual erro aparece para eu corrigir especificamente!** 🔧

