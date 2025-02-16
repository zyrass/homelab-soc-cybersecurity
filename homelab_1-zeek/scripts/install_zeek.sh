#!/usr/bin/env bash

# Chemin du marqueur
MARKER_FILE="/etc/homelab_zeek_installed"

# Définir les couleurs pour les messages
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

# Vérifie si le script a déjà été exécuté
if [ -f "$MARKER_FILE" ]; then
  echo -e "\n ${RED}# ====================================================================================== ${NC}"
  echo -e "${RED} #                      RIEN A FAIRE, ZEEK EST DEJA INSTALLE !                            ${NC}"
  echo -e "${RED} # ====================================================================================== ${NC}"
  exit 0
fi

# Logo
echo -e "\n${BLUE}# ====================================================================================== ${NC}"
echo -e "${BLUE} #                            Installation de Zeek                                       ${NC}"
echo -e "${BLUE} # ====================================================================================== ${NC}"

# Vérifier la version du système
OS_VERSION=$(lsb_release -rs)
echo -e "\n\t${GREEN}[1/6] Vérification de la version du système...${NC}"
echo -e "\tVersion du système détectée : ${YELLOW}$OS_VERSION${NC}"

# Mise à jour des paquets
echo -e "\n\t${GREEN}[2/6] Mise à jour des paquets système...${NC}"
sudo apt-get update -y

# Installation des dépendances nécessaires
echo -e "\n\t${GREEN}[3/6] Installation des dépendances nécessaires...${NC}"
sudo apt-get install -y curl cmake make gcc g++ flex bison libpcap-dev libssl-dev python3 python3-pip zlib1g-dev

# Ajout du dépôt Zeek
echo -e "\n\t${GREEN}[4/6] Ajout du dépôt Zeek (Ubuntu 20.04)...${NC}"
echo 'deb http://download.opensuse.org/repositories/security:/zeek/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/security:zeek.list
curl -fsSL https://download.opensuse.org/repositories/security:zeek/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/security_zeek.gpg > /dev/null

# Mise à jour de nouveau la liste des paquets
echo -e "\n\t${GREEN}[5/6] Mise à jour de la liste des paquets après ajout du dépôt...${NC}"
sudo apt-get update -y

# Installation de Zeek
echo -e "\n\t${GREEN}[6/6] Installation de Zeek...${NC}"
if [[ "$OS_VERSION" == "20.04" ]]; then
  sudo apt-get install -y zeek
elif [[ "$OS_VERSION" == "18.04" ]]; then
  sudo apt-get install -y zeek-6.0
else
  echo -e "\n ${RED}# ====================================================================================== ${NC}"
  echo -e "${RED} #               Votre version de système n'est pas supportée par ce script.               ${NC}"
  echo -e "${RED} # ====================================================================================== ${NC}"
  exit 1
fi

# Création du marqueur pour éviter les réinstallations
touch "$MARKER_FILE"

# Message final
echo -e "\n ${YELLOW}# ====================================================================================== ${NC}"
echo -e "${YELLOW} #               L'INSTALLATION DE ZEEK EST TERMINEE AVEC SUCCES !                       ${NC}"
echo -e "${YELLOW} # ====================================================================================== ${NC}\n"