# Homelab - SOC - Cybersecurity

description à éditer

## Introduction générale du projet

Bienvenue dans le projet `Homelab SOC Cybersecurity` (**SOC :** _Security Operations Center_) ! Ce projet vise à créer un environnement de cybersécurité complet et fonctionnel, en utilisant des outils open-source. L'objectif est de fournir une plateforme éducative pour apprendre et pratiquer la mise en place d'un SOC, tout en simulant des scénarios réels de surveillance et de réponse aux incidents.

## Objectifs

L'objectif principal est d'**apprendre à mettre en place un SOC complet** en utilisant des outils `open-source`, le tout par la pratique. Ce projet couvre divers aspects de la cybersécurité, y compris la **surveillance du réseau**, la **détection des menaces**, la **gestion des incidents**, et l'**analyse forensique**.

## Outils utilisés

###Tableau des Outils et Concepts

| **Outil/Concept** | **Catégorie**                                                 | **Description**                                                                                    | **Rôle**                                                                                  |
| ----------------- | ------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| **Zeek**          | Surveillance du réseau                                        | Zeek analyse les paquets réseau pour détecter des comportements suspects.                          | Surveillance en temps réel du trafic réseau pour détecter des anomalies.                  |
| **Suricata**      | Système de Détection d'Intrusion (IDS)                        | Suricata analyse le trafic réseau pour détecter des activités suspectes.                           | Détection des menaces en analysant le trafic réseau.                                      |
| **Snort**         | Système de Prévention d'Intrusion (IPS)                       | Snort surveille le trafic réseau et peut bloquer les activités malveillantes.                      | Prévention des menaces en bloquant les activités malveillantes.                           |
| **Wazuh**         | Surveillance des endpoints                                    | Wazuh collecte et analyse les logs des endpoints pour détecter des menaces.                        | Surveillance des endpoints pour détecter des comportements suspects.                      |
| **ELK Stack**     | Collecte et visualisation des logs                            | ELK Stack (Elasticsearch, Logstash, Kibana) collecte, stocke et visualise les logs.                | Centralisation et analyse des logs pour une meilleure compréhension des incidents.        |
| **TheHive**       | Gestion des incidents                                         | TheHive est une plateforme collaborative pour la gestion des incidents de sécurité.                | Gestion et analyse des incidents de sécurité en collaboration avec d'autres analystes.    |
| **Cortex**        | Automatisation des analyses                                   | Cortex automatise les analyses des incidents en utilisant des scripts et des outils d'analyse.     | Automatisation des analyses pour une réponse plus rapide aux incidents.                   |
| **OpenCTI**       | Gestion des renseignements sur les menaces                    | OpenCTI centralise les renseignements sur les menaces pour une meilleure réponse aux incidents.    | Centralisation et partage des renseignements sur les menaces.                             |
| **MITRE ATT&CK**  | Cadre de référence des tactiques et techniques des attaquants | MITRE ATT&CK fournit une base de données des tactiques et techniques utilisées par les attaquants. | Référence pour comprendre et répondre aux tactiques et techniques des attaquants.         |
| **Velociraptor**  | Investigation forensique                                      | Velociraptor collecte et analyse des données forensiques sur les endpoints.                        | Investigation forensique pour comprendre les incidents de sécurité.                       |
| **SIEM**          | Security Information and Event Management                     | Un SIEM collecte, analyse et corrèle les logs et événements de sécurité pour détecter des menaces. | Centralisation et analyse des logs pour une meilleure détection et réponse aux incidents. |
| **SOC**           | Security Operations Center                                    | Un SOC surveille et répond aux incidents de sécurité en temps réel.                                | Surveillance continue et réponse aux incidents de sécurité.                               |
| **EDR**           | Endpoint Detection and Response                               | L'EDR se concentre sur la détection et la réponse aux menaces sur les endpoints.                   | Surveillance, analyse et réponse automatisée aux menaces sur les endpoints.               |

## Structure du dépôt

Le dépôt est organisé en plusieurs sous-homelabs, représentant une étape évolutive avec l'ajout d'un nouvel outil. Voici la structure du dépôt :

