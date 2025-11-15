// Sistema de Cartas para Blackjack
const suits = ['♠', '♥', '♦', '♣'];
const values = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'];
const suitColors = {
    '♠': 'black',
    '♣': 'black',
    '♥': 'red',
    '♦': 'red'
};

// Oradoras Inspiradoras - Poderes Especiais para Blackjack
const inspiringWomen = [
    {
        name: 'Marie Curie',
        effect: 'Multiplica ganhos por 1.5x',
        multiplier: 1.5,
        description: 'Cientista pioneira que descobriu a radioatividade'
    },
    {
        name: 'Frida Kahlo',
        effect: 'Proteção: não estoura com 22',
        protection: true,
        protectionValue: 22,
        description: 'Artista mexicana conhecida por suas obras vibrantes'
    },
    {
        name: 'Rosa Parks',
        effect: 'Blackjack paga 3x ao invés de 2.5x',
        blackjackMultiplier: 3,
        description: 'Ativista dos direitos civis'
    },
    {
        name: 'Malala Yousafzai',
        effect: '+50 fichas se ganhar com exatamente 21',
        bonus: 50,
        condition: 'exact_21',
        description: 'Ativista pela educação das meninas'
    },
    {
        name: 'Ada Lovelace',
        effect: 'Pode ver uma carta do dealer',
        peekDealer: true,
        description: 'Primeira programadora da história'
    },
    {
        name: 'Cleópatra',
        effect: '+20 fichas por carta real (J,Q,K) na mão',
        royalBonus: 20,
        description: 'Última rainha do Egito'
    },
    {
        name: 'Amelia Earhart',
        effect: 'Pode dobrar aposta uma vez por rodada',
        doubleDown: true,
        description: 'Primeira aviadora a cruzar o Atlântico'
    },
    {
        name: 'Oprah Winfrey',
        effect: 'Ganha 100 fichas se dealer estourar',
        dealerBustBonus: 100,
        description: 'Empresária e filantropa'
    }
];

// Estado do Jogo
let gameState = {
    deck: [],
    playerHand: [],
    dealerHand: [],
    chips: 500,
    currentBet: 50,
    round: 1,
    gamePhase: 'betting', // 'betting', 'playing', 'dealer', 'finished'
    women: [],
    shop: [],
    dealerCardVisible: false,
    hasDoubledDown: false
};

// Criar Baralho
function createDeck() {
    const deck = [];
    for (let suit of suits) {
        for (let value of values) {
            deck.push({
                suit: suit,
                value: value,
                color: suitColors[suit],
                blackjackValue: getBlackjackValue(value)
            });
        }
    }
    return shuffleDeck(deck);
}

function shuffleDeck(deck) {
    const shuffled = [...deck];
    for (let i = shuffled.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }
    return shuffled;
}

function getBlackjackValue(value) {
    if (value === 'A') return 11; // Será tratado separadamente
    if (['J', 'Q', 'K'].includes(value)) return 10;
    return parseInt(value);
}

// Calcular Pontuação Blackjack
function calculateBlackjackScore(hand) {
    if (!hand || hand.length === 0) return 0;
    
    let score = 0;
    let aces = 0;
    
    for (let card of hand) {
        if (card.value === 'A') {
            aces++;
            score += 11;
        } else {
            score += card.blackjackValue;
        }
    }
    
    // Ajustar Áses
    while (score > 21 && aces > 0) {
        score -= 10;
        aces--;
    }
    
    // Nota: Bônus de cartas reais não é aplicado ao score base do Blackjack
    // para manter a mecânica tradicional do jogo
    // Os bônus das oradoras são aplicados nos ganhos, não no score
    
    return score;
}

// Comprar Carta
function drawCard() {
    if (gameState.deck.length === 0) {
        gameState.deck = createDeck();
    }
    return gameState.deck.pop();
}

// Verificar Blackjack (21 com 2 cartas)
function isBlackjack(hand) {
    return hand.length === 2 && calculateBlackjackScore(hand) === 21;
}

// Verificar se estourou
function isBusted(hand) {
    let score = calculateBlackjackScore(hand);
    
    // Verificar proteção das Oradoras
    for (let woman of gameState.women) {
        if (woman.protection && score === woman.protectionValue) {
            return false; // Protegido contra estouro
        }
    }
    
    return score > 21;
}

