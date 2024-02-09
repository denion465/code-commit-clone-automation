# Automação de Clonagem de Repositórios AWS CodeCommit

Este script em bash automatiza a clonagem de repositórios do AWS CodeCommit para um ambiente local. Ele permite clonar repositórios tanto para o backend quanto para o frontend, com base em prefixos especificados.

# Pré-requisitos
AWS CLI instalada e configurada com as credenciais necessárias.
Repositórios existentes no AWS CodeCommit.
Configurações
Antes de executar o script, certifique-se de configurar as seguintes variáveis:

`AWS_PROFILE`: Insira o nome do perfil de usuário do AWS CLI que será usado para acessar o CodeCommit.

`AWS_REGION`: Insira a região da AWS que será usada para acessar o CodeCommit.

`BACKEND_REPO_START_WITH`: Prefixos dos repositórios backend a serem clonados.

`FRONTEND_REPO_START_WITH`: Prefixos dos repositórios frontend a serem clonados.

# Utilização
Configure as variáveis no script conforme as instruções fornecidas.
Execute o script usando bash code-commit-clone-repositories-automation.sh no terminal.

# Comportamento
O script cria diretórios para armazenar os repositórios clonados, se ainda não existirem.
Itera sobre a lista de repositórios no CodeCommit.
Clona os repositórios backend e frontend que começam com os prefixos especificados para os diretórios correspondentes.

# Notas
Certifique-se de ter permissões adequadas para clonar os repositórios do CodeCommit.
Os repositórios são clonados usando o protocolo SSH.
Pode ser necessário dar as permissões para rodar o script, em ambientes UNIX execute `chmod +x code-commit-clone-repositories-automation.sh`.
