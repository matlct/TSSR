# La gestion des services

## Présentation d'ITIL

ITIL v3 propose une évolution de la gestion de projet vers la gestion de service qui est plus orientée client  
<u>**Un projet**</u>  
C'est la capacité à implémenter de nouvelles fonctionnalités par rapport à:  

- De nouveaux besoins  
- Une nouvelle législation  
- Une avancée technologie  

<u>Un service</u>  
!!! warning "un service doit fournir de la valeur"  

C'est la capacité à produire le service demandé en respectant trois critères importants:  

- Aligner les services informatiques sur les besoins des clients  
- Améliorer la qualité des services informatiques  
- Maîtriser les coûts de fourniture  

### Définitions d'un service

Un service est l'ensemble des moyens mis en oeuvre pour apporter à un client de la valeur sans qu'il n'en supporte ni les coûts ni les risques  
En résumé c'est un engagement de résultat l'informatique s'engage sur un résultat par rapport a une certaine fonctionnalité et un niveau de qualité.  

Un service est, par exemple, une applications installée sur une infrastructure avec:  

- Une documentation associée  
- Une formation adaptée  
- Un support mis en place  
- De l'assistance aux utilisateurs  

Un service est l'engagement sur le résultat:  

- Face au client  
- Face au risque  
- En assumant les risques  

### Les 2 conditions requises pour créer de la valeur

<u>**Utilité** (dimension de la prestation)</u>  
La raison d'être d'un service  

- Amélioration des performances  
- Dépassement des contraintes  
- Ou les deux  

<u>**Garantie** (utilisabilité)</u>  
La garantie est l'assurance, pour le client, que le service va remplir les exigences de niveau de qualité contractualisé (condition, résultats, lieu, délais et moment)  
C'est le niveau d'usage dont le client et ses utilisateurs ont besoin.  
Elle doit respecter:

- Les heures d'ouverture  
- La disponibilité  
- La performance  
- La continuité de service  
- La sécurité  

![creation valeur](../img/creation_valeur.png)

## Les 5 acteurs de services

1. Le fournisseur de services informatiques (IT Service Provider)  
Entité responsable de la mise à disposition des services informatiques  

      - Type 1: Fournisseurs interne  
        - Par exemple, l'organisation marketing d'une entreprise décide de mettre en place chez elle une équipe informatique chargée de gérer l'informatique qu'elle utilise.  
      - Type 2: Fournisseur de service partagés  
        - C'est le cas d'une direction informatique ayant pour clients les différentes organisations de l'entreprise (y compris elle-même).  
      - Type 3: Fournisseur externe  
        - Ce type de fournisseur propose ses services à toutes les entreprises intéressées.  

2. Le client  
    Personne ou organisation bénéficiaire finale d'un service, comptable des résultats.  

      - Il est le donneur d'ordre
      - Il est autorisé à signer un contrat (SLA) portant sur la fourniture de service informatique
      - Il va exprimer les besoins métiers
        - Négocier le service
        - Valider la solution
        - Payer la solution et le service
      - Il est le représentant des utilisateurs
      - Il a une relation particulière avec la DSI

3. L'utilisateur (collaborateur du client)  
    Personne qui utilise un système informatique  

      - Elle utilise les services informatiques au quotidien pour son activité professionnelle
      - Il remonte ses exigences auprès du client
      - Il ne paye pas l'utilisation d'un service
      - Il contacte la DSI par l'intermédiaire du centre de services (helpdesk)

4. Propriétaire de service (Service Owner - marketing)  
    Entité responsable qui effectue le suivi du service informatique  

    - Il est responsable de la définition du service et de sa mise en oeuvre
    - Il participe aux propositions d'amélioration du service
    - Il est responsable de la bonne mise en oeuvre des améliorations validées
    - Il représenté le service auprès des clients
    - Il participe à la négociation des SLA (Service Level Agreement) et des OLA (Operationnal Level Agreement: Accords sur les niveaux opérationnels)
    - Il est un des destinataires pour les incidents majeurs lors des escalades
    - Il est responsable de la vie du service (évolution et fin du service, création de tableaux de bord)
    - Il s'assure que le service atteigne les objectifs

