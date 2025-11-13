"""
Variáveis de ambiente e configuração para testes do PsicoCare
Este arquivo pode ser usado para definir variáveis dinâmicas baseadas em ambiente
"""

import os

# URLs baseadas em variáveis de ambiente
BASE_URL = os.getenv('PSICOCARE_BASE_URL', 'http://localhost:19006')
API_URL = os.getenv('PSICOCARE_API_URL', 'http://localhost:3000')

# Configurações de navegador
BROWSER = os.getenv('BROWSER', 'chrome')
HEADLESS = os.getenv('HEADLESS', 'False').lower() == 'true'

# Timeouts
TIMEOUT_SHORT = '5s'
TIMEOUT_MEDIUM = '10s'
TIMEOUT_LONG = '30s'
TIMEOUT_PAGE_LOAD = '15s'

# Credenciais de teste (em produção, usar variáveis de ambiente ou secrets)
EMAIL_PACIENTE_TESTE = os.getenv('TEST_EMAIL_PACIENTE', 'paciente@teste.com')
SENHA_PACIENTE_TESTE = os.getenv('TEST_SENHA_PACIENTE', 'senha123')
EMAIL_PSICOLOGO_TESTE = os.getenv('TEST_EMAIL_PSICOLOGO', 'psicologo@teste.com')
SENHA_PSICOLOGO_TESTE = os.getenv('TEST_SENHA_PSICOLOGO', 'senha456')

# Configurações de Sikuli (se necessário)
SIKULI_IMAGES_PATH = os.getenv('SIKULI_IMAGES_PATH', './tests/robotframework/sikuli_images')

