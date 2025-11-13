# Guia: Adicionar testID aos Componentes React Native

Este guia mostra como adicionar a propriedade `testID` aos componentes do PsicoCare para melhorar a identificação de elementos nos testes automatizados.

## 📋 Por que adicionar testID?

- **Identificação Estável**: testID não muda mesmo quando o layout ou texto muda
- **Melhor Performance**: Mais rápido que XPath ou seletores CSS
- **Menos Frágil**: Não quebra com mudanças de estilo ou estrutura
- **Padrão da Indústria**: Prática recomendada para testes de apps React Native

## 🔧 Como Adicionar testID

### 1. Componentes TextInput

**Antes:**
```tsx
<TextInput
  placeholder="Email"
  value={email}
  onChangeText={setEmail}
  style={styles.input}
/>
```

**Depois:**
```tsx
<TextInput
  testID="login-email-input"
  placeholder="Email"
  value={email}
  onChangeText={setEmail}
  style={styles.input}
/>
```

### 2. Componentes TouchableOpacity (Botões)

**Antes:**
```tsx
<TouchableOpacity onPress={handleLogin} style={styles.button}>
  <Text style={styles.buttonText}>Entrar</Text>
</TouchableOpacity>
```

**Depois:**
```tsx
<TouchableOpacity 
  testID="login-btn-entrar"
  onPress={handleLogin} 
  style={styles.button}
>
  <Text style={styles.buttonText}>Entrar</Text>
</TouchableOpacity>
```

### 3. Componentes View

**Antes:**
```tsx
<View style={styles.card}>
  <Text>Conteúdo</Text>
</View>
```

**Depois:**
```tsx
<View testID="home-card-agendamento" style={styles.card}>
  <Text>Conteúdo</Text>
</View>
```

### 4. Componentes Text

**Antes:**
```tsx
<Text style={styles.title}>Login</Text>
```

**Depois:**
```tsx
<Text testID="login-title" style={styles.title}>Login</Text>
```

## 📝 Convenção de Nomenclatura

Use o padrão: `[tela]-[tipo]-[nome]`

- **tela**: Nome da tela (login, register, home, etc.)
- **tipo**: Tipo do elemento (btn, input, card, title, etc.)
- **nome**: Nome descritivo do elemento (entrar, email, agendamento, etc.)

### Exemplos:

```
login-email-input
login-senha-input
login-btn-entrar
register-nome-input
register-btn-cadastrar
home-card-proximo-agendamento
agendamentos-input-data
agendamentos-btn-criar
acompanhamento-sono-1
acompanhamento-humor-estavel
```

## 🎯 Checklist de Arquivos para Atualizar

### Prioridade Alta (Funcionalidades Principais)

- [ ] `app/login.tsx`
  - [ ] `testID="login-title"`
  - [ ] `testID="login-email-input"`
  - [ ] `testID="login-senha-input"`
  - [ ] `testID="login-btn-entrar"`
  - [ ] `testID="login-link-cadastrar"`
  - [ ] `testID="login-link-esqueci-senha"`
  - [ ] `testID="login-msg-erro"`

- [ ] `app/register.tsx`
  - [ ] `testID="register-title"`
  - [ ] `testID="register-btn-paciente"`
  - [ ] `testID="register-btn-psicologo"`
  - [ ] `testID="register-nome-input"`
  - [ ] `testID="register-email-input"`
  - [ ] `testID="register-senha-input"`
  - [ ] `testID="register-telefone-input"`
  - [ ] `testID="register-nascimento-input"`
  - [ ] `testID="register-crp-input"`
  - [ ] `testID="register-especialidade-input"`
  - [ ] `testID="register-btn-cadastrar"`

- [ ] `app/(tabs)/index.tsx` (Dashboard)
  - [ ] `testID="home-header-title"`
  - [ ] `testID="home-card-proximo-agendamento"`
  - [ ] `testID="home-card-ultimo-acompanhamento"`
  - [ ] `testID="home-btn-agendamentos"`
  - [ ] `testID="home-btn-acompanhamento"`
  - [ ] `testID="home-btn-emergencia"`

- [ ] `app/(tabs)/agendamentos.tsx`
  - [ ] `testID="agendamentos-title"`
  - [ ] `testID="agendamentos-header"`
  - [ ] `testID="agendamentos-select-prof"`
  - [ ] `testID="agendamentos-input-data"`
  - [ ] `testID="agendamentos-input-hora"`
  - [ ] `testID="agendamentos-btn-criar"`
  - [ ] `testID="agendamentos-lista"`

- [ ] `app/psicologos.tsx`
  - [ ] `testID="psicologos-title"`
  - [ ] `testID="psicologos-card"`
  - [ ] `testID="psicologos-nome"`
  - [ ] `testID="psicologos-especialidade"`
  - [ ] `testID="psicologos-btn-agendar"`

