#!/usr/bin/env bash
set -euo pipefail

SCRIPT_NAME="docker_armbian_orange4lts"
LOG_PREFIX="[$SCRIPT_NAME]"

info()  { echo -e "${LOG_PREFIX} ✅ $*"; }
warn()  { echo -e "${LOG_PREFIX} ⚠️  $*"; }
error() { echo -e "${LOG_PREFIX} ❌ $*" >&2; }

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    error "Falta el comando: $1"
    exit 1
  }
}

# --- Validaciones básicas ---
if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
  error "Ejecuta este script como root (sudo). Ej: sudo ./${SCRIPT_NAME}.sh"
  exit 1
fi

if [[ ! -f /etc/os-release ]]; then
  error "No se encontró /etc/os-release. No puedo detectar el sistema."
  exit 1
fi

. /etc/os-release

need_cmd apt
need_cmd curl
need_cmd tee
need_cmd chmod
need_cmd install

# Detectar codename (Ubuntu/Armbian suelen traer UBUNTU_CODENAME o VERSION_CODENAME)
CODENAME="${UBUNTU_CODENAME:-${VERSION_CODENAME:-}}"
if [[ -z "${CODENAME}" ]]; then
  error "No pude detectar el codename (UBUNTU_CODENAME/VERSION_CODENAME)."
  error "Revisa /etc/os-release."
  exit 1
fi

info "Sistema detectado: ${PRETTY_NAME:-$NAME} | codename: ${CODENAME}"

# --- Instalación prerequisitos ---
info "Actualizando índices APT..."
apt update -y

info "Instalando prerequisitos (ca-certificates, curl)..."
apt install -y ca-certificates curl

# --- Keyring Docker ---
info "Creando /etc/apt/keyrings..."
install -m 0755 -d /etc/apt/keyrings

info "Descargando GPG key de Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

info "Ajustando permisos del keyring..."
chmod a+r /etc/apt/keyrings/docker.asc

# --- Repo Docker ---
DOCKER_SOURCES="/etc/apt/sources.list.d/docker.sources"
info "Creando repo en ${DOCKER_SOURCES}..."

cat > "${DOCKER_SOURCES}" <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: ${CODENAME}
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

info "Actualizando índices APT con repo Docker..."
apt update -y

# --- Instalación Docker ---
info "Instalando Docker (docker-ce, cli, containerd, buildx, compose plugin)..."
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# --- Servicio ---
info "Habilitando servicio docker..."
systemctl enable docker >/dev/null 2>&1 || true

info "Iniciando servicio docker..."
systemctl start docker

info "Verificando servicio docker..."
systemctl --no-pager --full status docker || {
  error "Docker no arrancó correctamente. Revisa: journalctl -u docker --no-pager -n 200"
  exit 1
}

# --- Test ---
info "Probando 'docker run hello-world'..."
docker run --rm hello-world

# --- Opcional: permitir docker sin sudo para el usuario que invocó sudo ---
if [[ -n "${SUDO_USER:-}" && "${SUDO_USER}" != "root" ]]; then
  if getent group docker >/dev/null; then
    true
  else
    info "Creando grupo docker..."
    groupadd docker || true
  fi

  info "Agregando usuario '${SUDO_USER}' al grupo docker (para usar docker sin sudo)..."
  usermod -aG docker "${SUDO_USER}" || true
  warn "Cierra sesión y vuelve a entrar (o reinicia) para que aplique el grupo docker."
fi

info "Listo. Docker instalado y funcionando."

