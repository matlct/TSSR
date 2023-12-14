# La gestion du stockage

explication des notions suivante:

- Partitionnement
- Format de table de partition
- systeme de fichiers
- Outils

## Le partitionnement

dans le domaine du stockage le partitionnement signifie **separer** un disque en plusieurs **portion** logiques, étanches et independantes les une des autres [inserer schema]
Le disque dur possede une table de paritionnement, elle agit comme un sommaire de DD.
Il y a 2 types de table de partition:

- Format MBR (Master Boot Record) :
  - format historique,
  - indispensable pour le bios, dans les dernieres etapes de demarrage le bios a pour mission de charger l'OS en mémoire vive, l'OS est un ensemble de fichier présent sur le disque dur (dans une partition), le MBR indique au bios ou ce situe la partition dasn laquel les fichiers de l'OS sont sotcké.
  - Le MBR est stocké sur le premier secteur du DD (secteur 0) taille de 512octets = ananlogie du sommaire avec un livre
  - il ne peut referencer que 4 partitions max.
  - il ne gere que des DD inférieur a 2,2To
  - compatible OS 32 & 64bits

Partition d'un disque de **base**
[inserer schema cours]
Possibilité d'étendre une partition existante avec l'espace libre contigu
possibilité creer 4 part. max sur un disque

Il existe une méthode pour aller au dela des 4 part. max., **parition étendue** elle se comporte comme un contenant pouvant acceuillir des lecteurs logique (lecteur logique pouvant eux meme stocké des données), il faut un mini 1 lecteur logique pour sotcker des données, il ne sont pas refe. dans le MBR (impossible de demarrer un ordinateur via un OS stocké dans un lecteur logique)

partitionnement de disque dynamique.

- dynamique (évolution du disque de base)
- ! Attention pour MS les partitions contenues sur un Disque Dynamique s'appellent des **volumes** !
- possibilités d'étendre un volume grace a l'espace libre disponible sur le disque source...
- ..et disponible sur un disque supp. Permet de gerer les disques par ensemble (RAID)
- Convertir un disque de base en disque dynamique sans perte de données

autre Format de table de partitionnement au format GPT:
decmocratise et tres repandu aujourd'hui

- GUID Partition Table
  - format gomme les inconvénients du MBR
  - dupliqué & sauvegardé sur plusieurs secteurs du disque (contrairement au MBR)
  - lecture du GPT par l'UEFI (evolution du bios depuis 2013)
  - 128 partitions max
  - taille max 256To
  - seulement compatible avec les OS 64bits et les puces UEFI

## formatage de partition

apres le partitionnement vient le formatage
formater une partition ou un lecteur logique, c'est installer un systeme de fichiers
grave a son index le FS (files system) organise les accès au données. une partition ou un lecteur logique formaté s'appelle un volume.
en autre l'index possede l'adresse physique des données situé sur les secteur du disk (analogie ikea on recupere l'emplacement du produit afin de le recuperer rapidement dans l'entrepot) l'OS consulte l'index pour savoir ou ce trouve la donnée a aller chercher.

il existe plusieurs sorte de systeme de fichiers

- NTFS :
  - systeme de fichiers par défaut chez MS (win10 ne s'install que sur du NTFS)
  - nativement sécurisé par les ACL (acces control list) l'index contient les info d'authorisation d'acces au fichier
    - qui peut le lire
    - qui peut le modifier
    - qui peut le supp
    - qui a un acces refuser
  - l'OS le sauras en consultant l'index
  - chiffrement intégré via EFS
  - compression des fichiers intégrée
  - activation de la synchronisation et de la deduplication des données via fonctionnalité supp
  - taille maximale (apres formatage en NTFS avec une taille d'allocation de secteur de 64Ko) du volume gere 256To

- FAT32 (file Allocation Table)
  - historique
  - standard il est reconnu par beaucoup d'OS (ex une cles usb en fat32 sera reconnu par la pluaprt des OS ex: win to macOs)
  - non sécurisé nativement
  - gere que 4Go max

- REFS (Resilient File System):
  - evolution de NTFS
  - reservé au grand espace de stockage (quasi illimité)
  - correction proactive des erreurs

- ext4 privilégié sur OS linux
- VMFS Vmware
- UDF systeme de fichier pour CD/DVD, inscritible 1x la pluaprt du temps et en lecture seule une fois finalisé

## outils de gestion

1- console graphique de gestion des disques (diskmgmt.msc) [possibilité de l'ajouter dans la console perso via les outils enfichable]

- avec la console on peut initialiser les disk (mettre en place une table de partitionnement), les partitionners, les formaté, les etendres, les reduires, leurs attribuer une lettre de lecteur ... bref administrer vos volumes
- en ligne de commande via l'outil diskpart
  - reste un outil plus complet

- via powershell avec les cmdlets :
  - get-disk : relever le numéro du nouveau disque
  - initialize-disk -number <numéro relevé> : par défaut GPT - il faut préciser le parametre -partitionstyle MBR pour la rétrocompatibilité
  - new-partition -disknumber <numéro relevé> -useMaximumsize - assigndriveletter : ont peut assigner la lettre apres avec set-partition -disknumber <numéro relevé> -partitionnumber <numéro relevé> -newdriveletter *lettre de votre choix*
  - format-volume -driveletter *lettre de lecteur* : format par défaut en NTFS - votre volume est pret a l'utilisation

## disque dur virtuel

on utilise de plus en plus de VM donc de DD virutel

MS dispose de son propre format format de DD virtuel, ceux utiliser dans HyperV (solution MS)
ext. .VHD (Virtual hard Drive) ou .VHDX (.VMDK chez Vmware)
Disk bootable donc il peuvent heberger des OS
Taille fixe ou dynamique et utilisable sur une machine physique, ils sont montable sur un OS (comme pour une image .iso ) donc facilement explorable.

1 disk virtuel est ni plus ni moins qu'un fichiers que l'on peut facilement manipuler, copier, agrandir, sauvegarder etc
