# 🧪 Guia de Teste - Oratória Feminina

## ✅ Checklist de Testes

### 1. Inicialização
- [ ] Jogo carrega sem erros no console
- [ ] Interface aparece corretamente
- [ ] Estatísticas mostram: Rodada 1, Fichas 500, Aposta 50
- [ ] Botões de aposta (25, 50, 100, 200) estão funcionando
- [ ] Botão "Apostar" está habilitado

### 2. Sistema de Apostas
- [ ] Posso selecionar diferentes valores de aposta (25, 50, 100, 200)
- [ ] A aposta é atualizada na interface
- [ ] Não posso apostar mais do que tenho de fichas
- [ ] Ao clicar em "Apostar", as cartas são distribuídas

### 3. Distribuição de Cartas
- [ ] Recebo 2 cartas na minha mão
- [ ] Dealer recebe 2 cartas (1 virada para baixo)
- [ ] Pontuação é calculada corretamente
- [ ] Cartas são exibidas corretamente

### 4. Ações do Jogador
- [ ] Botão "Pedir Carta" adiciona uma carta à minha mão
- [ ] Pontuação é atualizada ao receber carta
- [ ] Botão "Parar" finaliza minha jogada
- [ ] Não posso jogar após estourar (pontos > 21)

### 5. Dealer (Mesa)
- [ ] Carta do dealer é revelada quando paro
- [ ] Dealer pede cartas até ter 17 ou mais
- [ ] Dealer para quando tem 17+
- [ ] Dealer estoura se passar de 21

### 6. Resultados
- [ ] Blackjack (21 com 2 cartas) paga corretamente
- [ ] Vitória quando tenho mais pontos que o dealer
- [ ] Derrota quando estouro ou dealer tem mais pontos
- [ ] Empate quando temos o mesmo valor
- [ ] Fichas são atualizadas corretamente

### 7. Oradoras Inspiradoras
- [ ] Posso comprar oradoras na loja
- [ ] Efeitos das oradoras funcionam corretamente
- [ ] Preço é deduzido das fichas
- [ ] Posso ter até 5 oradoras

### 8. Próxima Rodada
- [ ] Botão "Próxima Rodada" aparece após resultado
- [ ] Rodada incrementa corretamente
- [ ] Cartas são limpas
- [ ] Nova rodada começa com fase de aposta

### 9. Casos Especiais
- [ ] Ás (A) ajusta automaticamente (11 ou 1)
- [ ] Blackjack automático quando tenho 21 com 2 cartas
- [ ] Proteção contra estouro (se tiver Frida Kahlo)
- [ ] Multiplicadores funcionam (se tiver Marie Curie)
- [ ] Bônus funcionam (se tiver outras oradoras)

### 10. Interface e UX
- [ ] Interface é responsiva
- [ ] Cartas são clicáveis e visíveis
- [ ] Mensagens de status são claras
- [ ] Modal aparece com resultados
- [ ] Botões têm feedback visual

### 11. Edge Cases
- [ ] Jogo funciona quando fico sem fichas
- [ ] Baralho é embaralhado quando acaba
- [ ] Múltiplas rodadas funcionam
- [ ] Oradoras persistem entre rodadas

## 🐛 Problemas Conhecidos

Nenhum problema conhecido no momento.

## 📝 Notas de Teste

- Teste em diferentes navegadores (Chrome, Firefox, Edge)
- Teste em diferentes tamanhos de tela
- Teste em modo mobile
- Verifique o console do navegador para erros

## 🚀 Como Testar

1. Execute `iniciar-servidor.bat` ou `python -m http.server 8000`
2. Acesse `http://localhost:8000` no navegador
3. Abra o console do navegador (F12) para ver erros
4. Siga o checklist acima
5. Anote qualquer problema encontrado


