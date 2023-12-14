# ^^Le Stockage^^

## ^^Gestion des espaces de stockage^^

Un disque dur est r sous linux par un périphérique de type **bloc**  
Le systèmes de fichiers par défaut est **ext4**  
Afin de comprendre comment Linux présentera ce périphérique et ses sous division (ses partitions)  

### ^^La norme Intel du MBR^^

Le MBR (**M**aster **B**oot **R**ecord crée en 1983) est constitué de 2 principaux éléments:  

- Le boot loader: 446 premiers octets - Sous Linux il contient le [stage](./Gestion_debian.md) 1 de GRUB
- La table de partition: 64 octets, contient la position des 4 partitions primaires

^^La partition primaire ou principales^^: C'est le type de partition le plus utilisé et qui permet de stocker des données. en **MBR**, on peut créer maximum 4 partitions par disques.  
^^La partition étendue^^: On utilise ce type de partition pour pouvoir dépasser la limite des 4 partitions principales, elle pourra stocker les informations de 56 partitions logiques maximum  

La plus grosse problématique du MBR est la taille limite des partitions fixée au maximum à 2,2To  

### ^^La norme Intel du GPT^^

Partitions EFI: c'est la partition de démarrage pour les disques GPT sur les PC UEFI.  
Elle est formaté en FAT32 et stocke le firmware EFI  
Le GPT (GUID Partition Table) est crée en (1993?) 2013, il est le remplacant du MBR  
Le nombre maximum de partitions est fixé à 128 (voire 256)  
La limite théorique des partitions et des disques est de 9,4Zo (Zeta octet)  

### ^^Nommage des disques sous Linux^^

Sur n'importe quelle distribution Linux les partitions de disque ne sont pas numérotés comme sur Windows.  
En effet, pour identifier un disque, Linux utilise des lettres à la place des chiffres.  
Linux crée et monte les périphériques dans **/dev**  

Voici la liste des principaux type de périphériques de stockage.
Par exemple, si votre systèmes comporte 2 disques:  

| type de périphérique   | Nom **/dev**                      |
| ---------------------- | --------------------------------- |
| Disque SATA ou SCSI    | /dev/sda                          |
| Stockage NVME          | /dev/nvme0n1                      |
| Disque IDE             | /dev/hda                          |
| DVD ou CD-ROM          | /dev/scd0, /dev.sr0 ou /dev/cdrom |
| SD card et carte Flash | /dev/mmcblkX                      |

On obtient donc le nommage suivant dans le cas de plusieurs disque SATA dans une même machine :  

- **/dev/sda** = Disque 0
- **/dev/sdb** = Disque 1
- **/dev/sdc** = Disque 2

On trouvera la même logique pour des disques NvME :  

- **/dev/nvme0n1**
- **/dev/nvme0n2**
- ...

### ^^Nommage des partitions^^

Pour les partition Linux utilisera cette fois ci des chiffres, afin de differencier les differentes partitions crée au sein d'un même disque.  

Par contre **Linux** ne nomme pas les partitions à la suite  
Il va réserver les chiffres 1 à 4 pour les partitions primaire (principales et étendue)  
Ainsi queleque sois le nombre de partitions principales, si une partition étendue est crée les paritions logiques commenceront quoiqu'il arrive à 5

^^Exemple:^^ le deuxième disque du système est partitionné avec 2 partitions principales et une partition étendue contenant 3 partitions logiques. Linux présentera tout cela de cette façon:  

| partition principale         | partition étendue                    |
| :--------------------------- | :----------------------------------- |
| **/dev/sdb** disque entier   | **/dev/sdb3** disque entier          |
| **/dev/sdb1** 1ere partition | **/dev/sdb5** 1ere partition logique |
| **/dev/sdb2** 2eme partition | **/dev/sdb6** 2eme partition logique |
|                              | **/dev/sdb7** 3eme partition logique |

!!! tip ""
    Dans ce cas **/devsdb** & **/dev/sdb3** ne sont pas utilisable  
    il s'agit de conteneurs (pool) pour les partitions lié.

Quelque exemple de nommage de partition selon les types de disque:  

| SATA                 |           NVME |       IDE |
| :------------------- | -------------: | --------: |
| Disque:    /dev/sda  |   /dev/nvme0n1 |  /dev/hda |
| Partition: /dev/sda1 | /dev/nvme0n1p1 | /dev/hda1 |
| Partition: /dev/sda2 | /dev/nvme0n1p2 | /dev/hda2 |


