# Livre 2 - Conception des services

## Objectif  

- Produire des services en respectant les livrables produits par la stratégie des services.  

## Son rôle  

- Recueillir les exigences du client (SLR = Service Level Requirement : Exigences de niveaux de service)  
- Définir la solution  
- Connaitre les contraintes de l'architecture du système d'information  
- Définir les processus  
- Définir les indicateurs de mesure du service  

## Définir la solution

Exigences, contraintes, spécifications, validité et bénéfices: ou je dois aller ?  
Options de réalisation : comment vais-je m'y prendre ?  

- Réalisation interne ou sous-traitance ?  
- Maintenance corrective internet ou externe (TMA) ?  
- Exploitation interne ou infogérance ?  
- Sous-traitance fonctionnelle (**BPO**) ?  
- **ASP**: fournir le service directement au client final via l'infrastructure de l'informatique d'un fournisseur ?  
- **KPO**: appel à un ou plusieurs consultants externes pour leurs connaissances sur les métiers ou la technologie ?  

## Indicateurs

- Comment évoluent les données du service ?  
- Fait-il ce qu'on a vendu au client ?  
- Le fait-il dans le respect des SLA ?  
- Sommes-nous efficients dans la livraison quotidienne du service ?  

## Les processus de la conception des services

### <u>La coordinations de la conception</u>  

- Met en relation les différents processus pour la création des services  

### <u>La gestion du catalogue des services</u>  

- Pour gérer et garder à jour les informations des services et leur disponibilité  

### <u>La gestion des niveaux de services (SLA)</u>  
(SLA: Service Level Agreement = Accords sur les niveaux de service)  

- Dans la matrice RACI, Elle est "accountable"  
- Permet d'identifier les exigences, les besoins et les moyens nécessaires à la fourniture des services  

### <u>La gestion de la disponibilité</u>  

- S'assure que les niveaux de disponibilité d'un service sont conformes aux SLA  
- Permet aussi de supprimer les SPOF (Single Point Of Failure)  

### <u>La gestion de la capacité</u>  

- S'assure que les services actuels et futurs sont et seront délivrés au meilleur coût (ressources humaines et/ou matérielles)  
- Elle contient trois sous-processus:  
  - **BCM** (**B**usiness **C**apacity **M**anagement) - Gestion de la capacité orientée métier - Futurs besoins  
  - **SCM** (**S**ervice **C**apacity **M**anagement) - Gestion de la capacité orientée service - Performances actuelles  
  - **CCM** (**C**omponent **C**apacity **M**anagement) - Gestion de la capacité des composants - Ressources disponibles  

### <u>La gestion de la continuité</u>  

