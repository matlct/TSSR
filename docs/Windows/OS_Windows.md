# Windows client

<p align="center">
  <img src='../../../../../site/img/frise_MS.png'>
</p>
- MS-DOS (MicroSoft Disk Operation System) née en aout 1981, il ne possede pas de GUI (Interface graphique) et permet a seulement un utilisateur de ne lancer qu'une seule instruction a la fois

- Windows 1 arrive en 1985 avec la premiere souris et une interface graphique.

- windows NT sort en 1993 Microsoft entre sur le marché des systeme d'exploitation serveur grace a :
  - OS multi-utilisateur
  - Multitache
  - Fonctionne sur une plus grande gamme de constructeur

- Windows 2000: popularise l'informatique en entreprise avec la cohabitation de win2000 pour les Poste de travail et de win200serveur

- Windows XP:  L'OS le plus populaire aujourd'hui, il a accompagné l'informatique en entreprise dans tous les corps de métier (Grands groupe, les PME)  
  - Il a grandement aidé a populariser l'informatique domestique, il à également accompagné l'explosion d'internet, il s'agit de l'OS qui a le record de longévité chez microsoft

- Windows vista et Windows 8 (remplacant de windows XP et Windows 7) OS synonyme de flop pour Microsoft

- Windows 10 est a l'heure actuel le plus répandu au monde (1 ordinateur de travail sur 2 tourne sur windows 10).

## Cycle de vie d'un OS Windows

Un OS est un produit qui nait/evolue et disparait.  
Pour cela des equipes support, chez Microsoft, ont pour mission de suivre l'evolution d'un OS, elles etudient les remontées d'information des utilisateur dans le but de corriger les bugs et ameliorer les fonctionnalitées.

4 etapes majeur definissent le cycle de vie d'un OS windows :

- la date de sortie officiel sur le marché
- la date de fin des ventes au pres des revendeurs officiel
- la date de fin du support standard
- la date de fin du support étendu

A retenir le support étendu est en général d'une **durée de 5 ans**, cela permet aux entreprises d'avoir du temps pour organiser la migration vers le nouvel OS.
Le support étendu continue durant les 5 ans à proposer des correctifs et des KB de sécurité. En effet il est tres rare de developper des KB d'améliorations ou de nouvelles fonctionnalité.

A la fin du support étendu, l'OS n'est plus supporté ce qui signifie qu'il ne beneficiera plus de nouvelle mise a jour, moins de mise a jour = moins de sécurité et moins de fiabilité!

Une mise a jour est defini par une KB (knowledge base) une maj peut contenir l'amelioration d'une fonctionnalité, peut corriger une erreur ou peut boucher une faille de sécurité, il est donc important de faire des mise a jour.  

!!! abstract ""
    MicroSoft a mis a disposition des ***services pack*** afin de gagner du temps sur les mise a jour en cas d'installation plusieurs année apres la sortie de l'OS.

## >WaaS (Windows As A Service)

- **Windows Insider** = Communauté d'utilisateur de beta testeurs
- **Build** = version de l'OS, chaque build est identifié par un numéro servant a retrouver sa date de sortie (ex1903 pour mars 2019), chaque build offrant son lots de nouveauté, le support d'une build est de 18 mois
- **Feature update (mise a jour de fonctionnalité)** = mise a disposition officiel d'une build aux entreprises et au grand publics, il y a 2 Features Update /an
- **Quality updates (mise a jour de qualité)** = Proposé a des rythme plus soutenu, elle comporte des maj de sécurité et de corrective, elles sont cumulatives et mise a dispo chaque 2eme mardi du mois (patch tuesday)

Durant 6 mois la communauté Windows Insider et MicroSoft travail main dans la main.
Durant cette periode microsoft recupere, massivement et tres regulierement, des rapport d'utilitisation et d'incident.
Microsoft exploite toutes ces données recolté pour creer et deployer des correctif, des mise a jour de sécurité et des nouvelles fonctionnalitées.

Au bout des 6 mois, de recolte de données, une build peut etre mise en production (ex: 1903), MicroSoft la deploye via une Feature update.

Ensuite la build connaitra une quality update afin de se renforcer et de ce fiabiliser, mais ne connaitra pas de nouvelle fonctionnalité.
Pendant ce temps les Insiders et MicroSoft travail deja sur la prochaine build,
6 mois apres une feature update sera disponible avec son lot de nouvelle fonctionnalité (ex:1909).
L'utilisateur a le choix de mettre a jour son OS ou de continuer avec la build qu'il possede.

6 mois passe une nouvelle build est mise en production, l'utilisateur a toujours la possibilité de migrer vers l'ancienne build (ex 1909) ou d'installer la nouvelle (ex:2004).

6 mois plus tard une build suivante arrive (ex:2009) la 1903 arrive en fin de support car elle aura vécu 18 mois, l'utilisateur doit impérativement migrer vers une build en phase de support.

<!--- inserer frise vie de build cours ENI --->

## Editon & Licence

1. **edition famille** usage domestique exclusivement : edition de base, comporte les fonctionalité de base native : moteur de recherche vocal cortana, les fonctionalité bureau supp, timeline, onedrive etc
2. **edition pro**: construite sur la base famille, meme fonctionnalité avec en plus utilitaire specifique pour le monde l'entreprise : chiffrement bitlocker et EFS (encrypted Files System), la possibilité de joindre a l'AD (Active directory)
3. **edition entreprise**: surcouche de l'edition pro, embarque des fonctionnalité pour les grands groupes comme direct acces (permet la connex. distante et auto d'un utilisateur au reseau de son entreprise)
4. Edition plus specifique comme l'edition education, professionel pour station de travail, l'edition entreprise ltsc (long terme servicing channel) version entreprise avec support assuré pdt 10 ans

