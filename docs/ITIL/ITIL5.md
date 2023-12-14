# Livre 3 - Transition des services

## Transition des services

<u>**Objectif**</u>  

Mise en production des services (nouveaux ou améliorés)  

<u>**Son rôle**</u>  

Mettre en production en respectant les livrables produits par la conception des services ainsi que les coûts  
    - Réalisation, construction, test, validation et déploiement des services  
Prévoir et gérer les ressources nécessaires  
Produire la documentation  
Surveiller et améliorer les services  
Respecter les critères de qualité, de sécurité et les délais dans la délivrance des services  
Prendre en compte et améliorer la perception client  

Dans la phase de transition, tout commence par le processus de gestion des changements avec une **RFC** **R**equest **F**or **C**hange  

![transition des services](./../img/transition_services.png)

## La gestion des changements

<u>**Ses objectifs**</u>  

S'assurer que les procédures et les méthodes pour traiter les changements sont efficaces, voire efficientes  
S'assurer que les modifications des **CI** (**C**onfiguration **I**tem) sont bien enregistrées dans le **CMS** (**C**ontent **Ma**nagement **S**ystem)  
Répondre aux évolutions exprimées par les clients en minimisant les risques d'interruption de service et en maximisant la valeur fournie  

<u>**Définition d'un changement**</u>  

Ajout, modification, ou retrait d'un ou plusieurs **CI** du système d'information ou d'un ou plusieurs services fournis par ce système d'information  

Les "7R" de la gestion des changements  

![7R](./../img/7R.png)

- Raised : qui fait la demande ?
- Reason : pour quelle raison ?
- Return : quel est le retour attendu ?
- Risks : quels sont les risques ?
- Resources : quelles seront les ressources ?
- Responsible : qui est le responsable ?
- Relationship : quelles sont les relations avec les autres changements ?

<u>Les origines d'un changement</u>  

Les correctifs (événement, incident, problème...)  
La législation  
L'organisation  
Des directives ou des standards  
Des évolutions des services existants  
Des nouveaux services  
Un nouveau modèle de sourcing  
Une innovation technologique  

<u>La demande de changement</u>  

Tous les clients sont habilités à émettre une demande de changement, mais cela ne veut pas dire qu'elle sera acceptée.  
Toute demande de changement doit être formalisée par une RFC.  
**RFC** (**R**equest **F**or **C**hange) est une formalisation d'une modification d'un ou plusieurs éléments de configuration (**CI**).  
Une **RFC** doit contenir:  

- un identifiant unique
- une date de demande
- le nom du demandeur
- une proposition de priorité de changement (priorité = impact x urgence)
- une description du changement
- les risques durant l'implémentation du changement
- les dates de mise en place du changement
- une estimation des ressources nécessaires (humaine, matériels...)

!!! warning "La gestion de la priorité d'une demande de changement"

![priorité demande de changement](./../img/priorite_changement.png)

## Les types de changement

<u>Le changement **standard**</u>  

- Actions connues, documentées, déjà réalisées et testées
- Les risques sont faibles et bien maîtrisés
- Changement préapprouvé, maitrisé et associé à des procédures établies
- Référencé dans un mini-catalogue de changements préautorisés

<u>Le changement **normal**</u>

- Il nécessite une évaluation complète et une autorisation avant sa réalisation par le CAB

<u>Le changement **urgent**</u>

- L'urgence est exceptionnelle et devra être validée et autorisée par l'ECAB
- Court-circuitage des procédures (réalisation, mise en oeuvre, documentation et tests)

### Cycle de vie d'un changement

