#!/usr/bin/env bash
set -euo pipefail

if [[ -t 1 ]]; then
  clear
fi

FECHA_HORA="$(date '+%Y-%m-%d %H:%M:%S')"
ZONA="$(timedatectl show -p Timezone --value 2>/dev/null || cat /etc/timezone 2>/dev/null || echo 'Unknown')"

cat <<EOF
#                                                                                              
#                                                                                              
#     ▄ ▄   ▄ ▄   ▄ ▄   ▄ ▄   ▄ ▄   ▄ ▄   ▄ ▄   ▄ ▄   ▄ ▄   ▄ ▄   ▄ ▄   ▄ ▄   ▄ ▄   ▄ ▄   ▄ ▄  
#    ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ 
#    ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ ▀█▀█▀ 
#                                                                                              
#
#                       Fecha y hora : $FECHA_HORA
#                       Zona horaria : $ZONA
#
#
#    ██╗   ██╗██╗██╗  ██╗██╗███╗   ██╗ ██████╗  ██████╗                                    
#    ██║   ██║██║██║ ██╔╝██║████╗  ██║██╔════╝ ██╔═══██╗                                   
#    ██║   ██║██║█████╔╝ ██║██╔██╗ ██║██║  ███╗██║   ██║                                   
#    ╚██╗ ██╔╝██║██╔═██╗ ██║██║╚██╗██║██║   ██║██║   ██║                                   
#     ╚████╔╝ ██║██║  ██╗██║██║ ╚████║╚██████╔╝╚██████╔╝                                   
#      ╚═══╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝                                    
#                                                                                          
#    ██╗███╗   ██╗███████╗ ██████╗ ██████╗ ███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ██████╗ 
#    ██║████╗  ██║██╔════╝██╔═══██╗██╔══██╗████╗ ████║██╔══██╗╚══██╔══╝██║██╔════╝██╔═══██╗
#    ██║██╔██╗ ██║█████╗  ██║   ██║██████╔╝██╔████╔██║███████║   ██║   ██║██║     ██║   ██║
#    ██║██║╚██╗██║██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║██╔══██║   ██║   ██║██║     ██║   ██║
#    ██║██║ ╚████║██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╗╚██████╔╝
#    ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═════╝ 
#                                                                                          
#                            :!                          7:          
#                          .~P7                          ?P~.        
#                        :~!5?                            JP!~:      
#                      ^??~5?                              ?5~??^    
#                     ~P~^G7               ..               7G~~P~   
#                    .P? ^P.           .:~?JJ?~:.           :G^ ?5.  
#                    .B?: !J^       :!JJPBY77YBPYJ7:      .^J! :?B.  
#                     JGJ^^75Y7~~7!?J7~:~57~!75~^~7J?!7~!7J57^^?GJ   
#                     .5#B5JJ7J7JB5?:.  :Y7!!7Y:  .:?5BJ?J7?J5B#5.   
#                       !GBBPGY?B5Y!!: .!5J???P!. :!!YPB?YPPGBP!     
#                         ^7YBP#BBY?Y?!7YBYJJJBY77?Y?YBB#GBY7^       
#                            :!BGGPYJ?!?5PYJ?YP5?!?Y5PGGB!:          
#                             .GBGP5??!75PP??5P5?!??5PGBG.           
#                             :GBG5#&#####PYY5#####&#5G#B:           
#                             ~GBG?JP#&@@@P5Y5&@@&#PJ?GBB^           
#                             J7?BP5??77JG?7!?GY77??55B?7Y           
#                            ~P^!YG@B5?7?Y77775?775B@GJ!^P~          
#                           :5JJJ?J^.    7????7    .^J??JJP^         
#                           .?YJJJJ.      .~!.      .J?J?Y?.         
#                             ~JJJJ!                7JJJJ~           
#                              .^77J:              ^J77^             
#                                 .^!              !^.               
EOF

cat <<'EOF'
#              ███████████████████████████████████████████████████████████████
#              ██  Instalación de DOCKER en ORANGE PI 4 LTS con ARMBIAN     ██
#              ███████████████████████████████████████████████████████████████
EOF

cat <<'EOF'
#                                                               
#                                                               
#    ██ ███  ██ ██ ▄█████ ██ ▄████▄ ███  ██ ████▄  ▄████▄       
#    ██ ██ ▀▄██ ██ ██     ██ ██▄▄██ ██ ▀▄██ ██  ██ ██  ██       
#    ██ ██   ██ ██ ▀█████ ██ ██  ██ ██   ██ ████▀  ▀████▀ ▄ ▄ ▄ 
#                                                               
EOF

cat <<'EOF'
#                                                                                                                                 
#                                                                                                                                 
#    ▄▄ ▄▄  ▄▄▄  ▄▄    ▄▄ ▄▄▄▄   ▄▄▄   ▄▄▄▄ ▄▄  ▄▄▄  ▄▄  ▄▄   ▄▄▄▄  ▄▄▄▄▄ ▄▄       ▄▄▄▄ ▄▄  ▄▄▄▄ ▄▄▄▄▄▄ ▄▄▄▄▄ ▄▄   ▄▄  ▄▄▄        
#    ██▄██ ██▀██ ██    ██ ██▀██ ██▀██ ██▀▀▀ ██ ██▀██ ███▄██   ██▀██ ██▄▄  ██      ███▄▄ ██ ███▄▄   ██   ██▄▄  ██▀▄▀██ ██▀██       
#     ▀█▀  ██▀██ ██▄▄▄ ██ ████▀ ██▀██ ▀████ ██ ▀███▀ ██ ▀██   ████▀ ██▄▄▄ ██▄▄▄   ▄▄██▀ ██ ▄▄██▀   ██   ██▄▄▄ ██   ██ ██▀██ ▄ ▄ ▄ 
#                                                                                                                                 
EOF