```plaintext
homelab-soc-cybersecurity/
│
├── README.md                   # README général du projet
├── .gitignore                   # Fichier pour ignorer les fichiers et dossiers non nécessaires
├── shared/                      # Dossier partagé pour les données communes entre les VM
│
├── homelab_1-[surveillance-reseau]-zeek/           # Sous-homelab pour Zeek
│   ├── Vagrantfile              # Fichier Vagrant pour Zeek
│   ├── README.md                # README spécifique à Zeek
│   ├── schema.mmd               # Schéma Mermaid pour Zeek
│   ├── scripts/                 # Scripts de configuration et d'installation pour Zeek
│   │   ├── install_zeek.sh     # Script pour installer Zeek
│   │   └── configure_zeek.sh   # Script pour configurer Zeek
│   └── images/                  # Captures d'écran et diagrammes pour Zeek
│
├── homelab_2-[IDS]-suricata/       # Sous-homelab pour Suricata
│   ├── Vagrantfile              # Fichier Vagrant pour Suricata
│   ├── README.md                # README spécifique à Suricata
│   ├── schema.mmd               # Schéma Mermaid pour Suricata
│   ├── scripts/                 # Scripts de configuration et d'installation pour Suricata
│   │   ├── install_suricata.sh # Script pour installer Suricata
│   │   └── configure_suricata.sh # Script pour configurer Suricata
│   └── images/                  # Captures d'écran et diagrammes pour Suricata
│
├── homelab_3-[IPS]-snort/           # Sous-homelab pour Snort
│   ├── Vagrantfile              # Fichier Vagrant pour Snort
│   ├── README.md                # README spécifique à Snort
│   ├── schema.mmd               # Schéma Mermaid pour Snort
│   ├── scripts/                 # Scripts de configuration et d'installation pour Snort
│   │   ├── install_snort.sh    # Script pour installer Snort
│   │   └── configure_snort.sh  # Script pour configurer Snort
│   └── images/                  # Captures d'écran et diagrammes pour Snort
│
├── homelab_4-[SIEM]-wazuh-filebeat/           # Sous-homelab pour Wazuh
│   ├── Vagrantfile              # Fichier Vagrant pour Wazuh
│   ├── README.md                # README spécifique à Wazuh
│   ├── schema.mmd               # Schéma Mermaid pour Wazuh
│   ├── scripts/                 # Scripts de configuration et d'installation pour Wazuh
│   │   ├── install_wazuh.sh     # Script pour installer Wazuh
│   │   └── configure_wazuh.sh   # Script pour configurer Wazuh
│   └── images/                  # Captures d'écran et diagrammes pour Wazuh et filebeat
│
├── homelab_5-[Collecte-visualisation]-elk/             # Sous-homelab pour ELK Stack
│   ├── Vagrantfile              # Fichier Vagrant pour ELK Stack
│   ├── README.md                # README spécifique à ELK Stack
│   ├── schema.mmd               # Schéma Mermaid pour ELK Stack
│   ├── scripts/                 # Scripts de configuration et d'installation pour ELK Stack
│   │   ├── install_elk.sh       # Script pour installer ELK Stack
│   │   └── configure_elk.sh     # Script pour configurer ELK Stack
│   └── images/                  # Captures d'écran et diagrammes pour ELK Stack (sans logstash vue que filebeat est utilisé)
│
├── homelab_6-[Gestion-incidents]-thehive/         # Sous-homelab pour TheHive
│   ├── Vagrantfile              # Fichier Vagrant pour TheHive
│   ├── README.md                # README spécifique à TheHive
│   ├── schema.mmd               # Schéma Mermaid pour TheHive
│   ├── scripts/                 # Scripts de configuration et d'installation pour TheHive
│   │   ├── install_thehive.sh   # Script pour installer TheHive
│   │   └── configure_thehive.sh # Script pour configurer TheHive
│   └── images/                  # Captures d'écran et diagrammes pour TheHive
│
├── homelab_7-[gestion-renseignements-menaces]-opencti/         # Sous-homelab pour OpenCTI
│   ├── Vagrantfile              # Fichier Vagrant pour OpenCTI
│   ├── README.md                # README spécifique à OpenCTI
│   ├── schema.mmd               # Schéma Mermaid pour OpenCTI
│   ├── scripts/                 # Scripts de configuration et d'installation pour OpenCTI
│   │   ├── install_opencti.sh   # Script pour installer OpenCTI
│   │   └── configure_opencti.sh # Script pour configurer OpenCTI
│   └── images/                  # Captures d'écran et diagrammes pour OpenCTI
│
├── homelab_8-[cadre-reference-tactiques-techniques]-mitre/           # Sous-homelab pour MITRE ATT&CK
│   ├── Vagrantfile              # Fichier Vagrant pour MITRE ATT&CK
│   ├── README.md                # README spécifique à MITRE ATT&CK
│   ├── schema.mmd               # Schéma Mermaid pour MITRE ATT&CK
│   ├── scripts/                 # Scripts de configuration et d'installation pour MITRE ATT&CK
│   │   ├── install_mitre.sh     # Script pour installer MITRE ATT&CK
│   │   └── configure_mitre.sh   # Script pour configurer MITRE ATT&CK
│   └── images/                  # Captures d'écran et diagrammes pour MITRE ATT&CK
│
├── homelab_9-[investigation-forensique]-velociraptor/    # Sous-homelab pour Velociraptor
│   ├── Vagrantfile              # Fichier Vagrant pour Velociraptor
│   ├── README.md                # README spécifique à Velociraptor
│   ├── schema.mmd               # Schéma Mermaid pour Velociraptor
│   ├── scripts/                 # Scripts de configuration et d'installation pour Velociraptor
│   │   ├── install_velociraptor.sh # Script pour installer Velociraptor
│   │   └── configure_velociraptor.sh # Script pour configurer Velociraptor
│   └── images/                  # Captures d'écran et diagrammes pour Velociraptor
│
├── homelab_10-user-linux/      # Sous-homelab pour User Linux
│   ├── Vagrantfile              # Fichier Vagrant pour User Linux
│   ├── README.md                # README spécifique à User Linux
│   ├── schema.mmd               # Schéma Mermaid pour User Linux
│   ├── scripts/                 # Scripts de configuration et d'installation pour User Linux
│   │   ├── install_wazuh_agent.sh # Script pour installer l'agent Wazuh sur Linux
│   │   └── configure_wazuh_agent.sh # Script pour configurer l'agent Wazuh sur Linux
│   └── images/                  # Captures d'écran et diagrammes pour User Linux
│
└── homelab_10-user-windows/    # Sous-homelab pour User Windows
    ├── Vagrantfile               # Fichier Vagrant pour User Windows
    ├── README.md                 # README spécifique à User Windows
    ├── schema.mmd                # Schéma Mermaid pour User Windows
    ├── scripts/                  # Scripts de configuration et d'installation pour User Windows
    │   ├── install_wazuh_agent.sh # Script pour installer l'agent Wazuh sur Windows
    │   └── configure_wazuh_agent.sh # Script pour configurer l'agent Wazuh sur Windows
    └── images/                  # Captures d'écran et diagrammes pour User Windows
```