![cycle de vie d'un changement](./../img/cycle_vie_changement.png)

#### Terminologie

**CI** - **C**onfiguration **I**tem: composant du système d'information qui va contribuer à la fourniture d'un ou plusieurs services  
**CMS**- **C**ontent **M**anagement **S**ystem: logiciel de gestion des **CI**, de la base connaissance...  
**CAB**- **C**hange **A**dvisory **B**oard: comité consultatif qui évalue et donne un avis sur la mise en oeuvre des changements dits normaux  
**ECAB**- **E**mergency **C**hange **A**dvisory **B**oard: comité qui donne l'autorisation de traiter le changement en urgence  
**PIR**- **P**ost **I**mplementation **R**eview: comité qui analyse les résultats des mises en production des changements  

## La gestion des actifs de services et des configurations

<u>Son objectif</u>  

- Identifier, contrôler et enregistrer les actifs de services et les éléments de configuration (**CI** - **C**onfiguration **I**tem, les "baselines")
- Editer des rapports sur l'état des actifs de services et des éléments de configuration
- Auditer et vérifier les actifs de services et les éléments de configuration
- Protéger l'intégrité des actifs de services et des éléments de configuration
- Gérer un systeme de gestion de configuration (**CMS** ou **C**onfiguration **M**anagement **S**ystem)

### **CI** - Element de configuration

Un élément de configuration, dénommé **CI**, est un composant du système d'information qui va contribuer à la fourniture d'un ou plusieurs services  
Identifiable par un type et un ensemble d'attributs pour le décrire  
Relation possible avec d'autre **CI**: situation, physique et fonctionnelle (ex. relation entre tour et ecran) 

![actifs de services et des configurations](./img/../../img/actifs%20services.png)

<u>Activités: planification initiale</u>  

Définir le périmètre, la stratégie, la politique de gestion des éléments de configuration  
Connaitre les outils et les données des différents composants existants (véracité et mise à jour): analyse de l'existant  
Sélection, configuration et modélisation du CMS/CMDB (type de CI, attributs, relations)  
Chargement initial  
Nomination du propriétaire, des acteurs clés avec leurs rôles et responsabilités  
Formation des collaborateurs  

<u>Activités: planification itérative</u>  

Chargement des CMDB  
Ajustement des procédures, rôles et responsabilités  

<u>Les outils</u>  

**CMDB**: **C**onfiguration **M**anagement **S**ystem  
BDD de l'outils de gestion associé  
Contient des enregistrements CI  

**CMS**: **C**onfiguration **M**anagement **S**ystem  
Ensemble d'outils pour gérer les données de configuration  
Prend les données de plusieurs CMDB pour constituer une CMDB fédérée  

**DML**: **D**efinitive **M**edia **L**ibrary  
Lieu de stockage sécurisé des CI logiciels  
Référence pour tous les logiciels: contient les médias, documentations et clés de licence associées  

![gestion des actifs et des configurations](./img/../../img/actif_configuration.png)

## La gestion des mises en production et des déploiements

La gestion des mises en production et des déploiements  

- valide, organise et planifie le déploiement des services (nouveaux ou mis à jour) de façon "industrielle", en garantissant la valeur apportée, dans le respect des SLA
- Crée et fournit le document à l'exploitation des services
- S'assure que les utilisateurs ont reçu les informations et sont formés pour utiliser les nouveaux services
- Gestion des version, convention de nommage, le R.A.C.I, les délais...

![gestion mise en production et déploiement](./img/../../img/gestion_production_déploiement.png)

Ci-dessous les différents modes de déploiement  

![différent modes de déploiement](./img/../../img/different_mode_deploiement.png)

## Les autres processus de la transition des services

<u>La gestion de l'évaluation des changements</u>  

- Mesure l'impact des changements, en évaluant les effets et les risques
- Crée la revue de post-implémentaire (PIR)
- Indépendante de la gestion des changements

<u>La validation et les tests</u>  

- Garant du bon fonctionnement des services (nouveaux et mise à jour) et de la gestion des erreurs découvertes pendant les phases d'intégration, de préproduction et de post-mise en production
- Création de procès-verbaux de recette (fonctionnelle, performance, d'exploitabilité, de service régulier)

<u>La gestion de la planification et le support à la transition</u>  

- Organise le ou les changements (nouveaux ou mise à jour) et gère les ressources nécessaires (humaines et matérielles)

## La gestion de la connaissance

<u>Objectif</u>  

- Donner de l'information à un collaborateur avec la granularité dont il a besoin
- Fournir une information compréhensible et fiable
- Permettre une prise de décision à tous les instants du cycle de vie
- Permettre d'optimiser et de fiabiliser les prises de décision (efficience)
- Permettre d'enregistrer les situations déjà connues
- Mettre en place et faire vivre un système de gestion de la connaissance
- Gérer l'information
- S'assurer de la bonne utilisation de la base de connaissances
- **SKMS** - **S**ervice **K**nowledge **M**anagement **S**ystem

<u>Gestion de l'information</u>  

Identifier les exigences, les contraintes, les spécifications des données traitées  
Définir une architecture permettant de supporter ces données  
Définir des outillages appropriés pour mettre en oeuvre cette architecture  
Ecrire les procédures qui vont faire vivre ces données  
Effectuer une analyse précise de l'état des lieux en matière de gestion de la connaissance  
Appréhender cette spécificité pour mieux bâtir une solution adaptée  
Evaluer la performance des bases de connaissances et être force de propositions pour l'amélioration des bases  

<u>Bonne utilisation de la base</u>  

Savoir si ce que l'on a mis en place sert à quelque chose ou si des collaborateurs l'utilisent  
Comprendre qui partage la connaissance, qui capitalise la connaissance de l'entreprise  
L'important n'est pas une base de connaissances contenant beaucoup d'informations, mais une base de connaissances qui est utilisée  
Gérer la promotion, l'information, la formation sur les bases de connaissances  
