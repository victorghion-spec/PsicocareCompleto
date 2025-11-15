Este diretório contém informações sobre arquivos que foram removidos ou arquivados
do diretório público do servidor.

Observações:
- Arquivos de pacote grandes (.rar, .zip) podem causar problemas de segurança e de
  distribuição quando servidos diretamente pelo servidor estático. Eles foram bloqueados
  pelo `server.js` para evitar downloads acidentais.
- Se você precisa recuperar um dos arquivos removidos do repositório, restaure a partir
  de um backup externo. Este repositório não contém os binários arquivados por padrão.

Como limpar o servidor remoto (passos sugeridos):
1. Conecte-se ao servidor (SSH / painel de hospedagem).
2. Navegue até a pasta pública do servidor (onde `server.js` serve os arquivos).
3. Verifique e remova o arquivo problemático, por exemplo:

   `Remove-Item -Path "C:\caminho\para\pasta\Creator_hub\Creator_hub.rar"`

4. Reinicie o processo do Node.js (ou o servidor web) para aplicar as mudanças.

Se preferir que eu remova os arquivos do repositório local (commit), diga-me e eu
posso removê-los com segurança e atualizar o histórico conforme necessário.