## ^^Outil de partitionnement^^

Plusieurs outils sont utilisables en console ou en mode graphique pour la gestion des partitions  
Les plus courant sont fdsisk, parted et gparted en version graphique...

### ^^La commande `fdisk`^^

L'utilisation de `fdisk` est basique mais relativement efficace  
Nous allons voir les étapes importante mise a disposition parmis toutes les options disponible  

`fdisk` est l'outil utilisé pour le partitionnement des disques  

`fdisk [option] <périphérique de stockage>`  

`-l` affiche la table de partition du périphérique  

```bash
root@deb
:~# fdisk l / sda
Disque /dev/
sda : 20 GiB , 21474836480 octets, 41943040 secteurs
Unités : secteur de 1 ×512 = 512 octets
Taille de secteur (logique / physique) : 512 octets / 512 octets
taille d'E/S (minimale / optimale) : 512 octets / 512 octets
Type d'étiquette de disque : dos
Identifiant de disque : 0x732e6aa1
Périphérique Amorçage Début Fin Secteurs Taille Id Type
/dev/sda1 * 2048 499711 497664 243M 83 Linux
/dev/sda2 501758 41940991 41439234 19,8G 5 Étendue
```

En ne rentrant que [-l] la commande renverra les informations de tous les disques connus du système.  

### ^^Exemple de création d'une partition^^

Pour passer en mode édition de la table des partitions d'un disque  

La commande sera `fdisk + <chemin_du_disque>`  

Dans l'exemple ci-dessous la commande `fdisk` porte le disque **/dev/sdb**  
en premier lieu ici il s'agit de l'affichage de l'aide de la commande.  

```bash
root@deb:~# fdisk /dev/sdb
Bienvenue dans fdisk util linux 2.29.2).
Les modifications resteront en mémoire jusqu'à écriture.
Soyez prudent avant d'utiliser la commande d'écriture.

Commande (m pour l'aide) : m
[...]
n ajouter une nouvelle partition
p afficher la table de partitions
t modifier le type d'une partition
[...]
w écrire la table sur le disque et quitter
q quitter sans enregistrer les modifications
```

****

Lors de la création d'une partition `fdisk` propose soit une partition primaire ou étendu, si une parti étendue a été crée fdisk proposera automatiquement une partition logique puis le numéro attendu.

le systeme proposera le bloc de début, le premier secteur, ainsi que la taille de la partition (saisie en bloc par défaut) il sera possible de préciser la taille voulu en stipulant un "+" + "la taille" + "unité voulu".  

```bash
root@deb:~# fdisk /dev/sdb
Commande (m pour l'aide) : n
Type de partition
p primaire (0 primaire, 0 étendue, 4 libre)
e étendue (conteneur pour partitions logiques)
Sélectionnez (p par défaut) : p
Numéro de partition (1
4, 1 par défaut) :
Premier secteur (2048
62914559, 2048 par défaut) :
Dernier secteur, +secteurs ou +taille{K,M,G,T,P} (2048
62914559, 62914559 par défaut) : +20G
```

****

Une nouvelle partition 1 de type Linux et de taille 20GiB a été créée.  
la commande p (print) permet de la visualiser.  
a ce stade la partition n'est pas encore écrit et validé tant que `w` n'as pas été saisie afin de quitter et enregistrer  

```bash
Commande (m pour l'aide) : p
Disque /dev/sdb : 30 GiB, 32212254720 octets, 62914560secteurs
Unités : secteur de 1 × 512 = 512 octets
Taille de secteur (logique / physique) : 512 octets / 512octets
taille d'E/S (minimale / optimale) : 512 octets / 512octets
Type d'étiquette de disque : dos
Identifiant de disque : 0x0ab85bf5
Périphérique Amorçage Début Fin Secteurs Taille Id Type
/dev/sdb1 2048 41945087 41943040 20G 83 Linux
```

****

Une fois les partitions créées, il ne faut pas oublier de définir le type de partition via la commande `t` (type).  
Cela est important afin de définir le type de système de fichier sera installé sur la partition  

(l'exemple ci-dessous ne reprend pas l'intégralité des types de fichiers)  

Les 2 plus importants sont :

- 83 Linux : Partition Linux native : type automatique lors de la création d'une partition
- 8e Linux LVM : Partition Linux LVM

