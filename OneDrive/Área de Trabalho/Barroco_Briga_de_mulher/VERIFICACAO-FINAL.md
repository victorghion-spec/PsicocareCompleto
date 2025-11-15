# ✅ Verificação Final - PC e Android

## 🖥️ Teste no PC

1. **Abra `index.html` no navegador**
   - Deve carregar normalmente
   - Ícone deve aparecer na aba do navegador
   - Jogo deve funcionar completamente

2. **Teste com Servidor Local:**
   ```bash
   # Execute:
   iniciar-servidor.bat
   # Acesse: http://localhost:8000
   ```

3. **Verifique no Console do Navegador (F12):**
   - Deve aparecer: "Service Worker registrado com sucesso"
   - Sem erros de JavaScript

## 📱 Teste no Android

### Método 1: Servidor Local
1. Execute `iniciar-servidor.bat` no PC
2. Anote o IP (ex: 192.168.1.100)
3. No Android, acesse: `http://192.168.1.100:8000`
4. Teste todas as funcionalidades

### Método 2: Instalar como PWA
1. Acesse o jogo no Chrome do Android
2. Toque no menu (3 pontos) > "Adicionar à tela inicial"
3. O ícone deve aparecer na tela inicial
4. Abra o app pelo ícone
5. Deve funcionar como app nativo

### Teste Offline (PWA):
1. Instale o app como PWA
2. Desative Wi-Fi/Dados
3. Abra o app
4. Deve funcionar normalmente (offline)

## ✅ Checklist de Funcionalidades

### Básico:
- [ ] Cartas aparecem na tela
- [ ] Posso selecionar cartas (toque/clique)
- [ ] Botão "Jogar Mão" funciona
- [ ] Pontuação é calculada
- [ ] Chips aumentam
- [ ] Posso descartar cartas
- [ ] Baralho funciona

### Mulheres Inspiradoras:
- [ ] Loja abre (clicar no +)
- [ ] Posso comprar mulheres
- [ ] Efeitos funcionam
- [ ] Posso remover mulheres

### PWA (Android):
- [ ] Ícone aparece na tela inicial
- [ ] Abre como app (sem barra do navegador)
- [ ] Funciona offline
- [ ] Service Worker registrado

### Visual:
- [ ] Interface adapta para tela pequena
- [ ] Texto legível
- [ ] Botões clicáveis no touch
- [ ] Ícone aparece corretamente

## 🚨 Problemas Comuns

### Service Worker não registra:
- **Solução**: Use servidor HTTP (não file://)
- Execute `iniciar-servidor.bat`

### Ícone não aparece:
- **Solução**: Verifique se `balatro_de_Mulher_icone.jpg` está na mesma pasta
- Limpe cache do navegador

### Não funciona offline:
- **Solução**: Acesse pelo servidor HTTP primeiro
- Service Worker precisa ser instalado uma vez online

### Não instala como PWA no Android:
- **Solução**: Precisa ser HTTPS (ou localhost)
- Use servidor local ou hospede online

## 📋 Arquivos Necessários

Certifique-se de ter todos estes arquivos:
- ✅ index.html
- ✅ style.css
- ✅ game.js
- ✅ manifest.json
- ✅ service-worker.js
- ✅ balatro_de_Mulher_icone.jpg
- ✅ .htaccess (opcional, para servidor Apache)

## 🎯 Pronto para Publicar?

Se tudo funcionar:
- ✅ PC: Funciona
- ✅ Android: Funciona
- ✅ PWA: Instala e funciona offline
- ✅ Ícone: Aparece corretamente

**Próximo passo**: Veja `PUBLICACAO-PLAYSTORE.md` para publicar!

