set -euo pipefail

KIND_CONFIG="kind.yaml"   # seu arquivo existente
CLUSTERS=(fullcycle)      # adicione mais nomes se precisar: ("fullcycle" "outro")

for NAME in "${CLUSTERS[@]}"; do
  echo "Criando cluster: $NAME"
  kind create cluster --name "$NAME" --config "$KIND_CONFIG"
  echo "Verificando: docker ps e kubectl"
  docker ps --filter "name=${NAME}"
  kubectl --context "kind-${NAME}" cluster-info || true
  kubectl --context "kind-${NAME}" get nodes -o wide || true
  echo "-----"
done