```bash
Commande (m pour l'aide) : t
Partition 1 sélectionnée
Code Hexa (taper L pour afficher tous les codes) :L
0 Vide              24 NEC DOS          81 Minix / Linux a
1 FAT12             27 TFS WinRE masqu  82 partition d' éch
2 root XENIX        39 Plan 9           ***83 Linux***
3 usr XENIX         3c récupération Pa  84 OS/2 cachée
4 FAT16 <32M        40 Venix 80286      85 Linux
5 Étendue           41 PPC PReP Boot    86 NTFS volume set
6 FAT16             42 SFS              87 NTFS volume set
7 HPFS/NTFS/exFAT   4d QNX4.x           88 Linux plaintext
8 AIX               4e 2e partie QNX4.  8e Linux LVM
```

****

L'enregistrement des modifications se fait via la commande `w`  

Si les modifications ne conviennent il est possible de quitter sans enregistrer les modifications via la commande `q`.  

```bash
Commande (m pour l'aide) : w
La table de partitions a été altérée.
Appel d'ioctl() pour relire la table de partitions.
Synchronisation des disques.
root@deb:~#
```

****

## ^^Gestion des espaces de stockage avancée^^

### ^^Présentation de LVM^^

Le **LVM** permet de s'affranchir des limites physiques des périphériques.  
**LVM** implémente une couche logique pour une gestion plus souple et plus évolutive des volumes de stockage  
Ce système implemente une couche logique par dessus le stockage standard ce qui permet une gestion plus souple et beaucoup plus évolutive  
On gère plusieurs types d'éléments:  

- Les volumes physiques (**PV**): désignent les périphériques physique intégrés dans **LVM** (les disques durs réellement présent dans la machine)
- Les groupes de volumes (**VG**): permettent de regrouper les volumes physiques  
- Les volumes logiques (**LV**): désignent les unités définies au sein des groupes de volumes, défini les partitions la ou nous allons réellement créer un systèmes de fichier  

La création d'un ou plusieurs groupes de volumes sera faite à partir des volumes physiques (partitions) disponibles.  
Les groupes de volumes seront ensuite découpés en volumes logiques.  
Ces volumes logiques pourront alors être utilisés comme n'importe quel volume de stockage  

<!-- inserer 3 capture d'ecran sur le cours vidéo module 8 -->

Les commandes de gestion s'organisent autour de ces dénominations et respectent toujours la même logique.  
Pour la création, on aura par exemple:

- **pvcreate**: création des volumes physiques
- **vgcreate**: création des groupes de volumes
- **lvcreate**: création des volumes logiques

Il en sera de même pour toutes les autres directives :  
**display**, **extend**, **reduce**, **remove** ...  

!!! note ""
    Toutes les commandes **LVM** sont également disponibles dans un shell dédié, accessible avec la commande `lvm`

### ^^Afficher les informations LVM^^

Plusieurs commandes sont disponibles pour obtenir des informations sur les volumes **LVM** configurés  

On peut les regrouper en deux "familles"  

- Informations résumées avec "s": **pvs**, **vgs**, **lvs**
- Informations détaillées avec "display": **pvdisplay**, **vgdisplay**, **lvdisplay**

****

#### ^^Afficher les informations résumées sur tous les groupes de volumes:^^

```bash
root@deb:~# vgs
VG          #PV     #LV     #SN     Attr    VSize       VFree
vggroup1    4       5       0       wz n    25,76g      22,26g
vggroup2    1       1       0       wz n    5g          4g
```

- PV : Partition de disque 
- LV : Volume Logique
- Vsize : Taille complète du groupe
- Vfree : Taille libre sur le groupe

****

#### ^^Afficher les info détaillées sur tous les groupes de volumes^^

```bash
root@deb:~# vgdisplay
```

****

#### ^^Afficher les infos détaillées sur un groupe de volumes^^

Permet de voir les informations détaillée d'un groupe en particulier

```bash
root@deb:~# vgdisplay vggroup2
--- Volume group ---
VG Name             vggroup2
System ID
Format              lvm2
[...]
Cur LV              1
Cur PV              1
[...]
VG Size             5 GiB
PE Size             4,00 MiB
Total PE            20480
Alloc PE / Size     256 / 1 GiB
Free PE / Size      20224 / 5056,00 MiB
VG UUID             sJd23F-75eY-fdsJ-Gp2w-ezfQ-PLy1-jmQjVb
```

****

#### ^^Afficher les infos résumées sur tous les Volumes Logiques^^

```bash
root@deb:~# lvs
LV          VG          Attr        LSize     Pool     Origin
lv1         vggroup1    -wi-ao----  3,50g
lv2         vggroup1    -wi-ao----  1,00g
```