// Renderizar Carta
function renderCard(card, faceDown = false) {
    const cardDiv = document.createElement('div');
    cardDiv.className = `card ${card.color}`;
    
    if (faceDown) {
        cardDiv.classList.add('face-down');
        cardDiv.innerHTML = `
            <div class="card-back-inner">🂠</div>
        `;
    } else {
    cardDiv.innerHTML = `
        <div class="card-value">${card.value}</div>
        <div class="card-suit">${card.suit}</div>
    `;
    }
    
    return cardDiv;
}

// Atualizar Display da Mão do Jogador
function updatePlayerHandDisplay() {
    const handDiv = document.getElementById('hand');
    handDiv.innerHTML = '';
    
    if (gameState.playerHand.length === 0) {
        document.getElementById('hand-score').textContent = 'Pontos: 0';
        document.getElementById('hand-status').textContent = 'Faça sua aposta';
        document.getElementById('hand-status').style.color = '#764ba2';
        return;
    }
    
    gameState.playerHand.forEach(card => {
        handDiv.appendChild(renderCard(card));
    });
    
    const score = calculateBlackjackScore(gameState.playerHand);
    document.getElementById('hand-score').textContent = `Pontos: ${score}`;
    
    if (isBlackjack(gameState.playerHand)) {
        document.getElementById('hand-status').textContent = 'BLACKJACK! 🎉';
        document.getElementById('hand-status').style.color = '#38ef7d';
    } else if (isBusted(gameState.playerHand)) {
        document.getElementById('hand-status').textContent = 'ESTOUROU! 💥';
        document.getElementById('hand-status').style.color = '#e74c3c';
    } else if (gameState.gamePhase === 'playing') {
        document.getElementById('hand-status').textContent = 'Sua vez de jogar';
        document.getElementById('hand-status').style.color = '#764ba2';
    } else if (gameState.gamePhase === 'betting') {
        document.getElementById('hand-status').textContent = 'Faça sua aposta';
        document.getElementById('hand-status').style.color = '#764ba2';
    }
}

// Atualizar Display da Mão do Dealer
function updateDealerHandDisplay() {
    const dealerHandDiv = document.getElementById('dealer-hand');
    dealerHandDiv.innerHTML = '';
    
    if (gameState.dealerHand.length === 0) {
        document.getElementById('dealer-score').textContent = 'Pontos: 0';
        return;
    }
    
    gameState.dealerHand.forEach((card, index) => {
        // Primeira carta virada para baixo até o dealer jogar
        const faceDown = !gameState.dealerCardVisible && index === 0 && gameState.gamePhase !== 'dealer' && gameState.gamePhase !== 'finished';
        dealerHandDiv.appendChild(renderCard(card, faceDown));
    });
    
    if (gameState.dealerCardVisible || gameState.gamePhase === 'dealer' || gameState.gamePhase === 'finished') {
        const score = calculateBlackjackScore(gameState.dealerHand);
        document.getElementById('dealer-score').textContent = `Pontos: ${score}`;
    } else if (gameState.dealerHand.length > 0) {
        // Mostrar apenas o valor da carta visível
        const visibleScore = gameState.dealerHand[0].value === 'A' ? 11 : getBlackjackValue(gameState.dealerHand[0].value);
        document.getElementById('dealer-score').textContent = `Pontos: ${visibleScore}+`;
    } else {
        document.getElementById('dealer-score').textContent = 'Pontos: 0';
    }
}

// Atualizar Estatísticas
function updateStats() {
    document.getElementById('round').textContent = gameState.round;
    document.getElementById('chips').textContent = gameState.chips;
    document.getElementById('bet').textContent = gameState.currentBet;
}

function updateDeckDisplay() {
    const deckCount = document.querySelector('.deck-count');
    if (deckCount) {
        deckCount.textContent = gameState.deck.length;
    }
}

// Pedir Carta (Hit)
function hit() {
    if (gameState.gamePhase !== 'playing') return;
    
    gameState.playerHand.push(drawCard());
    updatePlayerHandDisplay();
    updateDeckDisplay();
    
    if (isBusted(gameState.playerHand)) {
        endRound('lose');
    } else if (isBlackjack(gameState.playerHand)) {
        // Blackjack automático
        setTimeout(() => {
            endRound('blackjack');
        }, 1000);
    }
}

