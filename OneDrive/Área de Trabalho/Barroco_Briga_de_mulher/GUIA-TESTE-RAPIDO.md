# 🎮 Guia Rápido de Teste - Oratória Feminina

## 🚀 Como Testar Agora

### 1. Iniciar o Servidor
Execute um dos seguintes comandos no terminal:
- **Windows**: Clique duas vezes em `iniciar-servidor.bat`
- **Ou**: Execute `python -m http.server 8000` no terminal

### 2. Acessar o Jogo
Abra seu navegador e acesse:
```
http://localhost:8000
```

### 3. Abrir o Console (Importante!)
Pressione **F12** no navegador para abrir o console e ver se há erros.

## 🎯 Testes Básicos para Fazer

### Teste 1: Inicialização
- [ ] O jogo carrega sem erros?
- [ ] Aparece: Rodada 1, Fichas 500, Aposta 50?
- [ ] Botões de aposta (25, 50, 100, 200) aparecem?

### Teste 2: Fazer uma Aposta
- [ ] Clique em um botão de aposta (ex: 50)
- [ ] A aposta muda para 50?
- [ ] Clique em "Apostar"
- [ ] Você recebe 2 cartas?
- [ ] O dealer recebe 2 cartas (1 virada)?

### Teste 3: Jogar uma Mão
- [ ] Veja sua pontuação (Pontos: X)
- [ ] Clique em "Pedir Carta" algumas vezes
- [ ] A pontuação aumenta?
- [ ] Clique em "Parar"
- [ ] O dealer joga automaticamente?
- [ ] Um resultado aparece (Vitória/Derrota/Empate)?

### Teste 4: Blackjack
- [ ] Se você receber Ás + 10/J/Q/K = 21 com 2 cartas
- [ ] Aparece "BLACKJACK!"?
- [ ] Você ganha mais fichas?

### Teste 5: Estourar (Bust)
- [ ] Se você pedir muitas cartas e passar de 21
- [ ] Aparece "ESTOUROU!"?
- [ ] Você perde automaticamente?

### Teste 6: Próxima Rodada
- [ ] Após um resultado, aparece botão "Próxima Rodada"?
- [ ] Clique nele
- [ ] Nova rodada começa?
- [ ] Rodada incrementa (Rodada 2, 3, etc.)?

### Teste 7: Oradoras Inspiradoras
- [ ] Clique no slot vazio "+" para abrir a loja
- [ ] Aparecem oradoras para comprar?
- [ ] Você pode comprar uma oradora?
- [ ] O preço é deduzido das suas fichas?

## 🐛 O que Verificar

### No Console (F12)
- ❌ Erros em vermelho = Problema!
- ✅ Sem erros = Tudo certo!

### Na Interface
- ❌ Botões não funcionam = Problema!
- ❌ Cartas não aparecem = Problema!
- ❌ Pontuação não atualiza = Problema!
- ✅ Tudo funciona = Perfeito!

## 🎯 Funcionalidades para Testar

### Sistema de Apostas
- [ ] Posso escolher diferentes valores (25, 50, 100, 200)
- [ ] A aposta é deduzida das fichas
- [ ] Não posso apostar mais do que tenho

### Sistema de Cartas
- [ ] Recebo 2 cartas ao apostar
- [ ] Posso pedir mais cartas
- [ ] Ás ajusta automaticamente (11 ou 1)
- [ ] Pontuação é calculada corretamente

### Dealer (Mesa)
- [ ] Dealer recebe 2 cartas
- [ ] Primeira carta fica virada
- [ ] Dealer joga automaticamente quando paro
- [ ] Dealer para em 17 ou mais

### Resultados
- [ ] Vitória quando tenho mais pontos
- [ ] Derrota quando estouro ou dealer tem mais
- [ ] Empate quando temos o mesmo valor
- [ ] Blackjack paga mais

### Oradoras
- [ ] Loja gera oradoras
- [ ] Posso comprar oradoras
- [ ] Efeitos funcionam (se aplicável)

## 🎮 Como Jogar (Resumo)

1. **Escolha uma aposta** (25, 50, 100, 200)
2. **Clique em "Apostar"**
3. **Receba suas cartas**
4. **Decida**: Pedir mais cartas ou Parar
5. **Dealer joga automaticamente**
6. **Veja o resultado**
7. **Clique em "Próxima Rodada"**
8. **Repita!**

## 🎯 Dicas de Teste

- **Teste Blackjack**: Aposte várias vezes até conseguir Ás + 10/J/Q/K
- **Teste Estouro**: Peça muitas cartas para passar de 21
- **Teste Oradoras**: Compre algumas oradoras e veja os efeitos
- **Teste Múltiplas Rodadas**: Jogue várias rodadas seguidas
- **Teste Fichas**: Veja se as fichas aumentam/diminuem corretamente

## 🐛 Problemas Comuns

### Servidor não inicia
- Verifique se Python está instalado: `python --version`
- Tente outra porta: `python -m http.server 8080`

### Jogo não carrega
- Verifique o console (F12) para erros
- Verifique se está acessando via `http://` e não `file://`
- Recarregue a página (F5)

### Botões não funcionam
- Verifique o console para erros JavaScript
- Verifique se o arquivo `game.js` está carregando
- Limpe o cache do navegador (Ctrl+Shift+Delete)

## ✅ Checklist Final

Antes de considerar o jogo pronto:
- [ ] Jogo carrega sem erros
- [ ] Apostas funcionam
- [ ] Cartas são distribuídas
- [ ] Pontuação é calculada corretamente
- [ ] Dealer joga automaticamente
- [ ] Resultados são corretos
- [ ] Próxima rodada funciona
- [ ] Oradoras podem ser compradas
- [ ] Interface é responsiva
- [ ] Funciona em diferentes navegadores

## 🎉 Divirta-se Testando!

Teste tudo e veja o que funciona e o que precisa ser ajustado!


