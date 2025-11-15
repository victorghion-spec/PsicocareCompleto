# 🔧 Como Corrigir Erros no Inno Setup

## 🐛 Erros Comuns e Soluções

### Erro 1: "Cannot find file Oratoria_feminina.png"

**Problema**: O arquivo de ícone não foi encontrado.

**Solução**:
1. Certifique-se de que `Oratoria_feminina.png` existe no diretório raiz
2. OU remova a referência ao ícone no `setup.iss`:
   - Remova a linha: `SetupIconFile=Oratoria_feminina.png`
   - OU comente com `;SetupIconFile=Oratoria_feminina.png`

### Erro 2: "Cannot find file iniciar-jogo.bat"

**Problema**: O arquivo `iniciar-jogo.bat` não foi encontrado.

**Solução**:
1. Certifique-se de que `iniciar-jogo.bat` existe no diretório raiz
2. Verifique se o nome do arquivo está correto

### Erro 3: Erro de compilação do Inno Setup

**Problema**: Erro ao compilar o script.

**Solução**:
1. Verifique a sintaxe do arquivo `setup.iss`
2. Certifique-se de que o Inno Setup está instalado corretamente
3. Tente usar a versão atualizada do script

### Erro 4: "File not found" ou arquivos não incluídos

**Problema**: Arquivos não estão sendo incluídos no instalador.

**Solução**:
1. Verifique se todos os arquivos estão no diretório raiz:
   - `index.html`
   - `game.js`
   - `style.css`
   - `manifest.json`
   - `service-worker.js`
   - `iniciar-jogo.bat`
2. Certifique-se de que os caminhos no `setup.iss` estão corretos

## ✅ Versão Corrigida do Script

Criei uma versão corrigida e simplificada do `setup.iss` que:
- ✅ Não exige o arquivo de ícone (se não existir)
- ✅ Verifica se os arquivos existem antes de incluir
- ✅ Usa caminhos relativos corretos
- ✅ Funciona mesmo sem alguns arquivos opcionais

## 🔧 Como Usar a Versão Corrigida

1. **Substitua o arquivo `setup.iss`** pela versão corrigida
2. **Compile novamente** no Inno Setup
3. **Teste o instalador** gerado

## 📝 Checklist Antes de Compilar

Antes de compilar, verifique:

- [ ] `index.html` existe no diretório raiz
- [ ] `game.js` existe no diretório raiz
- [ ] `style.css` existe no diretório raiz
- [ ] `manifest.json` existe no diretório raiz
- [ ] `service-worker.js` existe no diretório raiz
- [ ] `iniciar-jogo.bat` existe no diretório raiz
- [ ] `Oratoria_feminina.png` existe (opcional - se não existir, o instalador funciona sem ícone)
- [ ] Inno Setup está instalado
- [ ] Todos os arquivos estão no mesmo diretório

## 🆘 Se Ainda Tiver Erros

Me informe:
1. **Qual é a mensagem de erro exata?**
2. **Em qual etapa acontece?** (ao compilar? ao instalar? ao executar?)
3. **O que você estava fazendo quando o erro aconteceu?**

Com essas informações, posso ajudar a corrigir o problema específico!