****

#### ^^Afficher les infos détaillées sur tous les Volumes Logiques^^

```bash
root@deb:~# lvdisplay
```

****

#### ^^Afficher les informations détaillées sur un Volume Logique^^

```bash
root@deb:~# lvdisplay /dev/vggroup1/lv2
--- Logical volume ---
LV Path                 /dev/vggoup1/lv2
LV Name                 lv2
VG Name                 vggroup1
LV UUID                 V2HdqC-zM80-juKd-51QA-A8mp-pYhX-z35OQJ
LV Write Access         read write
[...]
LV Size                 1 GiB
[...]
```

****

### ^^Création des LVM^^

Définir l'identifiant des partitions à utiliser avec `fdisk`, utiliser l'ID **8e**-Linux LVM:  
Très important afin que le système reconnaisse le système LVM au prochain redémarrage  

```bash
Device     Boot    Start End     blocks      Id System
/dev/sdb1  1       486     3903763+          8e Linux LVM
```

****

#### Créer des volumes physiques: **pvcreate**

`pvcreate <chemin_des_disques_a_creer>`  

La commande `pvcreate` suivie des chemins du/ou des divers disques qui devront être déclarés comme PV  
Dans l'exemple suivant nous avons donc 4 disques **sdb1**, **sdb2**, **sdb3** et un disque entier **sdd**  

```bash
root@deb
:~# pvcreate /dev/sdb1 /dev/sdb2 /dev/sdc1 /dev/sdd
```

![image partition LVM](./../../../img/partition%20LVM.excalidraw.svg)

****

#### ^^Créer des volumes groups: **vgcreate**^^

`vgcreate <nom_du_vggroupe> + <chemin_des_disques_a_ajouter>`  

Pour la création d'un groupe de volume, il faudra utiliser la commande `vgcreate` suivie du nom du groupe et des disques devant être inclus dans le **VG**

```bash
root@deb:~# vgcreate vggroup1 /dev/sdb1 /dev/sdb2 /dev/sdc1
```

![image partition LVM2](./../../../img/partition%20LVM%202.excalidraw.svg)

!!! warning ""
    Il est impossible d'ajouter un **PV** à 2 **VG**
    1 PV = 1VG

****

#### ^^Créer des volumes logiques: **lvcreate**^^

`lvcreate [-n - L]`

| options | description                         |
| :-----: | ----------------------------------- |
|  `-n`   | nom du volume logique               |
|  `-L`   | [taille] K/M/G/T/E (Ko, Mo, Go ...) |

```bash
root@deb:~# lvcreate -n lv1 -L 2G vggroup1
```

![lvcreate](./../../../img/partition%20lvcreate.excalidraw.svg)  

Un **LV** pourra avoir, au maximum la taille disponible du **VG**,  
Si cela n'est pas le cas, la taille restante du **VG** sera disponible pour d'autre **LV** ou pour étendre les **LV** déjà existants.  

!!! tip "Manipuler les volumes logiques"
    Il y aura 2 chemins possible :  
    === "`/dev/vgsystem/lvhome`"
    ou
    === "`/dev/mapper/vgsystem-lvhome`"

## Modifier des LVM

### ^^Ajouter des volumes physiques au VG: **vgextend**^^

il faudra ajouter a la commande `vgextend` le nom du **vggroup** que l'on souhaite étendre, suivi du **nom du disque** que l'on souhaite ajouter  

```bash
root@deb:~# vgextend vggroup1 /dev/sdd
```

### ^^Agrandir/Réduire des volumes logiques: **lvextend** & **lvreduce**^^

À noter que les commandes **lvreduce** et **lvextend** s'utilisent de la même manière.  
Seul **lvextend** sera détaillée ici  

```bash
root@deb:~# lvextend -rL +512M /dev/vggroup1/lv1
root@deb:~# lvextend -rL 1G /dev/vggroup1/lv2
```

- [-r]: invoque automatiquement `resize2fs`  
- [-L]: [+]<taille> K | M | G | T | E  
      ne pas mettre de signe '+' permet de "fixer" une taille de disque, peu importe sa taille initiale  
      ^^ex^^: dans l'exemple précédent on fixe la taille du volume à 1Go si celui-ci fait 2Go il y aura donc 1Go d'utiliser et 1Go de disponiblecd /dev

!!! warning ""
    Le système de fichier ne prendra pas en compte automatiquement ces changements  
    Il faudra forcer un redimensionnement-n lv pour pouvoir utiliser tout l'espace  