## Ordre d'exécution et pourquoi

Pour assurer une surveillance et une réponse efficaces aux incidents, il est crucial de démarrer les VM dans un ordre spécifique. Voici l'ordre recommandé et les raisons pour chaque étape :

1. `Zeek` : _Démarrer en premier pour commencer à surveiller le trafic réseau dès que possible._
2. `Suricata` : _Démarrer ensuite pour analyser le trafic réseau à la recherche d'activités suspectes._
3. `Snort` : _Démarrer après Suricata pour bloquer les activités malveillantes détectées sur le réseau._
4. `Wazuh` : _Démarrer pour surveiller les endpoints, y compris les VM utilisateur_.
5. `ELK Stack` : _Démarrer pour collecter, stocker, et visualiser les logs. **Filebeat doit être démarré en premier**, **suivi par Elasticsearch**, et **enfin Kibana**_.
6. `TheHive et Cortex` : _Démarrer pour la gestion des incidents et l'automatisation des analyses_.
7. `OpenCTI` : _Démarrer pour centraliser les renseignements sur les menaces_.
8. `MITRE ATT&CK` : _Démarrer pour fournir une référence pour les tactiques et techniques des attaquants_.
9. `Velociraptor` : _Démarrer pour effectuer des investigations forensiques sur les endpoints_.
10. `User Linux` ou `User Windows` : _Démarrer en dernier pour simuler des utilisateurs finaux, une fois que tous les outils de surveillance sont opérationnels_.

**NOTE IMPORTANTE**

> Ici il est question d'avoir deux homelab identique mais avec deux **OS** différents et donc pour éviter de complexifier deux installations et comme la configuration et l'utilisation diffère, il est préférable de séparer les deux sur deux homelab distinct soit : `homelab_10-user-linux` et `homelab_10-user-windows`.

## Instruction pour bien démarrer

1. **Installer Vagrant et VirtualBox** : _Assurez-vous que Vagrant et VirtualBox sont installés sur votre machine hôte_.
2. **Cloner le Dépôt** : _Clonez ce dépôt sur votre machine locale_.
3. **Démarrer les VM** : _Utilisez la commande vagrant up dans chaque dossier de VM, en suivant l'ordre recommandé ci-dessus_.
4. **Vérifier les Services** : _Assurez-vous que tous les services nécessaires sont en cours d'exécution sur chaque VM_.
5. **Accéder aux Interfaces** : _Utilisez les interfaces web (comme Kibana, TheHive, etc.) pour visualiser et analyser les données collectées_.
