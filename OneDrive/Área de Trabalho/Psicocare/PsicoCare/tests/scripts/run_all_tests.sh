#!/bin/bash
# Script para executar todos os testes (UI + API) e gerar relatório consolidado

set -e

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Executando Todos os Testes do PsicoCare                 ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"

# Configurações
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RESULTS_DIR="${BASE_DIR}/test-results"
ROBOT_RESULTS="${RESULTS_DIR}/robotframework"
POSTMAN_RESULTS="${RESULTS_DIR}/postman"
CONSOLIDATED_REPORT="${RESULTS_DIR}/consolidated-report.html"

# URLs (pode ser sobrescrito por variáveis de ambiente)
PSICOCARE_BASE_URL="${PSICOCARE_BASE_URL:-http://localhost:19006}"
PSICOCARE_API_URL="${PSICOCARE_API_URL:-http://localhost:3000}"

# Criar diretórios
mkdir -p "${RESULTS_DIR}"
mkdir -p "${ROBOT_RESULTS}"
mkdir -p "${POSTMAN_RESULTS}"

echo -e "${YELLOW}Configurações:${NC}"
echo -e "  Frontend URL: ${PSICOCARE_BASE_URL}"
echo -e "  API URL: ${PSICOCARE_API_URL}"
echo -e "  Resultados: ${RESULTS_DIR}"
echo ""

# Função para verificar se um comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Verificar dependências
echo -e "${YELLOW}Verificando dependências...${NC}"

if ! command_exists python3 && ! command_exists python; then
    echo -e "${RED}❌ Python não encontrado!${NC}"
    exit 1
fi

if ! command_exists node; then
    echo -e "${RED}❌ Node.js não encontrado!${NC}"
    exit 1
fi

if ! command_exists newman; then
    echo -e "${YELLOW}⚠️  Newman não encontrado. Instalando...${NC}"
    npm install -g newman newman-reporter-html newman-reporter-htmlextra newman-reporter-junit || true
fi

echo -e "${GREEN}✅ Dependências verificadas${NC}"
echo ""

# Executar testes em paralelo (simulado com background jobs)
echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}Executando Testes de API (Postman/Newman)${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"

cd "${BASE_DIR}/tests/postman"
if [ -f "run_postman_tests.sh" ]; then
    bash run_postman_tests.sh
    POSTMAN_EXIT_CODE=$?
else
    newman run PsicoCare_API.postman_collection.json \
        -e PsicoCare_API.postman_environment.json \
        --env-var "base_url=${PSICOCARE_API_URL}" \
        -r html,json,junit,cli \
        --reporter-html-export "${POSTMAN_RESULTS}/postman-report.html" \
        --reporter-json-export "${POSTMAN_RESULTS}/postman-report.json" \
        --reporter-junit-export "${POSTMAN_RESULTS}/postman-report.xml" \
        --reporter-cli-no-summary || true
    POSTMAN_EXIT_CODE=$?
fi

echo ""
echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}Executando Testes de UI (Robot Framework)${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"

cd "${BASE_DIR}/tests/robotframework"
robot \
    --variable BASE_URL:${PSICOCARE_BASE_URL} \
    --variable API_URL:${PSICOCARE_API_URL} \
    --outputdir "${ROBOT_RESULTS}" \
    --log "${ROBOT_RESULTS}/log.html" \
    --report "${ROBOT_RESULTS}/report.html" \
    --output "${ROBOT_RESULTS}/output.xml" \
    --xunit "${ROBOT_RESULTS}/xunit.xml" \
    . || true
ROBOT_EXIT_CODE=$?

echo ""

# Gerar relatório consolidado
echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}Gerando Relatório Consolidado${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"

cd "${BASE_DIR}"
if [ -f "tests/scripts/generate_consolidated_report.py" ]; then
    python3 tests/scripts/generate_consolidated_report.py \
        --robot-results "${ROBOT_RESULTS}" \
        --postman-results "${POSTMAN_RESULTS}" \
        --output "${CONSOLIDATED_REPORT}" || \
    python tests/scripts/generate_consolidated_report.py \
        --robot-results "${ROBOT_RESULTS}" \
        --postman-results "${POSTMAN_RESULTS}" \
        --output "${CONSOLIDATED_REPORT}" || \
    echo -e "${YELLOW}⚠️  Erro ao gerar relatório consolidado${NC}"
else
    echo -e "${YELLOW}⚠️  Script de relatório consolidado não encontrado${NC}"
fi

echo ""

# Resumo final
echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Resumo da Execução                                       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"

if [ $POSTMAN_EXIT_CODE -eq 0 ] && [ $ROBOT_EXIT_CODE -eq 0 ]; then
    echo -e "${GREEN}✅ Todos os testes passaram!${NC}"
    echo ""
    echo -e "${GREEN}Relatórios gerados:${NC}"
    echo -e "  📱 UI: ${ROBOT_RESULTS}/report.html"
    echo -e "  🔌 API: ${POSTMAN_RESULTS}/postman-report.html"
    echo -e "  📊 Consolidado: ${CONSOLIDATED_REPORT}"
    exit 0
else
    echo -e "${RED}❌ Alguns testes falharam${NC}"
    echo ""
    echo -e "${YELLOW}Relatórios gerados:${NC}"
    echo -e "  📱 UI: ${ROBOT_RESULTS}/report.html"
    echo -e "  🔌 API: ${POSTMAN_RESULTS}/postman-report.html"
    echo -e "  📊 Consolidado: ${CONSOLIDATED_REPORT}"
    exit 1
fi