SCRIPT_NAME="docker_armbian_orange4lts"
LOG_PREFIX="[$SCRIPT_NAME]"

info()  { echo -e "${LOG_PREFIX} OK $*"; }
warn()  { echo -e "${LOG_PREFIX} !¡ $*"; }
error() { echo -e "${LOG_PREFIX} ERROR $*" >&2; }

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

cat <<'EOF'
#                                                                                                                                                         
#                                                                                                                                                         
#    ▄█████ ▄████▄ █████▄   ▄████  ▄████▄ ███  ██ ████▄  ▄████▄   ████▄  ██████ █████▄ ██████ ███  ██ ████▄  ██████ ███  ██ ▄█████ ██ ▄████▄ ▄█████       
#    ██     ██▄▄██ ██▄▄██▄ ██  ▄▄▄ ██▄▄██ ██ ▀▄██ ██  ██ ██  ██   ██  ██ ██▄▄   ██▄▄█▀ ██▄▄   ██ ▀▄██ ██  ██ ██▄▄   ██ ▀▄██ ██     ██ ██▄▄██ ▀▀▀▄▄▄       
#    ▀█████ ██  ██ ██   ██  ▀███▀  ██  ██ ██   ██ ████▀  ▀████▀   ████▀  ██▄▄▄▄ ██     ██▄▄▄▄ ██   ██ ████▀  ██▄▄▄▄ ██   ██ ▀█████ ██ ██  ██ █████▀ ▄ ▄ ▄ 
#                                                                                                                                                         
EOF

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

cat <<'EOF'
#                                                                                                                           
#                                                                                                                           
#    ██ ███  ██ ▄█████ ██████ ▄████▄ ██     ▄████▄ ███  ██ ████▄  ▄████▄   ████▄  ▄████▄ ▄█████ ██ ▄█▀ ██████ █████▄        
#    ██ ██ ▀▄██ ▀▀▀▄▄▄   ██   ██▄▄██ ██     ██▄▄██ ██ ▀▄██ ██  ██ ██  ██   ██  ██ ██  ██ ██     ████   ██▄▄   ██▄▄██▄       
#    ██ ██   ██ █████▀   ██   ██  ██ ██████ ██  ██ ██   ██ ████▀  ▀████▀   ████▀  ▀████▀ ▀█████ ██ ▀█▄ ██▄▄▄▄ ██   ██ ▄ ▄ ▄ 
#                                                                                                                           
EOF

# --- Instalación Docker ---
info "Instalando Docker (docker-ce, cli, containerd, buildx, compose plugin)..."
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

cat <<'EOF'
#                                                                                                                                              
#                                                                                                                                              
#    ▄█████ ▄████▄ ██▄  ▄██ █████▄ █████▄  ▄████▄ █████▄ ▄████▄ ███  ██ ████▄  ▄████▄   ▄█████ ██████ █████▄  ██  ██ ██ ▄█████ ██ ▄████▄       
#    ██     ██  ██ ██ ▀▀ ██ ██▄▄█▀ ██▄▄██▄ ██  ██ ██▄▄██ ██▄▄██ ██ ▀▄██ ██  ██ ██  ██   ▀▀▀▄▄▄ ██▄▄   ██▄▄██▄ ██▄▄██ ██ ██     ██ ██  ██       
#    ▀█████ ▀████▀ ██    ██ ██     ██   ██ ▀████▀ ██▄▄█▀ ██  ██ ██   ██ ████▀  ▀████▀   █████▀ ██▄▄▄▄ ██   ██  ▀██▀  ██ ▀█████ ██ ▀████▀ ▄ ▄ ▄ 
#                                                                                                                                              
EOF

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

cat <<'EOF'
#                                                                                                                                               
#                                                                                                                                               
#    ██  ██ ▄████▄ ██     ██ ████▄  ▄████▄ ███  ██ ████▄  ▄████▄   ██ ███  ██ ▄█████ ██████ ▄████▄ ██     ▄████▄ ▄█████ ██ ▄████▄ ███  ██       
#    ██▄▄██ ██▄▄██ ██     ██ ██  ██ ██▄▄██ ██ ▀▄██ ██  ██ ██  ██   ██ ██ ▀▄██ ▀▀▀▄▄▄   ██   ██▄▄██ ██     ██▄▄██ ██     ██ ██  ██ ██ ▀▄██       
#     ▀██▀  ██  ██ ██████ ██ ████▀  ██  ██ ██   ██ ████▀  ▀████▀   ██ ██   ██ █████▀   ██   ██  ██ ██████ ██  ██ ▀█████ ██ ▀████▀ ██   ██ ▄ ▄ ▄ 
#                                                                                                                                               
EOF

# --- Test ---
info "Probando 'docker run hello-world'..."
docker run --rm hello-world

info "Listo. Docker instalado y funcionando."

#Versión final 1.0.1
