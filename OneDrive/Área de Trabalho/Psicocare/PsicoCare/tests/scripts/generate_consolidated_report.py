#!/usr/bin/env python3
"""
Script para gerar relatório consolidado dos testes
Combina resultados do Robot Framework e Postman/Newman
"""

import json
import xml.etree.ElementTree as ET
import argparse
import os
from datetime import datetime
from pathlib import Path


def parse_robot_results(robot_results_dir):
    """Parse resultados do Robot Framework"""
    output_xml = os.path.join(robot_results_dir, 'output.xml')
    if not os.path.exists(output_xml):
        return {
            'total': 0,
            'passed': 0,
            'failed': 0,
            'skipped': 0,
            'tests': []
        }
    
    try:
        tree = ET.parse(output_xml)
        root = tree.getroot()
        
        stats = root.find('statistics/total/stat')
        total = int(stats.get('pass', 0)) + int(stats.get('fail', 0))
        passed = int(stats.get('pass', 0))
        failed = int(stats.get('fail', 0))
        
        tests = []
        for suite in root.findall('.//test'):
            test_name = suite.get('name', 'Unknown')
            status = 'PASS' if suite.find('status') is not None and suite.find('status').get('status') == 'PASS' else 'FAIL'
            tests.append({
                'name': test_name,
                'status': status,
                'type': 'UI'
            })
        
        return {
            'total': total,
            'passed': passed,
            'failed': failed,
            'skipped': 0,
            'tests': tests
        }
    except Exception as e:
        print(f"Erro ao parsear resultados do Robot Framework: {e}")
        return {
            'total': 0,
            'passed': 0,
            'failed': 0,
            'skipped': 0,
            'tests': []
        }


