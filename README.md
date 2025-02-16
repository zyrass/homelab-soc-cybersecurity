# Homelab - SOC - Cybersecurity

Ce projet propose la mise en place d’un **Security Operations Center (SOC)** complet dans un environnement virtualisé, **exclusivement à partir d’outils open-source**. Chaque étape (ou homelab) s’appuie sur la précédente, afin d’offrir un apprentissage **progressif** et **opérationnel**. L’accent est mis sur la **pratique**, la **cohérence** et la **structuration** du SOC, du premier outil de surveillance réseau jusqu’à l’intégration des utilisateurs finaux sous Linux ou Windows.

## Sommaire

- [Homelab - SOC - Cybersecurity](#homelab---soc---cybersecurity)
  - [Sommaire](#sommaire)
  - [Introduction générale du projet](#introduction-générale-du-projet)
  - [Problématique et objectifs](#problématique-et-objectifs)
    - [Problématique](#problématique)
    - [Objectifs](#objectifs)
  - [Prérequis techniques](#prérequis-techniques)
  - [Tableau des Outils et Concepts](#tableau-des-outils-et-concepts)
  - [Structure du dépôt](#structure-du-dépôt)
  - [Ordre d'exécution et pourquoi](#ordre-dexécution-et-pourquoi)
  - [Instructions de mise en route](#instructions-de-mise-en-route)
  - [Perspectives et évolutions possibles](#perspectives-et-évolutions-possibles)
  - [Conclusion](#conclusion)

## Introduction générale du projet

Bienvenue dans le projet **Homelab SOC Cybersecurity**&nbsp;! L’objectif est de construire un **environnement de cybersécurité** fonctionnel utilisant uniquement des **outils open-source**. Au fil des **dix homelabs**, vous apprendrez à :

-   **Déployer** pas à pas les différents composants d’un SOC.
-   **Simuler** des scénarios réels de surveillance et de réponse aux incidents.
-   **Comprendre** le rôle précis de chaque brique (IDS, IPS, SIEM, forensique, etc.) et la manière dont elles interagissent.

Dans le climat actuel où les **menaces informatiques** évoluent en continu, la création d’un **SOC** (Security Operations Center) permet de couvrir la **détection**, la **surveillance** et la **réponse** aux incidents de sécurité. Ce projet s’appuie sur une méthode structurée&nbsp;: chaque homelab approfondit des concepts nouveaux et **réutilise** les acquis des précédents pour **familiariser** l’apprenant avec l’ensemble de l’écosystème SOC.

## Problématique et objectifs

### Problématique

Comment construire un **SOC complet** à l’aide de **logiciels open-source**, couvrant la détection réseau, la corrélation d’événements, l’analyse forensique et la gestion d’incidents&nbsp;?  
Et cela, en **optimisant la courbe d’apprentissage**, avec comme seules ressources&nbsp;: une bonne connexion internet, une **recherche personnelle** approfondie et une machine hôte sous Windows 11&nbsp;?

### Objectifs

-   **Objectif principal**  
    Concevoir et déployer **pas à pas** une infrastructure SOC, en utilisant uniquement des solutions/outils **open-source** reconnus et libres d’utilisation.

-   **Objectifs secondaires**
    1. **Maîtriser** les bases des différents outils (`Zeek`, `Suricata`, `Snort`, `Wazuh`, **etc.**).
    2. **Comprendre** l’importance de chaque brique dans le processus de **détection** et de **réponse**.
    3. **Établir** une **feuille de route** permettant de relier logiquement tous les composants (`collecte`, `analyse`, `corrélation`, `réaction`).
    4. **Former** les futurs analystes à la **réponse à incident** et à la **forensique** via des outils tels que `Velociraptor`.

Ce projet me permet d'acquérir **une expertise concrète** dans le déploiement et la gestion d'un SOC moderne, **en utilisant exclusivement des outils open-source**. Chaque composant est soigneusement sélectionné et documenté pour offrir une expérience d'apprentissage optimale, tout en respectant les standards de l'industrie ( _selon mes recherches_ ).

## Prérequis techniques

1. **Connaissances préalables**
    - Administration système ( `Linux` / `Windows` ).
    - Notions de réseaux ( `TCP/IP`, `routage`, `modèle OSI`, etc. ).
2. **Environnement matériel et logiciel**
    - **Vagrant** et **VirtualBox** installés et fonctionnels.
    - **Git** ( _fortement recommandé_ ) pour cloner et gérer l’évolution du projet.
    - Je dispose personnellement de **32 Go de RAM**, sous **Windows 11** (Intel(R) Core(TM) i5-10600KF CPU @ 4.10GHz), ce qui me permet de faire tourner plusieurs VMs simultanément.
        > **Note** : Les images officielles Bento utilisées (Ubuntu 14.04/16.04/18.04) restent relativement légères en mémoire. Malgré leurs versions “dépassées”, elles conservent **systemd**, permettant d’exécuter des commandes telles que `sudo systemctl status <nom_du_service>` qui est utilisé sur les versions récentes.
3. **Connectivité**
    - Un accès à internet est indispensable pour télécharger les dépendances et maintenir l’environnement à jour.

## Tableau des Outils et Concepts

| **Outil/Concept**  | **Catégorie**                                                 | **Description**                                                                                                                                                                                  | **Rôle**                                                                                                                                                                          |
| ------------------ | ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`Zeek`**         | Surveillance du réseau                                        | Zeek analyse les paquets réseau ( trafic ) pour détecter des comportements suspects.<br>( anomalies ou des activités malveillantes ).                                                            | Surveille en temps réel le réseau, génère des logs détaillés.                                                                                                                     |
| **`Suricata`**     | Système de Détection d'Intrusion _(IDS)_                      | Suricata analyse le trafic réseau pour détecter des activités suspectes.<br>Inspecte les paquets réseau et détecte les menaces via des règles et signatures.                                     | Détection des menaces en analysant le trafic réseau.                                                                                                                              |
| **`Snort`**        | Système de Prévention d'Intrusion _(IPS)_                     | Snort surveille le trafic réseau et peut bloquer les activités malveillantes.<br>Similaire à Suricata, mais focalisé sur la prévention et le blocage automatique.                                | Prévention des menaces en bloquant les activités malveillantes en temps réel.                                                                                                     |
| **`Wazuh`**        | Surveillance des endpoints                                    | Wazuh collecte et corrèle les logs des hôtes, assure la détection d’intrusion et le monitoring système.                                                                                          | Surveillance des endpoints pour protèger l’intégrité des systèmes et identifier/détecter des comportements suspects.                                                              |
| **`EFK Stack`**    | Collecte et visualisation des logs                            | Stack EFK (Elasticsearch, Filebeat **`*`**, Kibana) pour collecter, stocker et visualiser les logs.                                                                                              | Simplifie l’analyse globale de l’information collectée en centralisent les logs pour une meilleure compréhension des incidents.                                                   |
| **`TheHive`**      | Gestion des incidents                                         | TheHive est une plateforme collaborative pour la gestion des incidents de sécurité. (suivi des alertes et la coordination des équipes.)                                                          | Gestion et analyse des incidents de sécurité en collaboration avec d'autres analystes. Permet la création de cas, la communication et la traçabilité d’incidents.                 |
| **`Cortex`**       | Automatisation des analyses                                   | Cortex automatise les analyses des incidents en utilisant des scripts et des outils d'analyse. S’interface avec TheHive pour automatiser des tâches d’enquête (scans, vérifications de hash).    | Automatisation des analyses pour une prise de décision et une réponse plus rapide aux incidents.                                                                                  |
| **`OpenCTI`**      | Gestion des renseignements sur les menaces                    | OpenCTI centralise les renseignements sur les menaces pour une meilleure réponse aux incidents. (feeds externes, IoC).                                                                           | Centralisation et partage des renseignements sur les menaces. Ce qui améliore la connaissance des tactiques et techniques adverses pour adapter la défense.                       |
| **`MITRE ATT&CK`** | Cadre de référence des tactiques et techniques des attaquants | MITRE ATT&CK fournit une base de données recensant les techniques utilisées par les attaquants dans diverses phases.                                                                             | Référence pour comprendre et répondre aux tactiques et techniques des attaquants. Sert d’aide à la classification et à la compréhension des menaces rencontrées.                  |
| **`Velociraptor`** | Investigation forensique                                      | Velociraptor collecte et analyse des données forensiques sur les endpoints. Permet l’examen rapide d’artefacts système (fichiers, mémoire, événements).                                          | Investigation forensique pour comprendre les incidents de sécurité. Approfondit l’analyse post-incident et recueille des preuves tangibles.                                       |
| **`SIEM`**         | _Security Information and Event Management_                   | Un SIEM collecte, analyse et corrèle les logs et événements de sécurité pour détecter des menaces. Centralise et corrèle les logs, offre un moteur de détection. (Wazuh en est une déclinaison.) | Centralisation et analyse des logs pour une meilleure détection et réponse aux incidents. Composant central pour identifier des menaces et enrichir la connaissance des attaques. |
| **`SOC`**          | _Security Operations Center_                                  | Un SOC surveille et répond aux incidents de sécurité en temps réel. Infrastructure et organisation dédiée à la détection et la réponse aux menaces informatiques.                                | Surveillance, coordonne et agit pour limiter l’impact des attaques au quotidien en continue et fournis une réponse aux incidents de sécurité.                                     |
| **`EDR`**          | _Endpoint Detection and Response_                             | L'EDR se concentre sur la détection et la réponse aux menaces sur les endpoints.                                                                                                                 | Surveillance, analyse et réponse automatisée aux menaces sur les endpoints.                                                                                                       |

**NOTE IMPORTANTE**<br>
**`*` EFK** : En tant normal, la stack connu est **`ELK`** ( `L`: Logstash ) mais dans mon cas j'utilise ici **`Filebeat`** qui est mentionné dans la doc officiel lors de l'installation de `Wazuh` et donc c'est pour cette raison que j'ai fait le choix de renommer la stack **`ELK`** en **`EFK`**.

## Structure du dépôt

Le projet est constitué de **dix homelabs**, chacun étant un **module** enrichissant progressivement l’infrastructure SOC. L’arborescence se présente ainsi&nbsp;:

Le dépôt se présente en **dix homelabs**, chacun dédié à un **module** (ou plusieurs). L’idée est qu’à chaque étape, vous approfondissez **un nouvel outil** tout en **continuant** à faire fonctionner ceux déjà installés&nbsp;:

```
homelab-soc-cybersecurity/
│
├── README.md
├── .gitignore
├── shared/                         # Fichiers communs à toutes les VMs
│
├── homelab_1-zeek/                 # Surveillance réseau
├── homelab_2-suricata/             # IDS
├── homelab_3-snort/                # IPS
├── homelab_4-wazuh-filebeat/       # SIEM
├── homelab_5-ek/                   # Collecte & Visualisation des logs
├── homelab_6-thehive-cortex/       # SOAR - Gestion des Incidents
├── homelab_7-opencti/              # Threat Intelligence
├── homelab_8-mitre/                # Référence tactiques et techniques (ATT&CK)
├── homelab_9-velociraptor/         # EDR - Investigation Forensique
│
├── homelab_10-user-linux/          # VM utilisateur Linux
└── homelab_10-user-windows/        # VM utilisateur Windows
```

Chaque dossier **homelab_x-nom** inclut :

-   Un **Vagrantfile** pour configurer le Homelab.
-   Un **README.md** spécifique expliquant l’outil, son rôle et son intégration.
-   Un **schema.mmd** (diagramme Mermaid) représentant la topologie du homelab.
-   Un dossier **scripts** (scripts d’installation et de configuration).
-   Un dossier **images** (captures d’écrans, graphiques, etc.).

soit :

```
homelab-soc-cybersecurity/
│
├── homelab_x-<name>/            # Sous-homelab
│   ├── Vagrantfile              # Fichier Vagrant pour <name>
│   ├── README.md                # README spécifique à <name>
│   ├── schema.mmd               # Schéma Mermaid pour <name>
│   ├── scripts/                 # Scripts de configuration et d'installation pour <name>
│   │   ├── install_<name>.sh    # Script pour installer <name>
│   │   └── configure_<name>.sh  # Script pour configurer <name>
│   └── images/                  # Captures d'écran et diagrammes pour <name>
```

> **Remarque** : Les deux derniers homelabs (`10-user-linux` et `10-user-windows`) servent de postes clients/serveurs réels, permettant de **valider** la supervision et la protection sur des systèmes d’exploitation différents.

## Ordre d'exécution et pourquoi

Pour **maximiser** la cohérence et la pertinence des données collectées, il est **impératif** de lancer les VM **dans cet ordre** :

1. `Zeek` : _Démarrer en premier pour commencer à surveiller le trafic réseau et collecter les métadonnées dès que possible ._
2. `Suricata` : _Démarrer en second pour ajouter la **couche IDS** qui permettra d'inspecter le trafic et détecter les menaces._
3. `Snort` : _Démarrer après Suricata pour établir la **prévention** (IPS) pour bloquer les activités malveillantes détectées sur le réseau en temps réel._
4. `Wazuh` & `Filebeat` : _Démarrer pour permettre de mettre en lace la **surveillance les endpoints**, y compris les VM utilisateur (agents sur les VM)._

    - **Wazuh** : _Active la **surveillance des endpoints** (agents sur les VM), permettant de détecter les anomalies directement sur les systèmes._
    - **Filebeat** : _Se déploie **en même temps** que Wazuh afin de **collecter** les logs (Wazuh et systèmes) et de les **transférer** vers Elasticsearch._

5. `Elasticsearch` & `Kibana` : _Stack modifié (ELK > EFK)._

    - **Elasticsearch** : _Reçoit et stocke l’ensemble des logs transmis par Filebeat._
    - **Kibana** : _Permet de visualiser et d’analyser ces données via des tableaux de bord et des graphiques personnalisés._

6. `TheHive et Cortex` : _Démarrer pour introduire la gestion des incidents (**création** et le **suivi**) et l'automatisation des analyses avec **Cortex**._

7. `OpenCTI` : _Démarrer pour centraliser les renseignements sur les menaces (**Threat Intelligence**)._ ( IoC, TTP adverses )
8. `MITRE ATT&CK` : _Démarrer pour fournir un cadre de référence pour comprendre et catégoriser les tactiques et techniques des attaquants._
9. `Velociraptor` : _Démarrer pour effectuer des investigations forensiques post-incident pour analyser artefacts et preuves sur les endpoints._

10. `User Linux` ou `User Windows` : _Démarrer en dernier pour pour permettre à tous les services de détecter et tracer les événements dès le premier instant._

> **Pourquoi respecter impérativement cet ordre&nbsp;?**  
> En plaçant les VMs utilisateurs en fin de déploiement, on **ne perd aucune information** depuis leur démarrage&nbsp;: **Zeek, Suricata, Snort** et **Wazuh** enregistrent immédiatement les journaux d’activité. Cela garantit une **vue globale** des événements et facilite l’**intégration** de chaque nouvelle brique dans un écosystème déjà opérationnel.

> **Note importante**  
> Les homelabs `10-user-linux` et `10-user-windows` sont volontairement **séparés** pour éviter de fusionner deux systèmes d’exploitation différents dans une même configuration. Chaque OS ayant ses spécificités (installation d’agents Wazuh, etc.), vous pouvez ainsi **tester** les scénarios sur l’environnement de votre choix sans complexifier le déploiement.

## Instructions de mise en route

1. **Installer Vagrant et VirtualBox**  
   Je m'assure que les outils sont **fonctionnels** et **à jour** sur ma machine hôte (Windows 11, i5-10600KF, 32 Go de RAM).
2. **Cloner le dépôt**
    ```bash
    git clone https://votre-depot.git/homelab-soc-cybersecurity
    ```
3. **Démarrer dans l’ordre recommandé**
    - J'accède au homelab concerné en suivant l'ordre recommandé ci-dessus, puis j'exécute&nbsp;:
        ```bash
        vagrant up
        ```
    - Je répéte cette opération pour chaque homelab du 1 au 10 **dans l’ordre**.
4. **Vérification des services**
    - J'accéde à la VM (SSH ou VirtualBox) et j'utilise la commande :
        ```bash
        sudo systemctl status <service_name>
        ```
    - Je m'assure que tous les services (Zeek, Suricata, etc.) fonctionnent correctement.
5. **Accéder aux Interfaces** : _J'utilise les interfaces web (comme Kibana, TheHive, etc.) pour visualiser et analyser les données collectées._

## Perspectives et évolutions possibles

Une fois le déploiement validé, plusieurs pistes s’offrent à moi&nbsp;:

-   **Personnalisation avancée** : affiner les règles Suricata/Snort, créer des dashboards Kibana plus précis, etc.
-   **Scénarios d’attaque** : déployer des exercices de pénétration (CTF, red teaming) pour **évaluer** la réactivité du SOC.
-   **Extension fonctionnelle** : intégrer un honeypot (`Dionaea`, `Cowrie`), une sandbox (`Cuckoo`), ou explorer des solutions de **Malware Analysis**.

Ce socle méthodologique offre un **cadre pratique** pour **comprendre** la cybersécurité dans une **démarche concrète**. En évoluant dans chaque homelab, on prend la mesure de la **cohérence d’ensemble** d’un SOC, de la **détection** initiale jusqu’à la **gestion** et la **remédiation** d’un incident.

## Conclusion

> L’intégration méthodique de briques open-source au sein de ce **Homelab SOC** démontre qu’il est tout à fait possible de construire un **écosystème de sécurité** solide et évolutif. En respectant l’ordre de déploiement proposé et en approfondissant la configuration de chaque composant, j’ai développé une vision **globale** des enjeux liés à la **surveillance**, la **détection** et la **réponse aux incidents**. Cette approche progressive me permet d’acquérir une **expertise concrète** et **réutilisable** dans différents contextes professionnels.

> Par ailleurs, l’**architecture** mise en place ici peut être **facilement transposée** au sein d’entreprises, grâce à sa **modularité** et son **interopérabilité** avec des solutions existantes. Les outils sélectionnés (Zeek, Suricata, Wazuh, EFK, TheHive, etc.) suivent des standards ouverts, garantissant une **intégration fluide** dans un environnement de production, quel que soit le niveau de maturité en cybersécurité.
