#!/usr/bin/env bash
set -euo pipefail

if [[ -t 1 ]]; then
  clear
fi

cat <<'EOF'

# Fecha y hora : $(date '+%Y-%m-%d %H:%M:%S')
# Zona horaria : $(timedatectl show -p Timezone --value)


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

                   ^.                                                      .^                     
                    !&^                                                      ^&!                    
                  .?PB.                                                      .BP?.                  
                 !J7P!                                                        !57J~                 
               ~J7:??                                                          J?:7J~               
             ~J!::J?                                                            ??::!?!             
           ~J!  ~57                                                              7Y~  !J~           
         .J5~ .?P!                                                                !5?..~YJ.         
        ^PY~~!JG7                                                                  7BJ!~!JP~        
       ~5^^ :~P5                                 ::                                 PG~: :^5~       
      :P~   ^.5J                              .^?JJ?^.                              Y5.:   ~P:      
      YY:.  . !P                          .:^YY5!~~!5YY^:.                          P! .  .:YY      
     .PJ.^     ??                     ^!7JJJ5GY~.!!.~YP5JJJ?!^                     ?J     :.?P.     
     .PJ^^.    :JJ:                ^!55~7^^:Y?7:.^^ :77Y:^~7!YP7^                :JJ:    .^^JP.     
      5?Y^~     :?5J7!:.        .!??!!^.    Y~!.:!!..7~Y    .^!77?!.        .:!7J5?:     ~^Y?5      
      ~5YP~^    .!!?7JYYJ?7J?~~7?~:.        Y:7:.^:.:7:5        .:~?7~~7J7?JYYJ??!!:    ^~5Y5~      
       ?JGB7!:.~~~~~~^!~77~!7G5!^^:.        5.7.:!!:.7:5        .:^~!5G7!!!7!!~~~~~~~.:~7BPJ?       
        ?JP&PJY!~^~^:~!!~: ^Y7!!::          5:7:.^^.:7:5         .:^7!7Y^ :~!!~^~~^~7Y?P&5J?        
         ~JYB&GYJ!7~~!!~. :P!77.^           5^7.:!!..?:5           ^.7?!P: .~!!~~7!?5G&GJJ~         
          .!JP5G#GP5YY?~ .P?JY:~.           5^J^.^^.^J^Y           .~:5Y?G..~?YY5GG#G5P?!.          
             7JYJPGB&GJ^:YG?&~~~.:         .P!57~!!~75!5.         :.~~~&?G5:^?B#GG5JYJ7             
              .:~?JJPYY75@5GB~!~::       ..7BJ77!!~777JB!..       ^:~~~BG5@Y?YYPJJ?~:               
                   .7?P##BB#GY??77~~~~~~~!!YG!Y7~~~~!Y!PY7!~~~~~~!77??JG#BB##P?7.                   
                      .!5YGG5?77!~!~^^::::~JP?7!!^~!!7?5J!^::^^~~~!!7?JYGGY5!.                      
                       :PYPB57??7!..!!. .~~.Y5?!7~7!!75Y:~~: .!!.:!????5#P5P:                       
                       ^P5BGY7?7!~^:!~. .~~:Y5J!!!!!!75Y^~~: .~~:^~777?YGB5P^                       
                       ~P555JJ7J?77!~~~^^^~75!J~!!~!!775?~^^^^^~!!7?J7JY5PYP~                       
                       :PJY5~~^Y@@@@@&&&###B#???!!~~77?#BB##&&&@@@@@Y^!7GYJP:                       
                        PBPP?^^:?&@@@@@@@@@@@&57!7!!75&@@@@@@@@@@@&J:^^?PPGP                        
                       :PJYGP7^~^^?G&@@@@@@@@GJY7!!!JJG@@@@@@@@&GJ^:~^75GJ?G:                       
                       ?J~.?PP?!^.::~7J5G#&&@Y!7:^^.!7J@&&#G5J7~:::^~?5G7:^Y?                       
                      .G^..^5JGGY!^:~~  .^!~5~7~ ~! ^?~5!~:.  ^~:^!JPG?Y::.^G.                      
                      5Y  .^7^P5@@#GY?!~:^!^P:7: ^^ .?:5~~^:^!?YG#@@55^?^.  Y5                      
                     ?G!:  ^~~!G@@@&BG5J777YJ^!  ^~  !~JJ777J5G#&@@@G!~~^  :7G?                     
                    !G!!7!^7:~:#B?~.       ~Y?~. !! .~!Y!       .~JB#:!:!^!77~G!                    
                   :P7!7!~7?^!:P            ^J?^.~~.^?J^            P:!^?!!!7~7G:                   
                   :5~J77?!~!7.P              ^J7^^7J^              P.!!~!J77J!5:                   
                    !Y~!77~~!7.P:               ~JJ~               :P.7!^!!77~Y!                    
                     ~Y~7?~!!7.J!                .                 !J.77!!77~Y~                     
                      :??!77~!~^Y                                  5^~!!!7!??:                      
                        ^?7!!77:5^                                ^5.77!!7?^                        
                          ^7?!!~^5                                5^^!!?7^                          
                            .~77~YJ                              JY~77~.                            
                               .^!Y:                            ^Y!^.      

# Instalación de DOCKER en ORANGE PI 4 LTS con armbian

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

info "Listo. Docker instalado y funcionando."

