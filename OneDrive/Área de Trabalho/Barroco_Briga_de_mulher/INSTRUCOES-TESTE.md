# 🎮 Instruções para Testar o Jogo - Oratória Feminina

## 🚀 Iniciando o Servidor

### Opção 1: Usando o script bat (Windows)
1. Clique duas vezes no arquivo `iniciar-servidor.bat`
2. Aguarde o servidor iniciar
3. O servidor estará disponível em `http://localhost:8000`

### Opção 2: Usando Python manualmente
1. Abra o terminal na pasta do projeto
2. Execute: `python -m http.server 8000`
3. Acesse: `http://localhost:8000` no navegador

## 🌐 Acessando o Jogo

1. Abra seu navegador (Chrome, Firefox, Edge recomendados)
2. Acesse: `http://localhost:8000`
3. O jogo deve carregar automaticamente

## 🧪 Testes Básicos

### 1. Teste de Inicialização
- ✅ Verifique se a interface carrega
- ✅ Verifique se mostra: Rodada 1, Fichas 500, Aposta 50
- ✅ Verifique se os botões estão visíveis

### 2. Teste de Apostas
- ✅ Clique nos botões de aposta (25, 50, 100, 200)
- ✅ Verifique se a aposta é atualizada
- ✅ Clique em "Apostar"
- ✅ Verifique se as cartas são distribuídas

### 3. Teste de Jogabilidade
- ✅ Clique em "Pedir Carta" para receber mais cartas
- ✅ Verifique se a pontuação é atualizada
- ✅ Clique em "Parar" para finalizar sua jogada
- ✅ Verifique se o dealer joga automaticamente

### 4. Teste de Resultados
- ✅ Verifique se ganha quando tem mais pontos que o dealer
- ✅ Verifique se perde quando estoura (pontos > 21)
- ✅ Verifique se Blackjack (21 com 2 cartas) paga mais
- ✅ Verifique se empate devolve a aposta

### 5. Teste de Oradoras
- ✅ Clique no slot vazio para abrir a loja
- ✅ Compre uma oradora
- ✅ Verifique se os efeitos funcionam

## 🐛 Verificando Erros

1. Abra o Console do Navegador (F12)
2. Verifique se há erros em vermelho
3. Se houver erros, anote-os e informe

## 📱 Testando em Mobile

1. Descubra seu IP local:
   - Windows: `ipconfig` (procure por "IPv4")
   - Exemplo: `192.168.1.100`
2. No seu celular, acesse: `http://SEU_IP:8000`
3. Certifique-se de que o celular está na mesma rede Wi-Fi

## ✅ Checklist de Testes

- [ ] Jogo carrega sem erros
- [ ] Apostas funcionam
- [ ] Cartas são distribuídas corretamente
- [ ] Pontuação é calculada corretamente
- [ ] Botões "Pedir Carta" e "Parar" funcionam
- [ ] Dealer joga automaticamente
- [ ] Resultados são corretos
- [ ] Oradoras podem ser compradas
- [ ] Efeitos das oradoras funcionam
- [ ] Próxima rodada funciona
- [ ] Interface é responsiva

## 🎯 Problemas Conhecidos

Nenhum problema conhecido no momento.

## 📝 Notas

- O jogo funciona offline após o primeiro carregamento (PWA)
- O ícone `Oratoria_feminina.png` precisa estar no diretório
- Se o ícone não estiver disponível, o jogo ainda funciona, mas sem ícone

## 🆘 Resolução de Problemas

### Servidor não inicia
- Verifique se Python está instalado: `python --version`
- Verifique se a porta 8000 está disponível
- Tente usar outra porta: `python -m http.server 8080`

### Jogo não carrega
- Verifique o console do navegador (F12)
- Verifique se todos os arquivos estão presentes
- Verifique se está acessando via `http://` e não `file://`

### Cartas não aparecem
- Verifique se há erros no console
- Verifique se o JavaScript está carregando
- Tente recarregar a página (F5)

### Oradoras não aparecem
- Verifique se a loja está gerando itens
- Verifique se tem fichas suficientes
- Verifique o console para erros


