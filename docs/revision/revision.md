# Exercice revision ENI

<u>Chapitre 1</u>  
Présentation des concepts réseau  

<u>Mots-clés :</u>  
Configuration IP, accès internet, historique, ISO, service réseau, notions sur les réseaux, RAID 5, équilibre de charge, Windows Server 2022, Service Web, Test de connectivité.  

<u>Objectif :</u>  
Permettre d'acquérir les notions liées au réseau :  
- historique du réseau,  
- protocoles et applicatifs dans des environnements clients/serveurs,  
- Concepts liés à la sécurité,  
- La protection,  
- La virtualisation  

Mise en oeuvre d'un environnement virtuel impliquant :  
- Un serveur Windows 2022,  
- Un ordinateur Linux CentOS Stream 9.  

L'environnement sera utilisé dans les chapitres suivants pour réaliser des opérations concrètes.  

<u>Prérequis</u>  

=== "Précisez, dans la liste ci-dessous, ce qui ne constitue pas un système d'exploitation :"
  - [ ] Windows
  - [ ] Unix
  - [ ] SMTP
  - [ ] Linux
  - [ ] Novell
  - [ ] DOS
??? success "Correction"
    === "Correction"
        - [ ] Windows
        - [ ] Unix
        - [x] SMTP
        - [ ] Linux
        - [ ] Novell
        - [ ] DOS

=== "Citez trois exemples de systèmes de fichiers :"
??? success "Correction"
    === "Correction"
        Un File System ou système de fichiers permet de définir la manière dont les données seront stockées sur une portion d'un disque, appelée en général partition.  
        Il existe des systèmes de fichiers sécurisés qui permettent de gérer des accès différents suivant les utilisateurs concernés ou des systèmes de fichiers transactionnels qui proposent un accès suivi des opérations d'écriture.  
        Les exemples suivants peuvent être cités :  
        - FAT32 (File Allocation Table) système de fichiers utilisé sous de nombreuses versions de Windows,  
        - NTFS (New Technology File System) qui propose un accès sécurisé sous Windows Server 2022 ou Windows 11,  
        - EXT4 ou XFS sous Linux,  
        - UFS sous UNIX (Solaris)  

=== "Précisez, dans la liste ci-dessous, les éléments associés à un environnement d'impression :"  
- [ ] File d'attente
- [ ] Périphérique d'impression
- [ ] Carte SCSI
- [ ] Pilote
- [ ] Câble réseau
??? success "Correction"
    === "Correction"
      - [x] File d'attente permet de placer en attente les documents prêts à être imprimés.  
      - [x] Périphérique d'impression il constitue l'imprimante à proprement parler; attention de nombreux OS dénomment la file d'attente imprimante
      - [ ] Carte SCSI Il s'agit d'une carte généralement utilisée pour relier plusierus disques, offrant ainsi un sous-système disque très performant. Bien qu'un espace disque ou mémoire soit nécessaire pour stocker les documents placés en attente dans la file d'attente, cette réponse n'est pas considérée comme une bonne réponse.  
      - [x] Pilote Un pilote d'impression est nécessaire pour formater les données dans un langage adapté au périphérique d'impression utilisé (ex: PostScript ou PCL, Printer Command Languages).  
      - [x] Câble réseau IL est parfois nécessaire lorsque le périphérique doit être directement connecté au réseau et non à un ordinateur. Cependant, de nombreux périphériques d'impression sont accessibles par le biais d'un serveur d'impression sur lequel est branché localement le périphérique.

=== "Quelles affirmations parmi les suivantes sont vérifiées ?"  
- [ ] Un fichier peut être associé à un document de travail d'un utilisateur
- [ ] Un répertoire ou dossier permet d'organiser les informations de manière structurée et arborescente sur un disque dur
- [ ] La lettre associée à un disque dur sur un PC est généralement  X: ou Y:
- [ ] Un système de fichiers permet de définir une classification systématique des documents dans un répertoire
??? success "Correction"
    === "Correction"
      - [x] Un fichier est la plus petite unité visible par l'utilisateur 
      - [x] Il est possible d'utiliser de nombreux niveaux de dossiers 
      - [ ] La lettre associée à un disque dur sur un PC est généralement  X: ou Y:
      - [ ] Un système de fichiers permet de définir une classification systématique des documents dans un répertoire  