Pour avoir le droit d'exploiter Windows et beneficier des mise a jours il faut posseder une licence.

Les regles d'utilisation de Windows sont inscrit dasn le *CLUF* (Contrat de Licence d'Utilisateur Final) EULA (End User Licence Agreements).

Il existe different type de licence :

- **OEM (Original Equipment Manufacturer)**: Préinstallée, liée a la machine et liée au bios (impossible de l'installer sur une autre machine)
- **Retail (Vente au détail)**: lié a l'utilisateur, s'installe sur un poste mais peut-etre installé sur un futur ordinateur.
- **MAK : Multiple activation key** (pour les petites entreprises): licence comportant un nombre d'activation pré-programmé
- **VLK : Volume licence key** (meme principe que la MAK): destinées au plus grosse entreprise (pour les parcs de machine de plus de 25 postes), necessite KMS
  (centralise l'activation des machines)
- **CAL : Client Access Licence**: licence permettant au client de solliciter le service d'un serveur microsoft.
- **CAL Applicative**: permet, apres installation d'un soft sur poste de travail, de ce connecter au service non natif installé sur le serveur
  ex: Exchange sur le serveur et outlook sur le poste de travail (le P.t soit disposer d'une CAL applicative)

!!! tip "Explication 32 et 64 bits"
    Le 64 bits est une architecture matériel, plus on avance dans le temps plus le matériel evolue (plus petit plus puissant).
    Les éléments de l'ordinateur via la carte mere peuvent echanger entre eux avec plus de fiabilité et de vitesse, le systeme doit s'adapter a ce modele d'architecture vu que cest lui qui l'exploite, il existe donc des OS et des soft pour les architectures 32 & 64 bits.
    Les architecture 64bits sont maintenant tres répandu sur le marché mais pour assurer une retrocompabitilité microsoft continue de proposer du 32 bits pour les anciennes génération.
    Le 64bits amene plus de performance, OS win10 prend nativement en compte plus de 4Go de Memoire vive, meilleur protection du systeme via l'UEFI(evolution du bios) au dmérrrage, meilleur chiffrement via les puce TPM souvent embarqué dasn les PC portable, fiabilité car il ne gere que les periph dont le drivers est signé et approuvé par microsoft (réduit les risque de bluescreen), les 64bits ne porennent plus en charge les periph dev. en 16bits.

## L'installation

- **Nouvelle installation**
  installation sur nouveau matériel ou en remplacement d'un systeme existant (le disque de donnée sera donc formaté, faire des backup)
- **Mise a niveau**
  - Par dessus un windows existant (cela n'est pas le mieux car cela fait chuter le taux de fiabilité du systeme)
  - Impossible de faire une mise a niveau si l'OS est 2 generation en dessous
  - Utile pour la conservation de données difficilement exportable ou pour l'utilisation de soft ou le .exe n'est plus disponible

## Migration

L'installation de Windows sous entend que l'utilisateur possede un nouvelle ordinateur (renouvellement de parc ou nouvelle machine).  
Cela signifie qu'il doit récuperer un environnement de travail similaire a celui qu'il avait avant (pour ne pas perdre en productivité, en temps d'adaptation et de formation).  
C'est à l'équipe technique de ce charger du transfert et de la migration des données.

Il faudra reflechir aux élements à transferer de l'ancien vers le nouveau poste :

- Les comptes et profil des utilisateurs
- Les configurations particulières des logiciel installé localement
- Outils bureautique
- Parametre systeme, tel que pilote, messagerie, police d'ecriture
- Fichiers et dossiers
  - l'equipe pourra s'appuyer sur la solution centralisé de back-up
  - sinon MS propose sa solution native de back-up de données "outils de sauvegarde et restauration"

>Pour le reste il sera tout a fait possible de migrer la liste situé au dessus via des scripts USMT (User State Migration Tools)
procédure d'utilisation des USMT sont dispo sur le site MS

## Interargir avec Windows

**OS multi-utilisateur**  
Chaques utilisateurs possede un profil dans lequel son bureau est personnalisable ainsi que son menu demarrer.  
Ils peuvent ajouter des bureaux supplémentaire afin d'agrandir leurs espace de travail, il également de la ***Timeline*** (depuis la build 1803) qui propose un historique des tâches.

**OS multitache**  
Cela offre la possibilité d'utiliser plusieurs applications en meme temps et de basculer de l'une a l'autre depuis la barre des taches (ou via Win+tab).  
Le gestionnaire des taches permet d'afficher le détail du bon fonctionnement des applications.

**Zone de notification**  
Apporte des info en temps réel et des raccourcis vers certains programme  
Programmes tournant en arrière plan.  
Les notifications systèmes apparaisent dans cette zone.  
On peut également acceder au parametres système depuis cette zone.

!!! abstract ""
    L'élement intéressant, de cette zone est de pouvoir observer l'etat de la connexion réseau et de pouvoir la configurer.  

**Zone de recherche**  
Tres pratique pour acceder à n'importe quelle emplacement du système.  
Grâce à l'indexation elle propose des suggestions automatique pour gagner du temps

!!! example
    Taper dans la barre de recherche = panneau  
    le systeme proposera directement panneau de configuration

**Consoles mmc** (pour Microsoft Management Console)  
Principales outil du technicien.
Console préconfiguré disponible via `WIN+R` puis en tapant `mmc`  
Cela lancera une console vierge à configurer avec vos propre logiciel enfichable
egalement disponible grace au fichier `mmc.exe` disponible dans le dossier `c:\windows system32`