## Ajout de disque sur une machine

Après l'ajout d'un disque et que celui-ci n'est pas détecté, on peut suivre cette procédure:  

1. après cette logger en `su -`
2. taper `udevadm info --query=path --name=sda` cela permet d'afficher l'hôte utilisé pour monter les disques
3. `echo "- - -" > /sys/class/scsi_host/host2/scan` permet de relancer un scan sur le ou les bus des disques durs
4. relance une commande `fdisk /dev/sd[le_nom_de_votre_disque]`

## File System

### Considérations générales sur les systèmes de fichiers

Tous les systèmes de fichiers de type Unix sont basés sur le mêm principe et les mêmes éléments élémentaires.  
Les systèmes de fichiers Unix sont segmentés en bloc de données, actuellement à 4Ko par défaut  

Chaque bloc pourra avoir différentes structures:

- **Superbloc**: bloc contenant les informations vitales du système de fichiers
- **Inode**: bloc contenant les inodes contenant les informations d'un fichier
- **Bloc d'indirection**: bloc redirigeant cers d'autres blocs
- **Bloc de données**: bloc contenant les données réelles du fichier (ce qui est réellement écrit dans le fichier)
- **Table des inodes**: bloc contenant la liste des blocs d'inodes
- **Table des inodes libres**: bloc contenant la liste des inodes libres
- **Table des blocs libres**: bloc contenant la liste des blocs de données libre

#### Superbloc

Il contient les informations vitales du système de fichiers. Donc par mesure de sécurité, il est dupliqué à différents endroits du sytème de fichiers. Il contient les informations suivantes:

* Taille des **blocs**
* Taille du **système de fichiers**
* Nombre de **montages effectués**
* Nombre **maximum** de montages **avant vérification** avant le passage d'un fsck (équivalent au "checkdisk" windows)
* Date de **dernier montage**
* **Intervalle maximum** entre deux montages **avant vérification**
* Un **pointeur** vers **l'inode racine** du système de fichier

#### Inodes et bloc d'indirection

Les inodes sont regroupés par bloc dans un système de fichiers.  
La taille d'un inode est de 128 octets.  
Avec des blocs de 4Ko, il y aura 32 inodes par bloc d'inodes.  
Un inode contient des informations propres au fichier qu'il représente :

- **Type** de fichier: -, d, b, c, l, p, s
  - [-] standard
  - [d] dossier
  - [b] périphérique type bloc (partition, disque dur, volume logique, un clavier, une souris ...)
  - [l] lien symbolique
  - [p] pipe
  - [s] socket
- Mode ou **droit d'accès**: en octal, ex. 0644 (rw-r--r--)
- **Nombre de liens physiques**: si la valeur tombe à zéro, le fichier est considéré comme supprimé et l'inode rejoint la table des inodes libres
- **UID**: propriétaire du fichier
- **GID**: groupe propriétaire du fichier
- **Taille du fichier**: en octets
- **Champs date**:
  - atime dernier accès au fichier
  - ctime dernier changement des informations de l'inode
  - mtime dernier changement de données réelles du fichier
- **15 addresses**: pointant vers les blocs de données réelles du fichier

!!! warning "Attention!"
    L'inode ^^ne possède pas^^ le nom du fichier,  
    Celui-ci est renseigné dans le ^^répertoire contenant ce fichier^^

### Systèmes de fichiers Linux

#### EXT

Debian intègre l'**ext2**, **ext3** et **ext4** nativement.  
La différence entre l'**ext2** et l'**ext3** résident dans la journalisation, améliorant la récupération du système de fichier en cas de crash (ex. extinction brutale du PC)  
Le système de fichier **ext4** est une amélioration de l'ext3 mais réécrit de zéro, il s'agit du ssytème de fichier par défaut sur Debian.  
Il a pour avantage d'être peu sujet à la fragmentation grâce à la préallocation des blocs de données contigus, ce qui permet de reserver un certain nombre de bloc de données evitant ainsi d'exploser le fichier a de nombreux endroits sur le systèmes de fichier

Caractéristiques:  

* Taille maximale de fichier:           16 To (avec des blocs de 4Ko)
* Nombre maximal de fichiers:           4 milliards
* Taille maximale du nom de fichier:    255 octets
* Taille maximale de volume:            1 Eo (limité à 16 To par e2fsprogs avec des blocs de 4 Ko)