- S'assure de la poursuite de la livraison des services dans le respect des **SLA** dans un environnement dégradé (côté DSI et/ou client)
- Nécessite de tester régulièrement et adapter les PCA (Plan de continuité d'Activité)

### <u>La gestion de la sécurité</u>  

- S'assure de la sécurité des données du système d'information
- Disponibilité, confidentialité, intégrité, authenticité, non-répudiation
- Nécessite de définir la politique d'utilisation du système d'information

### <u>La gestion des fournisseurs</u>  

- Codifie la relation avec les fournisseurs (recrutement, contrat, niveau et qualité de service, litiges, ruptures de contrat)

## Les acteurs de la conception des services "4P"

![acteurs conception des services "4P"](../img/conceptions_services_4P.png)

### Gestion des niveaux de services

![gestion des niveaux de services](../img/gestion_niveaux_services.png)

Le contenu d'un **OLA**  

- Un contrat de services **OLA** est un contrat pour réaliser un **SLA**
- Le document a la même structure que le **SLA**
- L'**OLA** est un contrat interne, les conditions de pénalités sont souvent inexistantes ou non applicables

Le contenu d'un **UC**  

- Un contrat de service **UC** est un contrat avec un prestataire externe pour réaliser un **SLA**
- Le document a la même structure que le **SLA**
- Des clauses juridiques sont à ajouter pour traiter la relation entre les deux organisations

#### Terminologie

**SLR**: **S**ervice **L**evel **R**equirement: expression des besoins de client, niveau de satifsaction du client  
**SLM**: **S**ervice **L**evel **M**anager: responsable de la gestion des niveaux de services  
**SLA**: **S**ervice **L**evel **A**greement: accord de niveaux de services conclu avec le client  
**OLA**: **O**perationnal **L**evel **A**greement: accord de niveaux de services conclu avec les fournisseurs internes  
**UC**: **U**nderpinning **C**ontract: contrat de sous-traitance  
**Catalogue de services**: document regroupant l'ensemble des services  
**SIP**: **S**ervice **I**mprovement **P**rogram: programme d'amélioration des services  
**TMA**: **T**ierce **M**aintenance **A**pplicative: maintenance corrective applicative effectué par un tiers (développement)  
**BPO**: **B**usiness **P**rocess **O**utsourcing: sous-traitance fonctionnelle d'une application, d'un processus métier (la paie, la comptabilité)  
**ASP**: **A**pplication **S**ervice **P**rovision: fournir le service directement au client final via l'infrastructure de l'informatique d'un fournisseur  
**KPO**: **K**nowledge **P**rocess **O**utsourcing: appel à un ou plusieurs consultants externes pour leurs connaissances sur les métiers ou la technologie  

### Gestion de la disponibilité

![gestion de la disponibilité](../img/gestion_disponibilité.png)

#### Terminologie Gestion disponibilité

**Fiabilité**: aptitude d'un équipement, d'un logiciel, d'un service à fonctionner durablement avec un nombre minimum d'interruptions ou d'incidents  
**Maintenabilité**: aptitude d'un service ou d'un équipement à être remis en marche  
**Résilience**: aptitude à continuer à fonctionner même si un ou plusieurs composants sont hors service  
**Service-ability**: aptitude que l'on a à trouver des fournisseurs ou sous-traitants externes pour assurer disponibilité, fiabilité et maintenabilité  
**Recoverability**: aptitude à s'auto reconfigurer jusqu'au dernier niveau d'avant arrêt  

### Gestion de la continuité - Terminologie

**B**usiness **C**ontinuity **P**lan: PCA = Plan de Continuité d'Activité :  
orienté métier, quelles sont les activités opérationnelles et leurs ressources, que vais-je maintenir ?  
**B**usiness **C**ontinuity **M**anagement: analyse et gestion, quels sont les risques et leurs impacts  
**B**usiness **I**mpact **A**nalysis: méthode d'analyse de l'impact business qui permet d'évaluer les pertes potentielles  
**D**isaster **R**ecovery **P**lan: PRA = Plan de Reprise d'Activité :  
plan de rétablissement et reprise informatique  

### Gestion des Fournisseurs

Organisation externe à l'entreprise qui va intervenir dans la fourniture d'un service sous contrat de sous-traitance (**UC**)  
Plusieurs relations possibles :  

- Sous-traitance: organisation externe qui s'engage pour la conception, le développement, l'exploitation et la maintenance d'un service.
- Cotraitance: organisation externe qui s'engage à participer à des activités du cycle de vie du service.
- Partenariat: engagement à long terme pour de nouvelles opportunités.
- **A**pplication **S**ervice **P**rovision (**ASP**): fourniture partielle ou totale d'un service à partir de son propre SI et de son réseau.

### Gestion de la sécurité - Terminologie

**La disponibilité des données**: c'est donner à l'utilisateur qui le demande l'information dont il a besoin.  

- Exemple des disque en RAID

**La confidentialité**: c'est rendre accessible l'information à ceux qui en ont l'autorisation et à eux seuls.  

- Exemple les permissions de fichier et dossier afin de savoir qui peut acceder à quoi

**L'authenticité**: c'est rendre fiables les échanges par une signature éléctronique.  

- Exemple des certificats electronique

**L'intégrité**: c'est s'assurer que l'information est complète et qu'elle n'a pas été altérée de manière frauduleuse.  

- Exemple les fichiers md5 disponible avec les images .iso a verifier avec checksum

**La non-réputation**: c'est assumer le fait d'avoir effectué l'action.  

- Exemple signature electronique de mail  