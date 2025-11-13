#!/bin/bash
# Script para executar testes do PsicoCare

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Executando Testes do PsicoCare ===${NC}"

# Verificar se Python está instalado
if ! command -v python &> /dev/null; then
    echo -e "${RED}Python não encontrado. Por favor, instale Python 3.8 ou superior.${NC}"
    exit 1
fi

# Verificar se pip está instalado
if ! command -v pip &> /dev/null; then
    echo -e "${RED}pip não encontrado. Por favor, instale pip.${NC}"
    exit 1
fi

# Instalar dependências se necessário
echo -e "${YELLOW}Verificando dependências...${NC}"
pip install -r requirements.txt --quiet

# Criar diretório de resultados
mkdir -p results

# Executar testes
echo -e "${GREEN}Iniciando execução dos testes...${NC}"

# Verificar argumentos
if [ "$1" == "smoke" ]; then
    echo -e "${YELLOW}Executando apenas testes smoke...${NC}"
    robot --include smoke --outputdir results --log log.html --report report.html .
elif [ "$1" == "auth" ]; then
    echo -e "${YELLOW}Executando apenas testes de autenticação...${NC}"
    robot --outputdir results --log log.html --report report.html test_autenticacao.robot
elif [ "$1" == "all" ] || [ -z "$1" ]; then
    echo -e "${YELLOW}Executando todos os testes...${NC}"
    robot --outputdir results --log log.html --report report.html .
else
    echo -e "${YELLOW}Executando testes: $1${NC}"
    robot --outputdir results --log log.html --report report.html "$1"
fi

# Verificar resultado
if [ $? -eq 0 ]; then
    echo -e "${GREEN}=== Testes concluídos com sucesso! ===${NC}"
    echo -e "${GREEN}Relatório disponível em: results/report.html${NC}"
else
    echo -e "${RED}=== Alguns testes falharam ===${NC}"
    echo -e "${YELLOW}Verifique o log em: results/log.html${NC}"
    exit 1
fi