!!! tip ""
    Debian gère d'autre systèmes de fichiers  
    en autres NTFS, FAT, XFS, Btrfs, etc.

### Outils de gestion des systèmes de fichiers

#### Création de systèmes de fichiers

Le formatage va installer sur un périphérique de stockage un système de fichier. Sans un système de fichier, le périphérique de stockage est inutilisable.  
Un périphérique de stockage peut-être une partition (ex. /dev/sdc1) ou un volume logique (ex. /dev/vgsys/lvroot ou /dev/mapper/vgsys-lvhome)  

##### Commande `mkfs`

`mkfs`[fstype] <options> [périphérique de stockage]

Permets de mémoriser des commandes de création de systèmes de fichiers. C'est en réalité *une fausse commande* qui fait appel à la vraie commande de création.  
ex. `mkfs.ext4` est la commande `mke2fs` avec des options préconfigurées pour générer de l'`ext4`  

Pour savoir quelle est la commande utilisée par un `mkfs.[fstype]`, il suffit de consulter la commande `man mkfs.[fstype]`  

??? example "Création de système de fichiers"
    === "ext4 sur partition /dev/sda2"
        ```bash
        root@deb:~# mkfs.ext4 /dev/sda2
        ```
    === "ext4 sur volume Logique lv1"
        ```bash
        root@deb:~# mkfs.ext4 /dev/vggroup1/lv1
        ```
    === "Création système fichier NTFS"
        ```bash
        root@deb:~# mkfs.ntfs /dev/sde1
        ```
        Nécessite le paquet `ntfs-3g`

#### Modification de systèmes de fichiers

##### Commande `tune2fs`

`tune2fs <options> [périphérique de stockage]`

Permets de modifier les options d'un systèmes de fichier, il permet également de récupérer les informations du **superbloc**.  

Options :

- [-L] permet de modifier l'étiquette du système de fichiers
- [-l] permet d'afficher les informations du superbloc
- [-i] permet de modifier l'intervalle entre deux vérifications
- [-c] permet de modifier le nombre maximum de montages déclenchant une vérification

##### Commande `resize2fs`

`resize2fs <options> [périphérique de stockage]`

Permets de changer la taille d'un système de fichiers

#### Vérification d'un système de fichiers

##### Commande `fsck.<fstype>`

`fsck.<fstype> <options> [périphérique de stockage]`

Permets de contrôler l'intégrité des données présentes sur celui-ci, équivalent au "checkdisk" windows  
La vérification peut etre faite manuellement ou automatiqer au démarrage de la machine.  

#### Prise d'information

##### Commande `blkid`

`blkid <options> [périphérique de stockage]`

Permets d'afficher les informations relatives à un périphérique particulier.  Sans argument, elle affichera les informations relatives à tous les périphériques formatés.  

??? example "utilisation `blkid`"
    ```bash
    root@deb:~# blkid
    /dev/sda1: UUID="32a0cf22-91d5" TYPE="ext2" PARTUUID="732e6aa1-01"
    /dev/sda5: UUID="VDfsmc-gci2" TYPE="LVM2_member" PARTUUID="732e6aa1"
    /dev/sr0: UUID="2021" LABEL="Deb10" TYPE="iso9660 PTUUID="49506c1e" PTTYPE="dos"
    /dev/mapper/vgsys-lvroot : UUID="bffe9183-34a3" TYPE="ext4"
    /dev/mapper/vgsys-lvswap_1: UUID="d5d6cc72-21ed" TYPE="swap"
    ```

##### Commande `lsblk`

`lsblk <options> [périphérique de stockage]`

Permets d'afficher sous forme d'arborescence les informations relatives aux périphériques et aux systèmes de fichiers.  

??? example "utilisation commande `lsblk`
    === ""
        ```bash
        root@deb:~# lsblk
        NAME            MAJ:MIN  RM     SIZE    RO  TYPE    MOUNTPOINT
        sda             8:0      0      20G     0   disk
        ├─sda1          8:1      0      243M    0   part    /boot
        ├─sda2          8:2      0      1K      0   part
        └─sda5          8:5      0      19,8G   0   part
        ├─vgsys-lvroot  254:0    0      17,8G   0   lvm     /
        └─vgsys-lvswap  254:1    0      2G      0   lvm     [SWAP]
        sr0             11:0     1      3,4G    0   rom     /media/cdrom0
        ```v
    === "avec option [-f]"
        ```bash
        root@deb:~# lsblk -f # remplace les colonnes taille et permissions par LABEL et UUID
        NAME              FSTYPE        LABEL  UUID                     MOUNTPOINT
        sda
        ├─sda1            ext2          32a0cf22-91d5-548810a16c45      /boot
        ├─sda2
        └─sda5            LVM2_member   VDfsmc-gci2-R5IA-ozNO8x
        ├─vgsys-lvroot    ext4          bffe9183-34a3-49d4-b1a4         /
        └─vgsys-lvswap    swap          d5d6cc72-10f5-48e4-bd60         [SWAP]
        sdb
        └─sdb1            ext4  HOME    42237738-92a8-4ddf-9326         /home
        sr0                             iso9660 Deb10 2021-02-16        /media/cdrom0
        ```

