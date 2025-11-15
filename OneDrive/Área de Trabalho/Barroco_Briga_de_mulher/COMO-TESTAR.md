# 🎮 COMO TESTAR O JOGO - Passo a Passo

## ✅ PASSO 1: Acessar o Jogo

### Opção A: Navegador já abriu automaticamente
- Se o navegador abriu, você já está no jogo!
- Vá para o PASSO 2

### Opção B: Acessar manualmente
1. Abra seu navegador (Chrome, Firefox ou Edge)
2. Digite na barra de endereço: `http://localhost:8000`
3. Pressione Enter
4. O jogo deve carregar!

## ✅ PASSO 2: Verificar se Carregou

### O que você deve ver:
- ✅ Título: "🎤 Oratória Feminina 🎤"
- ✅ Estatísticas: Rodada 1, Fichas 500, Aposta 50
- ✅ Área do Dealer (Mesa) - vazia no início
- ✅ Sua Mão - vazia no início
- ✅ Baralho com 52 cartas
- ✅ Botões: "Pedir Carta", "Parar", "Apostar"
- ✅ Botões de aposta: 25, 50, 100, 200
- ✅ Oradoras Inspiradoras (slots vazios com +)

## ✅ PASSO 3: Abrir o Console (Importante!)

1. Pressione **F12** no navegador
2. Clique na aba **Console**
3. Verifique se há erros em vermelho
   - ❌ Se houver erros = me informe!
   - ✅ Se não houver erros = está tudo certo!

## ✅ PASSO 4: Fazer seu Primeiro Teste

### Teste 1: Fazer uma Aposta
1. Clique no botão **"50"** (ou qualquer outro valor)
2. Veja a aposta atualizar no topo
3. Clique no botão **"Apostar"**
4. **O que deve acontecer:**
   - ✅ Você recebe 2 cartas
   - ✅ O dealer recebe 2 cartas (1 virada)
   - ✅ Sua pontuação aparece (ex: Pontos: 15)
   - ✅ Botões "Pedir Carta" e "Parar" ficam habilitados
   - ✅ Botão "Apostar" fica desabilitado

### Teste 2: Pedir Cartas
1. Veja sua pontuação
2. Clique em **"Pedir Carta"**
3. **O que deve acontecer:**
   - ✅ Uma nova carta aparece na sua mão
   - ✅ Sua pontuação atualiza
   - ✅ Se passar de 21, aparece "ESTOUROU!" em vermelho

### Teste 3: Parar
1. Quando achar que está bom, clique em **"Parar"**
2. **O que deve acontecer:**
   - ✅ Botões "Pedir Carta" e "Parar" ficam desabilitados
   - ✅ A carta do dealer é revelada
   - ✅ O dealer joga automaticamente (pede cartas até 17+)
   - ✅ Resultado aparece (Vitória/Derrota/Empate)
   - ✅ Botão "Próxima Rodada" aparece

### Teste 4: Ver Resultado
1. Veja o resultado no modal que aparece
2. **O que pode acontecer:**
   - ✅ **Vitória**: Você ganha fichas!
   - ✅ **Derrota**: Você perde fichas
   - ✅ **Blackjack**: Ganha mais (21 com 2 cartas)
   - ✅ **Empate**: Aposta devolvida

### Teste 5: Próxima Rodada
1. Clique em **"Próxima Rodada"**
2. **O que deve acontecer:**
   - ✅ Modal fecha
   - ✅ Cartas são limpas
   - ✅ Rodada incrementa (Rodada 2, 3, etc.)
   - ✅ Botão "Apostar" fica habilitado novamente
   - ✅ Você pode jogar novamente!

## ✅ PASSO 5: Testar Oradoras Inspiradoras

### Como comprar uma oradora:
1. Clique no slot vazio **"+"** (no painel esquerdo)
2. **O que deve acontecer:**
   - ✅ Loja aparece no painel direito
   - ✅ Mostra 3 oradoras disponíveis
   - ✅ Cada uma tem um preço (ex: 150 fichas)

### Como comprar:
1. Clique em uma oradora na loja
2. **O que deve acontecer:**
   - ✅ O preço é deduzido das suas fichas
   - ✅ A oradora aparece no slot
   - ✅ Você pode ver o efeito dela

### Efeitos das oradoras:
- **Marie Curie**: Multiplica ganhos por 1.5x
- **Frida Kahlo**: Proteção contra estouro com 22
- **Rosa Parks**: Blackjack paga 3x
- **Malala Yousafzai**: +50 fichas se ganhar com 21
- **Ada Lovelace**: Pode ver uma carta do dealer
- **Cleópatra**: +20 fichas por carta real (J,Q,K)
- **Amelia Earhart**: Pode dobrar aposta
- **Oprah Winfrey**: +100 fichas se dealer estourar

## ✅ PASSO 6: Testar Casos Especiais

### Teste Blackjack:
1. Aposte várias vezes até conseguir **Ás + 10/J/Q/K**
2. Deve aparecer **"BLACKJACK!"** em verde
3. Você ganha mais fichas (2.5x ou 3x com Rosa Parks)

### Teste Estourar:
1. Peça muitas cartas até passar de 21
2. Deve aparecer **"ESTOUROU!"** em vermelho
3. Você perde automaticamente

### Teste Empate:
1. Tenha o mesmo valor que o dealer (sem estourar)
2. Deve aparecer **"Empate!"**
3. Sua aposta é devolvida

## 🐛 O Que Verificar

### No Console (F12):
- ❌ **Erros em vermelho** = Problema! (me informe)
- ✅ **Sem erros** = Tudo certo!

### Na Interface:
- ❌ **Botões não funcionam** = Problema! (me informe)
- ❌ **Cartas não aparecem** = Problema! (me informe)
- ❌ **Pontuação não atualiza** = Problema! (me informe)
- ✅ **Tudo funciona** = Perfeito!

## 📝 Checklist de Teste

Teste estas funcionalidades:
- [ ] Jogo carrega sem erros
- [ ] Apostas funcionam
- [ ] Cartas são distribuídas
- [ ] Pontuação é calculada corretamente
- [ ] Botão "Pedir Carta" funciona
- [ ] Botão "Parar" funciona
- [ ] Dealer joga automaticamente
- [ ] Resultados aparecem corretamente
- [ ] Próxima rodada funciona
- [ ] Oradoras podem ser compradas
- [ ] Efeitos das oradoras funcionam
- [ ] Blackjack funciona
- [ ] Estourar funciona
- [ ] Empate funciona

## 🎯 Dicas

- **Teste várias rodadas** para ver se tudo funciona
- **Teste diferentes apostas** (25, 50, 100, 200)
- **Teste comprar oradoras** e veja os efeitos
- **Teste Blackjack** (21 com 2 cartas)
- **Teste estourar** (passar de 21)
- **Teste vitória normal** (mais pontos que dealer)

## 🆘 Se Algo Não Funcionar

1. **Verifique o console (F12)** para erros
2. **Recarregue a página** (F5)
3. **Verifique se o servidor está rodando** (porta 8000)
4. **Me informe o problema** e eu corrijo!

## 🎉 Divirta-se Testando!

Teste todas as funcionalidades e veja o que funciona e o que precisa ser ajustado!

---

**Acesse agora**: http://localhost:8000

**Boa sorte!** 🎮🎉


