# Script para gerar AAB (Android App Bundle) de release
# Execute este script no PowerShell para criar o build de teste

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Creator Hub - Build de Teste Interno" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar se o Gradle está disponível
Write-Host "Verificando Gradle..." -ForegroundColor Yellow
if (Get-Command gradle -ErrorAction SilentlyContinue) {
    Write-Host "✓ Gradle encontrado" -ForegroundColor Green
} else {
    Write-Host "✗ Gradle não encontrado. Usando gradlew..." -ForegroundColor Yellow
}

# Verificar Java
Write-Host "Verificando Java (JDK)..." -ForegroundColor Yellow
try {
    $java = & java -version 2>&1 | Out-String
    Write-Host "✓ Java encontrado" -ForegroundColor Green
} catch {
    Write-Host "✗ Java não encontrado. Instale o JDK e garanta que 'java' esteja no PATH." -ForegroundColor Red
}

# Verificar Android SDK
if ($env:ANDROID_SDK_ROOT -or $env:ANDROID_HOME) {
    Write-Host "✓ Android SDK detectado" -ForegroundColor Green
} else {
    Write-Host "⚠ Android SDK não detectado (variáveis ANDROID_SDK_ROOT/ANDROID_HOME não configuradas)." -ForegroundColor Yellow
    Write-Host "Certifique-se de que o Android SDK esteja instalado e as variáveis de ambiente configuradas." -ForegroundColor Yellow
}

# Limpar builds anteriores
Write-Host ""
Write-Host "Limpando builds anteriores..." -ForegroundColor Yellow
if (Test-Path "gradlew.bat") {
    .\gradlew.bat clean
} else {
    gradle clean
}

# Gerar AAB (Android App Bundle)
Write-Host ""
Write-Host "Gerando Android App Bundle (AAB)..." -ForegroundColor Yellow
Write-Host "Isso pode levar alguns minutos..." -ForegroundColor Gray

if (Test-Path "gradlew.bat") {
    .\gradlew.bat bundleRelease
} else {
    gradle bundleRelease
}

# Verificar se o AAB foi gerado
$AABPath = "app\build\outputs\bundle\release\app-release.aab"
if (Test-Path $AABPath) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  ✓ Build gerado com sucesso!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Arquivo AAB gerado em:" -ForegroundColor Cyan
    Write-Host (Resolve-Path $AABPath).Path -ForegroundColor White
    Write-Host ""
    
    # Obter informações do arquivo
    $fileInfo = Get-Item $AABPath
    $fileSizeMB = [math]::Round($fileInfo.Length / 1MB, 2)
    Write-Host "Tamanho: $fileSizeMB MB" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Próximos passos:" -ForegroundColor Yellow
    Write-Host "1. Acesse o Google Play Console" -ForegroundColor White
    Write-Host "2. Vá em 'Teste interno' > 'Criar versão'" -ForegroundColor White
    Write-Host "3. Faça upload do arquivo AAB acima" -ForegroundColor White
    Write-Host "4. Preencha as informações da versão" -ForegroundColor White
    Write-Host "5. Revise e publique para teste interno" -ForegroundColor White
    Write-Host ""
    
    # Abrir a pasta do arquivo
    $openFolder = Read-Host "Deseja abrir a pasta do arquivo? (S/N)"
    if ($openFolder -eq "S" -or $openFolder -eq "s") {
        explorer.exe (Split-Path (Resolve-Path $AABPath).Path)
    }
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "  ✗ Erro ao gerar o build" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Verifique os erros acima e tente novamente." -ForegroundColor Yellow
    exit 1
}


