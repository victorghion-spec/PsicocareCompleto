#!/bin/bash

echo "========================================"
echo "  Cartas Inspiradoras - Servidor Local"
echo "========================================"
echo ""

# Verificar se Python está instalado
if ! command -v python3 &> /dev/null && ! command -v python &> /dev/null; then
    echo "[ERRO] Python não encontrado!"
    echo ""
    echo "Por favor, instale Python ou use outro método de teste (veja TESTE.md)"
    exit 1
fi

# Usar python3 se disponível, senão python
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
else
    PYTHON_CMD="python"
fi

echo "[OK] Python encontrado!"
echo ""

# Obter IP local
echo "Obtendo seu endereço IP..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | head -n 1)
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    IP=$(hostname -I | awk '{print $1}')
else
    IP=""
fi

echo ""
echo "========================================"
echo "  Servidor iniciado!"
echo "========================================"
echo ""
echo "Acesse no PC: http://localhost:8000"
echo ""

if [ ! -z "$IP" ]; then
    echo "Acesse no Android: http://$IP:8000"
    echo ""
    echo "IMPORTANTE: Certifique-se de que:"
    echo "- PC e Android estão na mesma rede Wi-Fi"
    echo "- Firewall permite conexões na porta 8000"
    echo ""
else
    echo "Não foi possível detectar o IP automaticamente."
    echo "Execute 'ifconfig' (Linux) ou 'ipconfig' (Mac) para ver seu IP manualmente."
    echo ""
fi

echo "Pressione Ctrl+C para parar o servidor"
echo "========================================"
echo ""

$PYTHON_CMD -m http.server 8000

