# 📱 Guia de Publicação na Play Store

## ✅ Preparação do Jogo

O jogo já está configurado como PWA (Progressive Web App) e pronto para publicação!

### Arquivos Configurados:
- ✅ `manifest.json` - Configuração do app
- ✅ `service-worker.js` - Funciona offline
- ✅ Ícone configurado (`balatro_de_Mulher_icone.jpg`)
- ✅ Meta tags para mobile
- ✅ Responsivo para PC e Android

## 🚀 Passos para Publicar na Play Store

### 1. Hospedar o Jogo Online

Você precisa hospedar o jogo em um servidor web com HTTPS (obrigatório para Play Store).

**Opções de Hospedagem Gratuita:**
- **Netlify** (recomendado): https://www.netlify.com
- **Vercel**: https://vercel.com
- **GitHub Pages**: https://pages.github.com
- **Firebase Hosting**: https://firebase.google.com/docs/hosting

**Como fazer (Netlify - mais fácil):**
1. Acesse https://www.netlify.com
2. Crie uma conta gratuita
3. Arraste a pasta do jogo para o site
4. Pronto! Você terá uma URL HTTPS

### 2. Testar o PWA

1. Acesse seu jogo pelo navegador no Android
2. No Chrome, toque no menu (3 pontos) > "Adicionar à tela inicial"
3. O app deve aparecer como um ícone na tela inicial
4. Teste se funciona offline

### 3. Publicar na Play Store usando TWA (Trusted Web Activity)

A Play Store aceita PWAs através de TWA. Você tem duas opções:

#### Opção A: Usar Bubble (Mais Fácil - Pago)
- https://bubble.io - Cria TWA automaticamente

#### Opção B: Criar TWA Manualmente (Gratuito)

1. **Instalar Android Studio**
   - Baixe: https://developer.android.com/studio

2. **Criar Projeto TWA**
   - Use o template TWA do Google
   - Configure a URL do seu jogo hospedado
   - Gere o APK/AAB

3. **Configurar na Play Console**
   - Acesse: https://play.google.com/console
   - Crie uma conta de desenvolvedor ($25 único)
   - Faça upload do APK/AAB
   - Preencha informações do app
   - Envie para revisão

### 4. Informações Necessárias para Play Store

- **Nome do App**: Cartas Inspiradoras
- **Descrição Curta**: Jogo de cartas estratégico com mulheres inspiradoras
- **Descrição Completa**: 
  ```
  Cartas Inspiradoras é um jogo de cartas estratégico único com uma temática 
  especial de mulheres inspiradoras e seus poderes especiais!
  
  Características:
  - Sistema de cartas de poker completo
  - Mulheres Inspiradoras com poderes únicos
  - Progressão por Níveis
  - Interface moderna e responsiva
  - Funciona offline
  - Totalmente original e autoral
  ```
- **Categoria**: Jogos > Cartas
- **Classificação**: PEGI 3 / Livre
- **Capturas de Tela**: Tire 2-8 screenshots do jogo
- **Ícone**: Use `balatro_de_Mulher_icone.jpg` (512x512px recomendado)

### 5. Requisitos Técnicos

✅ **Já Configurado:**
- Manifest.json
- Service Worker
- HTTPS (quando hospedar)
- Ícone configurado
- Responsivo

⚠️ **Verificar:**
- URL deve ser HTTPS
- Manifest.json acessível
- Service Worker funcionando
- Testar em diferentes dispositivos Android

## 🧪 Teste Final Antes de Publicar

1. ✅ Abre no navegador Android
2. ✅ Pode ser instalado como app
3. ✅ Funciona offline
4. ✅ Ícone aparece corretamente
5. ✅ Todas as funcionalidades funcionam
6. ✅ Interface adapta para telas pequenas

## 📝 Checklist de Publicação

- [ ] Jogo hospedado com HTTPS
- [ ] Testado no Android
- [ ] Pode ser instalado como PWA
- [ ] Funciona offline
- [ ] Ícone configurado
- [ ] Screenshots preparados
- [ ] Descrição escrita
- [ ] Conta de desenvolvedor criada ($25)
- [ ] APK/AAB gerado (se usar TWA)
- [ ] Upload na Play Console
- [ ] Informações preenchidas
- [ ] Enviado para revisão

## 🔗 Links Úteis

- **Play Console**: https://play.google.com/console
- **Documentação TWA**: https://developer.chrome.com/docs/android/trusted-web-activity/
- **PWA Builder**: https://www.pwabuilder.com (ajuda a criar TWA)
- **Teste PWA**: https://www.pwabuilder.com/imagegen (gera ícones)

## 💡 Dica Rápida

A forma mais fácil é:
1. Hospedar no Netlify (gratuito, HTTPS automático)
2. Usar PWA Builder para gerar TWA
3. Publicar na Play Store

Boa sorte com a publicação! 🎉