def parse_postman_results(postman_results_dir):
    """Parse resultados do Postman/Newman"""
    report_json = os.path.join(postman_results_dir, 'postman-report.json')
    if not os.path.exists(report_json):
        return {
            'total': 0,
            'passed': 0,
            'failed': 0,
            'skipped': 0,
            'tests': []
        }
    
    try:
        with open(report_json, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        run = data.get('run', {})
        stats = run.get('stats', {})
        assertions = stats.get('assertions', {})
        
        total = assertions.get('total', 0)
        passed = assertions.get('total', 0) - assertions.get('failed', 0)
        failed = assertions.get('failed', 0)
        
        tests = []
        for execution in run.get('executions', []):
            item = execution.get('item', {})
            test_name = item.get('name', 'Unknown')
            assertions_list = execution.get('assertions', [])
            
            status = 'PASS'
            for assertion in assertions_list:
                if assertion.get('error'):
                    status = 'FAIL'
                    break
            
            tests.append({
                'name': test_name,
                'status': status,
                'type': 'API'
            })
        
        return {
            'total': total,
            'passed': passed,
            'failed': failed,
            'skipped': 0,
            'tests': tests
        }
    except Exception as e:
        print(f"Erro ao parsear resultados do Postman: {e}")
        return {
            'total': 0,
            'passed': 0,
            'failed': 0,
            'skipped': 0,
            'tests': []
        }


def generate_html_report(robot_data, postman_data, output_file):
    """Gera relatório HTML consolidado"""
    
    total_tests = robot_data['total'] + postman_data['total']
    total_passed = robot_data['passed'] + postman_data['passed']
    total_failed = robot_data['failed'] + postman_data['failed']
    total_skipped = robot_data['skipped'] + postman_data['skipped']
    
    pass_rate = (total_passed / total_tests * 100) if total_tests > 0 else 0
    
    html = f"""<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatório Consolidado de Testes - PsicoCare</title>
    <style>
        * {{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }}
        
        body {{
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background: #f5f5f5;
            padding: 20px;
            color: #333;
        }}
        
        .container {{
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 30px;
        }}
        
        h1 {{
            color: #2c3e50;
            margin-bottom: 10px;
            font-size: 28px;
        }}
        
        .timestamp {{
            color: #7f8c8d;
            margin-bottom: 30px;
            font-size: 14px;
        }}
        
        .summary {{
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }}
        
        .summary-card {{
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }}
        
        .summary-card.success {{
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
        }}
        
        .summary-card.failure {{
            background: linear-gradient(135deg, #eb3349 0%, #f45c43 100%);
        }}
        
        .summary-card.warning {{
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }}
        
        .summary-card h3 {{
            font-size: 32px;
            margin-bottom: 5px;
        }}
        
        .summary-card p {{
            font-size: 14px;
            opacity: 0.9;
        }}
        
        .section {{
            margin-bottom: 40px;
        }}
        
        .section h2 {{
            color: #2c3e50;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #ecf0f1;
        }}
        
        .test-grid {{
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 15px;
        }}
        
        .test-card {{
            background: #f8f9fa;
            border-left: 4px solid #95a5a6;
            padding: 15px;
            border-radius: 4px;
        }}
        
        .test-card.pass {{
            border-left-color: #27ae60;
            background: #d5f4e6;
        }}
        
        .test-card.fail {{
            border-left-color: #e74c3c;
            background: #fadbd8;
        }}
        
        .test-card h4 {{
            color: #2c3e50;
            margin-bottom: 5px;
            font-size: 16px;
        }}
        
        .test-card .badge {{
            display: inline-block;
            padding: 3px 8px;
            border-radius: 3px;
            font-size: 12px;
            font-weight: bold;
            margin-top: 5px;
        }}
        
        .badge.ui {{
            background: #3498db;
            color: white;
        }}
        
        .badge.api {{
            background: #9b59b6;
            color: white;
        }}
        
        .badge.pass {{
            background: #27ae60;
            color: white;
        }}
        
        .badge.fail {{
            background: #e74c3c;
            color: white;
        }}
        
        .progress-bar {{
            width: 100%;
            height: 30px;
            background: #ecf0f1;
            border-radius: 15px;
            overflow: hidden;
            margin: 20px 0;
        }}
        
        .progress-fill {{
            height: 100%;
            background: linear-gradient(90deg, #27ae60 0%, #2ecc71 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            transition: width 0.3s ease;
        }}
        
        .progress-fill.low {{
            background: linear-gradient(90deg, #e74c3c 0%, #c0392b 100%);
        }}
        
        .links {{
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px solid #ecf0f1;
        }}
        
        .links a {{
            display: inline-block;
            margin-right: 15px;
            padding: 10px 20px;
            background: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background 0.3s;
        }}
        
        .links a:hover {{
            background: #2980b9;
        }}
    </style>
</head>
<body>
    <div class="container">
        <h1>📊 Relatório Consolidado de Testes - PsicoCare</h1>
        <p class="timestamp">Gerado em: {datetime.now().strftime('%d/%m/%Y %H:%M:%S')}</p>
        
        <div class="summary">
            <div class="summary-card">
                <h3>{total_tests}</h3>
                <p>Total de Testes</p>
            </div>
            <div class="summary-card success">
                <h3>{total_passed}</h3>
                <p>Passou</p>
            </div>
            <div class="summary-card failure">
                <h3>{total_failed}</h3>
                <p>Falhou</p>
            </div>
            <div class="summary-card warning">
                <h3>{total_skipped}</h3>
                <p>Pulou</p>
            </div>
        </div>
        
        <div class="progress-bar">
            <div class="progress-fill {'low' if pass_rate < 80 else ''}" style="width: {pass_rate}%">
                {pass_rate:.1f}% de Sucesso
            </div>
        </div>
        
        <div class="section">
            <h2>🎯 Resumo por Tipo de Teste</h2>
            <div class="test-grid">
                <div class="test-card">
                    <h4>Testes de UI (Robot Framework)</h4>
                    <p><strong>Total:</strong> {robot_data['total']}</p>
                    <p><strong>Passou:</strong> {robot_data['passed']}</p>
                    <p><strong>Falhou:</strong> {robot_data['failed']}</p>
                </div>
                <div class="test-card">
                    <h4>Testes de API (Postman/Newman)</h4>
                    <p><strong>Total:</strong> {postman_data['total']}</p>
                    <p><strong>Passou:</strong> {postman_data['passed']}</p>
                    <p><strong>Falhou:</strong> {postman_data['failed']}</p>
                </div>
            </div>
        </div>
        
        <div class="section">
            <h2>📋 Detalhes dos Testes</h2>
            <div class="test-grid">
"""
    
    # Adicionar testes do Robot Framework
    for test in robot_data['tests']:
        status_class = 'pass' if test['status'] == 'PASS' else 'fail'
        html += f"""
                <div class="test-card {status_class}">
                    <h4>{test['name']}</h4>
                    <span class="badge ui">UI</span>
                    <span class="badge {status_class.lower()}">{test['status']}</span>
                </div>
"""
    
    # Adicionar testes do Postman
    for test in postman_data['tests']:
        status_class = 'pass' if test['status'] == 'PASS' else 'fail'
        html += f"""
                <div class="test-card {status_class}">
                    <h4>{test['name']}</h4>
                    <span class="badge api">API</span>
                    <span class="badge {status_class.lower()}">{test['status']}</span>
                </div>
"""
    
    html += """
            </div>
        </div>
        
        <div class="links">
            <a href="robotframework/report.html">📱 Relatório Robot Framework</a>
            <a href="postman/postman-report.html">🔌 Relatório Postman</a>
        </div>
    </div>
</body>
</html>
"""
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(html)
    
    print(f"Relatório consolidado gerado: {output_file}")


def main():
    parser = argparse.ArgumentParser(description='Gerar relatório consolidado de testes')
    parser.add_argument('--robot-results', required=True, help='Diretório com resultados do Robot Framework')
    parser.add_argument('--postman-results', required=True, help='Diretório com resultados do Postman')
    parser.add_argument('--output', required=True, help='Arquivo de saída HTML')
    
    args = parser.parse_args()
    
    print("Parseando resultados do Robot Framework...")
    robot_data = parse_robot_results(args.robot_results)
    
    print("Parseando resultados do Postman...")
    postman_data = parse_postman_results(args.postman_results)
    
    print("Gerando relatório HTML consolidado...")
    generate_html_report(robot_data, postman_data, args.output)
    
    print("✅ Relatório consolidado gerado com sucesso!")


if __name__ == '__main__':
    main()