// Parar (Stand)
function stand() {
    if (gameState.gamePhase !== 'playing') return;
    
    gameState.gamePhase = 'dealer';
    gameState.dealerCardVisible = true;
    updateDealerHandDisplay();
    
    // Dealer joga
    dealerPlay();
}

// Dealer joga
function dealerPlay() {
    // Revelar carta
    gameState.dealerCardVisible = true;
    updateDealerHandDisplay();
    
    // Dealer deve pedir cartas até ter 17 ou mais
    const playDealerCard = () => {
        const dealerScore = calculateBlackjackScore(gameState.dealerHand);
        
        if (dealerScore < 17 && !isBusted(gameState.dealerHand)) {
            gameState.dealerHand.push(drawCard());
            updateDealerHandDisplay();
            updateDeckDisplay();
            // Continuar jogando após um delay
            setTimeout(playDealerCard, 800);
        } else {
            // Determinar resultado após um pequeno delay
            setTimeout(() => {
                determineWinner();
            }, 500);
        }
    };
    
    // Iniciar jogo do dealer
    playDealerCard();
}

// Determinar Vencedor
function determineWinner() {
    const playerScore = calculateBlackjackScore(gameState.playerHand);
    const dealerScore = calculateBlackjackScore(gameState.dealerHand);
    const playerBusted = isBusted(gameState.playerHand);
    const dealerBusted = isBusted(gameState.dealerHand);
    const playerBlackjack = isBlackjack(gameState.playerHand);
    const dealerBlackjack = isBlackjack(gameState.dealerHand);
    
    let result = '';
    
    if (playerBusted) {
        result = 'lose';
    } else if (dealerBusted) {
        result = 'win';
        // Bônus se dealer estourar
        gameState.women.forEach(woman => {
            if (woman.dealerBustBonus) {
                gameState.chips += woman.dealerBustBonus;
            }
        });
    } else if (playerBlackjack && !dealerBlackjack) {
        result = 'blackjack';
    } else if (dealerBlackjack && !playerBlackjack) {
        result = 'lose';
    } else if (playerBlackjack && dealerBlackjack) {
        result = 'push';
    } else if (playerScore > dealerScore) {
        result = 'win';
    } else if (dealerScore > playerScore) {
        result = 'lose';
    } else {
        result = 'push';
    }
    
    // Calcular bônus
    let bonusChips = 0;
    
    if (result === 'win' || result === 'blackjack') {
        // Bônus se ganhar com exatamente 21 (Malala Yousafzai)
        if (playerScore === 21) {
            gameState.women.forEach(woman => {
                if (woman.condition === 'exact_21' && woman.bonus) {
                    bonusChips += woman.bonus;
                }
            });
        }
        // Bônus por cartas reais (Cleópatra)
        gameState.women.forEach(woman => {
            if (woman.royalBonus) {
                const royalCount = gameState.playerHand.filter(c => ['J', 'Q', 'K'].includes(c.value)).length;
                bonusChips += royalCount * woman.royalBonus;
            }
        });
    }
    
    if (dealerBusted) {
        // Bônus se dealer estourar (Oprah Winfrey)
        gameState.women.forEach(woman => {
            if (woman.dealerBustBonus) {
                bonusChips += woman.dealerBustBonus;
            }
        });
    }
    
    endRound(result, bonusChips);
}

// Finalizar Rodada
function endRound(result, bonusChips = 0) {
    gameState.gamePhase = 'finished';
    gameState.dealerCardVisible = true;
    updateDealerHandDisplay();
    
    let message = '';
    let winnings = 0;
    
    switch(result) {
        case 'blackjack':
            const blackjackMultiplier = gameState.women.find(w => w.blackjackMultiplier)?.blackjackMultiplier || 2.5;
            winnings = Math.floor(gameState.currentBet * blackjackMultiplier);
            message = `BLACKJACK! Você ganhou ${winnings} fichas!`;
            if (bonusChips > 0) {
                message += ` (+${bonusChips} de bônus)`;
            }
            gameState.chips += winnings;
            break;
        case 'win':
            winnings = gameState.currentBet * (gameState.hasDoubledDown ? 2 : 1);
            // Aplicar multiplicador (Marie Curie)
            gameState.women.forEach(woman => {
                if (woman.multiplier) {
                    winnings = Math.floor(winnings * woman.multiplier);
                }
            });
            message = `Você ganhou! +${winnings} fichas`;
            if (bonusChips > 0) {
                message += ` (+${bonusChips} de bônus)`;
            }
            gameState.chips += winnings;
            break;
        case 'lose':
            message = `Você perdeu! -${gameState.currentBet} fichas`;
            break;
        case 'push':
            message = 'Empate! Sua aposta foi devolvida.';
            gameState.chips += gameState.currentBet; // Devolver aposta
            break;
    }
    
    updateStats();
    disableGameButtons();
    
    // Mostrar próximo botão
    document.getElementById('next-round').style.display = 'block';
    document.getElementById('next-round').textContent = 'Próxima Rodada';
    
    showModal(result === 'win' || result === 'blackjack' ? 'Vitória!' : result === 'push' ? 'Empate' : 'Derrota', message);
}