=== "A propos de la connectique utilisée ou qui était utilisée sur un PC, précisez quelles affirmations parmi les suivantes sont vérifiées :"  
- [ ] Un port série permet généralement de brancher une carte réseau  
- [ ] Un port parallèle permet le branchement d'une souris
- [ ] Un port USB permet de connecter de nombreux périphériques tels que disques externes, imprimantes, caméra ou modem
- [ ] Le périphérique utilisé couramment pour connecter un ordinateur à Internet par le Réseau de Télécommunication Commuté (RTC) est un modem/routeur
??? success "Correction"
    === "Correction"
      - [ ] Il était surtout utilisé pour brancher une souris ou un modem externe  
      - [ ] Le port parallèle était surtout utilisé pour brancher des imprimantes, des scanners ou des lecteurs externes. il est de moins en moins utilisé au profit du port USB
      - [x] USB signifie Universal Serial Bus et remplace aujourd'hui avantageusement les ports série et parallèle
      - [x] Un Modem ou Modulateur-Démodulateur permet d'effectuer la conversion entre un signal numérique, codant des données numériques provenant de l'ordinateur, vers un signal analogique, codant des données numériques sur le Reséau Téléphonique Commuté (RTC). Il assure aussi l'opération inverse.

=== "Associez les valeurs suivantes aux types de périphériques concernés :"  
1. 750 gigaoctets
2. 4 gigaoctets
3. 3 gigahertz
4. 20 megabits par seconde
5. 8 gigaoctets
6. 800 mégaoctets
7. 1 gigaoctet
8. 1 gigabit par seconde
9.  16 gigaoctets
10. 56 kilobits par seconde

A. ADSL  
B. Mémoire Vidéo  
C. CD-ROM  
D. DVD-ROM  
E. Mémoire vive  
F. Modem RTC  
G. Clé USB  
H. Carte réseau local
I. Processeur  
J. Disque Dur
??? success "Correction"
    === "Correction"
        - 4-A : ADSL ou Asymmetric Digital Subscriber Line permet de disposer d'une connexion asymétrique et peut proposer, par exemple, 20Mbps en téléchargement depuis Internet (download) et 1Mbps en téléchargement vers Internet (Upload)
        - 7-B : Mémoire vidéo ou VRAM (V pour vidéo) Cette mémoire permet de stocker les informations qui servent à afficher une interface graphique pour l'utilisateur (GUI) sur l'écran de l'ordinateur. Certaines cartes récentes proposent jusqu'à 4Go de mémoire dédiée.
        - 6-C : CD-ROM Sa capacité de stockage importante et le type de stockage utilisé (optique) lui permettent de conserver des données en toute sécurité.
        - 5-D : DVD-ROM
        - 2-E : Mémoire Vive ou RAM (Random Access Memory) Ce type de mémoire est dit volatile puisque toutes les données sont perdues lorsque l'ordinateur est éteint.
        - 10-F : Modem RTC Sa capacité a quasiment atteint celle du RNIS (Réseau Numérique à Intégration de Service) qui fonctionne à 64 Kps pour une connexion (un canal B).
        - 9-G : Clé USB (USB Key) Elle permet de stocker et déplacer aisément des informations.
        - 8-H : Carte réseau local. Différent débits seront disponibles sur des réseaux locaux : Ethernet (10, 100, 1000 Mbps), par exemple.
        - 3-I : Processeur. Il s'agit de la fréquence d'horloge du microprocesseur de l'ordinateur. En l'occurrence, ici l'ordinateur est capable de traiter 3 milliards de cycles d'horloge par seconde ! Plusieurs cycles peuvent être nécessaires pour traiter une instruction.
        - 1-J : Disque Dur. Cet espace sert à stocker, sous la forme de fichiers organisés en dossiers, les informations à conserver lors de l'extinction de l'ordinateur.

<u>Enoncé 1.1</u>

a venir