# 🧪 Guia de Testes - PC e Android

## 🖥️ Testando no PC

### Método 1: Abrir Diretamente (Mais Simples)
1. Navegue até a pasta do jogo
2. Clique duas vezes no arquivo `index.html`
3. O jogo abrirá no seu navegador padrão

### Método 2: Usar Servidor Local (Recomendado)
1. Abra o PowerShell ou Terminal na pasta do jogo
2. Execute um dos comandos abaixo:

**Python 3:**
```bash
python -m http.server 8000
```

**Python 2:**
```bash
python -m SimpleHTTPServer 8000
```

**Node.js (se tiver instalado):**
```bash
npx http-server -p 8000
```

3. Abra o navegador e acesse: `http://localhost:8000`

## 📱 Testando no Android

### Método 1: Servidor Local na Rede (Recomendado)

1. **No PC:**
   - Descubra o IP do seu PC:
     - Windows: Abra PowerShell e digite `ipconfig`
     - Procure por "IPv4" (exemplo: 192.168.1.100)
   - Inicie um servidor HTTP na pasta do jogo:
     ```bash
     python -m http.server 8000
     ```
   - **IMPORTANTE:** Desative o firewall temporariamente ou permita a porta 8000

2. **No Android:**
   - Conecte o celular na mesma rede Wi-Fi do PC
   - Abra o navegador (Chrome, Firefox, etc.)
   - Digite: `http://SEU_IP:8000` (exemplo: `http://192.168.1.100:8000`)

### Método 2: Usar o Script Automático
Execute o arquivo `iniciar-servidor.bat` (Windows) ou `iniciar-servidor.sh` (Linux/Mac)
Ele mostrará o IP automaticamente!

### Método 3: Transferir Arquivos para o Android
1. Copie todos os arquivos do jogo para o Android (via USB, email, Google Drive, etc.)
2. Use um app de gerenciador de arquivos no Android
3. Abra o arquivo `index.html` com o navegador

### Método 4: Usar ngrok (Acesso de Qualquer Lugar)
1. Instale o ngrok: https://ngrok.com/download
2. No PC, inicie o servidor:
   ```bash
   python -m http.server 8000
   ```
3. Em outro terminal, execute:
   ```bash
   ngrok http 8000
   ```
4. Copie a URL fornecida (ex: `https://abc123.ngrok.io`)
5. Acesse essa URL no Android (funciona de qualquer lugar!)

## 🔧 Solução de Problemas

### Firewall Bloqueando
- Windows: Painel de Controle > Firewall > Permitir app através do firewall
- Ou desative temporariamente o firewall para testes

### Não Consegue Acessar pelo IP
- Verifique se PC e Android estão na mesma rede Wi-Fi
- Verifique se o servidor está rodando
- Tente desativar o firewall temporariamente

### Porta Já em Uso
- Use outra porta (ex: 8001, 8080, 3000)
- Altere o comando: `python -m http.server 8001`

## 📋 Checklist de Testes

### Funcionalidades Básicas:
- [ ] Cartas aparecem na tela
- [ ] Posso selecionar cartas clicando
- [ ] Botão "Jogar Mão" funciona
- [ ] Pontuação é calculada corretamente
- [ ] Chips aumentam ao jogar mão
- [ ] Posso descartar cartas
- [ ] Baralho diminui ao comprar cartas

### Mulheres Inspiradoras:
- [ ] Posso abrir a loja
- [ ] Posso comprar mulheres
- [ ] Efeitos das mulheres funcionam
- [ ] Posso remover mulheres

### Progressão:
- [ ] Avanço para próxima Ante funciona
- [ ] Meta de chips aumenta corretamente
- [ ] Game Over aparece quando perde

### Mobile (Android):
- [ ] Interface se adapta à tela pequena
- [ ] Cartas são clicáveis no touch
- [ ] Botões funcionam corretamente
- [ ] Texto é legível

## 🎮 Navegadores Testados

### PC:
- ✅ Chrome
- ✅ Firefox
- ✅ Edge
- ✅ Opera

### Android:
- ✅ Chrome Mobile
- ✅ Firefox Mobile
- ✅ Samsung Internet