### Monter des sytèmes de fichiers

Sous un système d'exploitation Linux, comme tout est fichier, la mise à disposition d'un **système de fichier** venant d'un espace de stockage (partition, LVM, RAID, etc.) se fera en définissant **un répertoire** comme **point de montage**.  
Ce **point de montage** sera le chemin par lequel accéder aux données du système de fichier.  
Pour un montage temporaire d'un système de fichiers, il est conseillé d'utiliser le répertoire `/mnt`.  
S'il faut monter plusieurs systèmes de fichiers de façon temporaire, il est possible de créer des sous-répertoire dans `/mnt`, pour chacun des systèmes de fichiers.  

#### Montage manuel avec `mount`

`mount <options> [périphérique source] [/point/de/montage]`

Permets de mettre à disposition un système de fichiers dans un répertoire.  

Options possibles :

- [-t[fstype]] Détermine le type de système de fichiers à monter
- [-o[option]] Permet de définir différentes options séparées par une virgule
- [sync/async] Active ou non l'utilisation de la mise en tampon en RAM des données avant écriture dans le système de fichiers. Par défaut: async
- [exec/noexec] Active la possibilité d'exécuter des fichiers exécutables présents sur le système de fichiers. Par défaut: exec
- [ro/rw] Monte le système de fichiers en lecture seule ou en lecture/écriture. Par défaut: rw
- [suid/nosuid] Active la possibilité d'exécuter les binaires avec l'interprétation du SUID positionné dessus. Par défaut: suid
- [remount] Permet de changer une ou des options de montage sans démonter le système de fichiers.

??? example "utilisation commande `mount`"
    ```bash
    root@deb:~# ls /mnt
    root@deb:~# mount -t ext4 /dev/sdc1 /mnt
    root@deb:~# ls /mnt
    contacts
    liste_taches.txt
    preparation
    root@deb:~#
    ```

#### Informations sur les montages

##### `mount` bis !

Bien que faiblement lisible elle permet de savoir "facilement" les options de montage appliquées.  

```bash
root@deb:~# mount
sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
[...]
/dev/mapper/vgsys/lvroot on / type ext4 (rw,relatime,errors=remount-ro,data ordered)
securityfs on /sys/kernel/security type securityfs
(rw,nosuid,nodev,noexec,relatime)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
tmpfs on /run/lock type tmpfs (rw,nosuid,nodev,noexec,relatime,size=5120K)
tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,mode=755)
[...]
/dev/mapper/vgsys/lvhome on /home type ext4 (rw,relatime,data=ordered)
/dev/sdc1 on /mnt type ext4 (rw,relatime,data=ordered)
/dev/sr0 on /media/cdrom0 type iso9660
(ro,nosuid,nodev,noexec,relatime,user)
```

##### Commande `findmnt`

Permet une meilleures lisibilité et surtout de prendre l'information sur un seul point de montage.  

```bash
root@deb:~# findmnt
TARGET    SOURCE                      FSTYPE        OPTIONS
/         /dev/ vgsys lvroot          ext4 rw,errors=remountro
├─ /sys   sysfs s                     ysfs rw,nosuid,noexec
│ ├─ /sys/kernel/security securityfs  rw,nosuid,nodev,noexec
│ ├─ /sys/fs/cgroup tmpfs             tmpfs
[...]
├─ /home     /dev/mapper/vgsys/lvhome ext4   rw,relatime,data ordered
├─ /mnt     /dev/sdc1                 ext4   rw,relatime,data ordered
└─ /media/cdrom0    /dev/sr0    iso9660 ro,nosuid,nodev,noexec,relatime
```

!!! tip ""
    Pour avoir l'information sur un seul point de montage, il suffit de la cibler:  
    ```bash
    root@deb:~# findmnt /dev/sdc1
    TARGET      SOURCE          FSTYPE          OPTIONS
     /mnt       /dev/sdc1       ext4    rw,relatime,data=ordered
     ```

