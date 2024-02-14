#!/bin/bash

echo "Start repository clones..."

# Configurações AWS CLI
AWS_PROFILE="" # Insira o nome do perfil de usuário do AWS CLI que será usado para acessar o CodeCommit. Ex: "default"
AWS_REGION="us-east-2" # Insira a região da AWS que será usada para acessar o CodeCommit. Ex: "us-east-2"

# Diretórios de repositórios
BACKEND_DIR="backend"
FRONTEND_DIR="frontend"

# Cria diretórios se não existirem
create_directory_if_not_exists() {
  if [ ! -d "$1" ]; then
      mkdir -p "$1"
  fi
}

create_directory_if_not_exists "$BACKEND_DIR"
create_directory_if_not_exists "$FRONTEND_DIR"

# Prefixos dos repositórios a serem clonados
BACKEND_REPOS_START_WITH=() # Coloque os prefixos dos repositórios backend aqui. Ex: BACKEND_REPOS_START_WITH=("backend-" "data-")
FRONTEND_REPOS_START_WITH=() # Coloque os prefixos dos repositórios frontend aqui. Ex: FRONTEND_REPOS_START_WITH=("frontend-" "components-")

# Obtém a lista de repositórios
repositories=$(AWS_PROFILE="$AWS_PROFILE" aws codecommit list-repositories --query 'repositories[].repositoryName' --output text)

clone_repositories() {
  local prefix=$1
  local dir=$2

  for repository in $repositories; do
    # Verifica se o repositório começa com o prefixo especificado e se o diretório não existe, então clona o repositório.
    if [[ $repository == $prefix* && ! -d "$dir/$repository" ]]; then
      git clone "ssh://git-codecommit.$AWS_REGION.amazonaws.com/v1/repos/$repository" "$dir/$repository"
    fi
  done
}

# Clona os repositórios backend que começam com os prefixos especificados
for prefix in "${BACKEND_REPOS_START_WITH[@]}"; do
  clone_repositories "$prefix" "$BACKEND_DIR"
done

# Clona os repositórios frontend que começam com os prefixos especificados
for prefix in "${FRONTEND_REPOS_START_WITH[@]}"; do
  clone_repositories "$prefix" "$FRONTEND_DIR"
done

echo "End repository clones..."
