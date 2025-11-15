// Servidor HTTP simples para servir arquivos estáticos
// Porta: 3000 (pode ser alterada se necessário)

const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = 3000;
const HOST = 'localhost';

// Mapeamento de tipos MIME
const mimeTypes = {
    '.html': 'text/html',
    '.js': 'text/javascript',
    '.css': 'text/css',
    '.json': 'application/json',
    '.png': 'image/png',
    '.jpg': 'image/jpg',
    '.jpeg': 'image/jpeg',
    '.gif': 'image/gif',
    '.svg': 'image/svg+xml',
    '.mp4': 'video/mp4',
    '.webm': 'video/webm',
    '.mp3': 'audio/mpeg',
    '.wav': 'audio/wav',
    '.pdf': 'application/pdf',
    '.txt': 'text/plain'
};

const server = http.createServer((req, res) => {
    console.log(`${new Date().toLocaleString()} - ${req.method} ${req.url}`);

    // Remover query string e normalizar URL
    let filePath = '.' + req.url.split('?')[0];
    
    // Se for a raiz, servir index.html se existir
    if (filePath === './') {
        filePath = './index.html';
    }

    // Prevenir acesso a arquivos fora do diretório
    const safePath = path.normalize(filePath).replace(/^(\.\.[\/\\])+/, '');

    // Obter extensão do arquivo
    const extname = String(path.extname(safePath)).toLowerCase();
    const contentType = mimeTypes[extname] || 'application/octet-stream';

    // Bloquear acesso a extensões perigosas ou de backup (não servir arquivos de pacote)
    const blockedExtensions = ['.rar', '.zip', '.exe', '.msi', '.bat', '.ps1'];
    if (blockedExtensions.includes(extname)) {
        res.writeHead(403, { 'Content-Type': 'text/html; charset=utf-8' });
        res.end(`
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <title>403 - Acesso proibido</title>
                <style>body{font-family:Arial, sans-serif; background:#111;color:#fff;text-align:center;padding:40px}</style>
            </head>
            <body>
                <h1>403 - Acesso proibido</h1>
                <p>O acesso a arquivos do tipo <code>${extname}</code> foi bloqueado por segurança.</p>
                <p>Se você precisa baixar esse arquivo, entre em contato com o administrador.</p>
            </body>
            </html>
        `, 'utf-8');
        return;
    }

    // Ler arquivo
    fs.readFile(safePath, (error, content) => {
        if (error) {
            if (error.code === 'ENOENT') {
                // Arquivo não encontrado
                res.writeHead(404, { 'Content-Type': 'text/html; charset=utf-8' });
                res.end(`
                    <!DOCTYPE html>
                    <html>
                    <head>
                        <meta charset="UTF-8">
                        <title>404 - Arquivo não encontrado</title>
                        <style>
                            body { 
                                font-family: Arial, sans-serif; 
                                text-align: center; 
                                padding: 50px;
                                background: #1a1a1a;
                                color: #fff;
                            }
                            h1 { color: #ff4444; }
                            code { background: #333; padding: 2px 6px; border-radius: 3px; }
                        </style>
                    </head>
                    <body>
                        <h1>404 - Arquivo não encontrado</h1>
                        <p>O arquivo <code>${req.url}</code> não foi encontrado.</p>
                        <p>Servidor rodando em: <code>http://${HOST}:${PORT}</code></p>
                    </body>
                    </html>
                `, 'utf-8');
            } else {
                // Erro do servidor
                res.writeHead(500);
                res.end(`Erro do servidor: ${error.code}`, 'utf-8');
            }
        } else {
            // Sucesso
            res.writeHead(200, { 
                'Content-Type': contentType,
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
                'Access-Control-Allow-Headers': 'Content-Type'
            });
            res.end(content, 'utf-8');
        }
    });
});

server.listen(PORT, HOST, () => {
    console.log('========================================');
    console.log('  🚀 Servidor Creator Hub');
    console.log('========================================');
    console.log('');
    console.log(`✓ Servidor rodando em:`);
    console.log(`  http://${HOST}:${PORT}`);
    console.log(`  http://127.0.0.1:${PORT}`);
    console.log('');
    console.log('Para acessar em dispositivos na mesma rede:');
    console.log(`  http://[SEU_IP_LOCAL]:${PORT}`);
    console.log('');
    console.log('Pressione Ctrl+C para parar o servidor');
    console.log('========================================');
    console.log('');
});

// Tratamento de erros
server.on('error', (error) => {
    if (error.code === 'EADDRINUSE') {
        console.error(`\n❌ Erro: A porta ${PORT} já está em uso!`);
        console.error('Tente fechar outros programas ou altere a porta no arquivo server.js\n');
    } else {
        console.error('Erro do servidor:', error);
    }
    process.exit(1);
});