// Fazer Aposta
function placeBet() {
    if (gameState.gamePhase !== 'betting') return;
    if (gameState.chips < gameState.currentBet) {
        showModal('Erro', 'Fichas insuficientes!');
        return;
    }
    
    gameState.chips -= gameState.currentBet;
    gameState.gamePhase = 'playing';
    gameState.hasDoubledDown = false;
    
    // Distribuir cartas
    gameState.playerHand = [drawCard(), drawCard()];
    gameState.dealerHand = [drawCard(), drawCard()];
    
    updatePlayerHandDisplay();
    updateDealerHandDisplay();
    updateStats();
    updateDeckDisplay();
    
    // Ativar botões de jogo
    document.getElementById('hit').disabled = false;
    document.getElementById('stand').disabled = false;
    document.getElementById('bet-button').disabled = true;
    
    // Desativar botões de aposta
    document.querySelectorAll('.btn-bet').forEach(btn => btn.disabled = true);
    
    // Verificar Blackjack automático
    if (isBlackjack(gameState.playerHand)) {
        setTimeout(() => {
            endRound('blackjack');
        }, 1000);
    }
}

// Dobrar Aposta
function doubleDown() {
    if (gameState.gamePhase !== 'playing') return;
    if (gameState.hasDoubledDown) return;
    if (gameState.chips < gameState.currentBet) return;
    
    // Verificar se tem oradora com poder de double down
    const hasDoubleDownPower = gameState.women.some(w => w.doubleDown);
    if (!hasDoubleDownPower) return;
    
    gameState.chips -= gameState.currentBet;
    gameState.currentBet *= 2;
    gameState.hasDoubledDown = true;
    
    // Pedir uma carta e parar automaticamente
    hit();
    if (!isBusted(gameState.playerHand)) {
        setTimeout(() => stand(), 500);
    }
    
    updateStats();
}

// Próxima Rodada
function nextRound() {
    gameState.round++;
    gameState.playerHand = [];
    gameState.dealerHand = [];
    gameState.gamePhase = 'betting';
    gameState.dealerCardVisible = false;
    gameState.hasDoubledDown = false;
    gameState.currentBet = 50; // Reset para aposta padrão
    
    // Embaralhar novo baralho se necessário
    if (gameState.deck.length < 10) {
        gameState.deck = createDeck();
    }
    
    updatePlayerHandDisplay();
    updateDealerHandDisplay();
    updateStats();
    updateDeckDisplay();
    
    // Resetar botões
    document.getElementById('hit').disabled = true;
    document.getElementById('stand').disabled = true;
    document.getElementById('bet-button').disabled = false;
    document.getElementById('next-round').style.display = 'none';
    
    // Ativar botões de aposta
    document.querySelectorAll('.btn-bet').forEach(btn => btn.disabled = false);
    
    // Verificar se perdeu todas as fichas
    if (gameState.chips <= 0) {
        showModal('Game Over', 'Você ficou sem fichas! O jogo será reiniciado.');
        gameState.chips = 500;
        gameState.round = 1;
        updateStats();
    }
}

// Desativar Botões de Jogo
function disableGameButtons() {
    document.getElementById('hit').disabled = true;
    document.getElementById('stand').disabled = true;
}

// Definir Aposta
function setBet(amount) {
    if (gameState.gamePhase !== 'betting') return;
    if (gameState.chips < amount) {
        showModal('Erro', 'Fichas insuficientes!');
        return;
    }
    gameState.currentBet = amount;
    updateStats();
}

