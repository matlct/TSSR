# Utilisation des Fichiers et Dossiers

Objectifs

- Découvrir le standard des dossiers Unix (FHS)
- Savoir créer, copier, déplacer et supprimer des fichiers et dossiers
- Savoir se situer et se déplacer dans l'arborescence de fichiers
- Utiliser les métacaractères de bash

## Arborescence de fichiers

### les chemins

- une racine unique : `/`
- Possibilité de se déplacer partout en une seule commande (sous réserve d'avoir les droits pour atteindre un dossier particulier)
- La connexion des disques, des partitions, des lecteurs réseau, des périphériques amovibles est prévue dans cette arborescence
- les médias et disques sont connectés à travers des dossiers nommée point de montage

La racine `/` est le point le plus haut de l'arborescence.
D'un point de vue pratique tous les autres répertoire sont enfaite des sous-répertoires de `/`.

??? quote "exemple de déplacement"
    === "Déplacement dans un dossier"
        ```bash
        user30@deb:~$ cd /home/user30/rep01
        user30@deb:~/rep01$
        ```
        Les dossiers sont séparés par le caractère `/`
    === "Déplacement vers un fichier"
        ```bash
        user30@deb:~$ cd /home/user30/rep01
        Bonjour le monde !
        ```
        Si un fichier doit être précisé, il est ajouté  
        après le dernier `/` sans espace  

À la connexion l'utilisateur est généralement dans son propre répertoire personnel.  
Ce répertoire est, la plupart du temps, au nom de l'utilisateur est contenu dans le dossier `/home`
Le chemin du répertoire personnel d'un utilisateur est contenu dans la variable d'environnement `$HOME`

??? example "répertoire personnel"
    === "user30"
        ```bash
        user30@deb:~$ echo $HOME
        /home/user30
        ```
    === "user29"
        ```bash
        user29@deb:~$ echo $HOME
        /home/user29
        ```

>Pour faire une analogie avec le monde Windows  
Cela correspond au `c:\users` qui contient également les répertoires des divers utilisateurs  

!!! tips "Chemin absolu et relatif"
    === "Chemin Absolu"
        ```bash
        user30@deb:~$ cd /home/user30/dossier01
        user30@deb:~$/dossier01$
        ```
        Ecrire le chemin complet depuis la racine  
        du système de fichier.
    === "Chemin Relatif"
        ```bash
        user30@deb:~$ cd dossier01
        user30deb:~$/dossier01$
        ```
        Ecriture depuis l'emplacement actuel

Chaque répertoire, en dehors de la racine, contient au minimum deux sous-répertoires particuliers:  

- `..` le répertoire parent

??? example "répertoire parent"
    === "Remontée d'un niveau"
        ```bash
        user30@deb:~/dossier01$ cd ..
        user30@deb:~$
        ```
    === "Remontée de niveau et redirection dans un dossier"
        ```bash
        user30@deb:~/dir02/dir03$ cd ../../dossier01
        user30@deb:~/dossier01$
        ```

- `.` le répertoire courant (également utile pour lancer des scripts)

??? example "répertoire courant"
    === "Spécifier un répertoire courant"
        ```bash
        user30@deb:~$ find . -name "*.txt"
        ./aFaire.txt
        ./fic01.txt
        ./contacts.txt
        ```
    === "Lancement de script"
        ```bash
        user30@deb:~/scripts$ ./monscript.sh
        ```

****

## Le FHS (Filesystem Hierarchy Standard)

Définis l'arborescence et le contenu des principaux répertoires des systèmes de fichiers des systèmes d'exploitation GNU/Linux et de la plupart des systèmes Unix.  

### Répertoire d'utilisateur et de montage

| Répertoire | Description                                                            |
| :--------: | :--------------------------------------------------------------------- |
|   /home    | Répertoire contenant les dossiers de tous les utilisateurs hormis root |
| /home/dom  | Répertoire de l'utilisateur dont le login est dom                      |
|   /root    | Répertoire personnel de l'utilisateur root                             |
|            |                                                                        |
|   /media   | Points de montages des médias amovibles (clé USB...)                   |
|    /mnt    | Points de montage temporaire de volumes disques                       |

/media est l'équivalent du point de montage sur Windows le e:\ ou d:\

****

### Répertoire de commande et applications

|   Répertoire   | Description                                                                               |
| :------------: | :---------------------------------------------------------------------------------------- |
|      /bin      | Commandes système disponibles aux utilisateurs standards.  Peut être un lien de /usr/bin |
|    /usr/bin    | Commandes système disponibles aux utilisateurs standards                                 |
| /usr/local/bin | Commandes système disponibles aux utilisateurs standards                                 |
|     /sbin      | Commandes d'administration du super-utilisateur root. Peut-être un lien de /usr/bin       |
|    /usr/bin    | Commandes d'administration du super-utilisateur root                                      |
| /usr/local/bin | Commandes d'administration du super-utilisateur root                                      |
|      /opt      | Répertoires pour les applications tierces. (Compilation manuelle de logiciels)            |

/sbin peut être vu comme l'équivalent de c:\windows\system32 qui contient des exécutables liés au système

****

### Répertoire du système

| Répertoire | Description                                                                   |
| :--------: | ----------------------------------------------------------------------------- |
|   /boot    | Fichiers nécessaires au démarrage du système                                  |
|    /dev    | Liaisons des périphériques (disques, claviers, écrans...)                     |
|    /etc    | Contiens les fichiers de paramètres du système et de ses services             |
|    /var    | Données de tailles variables (sites web, bases de données, journaux...)       |
|  /var/log  | Dossiers contenant les fichiers de journalisation du système                  |
|    /lib    | Contient les librairies principales utiles aux exécutables dans /bin et /sbin |
|    /tmp    | Fichiers temporaires                                                          |
|   /proc    | Répertoire virtuel contenant les fichiers de paramètres du noyau              |
|    /sys    | Répertoire virtuel contenant les informations des périphériques, pilotes...   |

!!! warning ""
    === "/etc"
        Equivalent de la base de registre windows
    === "/tmp"
        Dossier vidé a chaque redémarrage du systeme

## Métadonnées

Un fichier sous Linux est généralement composé de 3 parties :  

<!-- insérer schéma inode support cours -->

1. Nom du fichier
2. Inode / métadonnées
3. Données

Pour afficher l'inode d'un fichier, l'option [-i] doit être rajoutée à la commande `ls`

??? info " inode d'un fichier"
    ```bash
    user30@deb:~$ ls -li
    10557 -rw-r--r-- 1 user30 user30    29 juil. 21 09:36 contact
    35270 drwxr-xr-x 3 user30 user30  4096 juil. 20 12:38 perso
     1486 -rw-r--r-- 1 user30 user30    77 juil. 21 14:40 tel2018
    ```
    les inodes sont en effet visible juste avant les permissions et droits

Les `inodes` sont enregistrés dans une table d'inode, index ou le système pourra trouver facilement les informations de ces inodes de manière à aller les lires,  
chaque partitions, chaque disque, chaque système de fichiers aura sa propre table d'inode et ne pourra la partager avec une autre partition ou un autre disque.  

l'inode contient des informations telles que:  

- le type de fichier
- les identifiants de l'utilisateur et du groupe propriétaire du fichier
- les permissions
- les dates et heures de dernière modification et d'accès
- la taille du fichier
- les pointeurs vers les données du fichier.

!!! Warning "l'inode **ne contient pas** le nom du fichier"

Ainsi quand un **utilisateur** tente d'accéder à un fichier par **son nom**  
Celui-ci renverra vers l'**inode** du fichier qui sera lu et si les **permissions** autorisent l'accès au fichier alors les données seront accessibles grâce aux **pointeurs vers les blocs de données**.

****

## Lister des fichiers et dossiers

### commande `ls`

Permets d'obtenir des informations sur un ou plusieurs fichiers, sur le contenu d'un ou plusieurs dossiers avec plus ou moins de détail  
sans option, elle liste le contenu de l'emplacement actuel et affiche simplement les fichiers et le dossier présent.  

??? example "`ls`"
    ```bash
    user30@deb:~$ ls
    aFaire.txt  dossier01   fic01.txt
    contacts.txt    Edition
    ```

Avec l'option `-l` le format long est activé, cela donne plus de détail:

??? example "`ls -l`"
    === "ls -l"
        ```bash
        user30@deb:~$ ls -l
        total 12
        -rw-r--r-- 1 user30 user30   36 juin   26 12:08 aFaire.txt
        -rw-r--r-- 1 user30 user30    0 juil.   2 10:47 contacts.txt
        drwxr-xr-x 2 user30 user30 4096 juil.   1 11:04 dossier01
        -rw------- 1 user30 user30  586 avril  16 17:26 Edition
        -rw-r--r-- 1 user30 user30    0 juil.   2 10:47 fic01.txt
        ```
    === "ls -lh"
        ```bash
        user30@deb:~$ ls -l
        total 12
        -rw-r--r-- 1 user30 user30     36 juin   26 12:08 aFaire.txt
        -rw-r--r-- 1 user30 user30      0 juil.   2 10:47 contacts.txt
        drwxr-xr-x 2 user30 user30    4Ko juil.   1 11:04 dossier01
        -rw------- 1 user30 user30  0.5Ko avril  16 17:26 Edition
        -rw-r--r-- 1 user30 user30      0 juil.   2 10:47 fic01.txt
        ```
        Permet la conversion de la taille du fichier en format plus lisible

<!-- insérer img support cours détail des colonnes format long -->

1. Type de fichier et droits
2. Nombre de liens physiques
3. Utilisateur propriétaire
4. Groupe propriétaire
5. Taille du fichier en octet
6. Date/Heure de modification
7. Nom du fichier ou dossier

les différents types de fichiers:  
`-` fichier standard  
`d` répertoire  
`l` lien symbolique (équivalent au raccourci Windows)  
`b` périphérique de type bloc (disque dur, clé USB...)  
`c` périphérique de type caractère (clavier, écran, souris)  
`p` pipe (|) nommée  
`s` socket Unix  

Avec l'option `-a` permet d'afficher les fichiers cachés du système (comportant toujours un `.` au début de leurs noms)

??? example "Utilisation de `ls`"
    === "ls -a"
        ```bash
        user30@deb:~$ ls -a
        .       .bash_history    .bashrc         fic01.txt
        ..      .bash_logout     contacts.txt    Edition
        ```
        Sans le `-a` seul les fichiers contact, fic01 et edition  
        seraient visibles
    === "ls -A"
        ```
        user30@deb:~$ ls -A
        aFaire.txt      .bash_logout     .bashrc    Edition
        .bash_history   contacts.txt     fic01.txt  .profile
        ```
        Meme sortie que la précédente sans les `.` & `..`
    === "ls -lA"
        ```bash
        user30@deb:~$ ls -lA
        total 40
        -rw-r--r-- 1 user30 user30   36 juin   26   12:08 aFaire.txt
        -rw------- 1 user30 user30  757 juil.   2   02:21 .bash_history
        -rw-r--r-- 1 user30 user30  220 avril  18    2019 .bash_logout
        ```
        Meme principe que la version précédente mais celle-ci est  
        combinée avec une option de sortie longue `-l`

l'option `-ld`  
permet d'afficher le détail du dossier avec la même syntaxe que l'option `l` pour un fichier  
nécessite absolument l'utilisation d'un argument (le dossier dont on souhaite voir les détails)  
dans le cas d'aucun argument inscrit seul le dossier `.` sera visualisé.

l'option `-lt`  
Permets de trier par ordre de modification du plus récent au plus ancien

l'option `-lr`  
Permets de trier par ordre alphabétique décroissant

l'option `-lrt`
Permets de combiner les 2 options précédentes.  

### Commande `file`

Elle permet de connaitre le *type de données* d'un fichier

??? example "Commande file"
    === "texte"
        ```bash
        user30@deb:~$ file Edition
        Edition: ASCII text
        ```
    === "lien symbolique"
        ```bash
        user30@deb:~$ file edition1.txt
        edition1.txt: symbolic link to Edition
        ```
    === "Dossier"
        ```bash
        user30@deb:~$file dirtest01/
        dirtest01/: directory
        ```
    === "Executable"
        ```bash
        user30@deb:~$ file /bin/bash
        /bin/bash: ELF 64-bit LSB pie executable, x86-64, version 1 [...]
        ```
    === "librairie partagée"
        ```bash
        user30@deb:~$ file /usr/lib/libDeployPkg.so.0.0.0
        /usr/lib/libDeployPkg.so.0.0.0: ELF 64-bit LSB shared object [...]
        ```
    === "Périphérique spécial"
        ```bash
        user30@deb:~$ file /dev/sda1
        /dev/sda1: block special (8/1)
        ```

****

## Manipuler les dossiers

### commande `cd`

Utiliser pour ce déplacé dans l'arborescence Linux peut être utilisé aussi bien avec des chemins absolus et relatifs  
Elle s'utilise souvent sans option, utilisé sans argument elle permet de revenir dans le répertoire personnel de l'utilisateur (équivalent à un $HOME ou cd ~)
`cd -` permet de revenir a l'élément précédent

```bash
user30@deb:~$ cd dossier01
user30@deb:~/dossier01$ cd $HOME
user30@deb:~$ cd dir02/dir03
user30@deb:~/dir02/dir03$ cd
user30@deb:~/ cd -
user30@deb:~/dir02/dir03$ cd ~
user30@deb:~$
```

****

### commande `mkdir`

Permet la création de dossiers  
`mkdir` pour make directory

??? example "`mkdir`"
    === "mkdir"
        ```bash
        user30@deb:~$ mkdir dossier01
        ```
        Création d'un dossier sans retour  
        de l'action
    === "mkdir -v"
        ```bash
        user30@deb:~$ mkdir -v dossier02
        mkdir: création du répertoire 'dossier02'
        ```
        Permet d'avoir un retour sur la création  
        du dossier via la `-v`
    === "mkdir -p -v dir02/dir03"
        ```bash
        user30@deb:~$ mkdir -p -v dir02/dir03
        mkdir: création du répertoire 'dir02'
        mkdir; création du répertoire 'dir02/dir03'
        ```
        Permet la création d'un dossier et d'un sous dossier  
        directement avec cette commande via l'option [-p]

****

### commande `rmdir`

Permet la suppression d'un dossier
`rmdir` pour remove directory
Ne supprime les dossiers uniquement si ceux-ci sont vides.

??? example "`rmdir`"
    === "rmdir -v"
        ```bash
        user30@deb:~$ rmdir -v dossier01
        rmdir: suppression du répertoire, 'dossier01'
        ```
        Permet la suppression du 'dossier01' avec un retour  
        de l'action réalisé grave a `-v`
    === "rmdir -pv dire02/dir03"
        ```bash
        user30@deb:~$ rmdir -pv dir02/dir03
        rmdir: suppression du répertoire, 'dir02/dir03'
        rmdir: suppression du répertoire, 'dir02'
        user30@deb:~$
        ```
        Permet la suppression d'un dossier et de son  
        sous dossier.

****

## Manipulation des fichiers

### Commande `touch`

Permets de créer un fichier  

`touch <nouveau_fichier>`  

>Sur un fichier existant ne l'écrasera pas, mais modifiera la date de dernière modification du fichier

??? example "touch"
    ```bash
    user30@deb:~$ ls fichier01.txt
    ls: impossible d'acceéder à 'fichier01.txt': Aucun fichier ou dossier de ce type
    user30@deb:~$ touch fichier01.txt
    user30@deb:~$ ls -l fichier01.txt
    -rw-r--r-- 1 user30 user30 0 juil.  3 11:12 fichier01.txt
    ```

****

### Commande `mv`

Permets de déplacer des fichiers ou des répertoires  
Permets également de renommer un fichier  
Fonctionne avec 2 arguments la source et la cible.  

!!! warning "Options [-f -i -v -r]"
    === "[-f] "force""
        force le déplacement du fichier  
        Si un fichier portant le même nom est deja présent  
        dans le dossier celui-ci sera ecrasé
    === "[-i] "interactif""
        au contraire de [-f] cette option demandera une confirmation avant l'écrasement d'un fichier
    === "[-v]"
        affiche un message d'etat de l'action
    === "[-r] recursivité"
        permet lors de copie, ou de suppression, de selectionner un dossier et tous son contenu  
        (sous-dossier, fichier...)

??? example "mv"
    === "`mv` déplacement sans confirmation"
        ```bash
        user30@deb:~$ mv fichier01.txt /tmp/
        user30@deb:~$ ls /tmp/fichier01.txt
        /tmp/fichier01.txt
        ```
        Cela déplace le fichier sans donner plus d'informations
    === "`mv -iv` déplacement avec confirmation"
        ```bash
        user30@deb:~$ mv -iv fic01.txt /tmp
        mv : voulez-vous écraser '/tmp/fic01.txt' ? o
        renommé'fic01.txt' -> '/tmp/fic01.txt'
        ```
        Cela demande une confirmation avant le déplacement
    === "`mv -v` renommer un fichier"
        ```bash
        user30@deb:~$ mv -v aFaire.txt Fait.txt
        renommé'aFaire.txt' -> 'Fait.txt'
        ```
        Permet de renommer un fichier  

****

### Commande `cp`

Permets de copier des fichiers et dossiers sous Linux.  
Très proche de `mv` en termes de fonctionnement.  
Elle nécessite a minima un fichier source en 1er argument puis le fichier cible en 2eme argument  
les options [-f -i -v] ayant les mêmes fonctionnalités que la commande `mv`

??? example "`cp`"
    === "Simple copie"
        ```bash
        user30@deb:~$ cp -v contacts.txt contacts2.txt
        'contacts.txt' -> 'contacts2.txt"
        ```
    === "Copie d'un fichier vers un autre emplacement"
        ```bash
        user30@deb:~$ cp -v contacts.txt ./dossier2/
        'contacts.txt' -> './dossier2/contacts.txt'
        ```
    === "Copie dans un autre dossier avec un nouveau nom"
        ```bash
        user30@deb:~$ cp -v contacts.txt /tmp/contacts3
        'contacts.txt' -> '/tmp/contacts3'
        ```

il y a possibilité de copier plusieurs fichiers ou dossiers vers un dossier cible existant via la syntaxe

`cp [-p -r -v] <ficsource> <ficsource> <dirsource> <dossiercible>`

>penser à créer (ou du moins que le dossier cible soit déjà existant)
la commande `cp` ne va pas créer de dossiers à la volée

??? example "copie plusieurs fichiers"
    ```bash
    user30@deb:~$ mkdir perso
    user30@deb:~$ cp -rpv contacts.txt contacts-2.txt dirtest01/ perso/
    dirtest01/ perso/
    'contacts-2020.txt' -> 'perso/contacts-2020.txt'
    'contacts.txt' -> 'perso/contacts.txt'
    'dirtest01/' -> 'perso/dirtest01'
    'dirtest01/fic1M' -> 'perso/dirtest01/fic1M'
    'dirtest01/fic10M' -> 'perso/dirtest01/fic10M'
    dirtest01/fic01.txt' -> 'perso/dirtest01/fic01.txt'
    ```

`-r` nécessaire si un dossier fait partie des sources et enclenche la récursivité. Cela copie l'intégralité du répertoire (sous-dossier, fichier.).  
`-p` Permets de préserver les permissions des éléments sources.

****

### Commande `rm`

`rm [-f -i -r -v] <fic1> <fic1>`

Permets de supprimer des fichiers.

>La commande `rm` est destructrice, les éléments supprimés ne sont pas déplacés dans une corbeille.  
les éléments sont réellement supprimés et non récupérable  
supprimé un dossier et son contenu en utilisant l'option -r (en cas d'oubli de cette option, un message d'erreur sera retourné)

??? example "Suppression des fichiers/dossiers"
    === "Suppression de 2 fichiers"
        ```bash
        user30@deb:~$ rm -v /tmp/fichier01.txt contacts-2.txt
        '/tmp/fichier01.txt' supprimé
        'contacts-2.txt' supprimé
        ```
    === "Supression d'un dossier avec [-r]"
        ```bash
        user30@deb:~$ rm -rv dirtest01/
        'dirtest01/fic1M' supprimé
        'dirtest01/fic50k' supprimé
        'dirtest01/fichier01.txt' supprimé
        'dirtest01/fic100M' supprimé
        'dirtest01/fic10M' supprimé
        répertoire 'dirtest01/' supprimé
        ```

!!! danger " [rm -rf] "
    les options [-r] & [-f] utilisées conjointement sont destructrices
    `rm -rf <dossier>`
    ```bash
    user30@deb:~$ rm -rf $HOME
    ```
    Dans cet exemple le repertoire personnel de l'utilsateur sera effacé

****

## Métacaractères and Co

il s'agit de :

- caractères spéciaux de substitution afin d'effectuer des recherches plus globales
- Mécanisme important du bash
- Globalement spécifiques aux shells Unix/Linux

****

### caracteres[*]

Surnommé wildcard,  
permet de récupérer n'importe quel caractère peut importe le nombre.

!!! example " Caractères [*] "
    === "*.txt"
        ```bash
        user30@deb:~$ ls *.txt
        contacts.txt    Faits.txt    liste.txt    Tel-2020.txt
        edition1.txt    12.txt       Tel2018.txt  tel2018.txt
        ```
        Affiche tout les fichiers ayant comme extension .txt
    === "tel*"
        ```bash
        user30@deb:~$ ls tel*
        tel2018    tel2018.txt    tel2020
        ```
        Ici on recupère tout les fichiers commencant par [tel]

****

### caractères `?`

Assez proche dans son fonctionnement, on trouvera le `?`.  
Celui-ci indique un caractère quelconque et un seul.

!!! tips ""
    ```bash
    user30@deb:~$ ls tel20??
    tel2018    tel2020    tel20xx
    ```
    Dans cet exemple, on liste tous les fichiers qui commencent par tel20  
    et possèdent ensuite deux caractères quelconque.

****

### caractère `[..]` et `[..-..]`

On peut définir, de manière plus précise, des listes de caractères pouvant valider notre sélection.  
On utilise les syntaxes `[..]` et `[..-..]`

- `[..]` indique la possibilité d'utiliser un caractère parmi ceux indiqués.
- `[..-..]` indique la possibilité d'utiliser un caractère présent dans un intervalle

!!! example ""
    === "chiffres"
        ```bash
        user30@deb:~$ ls tel20[12][0-9]
        tel2018    tel2020
        ```
        Le premier choix [12] indique le choix entre le chiffre 1 ou le chiffre 2  
        La deuxieme partie [0-9] indique un caractère entre 0 et 9.
    === "Caractères"
        ```bash
        user30@deb:~$ ls [tT][a-zA-Z]*
        tel2018    Tel2018    tel2020    Tel-2020.txt    toto    tel20xx
        ```
        Ici on donne le choix entre `t` miniscule ou `T` majuscule [tT].  
        Ensuite [a-zA-Z] précise que l'on veut une lettre minuscule ou majuscule.  
        Enfin [*] permet d'indiquer n'importe quel caractère à suivre, ou aucun.
    === "Mélange chiffre caractères"
        ```bash
        user30@deb:~$ ls [tT]*[0-9][0-9]
        tel2018    tel2020    Tel2018
        ```
        Ici on souhaite un fichier commencant par la lettre Minuscule ou Majuscule  
        N'importe quelle caractère entre les deux  
        Mais cela doit obligatoirement ce finir par 2 chiffres  

Si le caractère `^` ou `!` est ajouté au crochet

- [^.] / [^.-..]
- [!.] / [!.-..]

Il sera possible d'inverser la sélection.  
Dans ce cas, il sera demandé d'afficher tous les fichiers et dossiers ne commençant pas par la lettre `t`

****

### autres caractères

Le bash permet également l'utilisation d'autres caractères spéciaux avec les utilisations suivantes :

| symbole                                                                         | nom               | Description                                                                                 |
| ------------------------------------------------------------------------------- | ----------------- | ------------------------------------------------------------------------------------------- |
| ' '                                                                             | Simples quotes    | Banalise tous les caractères situés entre les quotes                                        |
| " "                                                                             | Doubles quotes    | Banalise tous *SAUF $, \ et `(Backquote)                                                    |
| $                                                                               | Dollar            | Il permet d'afficher le contenu d'une variable                                              |
| \                                                                               | Antislash         | Il banalise le caractère qui le suit ($, *, ?..) et permet de l'afficher dans l'interpreter |
| $(..)                                                                           | Dollar parenthèse | Récupérer le résultat de la commande entre parenthèse, par exemple dans une variable        |
| `     | Backquotes        | Même résultat que ci-dessus, mais syntaxe dépréciée |                   |                                                                                             |

****

### Facteurs d'occurrence

Les *facteurs d'occurrence* permettent de définir le nombre de fois ou une recherche est effectuée.  

- ?(..) 0 à 1 fois : optionnel une seule fois
- *(.) 0 à n fois : optionnel illimité en nombre 
- +(.) 1 à n fois : au moins une fois
- @(.) 1 fois : exactement une fois
- !(..) l'expression entre parenthèses ne sera pas présente  

!!! example ""
    ```bash
    user30@deb:~$ ls -d +([eE])*
    Edition    edition1.txt    eedition    Eedition    eeeeexemple
    ```
    La recherche +([eE]) indique que l'on veut au moins une fois le caractère e en majuscule ou en minuscule
    Completer avec * pour lister tous les fichiers commençant par un e

!!! example ""
    ```bash
    user30@deb:~$ ls -d !(*.txt)
    contacts2020    dirtest01    Edition    eedition    Eedition
    eeeeexemple     newcontacts  perso      tel2018     tel2020    toto
    ```
    La recherche !(*.txt) indique tous les fichiers sauf ceux se terminant par l'extension txt.

N. B. L'option du shell `extglob` doit être activée. Cela se fait et vérifie avec la commande **shopt**

!!! tips "shopt"
    ```bash
    user30@deb:~$ shopt -s extglob
    user30@deb:~$ shopt
    [...]
    extglob on
    [...]
    ```

Possibilité d'utiliser les accolades {} pour offrir un choix parmi plusieurs possibilités.  
Par exemple pour rechercher plusieurs extensions de fichiers à la fois.  
Cette syntaxe ne se limite pas à la recherche.  

??? example " {} "
    === "Recherche"
        ```bash
        user30@deb:~$ls images/*.{jpeg,gif,png}
        images/icon1.gif    images/icon2.gif    images/logo.png
        images/wallp.jpeg
        ```
    === "Création de répertoire"
        ```bash
        user30@deb:~$ mkdir -v {image,video}
        mkdir: création du répertoire 'images'
        mkdir: création du répertoire 'video'
        ```
