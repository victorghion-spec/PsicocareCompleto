#!/bin/bash
# Script para executar testes Postman/Newman

set -e

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== Executando Testes de API com Postman/Newman ===${NC}"

# Verificar se Newman está instalado
if ! command -v newman &> /dev/null; then
    echo -e "${YELLOW}Newman não encontrado. Instalando...${NC}"
    npm install -g newman newman-reporter-html newman-reporter-htmlextra
fi

# Criar diretório de resultados
mkdir -p results

# Variáveis
COLLECTION="PsicoCare_API.postman_collection.json"
ENVIRONMENT="PsicoCare_API.postman_environment.json"
BASE_URL="${PSICOCARE_API_URL:-http://localhost:3000}"

echo -e "${YELLOW}URL da API: ${BASE_URL}${NC}"

# Executar testes
echo -e "${GREEN}Executando coleção Postman...${NC}"

newman run "${COLLECTION}" \
    -e "${ENVIRONMENT}" \
    --env-var "base_url=${BASE_URL}" \
    -r html,cli,json,junit \
    --reporter-html-export results/postman-report.html \
    --reporter-json-export results/postman-report.json \
    --reporter-junit-export results/postman-report.xml \
    --reporter-cli-no-summary \
    --reporter-cli-no-banner

# Verificar resultado
if [ $? -eq 0 ]; then
    echo -e "${GREEN}=== Testes de API concluídos com sucesso! ===${NC}"
    echo -e "${GREEN}Relatório HTML: results/postman-report.html${NC}"
    echo -e "${GREEN}Relatório JSON: results/postman-report.json${NC}"
    echo -e "${GREEN}Relatório JUnit: results/postman-report.xml${NC}"
    exit 0
else
    echo -e "${RED}=== Alguns testes de API falharam ===${NC}"
    echo -e "${YELLOW}Verifique o relatório em: results/postman-report.html${NC}"
    exit 1
fi