// Renderizar Oradoras Inspiradoras
function renderWomen() {
    const slotsDiv = document.getElementById('women-slots');
    slotsDiv.innerHTML = '';
    
    for (let i = 0; i < 5; i++) {
        const slot = document.createElement('div');
        slot.className = `slot ${gameState.women[i] ? 'filled' : 'empty'}`;
        
        if (gameState.women[i]) {
            const woman = gameState.women[i];
            slot.innerHTML = `
                <div class="woman-name">${woman.name}</div>
                <div class="woman-effect">${woman.effect}</div>
            `;
            slot.addEventListener('click', () => removeWoman(i));
        } else {
            slot.textContent = '+';
            slot.addEventListener('click', () => showShop());
        }
        
        slotsDiv.appendChild(slot);
    }
}

function removeWoman(index) {
    gameState.women.splice(index, 1);
    renderWomen();
}

// Loja
function generateShop() {
    const available = inspiringWomen.filter(w => 
        !gameState.women.some(owned => owned.name === w.name)
    );
    
    const shopCount = Math.min(3, available.length);
    gameState.shop = [];
    
    for (let i = 0; i < shopCount; i++) {
        const randomIndex = Math.floor(Math.random() * available.length);
        const woman = { ...available[randomIndex] };
        woman.price = Math.floor(Math.random() * 200) + 100;
        gameState.shop.push(woman);
        available.splice(randomIndex, 1);
    }
    
    renderShop();
}

function renderShop() {
    const shopDiv = document.getElementById('shop-items');
    shopDiv.innerHTML = '';
    
    if (gameState.shop.length === 0) {
        shopDiv.innerHTML = '<p style="text-align: center; color: #666;">Loja vazia</p>';
        return;
    }
    
    gameState.shop.forEach((woman, index) => {
        const item = document.createElement('div');
        item.className = 'shop-item';
        item.innerHTML = `
            <div class="shop-item-name">${woman.name}</div>
            <div class="shop-item-effect">${woman.effect}</div>
            <div class="shop-item-price">💰 ${woman.price} fichas</div>
        `;
        item.addEventListener('click', () => buyWoman(index));
        shopDiv.appendChild(item);
    });
}

function buyWoman(index) {
    const woman = gameState.shop[index];
    if (gameState.chips >= woman.price && gameState.women.length < 5) {
        gameState.chips -= woman.price;
        gameState.women.push(woman);
        gameState.shop.splice(index, 1);
        updateStats();
        renderWomen();
        renderShop();
    } else if (gameState.women.length >= 5) {
        showModal('Loja', 'Você já tem o máximo de Oradoras Inspiradoras!');
    } else {
        showModal('Loja', 'Fichas insuficientes!');
    }
}

function showShop() {
    generateShop();
    document.getElementById('shop-items').scrollIntoView({ behavior: 'smooth' });
}

// Modal
function showModal(title, message) {
    document.getElementById('modal-title').textContent = title;
    document.getElementById('modal-message').textContent = message;
    document.getElementById('modal').style.display = 'flex';
}

document.getElementById('modal-close').addEventListener('click', () => {
    document.getElementById('modal').style.display = 'none';
});

// Event Listeners
document.getElementById('hit').addEventListener('click', hit);
document.getElementById('stand').addEventListener('click', stand);
document.getElementById('bet-button').addEventListener('click', placeBet);
document.getElementById('next-round').addEventListener('click', nextRound);

// Botões de aposta
document.querySelectorAll('.btn-bet').forEach(btn => {
    btn.addEventListener('click', () => {
        const betAmount = parseInt(btn.dataset.bet);
        setBet(betAmount);
    });
});

// Inicializar Jogo
function initGame() {
    gameState.deck = createDeck();
    gameState.gamePhase = 'betting';
    updateStats();
    updatePlayerHandDisplay();
    updateDealerHandDisplay();
    updateDeckDisplay();
    renderWomen();
    generateShop();
    
    // Desativar botões de jogo inicialmente
    document.getElementById('hit').disabled = true;
    document.getElementById('stand').disabled = true;
    document.getElementById('next-round').style.display = 'none';
}

// Registrar Service Worker para PWA
if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
        navigator.serviceWorker.register('./service-worker.js')
            .then((registration) => {
                console.log('Service Worker registrado com sucesso:', registration.scope);
            })
            .catch((error) => {
                console.log('Falha ao registrar Service Worker:', error);
            });
    });
}

// Iniciar quando a página carregar
window.addEventListener('DOMContentLoaded', initGame);