- [ ] `app/(tabs)/avaliacoes.tsx` (Acompanhamento)
  - [ ] `testID="acompanhamento-title"`
  - [ ] `testID="acompanhamento-textarea"`
  - [ ] `testID="acompanhamento-sono-1"` a `testID="acompanhamento-sono-5"`
  - [ ] `testID="acompanhamento-humor-estavel"`
  - [ ] `testID="acompanhamento-humor-ansioso"`
  - [ ] `testID="acompanhamento-humor-triste"`
  - [ ] `testID="acompanhamento-humor-irritado"`
  - [ ] `testID="acompanhamento-humor-outro"`
  - [ ] `testID="acompanhamento-btn-salvar"`
  - [ ] `testID="acompanhamento-historico"`

### Prioridade Média

- [ ] `app/psicologo/[id].tsx` (Avaliações)
  - [ ] `testID="avaliacao-comentario-input"`
  - [ ] `testID="avaliacao-nota-input"`
  - [ ] `testID="avaliacao-btn-enviar"`
  - [ ] `testID="avaliacao-lista-publica"`

- [ ] `app/home-psicologo.tsx`
  - [ ] `testID="psicologo-home-title"`
  - [ ] `testID="psicologo-proxima-consulta"`
  - [ ] `testID="psicologo-pacientes-aceitos"`

- [ ] `app/solicitacoes-psicologo.tsx`
  - [ ] `testID="solicitacoes-title"`
  - [ ] `testID="solicitacoes-card"`
  - [ ] `testID="solicitacoes-nome-paciente"`
  - [ ] `testID="solicitacoes-email-paciente"`
  - [ ] `testID="solicitacoes-btn-aceitar"`

- [ ] `app/(tabs)/perfil.tsx`
  - [ ] `testID="perfil-title"`
  - [ ] `testID="perfil-btn-disponibilidade"`
  - [ ] `testID="perfil-status-disponivel"`
  - [ ] `testID="perfil-status-indisponivel"`

## 🔄 Atualizar Locators Após Adicionar testID

Depois de adicionar testID, atualize o arquivo `locators.robot`:

**Antes (XPath):**
```robot
${LOGIN_EMAIL_INPUT}    xpath=//input[@placeholder='Email' or @type='email']
```

**Depois (testID):**
```robot
${LOGIN_EMAIL_INPUT}    testid=login-email-input
```

## ✅ Exemplo Completo: login.tsx

```tsx
import AsyncStorage from '@react-native-async-storage/async-storage';
import { Link, useFocusEffect, useRouter } from 'expo-router';
import { useCallback, useState } from 'react';
import { Alert, StyleSheet, Text, TextInput, TouchableOpacity, View } from 'react-native';
import Colors from '../constants/Colors';
import { login } from '../lib/api';
import { useAuth } from './contexts/AuthContext';

export default function Login() {
  const [email, setEmail] = useState('');
  const [senha, setSenha] = useState('');
  const router = useRouter();
  const { signIn } = useAuth();

  // ... código existente ...

  return (
    <View style={styles.container}>
      <Text testID="login-title" style={styles.title}>Login</Text>

      <TextInput
        testID="login-email-input"
        placeholder="Email"
        value={email}
        onChangeText={setEmail}
        style={styles.input}
        keyboardType="email-address"
      />
      <TextInput
        testID="login-senha-input"
        placeholder="Senha"
        value={senha}
        onChangeText={setSenha}
        secureTextEntry
        style={styles.input}
      />

      <TouchableOpacity 
        testID="login-btn-entrar"
        onPress={handleLogin} 
        style={styles.button}
      >
        <Text style={styles.buttonText}>Entrar</Text>
      </TouchableOpacity>

      <Link 
        testID="login-link-cadastrar"
        href="/register" 
        style={styles.link}
      >
        Criar conta
      </Link>
      <Link 
        testID="login-link-esqueci-senha"
        href="/esqueci-senha" 
        style={styles.link}
      >
        Esqueci minha senha
      </Link>
    </View>
  );
}
```

## 🧪 Testar Após Adicionar testID

1. Execute os testes para verificar se os novos testID funcionam:
   ```bash
   robot tests/robotframework/test_autenticacao.robot
   ```

2. Verifique se os elementos são encontrados corretamente

3. Atualize os locators em `locators.robot` se necessário

## 📚 Recursos Adicionais

- [React Native testID Documentation](https://reactnative.dev/docs/view#testid)
- [Appium testID Support](https://appium.io/docs/en/commands/element/find-elements/)
- [Robot Framework SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)

## ⚠️ Notas Importantes

1. **testID não aparece na UI**: É apenas para testes, não afeta a aparência
2. **Mantém acessibilidade**: Não interfere com `accessibilityLabel` ou `accessibilityHint`
3. **Funciona em Web e Mobile**: testID funciona tanto no Expo Web quanto no app nativo
4. **Case Sensitive**: Os testID são case-sensitive, mantenha consistência