##### Commande `df`

`df <options> [/point/de/montage]`

Permets de prendre des informations utiles sur les systèmes de fichiers montés  

Options:  

- [-h]: affiche la taille en puissance de 1024 (K, M, G...)
- [-i]: affiche les informations sur les inodes

```bash
root@deb:~# df -h
Sys. de fichiers            Taille   Utilisé   Dispo   Uti%  Monté sur
udev                        982M     0         982M    0%    /dev
tmpfs                       199M     22M       178M    11%   /run
/dev/mapper/vgsys-lvroot    18G      4,3G      13G     26%   /
```

##### Commande `du`

`du <options> [/point/de/montage]`  

Permets de connaitre la taille d'un répertoire.  

Options:  

- [-h]: affiche la taille en puissance de 1024 (K, M, G...)
- [-s]: n'affiche pas les sous-répertoires mais uniquement le répertoire en argument

```bash
root@deb:~# du -hs /etc
6.9M         /etc
```

#### Demonter un volume

##### Commande `umount`

`umount [périphérique de stockage]`  
ou  
`umount [point de montage]`

À utiliser par exemple pour retirer une clé USB ou un disque externe.  

```bash
root@deb:~# umount /mnt
```

#### Montage Automatique des systèmes de fichiers

`systemd` s'occupe d'effectués les montages automatiques au tout début du démarrage du système d'exploitation.  
La déclaration des montages automatiques est présente dans le fichier **/etc/fstab**

```bash
# /etc/fstab: static file system information.
# <file system>             <mount point> <type>        <options>       <dump> <pass>
/dev/mapper/vgsys/lvroot    /             ext4      errors=remount-ro   0      1
# /boot was on /dev/sda1 during installation
UUID=32a0cf22-548810a16c45 /boot          ext2          defaults        0      2
/dev/vgsys/lvhome          /home          ext4          defaults        0      2

/dev/mapper/vgsys-lvswap   none           swap          sw              0      0
/dev/sr0                   /media/cdrom0  udf,iso9660   user,noauto     0      0
```

^^Section **`file system`**:^^  

Cette colonne déclare le système à monter. Cette source peut être exprimée de plusieurs façons:  

- Via un **UUID**, la façon la plus sécurisée mais humainement plus difficile à reconnaître
- Via le **LABEL**, humainement plus pratique mais il pose un problème en cas de doublon
- Via le chemin du périphérique, on l'utilise principalement pour les **LVM** car il n'est pas possibile d'avoir plusieurs volume **LVM** ave le même nom sur un système
- Il est fortement déconseillé de l'utiliser pour des partitions (ex. /dev/sdb1)

^^Section **`mount point`**:^^  

Cette colonne déclare le répertoire de montage du système de fichiers.

^^Section **`type`**:^^  

Cette colonne déclare le type de système de fichiers. Il est possible de mettre `auto`mais cela ralentit le montage des périphériques.  

^^Section **`options`**:^^  

Cette colonne déclare les options de montage. Il est possible de mettre [defaults]  
Les options dans [defaults] sont: `async`, `nouser`, `exec`, `rw`, `auto`, `suid`, `dev`.  

^^Section **`dump`**:^^  

Cette colonne est rarement utilisée. Elle correspond à des paramètres de configuration de la commande `dump`.  

^^Section **`pass`**:^^  

Cette section permet de savoir si le système doit analyser l'intégrité du système de fichiers afin de corriger les problèmes avant de le monter. (commande `fsck`).  
Si la valeur est à 0(zéro): pas de vérification, si elle est supérieure à 0(zéro) alors le système analysera les systèmes de fichiers (1 pour la racine, 2 pour les autres).  

Afin de garantir la bonne intégration d'une nouvelle ligne dans le fichier **/etc/fstab**, il est important de la tester avant le rédemarrage du poste. Le moyen le plus simple est d'utiliser la commande `mount` en ne précisant que le point de montage.  

```bash
root@deb:~# mount /srv/data
mount: impossible de trouver /srv/data dans /etc/fstab
```

Dans cette exemple, la commande indique qu'elle ne trouve pas d'entrée de /srv/data dans le `fstab`  
Dans le cas où une ligne indique /srv/data dans le fichier `fstab` alors le montage se fera par rapport aux différentes déclarations.  
Si la commande ne renvoie rien, c'est que le montage s'est correctement effectué.  