5. Le gestionnaire de service  
    Personne responsable de la mise en place de la démarche ITIL au sein de l'entreprise et de la vie du service.  

    - Il possède une position hiérarchique élévée pour être légitime
    - Il coordonne les activités des propriétaires de processus et des propriétaires de services
    - Il travaille en collaboration avec le gestionnaire de l'amélioration continue des services

## Les 2 dispositions spécialisées au coeur d'ITIL

La gestion de service intègre:  

- La planification
- La mise en oeuvre
- L'optimisation de la fourniture des services
- Le support des services

Pour cela, il y a 2 dispositions spécialisées:

- Des fonctions
- Des processus

## La notion de processus

Un processus est une suite d'activités structurées et logiques poursuivant un objectif défini  
Il possède plusieurs caractéristiques:  

- Il comprend un ou des éléments en entrée définis
- Il comprend un ou des éléments en sortie qui peuvent être en entrée d'un autre processus
- Il est mesurable: coûts, qualité, gain de productivité et délais de production
- Il a un ou des résultats attendus
- Il a un ou des clients
- Il a un ou des déclencheurs
- Il définit les rôles et les responsabilités des différents acteurs
- Il définit les besoins en outils et les contrôles de gestion
- Il doit être documenté
- Il doit être controlé

### Modélisation d'un processus

![modelisation processus](../img/modelisation_processus.png)

### Les mesures d'un processus

Les mesures d'un processus (ses résultats, ses activités, ses livrables...) permettent d'améliorer son efficacité et son efficience  

<u>**L'efficacité:**</u>  

- C'est une mesure permettant de savoir si les objectifs d'un processus, d'un service 
  ou d'une activité ont été atteints  

<u>**L'efficience:**</u>  

- C'est une mesure qui permet de savoir si la quantité de ressources attribuée à un processus, à un service ou à une activité a été suffisante et bien utilisée (coût d'argent, d'hommes, de temps)  

## La notion de fonction

**Une fonction** est un groupe de personnes fonctionnelles (unité, équipe) disposant d'outils et de ressources spécifiques pour exécuter un certain type de travaux et sera responsable des résultats spécifiques  
Il assure une ou plusieurs activités par rapport à un ou plusieurs processus  
Il est responsable des outils (définition et utilisation)  
ITIL définit quatre fonctions:  

- Le centre des services  
- La gestion des opérations  
- La gestion technique  
- La gestion des applications  

### Fonctions et processus

![Fonctions et Processus](../img/fonctions_processus.png)

## La notion de Rôle

Un rôle se définit à un instant **T** (qui fait quoi à ce moment-là)  
Il s'agit de l'ensemble de responsabilité, que l'on attribue a une personne ou a un groupe de personne, un role va permettre d'attribuer la responsabilite d'une action d'un processus ou d'attribuer la responsabilité d'une fonction a une person ou a une equipe.  

### Modèle R.A.C.I

Dans la demarche ITIL les roles sont strucuré via la modele **RACI** (**R**esponsible **A**ccountable **C**onsulted **I**nformed)  

!!! success "R.A.C.I"
    === "R - Responsible"
        Réalise et reporte - chargé de faire
        - En charge de la réalisation de l'action (plusieurs)  
        - Sous-traitant de A  
        - Au moins 1 par action  
    === "A - Accountable"
        Autorise et assume - responsable
        - Rend des comptes sur l'avancement de l'action
        - Assume la responsabilité de l'action
        - 1 seul par action
    === "C - Consulted"
        Personne Consulté
        - Impliqué dans l'action en tant que fournisseur d'avis
        - L'avis doit être pris en compte par la personne qui l'a demandé
        - Au moions 1 par action
    === "I - Informed"
        Personne qui est informé
        - Doit prendre connaissance de l'action et de son avancement
        - Doit être informé sur le déroulement, le résultat
        - Au moins 1 par action

![Modele RACI](../img/modele_RACI.png)

## Le cycle de vie des services

![cycle vie services](../img/cycle_vie_services.png)
