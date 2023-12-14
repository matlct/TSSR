# Shell Bash

## Découverte du Shell Bash

## Découverte du shell Linux

Le shell est l’interface par laquelle l’utilisateur va interagir avec le système d’exploitation et les programmes disponibles.  
Le shell est un interpréteur de commandes.  
On parle également de CLI (Command Line Interface).

!!! example "Ligne de commande shell"
    ````sh
    user30@deb:~$ echo "Bonjour le monde"  
    Bonjour le monde  
    ````

<!-- insérer schéma du shell dispo sur support cours-->

Un shell traite les informations sous forme de flux. Par défaut le shell va lire une commande à partir du flux d’entrée, une saisie au clavier, ce flux va ce nommer `stdin (0)`(Standard Input) le système vas traiter la commande et restituer le résultat normal sur la sortie standard `stdout (1)`(Standard Output).
un second flux sera disponible en sortie, celui-ci traite des éventuelles erreurs retournées par une commande, il se nomme `stderr (2)`

???+ example "Ligne de commande shell"
    === "commande shell"
        ```bash
        user30@deb:~$ echo "Bonjour le monde"
        Bonjour le monde
        ```
    === "stdin"
        ```bash
        user30@deb:~$ echo "Bonjour le monde"
        ```
    === "stdout"
        ```bash
        Bonjour le monde
        ```

???+ example "ligne de commande shell avec erreur"
    === "stdin (0)"
        ```bash
        user30@deb:~$ cat Bonjour
        ```
    === "stderr (2)"
        ```bash
        cat: Bonjour: Aucun fichier ou dossier de ce type
        ```

Dans le monde UNIX/Linux il existe différent shell en voici quelques-uns (liste non exhaustive)

- Bourne Shell : sh
  - écrit par Steve Bourne
  - Apparait dans Unix v7
- C Shell : csh/tcsh
  - Écrit par Bill Joy
  - Inspiré du langage C
- KornShell : ksh
  - Écrit par David Korn
  - Compatible Bourne Shell, il reprend des éléments du C Shell

Le Shell principal de Linux est le Bash, (*B*o(u)rn(e) *A*gain *Sh*ell) : bash
Shell principal des distributions GNU/Linux
Réécriture de Bourne par Brian Fox au sein du projet GNU
Implémentations libres de Bourne Shell
Quelques améliorations de bas par rapport à Bourne

- Historique de commandes
- Autocomplétion
- Alias de commande

L’utilisation de la CLI impose le respect de certaine règles, sans celle-ci il ne sera pas possible d’utiliser le correctement le système, nous aurons des messages d’erreur sans cesse.

Un shell Linux est sensible à la casse

???+ example ""
    === "Correct"
        ```bash
        user30@deb~$ echo "bonjour le monde"  
        Bonjour le monde
        ```
    === "Erreur"
        ```bash
        user30@deb~$ Echo "bonjour le monde"  
        -bash: Echo : commande introuvable
        ```

La commande doit toujours être située en premier dans l’instruction après le prompt  
La commande peut être suivie par des options, puis des arguments, le tout séparé par des espaces.  
Les options sont en général précédé du signe `- ou +`elle peuvent aussi ne comporter aucun signe, elles peuvent être séparées par des espaces ou regroupées ensemble lorsqu’il s’agit d’option simple.
Les arguments sont les éléments utiles de la commande, à savoir la donnée que l’on doit chercher à traiter.  

!!! abstract ""
    === "Example de Shell"
        ```bash
        user30@LinuxUtil:~$ ls -l /home/user30  
        total 8  
        -rw-r--r-- 1 user30 36 juin 26 12:08 aFaire.txt  
        -rw------- 1 user30 586 avril 16 17:26 Edition  
        ```
    === "Prompt"
        ```bash
        user30@LinuxUtil:~$
        ```
    === "Commande"
        ```bash
        ls
        ```
    === "Options"
        ```bash
        -l
        ```
        indique une réponse longue
    === "Arguments"
        ```bash
        /home/user30
        ```
    === "Résultat de la commande"
        total 8 = signifie que 8 fichiers on été trouvé  
        dans notre cas seul 2 sont affichés

Quelques exemples de commandes  

`who` Commande simple sans argument  
`ls /etc` Commande avec un argument
`head -n 5 /etc/pam.conf` Commande avec une option et un argument
`cp /tmp/fic1 $HOME` Commande avec 2 arguments
`tar xzvf archive.tar.gz` Commande avec quatre options (sans signe + ou -) et un argument d’option  

## Compte "Root"

Sous Linux et Unix, le compte **root** est le compte du **super administrateur**  
L’invite de commande root utilise le caractère `#`(permet de différencier une session super administrateur d’une session simple utilisateur)
Un administrateur utilisera son compte habituel pour les opérations courantes puis effectuera ponctuellement une élévation de privilèges selon les besoins.  
Pour des raisons de sécurité, il est fortement déconseillé de se connecter en root. Sur les distributions Debian la connexion en root est nativement interdite.  
Il faudra se connecter avec un compte utilisateur standard, disposant des droits suffisant, puis faire une élévation de privilèges en tant que **root**

## Premières commandes

La syntaxe des commandes est représentée ainsi :  

```bash
commande [options] <Argument>
```

!!! tips "Rappel"
    l'espace est un séparateur d'expressions entre  
    la commande, les options et les arguments.  

### `logname`

```bash
user12@srv-formateur:~$ logname  
user12
```

### `id`

```bash
user12@srv-formateur:~$ id  
uid=1182(user12) gid=1210(grp4) groupes=1210(grp4)  
```
uid : identifiant unique
gid : identifiant du groupe principal de l’utilisateur

```bash
user12@srv-formateur:~$ id -u user11  
1181  
```
Permet de récupérer des informations sur un autre utilisateur  
l’option `-u`permet de ne récupérer que l’uid de l’utilisateur et non c’est information complète.  

### `who`

Affiche les utilisateurs connectés au système.

```bash
user12@srv-formateur:~$ who
user03   pts/0        2023-07-03 16:54 (172.25.128.117)
eni      pts/1        2023-07-03 17:27 (172.25.128.89)
user04   pts/2        2023-07-03 16:53 (172.25.128.41)
user12   pts/3        2023-07-03 18:16 (172.25.128.2)
user15   pts/4        2023-07-03 17:36 (172.25.128.57)
user15   pts/5        2023-07-03 17:37 (172.25.128.137)
user03   pts/9        2023-07-03 16:55 (172.25.128.117)
```

affiche :  

- l’utilisateur, le terminal, la date et l’heure de la connexion

options disponibles [-H, -q, -u] (liste non exhaustive)

- -H : Heading n’affiche que les en-tête de colonne

```bash
user12@srv-formateur:~$ who -H
NOM      LIGNE        HEURE            COMMENTAIRE
user03   pts/0        2023-07-03 16:54 (172.25.128.117)
eni      pts/1        2023-07-03 17:27 (172.25.128.89)
user04   pts/2        2023-07-03 18:23 (172.25.128.41)
user12   pts/3        2023-07-03 18:16 (172.25.128.2)
user15   pts/4        2023-07-03 17:36 (172.25.128.57)
user15   pts/5        2023-07-03 17:37 (172.25.128.137)
user03   pts/9        2023-07-03 16:55 (172.25.128.117)
```

- -q : uniquement les connexions actives

```bash
user12@srv-formateur:~$ who -q
user03 eni user04 user12 user15 user15 user03
nombre d'utilisateurs : 7
```

- -u : affiche des informations complémentaires (jumelé à l’option -H pour les en-têtes)

```bash
user12@srv-formateur:~$ who -u -H
NOM      LIGNE        HEURE                   PID COMMENTAIRE
user03   pts/0        2023-07-03 16:54 01:31        4006 (172.25.128.117)
eni      pts/1        2023-07-03 17:27 00:05        4503 (172.25.128.89)
user04   pts/2        2023-07-03 18:23 00:01        5242 (172.25.128.41)
user12   pts/3        2023-07-03 18:16   .          5149 (172.25.128.2)
user15   pts/4        2023-07-03 17:36 00:03        4599 (172.25.128.57)
user15   pts/5        2023-07-03 17:37 00:49        4634 (172.25.128.137)
user03   pts/9        2023-07-03 16:55 01:30        4074 (172.25.128.117)
```

`who am i` donne des informations sur l’utilisateur de la session courante uniquement  

```bash
user12@srv-formateur:~$ who am i
user12   pts/3        2023-07-03 18:16 (172.25.128.2)
```

### `passwd [options]`

Permets de modifier le mot de passe utilisateur  
Si une erreur est effectuée durant le changement le système le précisera et l’ancien mdp ne sera pas changé  

```bash
user12@srv-formateur:~$ passwd
Changement du mot de passe pour user12.
Current password:
Nouveau mot de passe :
Retapez le nouveau mot de passe :
passwd: password updated successfully
```

`passwd -S` Affiche les informations sur le mot de passe actuel

```bash
user12@srv-formateur:~$ passwd -S
user12 P 07/03/2023 0 99999 7 -1
```

!!! warning "mot de passe"
    Des exigences de complexité sur les mot de passe sont présentes  
    un mot de passe de base sur Linux devra:  
    - 7 caractères minimum  
    - ne pas etre trop silimaire du précedent mot de passe  
    - ne doit pas etre basé sur un mot du dictionnaire  

### `date [options] <+format>`

Permets d’afficher les informations de date et d’heure du système  
En contexte administrateur (root) `date`permet également de modifier la date et l’heure du système d’exploitation

```bash
user12@srv-formateur:~$ date
lundi 3 juillet 2023, 18:41:46 (UTC+0200)
```

Formater la sortie de `date`

```bash
user12@srv-formateur:~$ date "+%nBonjour, nous sommes le %A %d %B %Y.%nIl est %Hh%Mm"

Bonjour, nous sommes le lundi 03 juillet 2023.
Il est 18h43m
```
!!! Warning inline end "Attention"
    Le signe `+` ne doit etre utilisé qu'au début de la séquence  
    Si un autre + est utilsé il sera consideré comme un caractere  
    a ajouter a la sortie écran 

Après la commande `date`les `"`la double quote permet d’utiliser des espaces sans qu’il soit pris pour des séparateurs d’expression.  
le `+` indique a la commande `date`qu’elle va devoir interpréter ce qui suit en manipulant le format de sortie.
Le caractère `%n`indique un saut de ligne.
Les `%A`, `%d`, `%B`, `%Y` permettent de récupérer les informations`lundi`, `03`, `juillet`, `2023`
Les `%H`, `%M` permettent de récupérer les informations`Heure`, `Minutes`  

Quelques options de format de `date`
<!-- insérer capture d’écran cours -->

### `cal <mois> <année>`

Permets d’afficher le calendrier du mois et de l’année indiquée  

```bash
user12@srv-formateur:~$ cal
    Juillet 2023
di lu ma me je ve sa
                   1
 2  3  4  5  6  7  8  
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
```

```bash
user12@srv-formateur:~$ cal 08 1987
     Août 1987
di lu ma me je ve sa
                   1
 2  3  4  5  6  7  8  
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
```

### `tty`

Permets d’afficher le nom du terminal utilisé par la session actuelle  

```bash
user12@srv-formateur:~$ tty
/dev/pts/4
```

`pts` signifie pseudoterminal (uniquement en connexion distante)

### `pwd`

Permet d’afficher à quel endroit de l’arborescence on se trouve  
(pwd : print working directory)  

Dans une configuration native Debian Linux, l’information est directement présente dans le prompt entre le : et $ s’affiche l’emplacement actuel.  

Dans un environnement CentOS est indiqué uniquement le nom du dossier courant et non le chemin complet de celui-ci  

```bash
user12@srv-formateur:~$ pwd
/home/user12
```

## Découverte des variables

Chaque variable porte un nom  
Ce nom permet de récupérer, modifier, le contenu de cette mémoire  
La donnée n’existe que dans la mémoire vive du système  

Pour lire une variable, on accole un caractère `$`avant le nom de la variable.  

!!! note ""
    === "Commande"
    ```bash
    var="Ceci est le contenu de ma variable"
    echo $var
    Ceci est le contenu de ma variable
    ```
    === "Tips"
    var est le contenant comportant un contenu  
    Dans notre cas "Ceci est le contenu de ma variable"  
    var est le nom de la mémoire permettant d'acceder  
    a cette donnée et non la donnée elle meme

il existe de nombreuses variables dans les OS
variables d’environnement via la variable `env`permet d’afficher les éléments suivant :  

- SHELL = contiens le chemin vers le shell actuellement utilisé
- LOGNAME = contiens le nom d’utilisateur
- HOME = contiens le chemin du répertoire personnel de l’utilisateur
- etc.

```bash
user12@srv-formateur:~$ env
SHELL=/bin/bash
PWD=/home/user12
LOGNAME=user12
XDG_SESSION_TYPE=tty
HOME=/home/user12
LANG=fr_FR.UTF-8
```

la variable `set`permet la visualisation de toutes les variables d’environnement et fonctions.  

<!-- insérer image cours variables environnement utiles-->

## Simplifier l’utilisation

Le shell bash utilise un historique des commandes. Cette fonctionnalité apporte une grande efficacité à l’utilisateur.  
De manière basique on utilise les flèches haut et bas du clavier pour remonter ou redescendre dans ces commandes précédentes.  
`history` Permets d’afficher le contenu de l’historique de commandes.  

Il est possible d’augmenter encore son efficacité avec les raccourcis suivants :

- `!!`Rappeler la dernière commande exécutée
- `!com`Rappeler la dernière commande commençant par "com"
- `!?fich`Rappeler la dernière commande contenant la chaine "fich"
- `!287`Rappeler la commande numérotée "287″ dans l’historique  

L’historique de commande est mémorisé dans le fichier `.bash_history`du répertoire personnel de l’utilisateur  

Bash utilisé des variables d’environnement pour gérer l’historique  

- HISTFILE
- HISTSIZE

On peut les visualiser afin d’obtenir des informations sur ces paramètres  

### Autocomplétion

En utilisant la touche [tab] du clavier, le shell complétera de lui-même notre saisie.  
Il est possible de compléter

- des chemins d’accès

```bash
user30@deb:/$cd /e [tab]
user30@deb:/$cd /etc
```

- des noms de commandes

```bash
user30@deb:~$ fir [tab]
user30@deb:~$ firefox
```

- des noms de variables

```bash
user30@deb:/$ echo $LOG [tab]
user30@deb:/$ echo $LOGNAME
```

- Si plusieurs choix sont disponibles, un double appui sur la touche [tab] va permettre de lister les résultats possibles

```bash
user30@deb:/$ ls /etc/h [tab] [tab]
hdparm.conf host.conf hostname hosts hosts.allow hosts.deny
```

## Aide

Aide contextuelle des commandes

- aide plus ou moins succincte codée au sein même de la commande.  
- Permets de trouver rapidement une information sur l’utilisation générale de la commande ou sur les principales options.  
- La plupart des commandes utilisent l’option longue `--help`pour son appel.

```bash
user30@deb:/$ pwd --help
    pwd: pwd [-LP]
    Affiche le nom du répertoire de travail courant.
    Options :
    -L affiche la valeur de $PWD s'il nomme le répertoire de travail courant
```

### `man`

`man` Est la principale commande d’aide dans le monde Unix/Linux.  
`man` Donne accès au manuel du système, des commandes, des fichiers de configuration.  
Pour obtenir l’aide `man`: `man man`

```bash
man passwd
PASSWD(1)                                       Commandes utilisateur                                       PASSWD(1)

NOM
       passwd - Modifier le mot de passe d'un utilisateur

SYNOPSIS
       passwd [options] [LOGIN]

DESCRIPTION
       La commande passwd modifie les mots de passe des comptes d'utilisateurs. Un utilisateur normal ne peut changer
       que son propre mot de passe, alors que le superutilisateur peut changer le mot de passe associé à n'importe
       quel compte. passwd modifie également les dates de fin de validité du compte ou du mot de passe associé.
```
Commande interne pour la section `man`

- `/mot`Rechercher "mot" dans la page
- `n`Passer à l’occurrence suivante 
- `N`Passer à l’occurrence précédente
- `h`Afficher l’aide-interne de man
- `q` Quitter man

Utilisez-le `man`en Anglais  
LANG=C man passwd

```bash
user12@srv-formateur:~$ LANG=C man passwd
```

Bash possède également la commande`help`. Celle-ci apporte de l’aide uniquement sur les commandes internes de shell.

```bash
user12@srv-formateur:~$ help
GNU bash, version 5.0.3(1)-release (x86_64-pc-linux-gnu)
Ces commandes de shell sont définies de manière interne. Saisissez  
« help » pour voir cette liste.
Tapez « help nom » pour en savoir plus sur la fonction qui s'appelle « nom ».
Utilisez « info bash » pour en savoir plus sur le shell en général.
Utilisez « man -k » ou « info » pour en savoir plus sur les commandes qui
ne font pas partie de cette liste.

Une astérisque (*) à côté d'un nom signifie que la commande est désactivée.
```

## Effectuer des recherches

### Commande `grep`

`grep [-e -i -l -n -v] "expr" <fichier1> (<fichier2>)`

Permet de rechercher un motif dans fichier (ou dans le résultat d’une commande si celle-ci est précédée du "pipe |").  

!!! warning "Option de `grep`"
    === "option -e"
        Permet d'effectuer plusieurs recherche au sein d'un fichier  
        Application d'un `OU` logique et non d'un `ET` logique
    === "option -i"
        Permet d'ignorer la casse lors des recherches
    === "option -l"
        Affiche les noms des fichiers ou le motif de recherche est présent et non leurs contenu
    === "option -n"
        Affiche les numéros de ligne comportant le motif
    === "option -v"
        Inverse le sens de la recherche, affiche les lignes qui ne correspondent pas
    === "option -r ou -R"
        Effectue une recherche récursive dans les répertoires
    === "option -w"
        Recherche des correspondances de mots entiers
    === "option -c"
        Affiche le nombre de lignes correspondantes au lieu des lignes elles-mêmes

??? example "commandes `grep`"
    ```bash
    user30@deb:~$ grep -in "dupont" Edition
    13:Dupont Jean 111111
    14:Dupont Jean 111111
    15:Dupont Patrice 222222
    16:Dupont jojo 999999
    17:Dupont Pierre 222222
    ```

#### Filtrer les résultats d’une commande

`<command> | grep [-e -i -l -n -v] "expr"`

Permets de filtrer le résultat d’une précédente commande.  

??? example "filtrer le résultat de la commande ls"
    === "commande"
        ```bash
        user30@deb:~$ ls | grep -v "[Tt]el"
        -rw-r--r-- 1 user30 user30  113 juil. 21 11:04 liste.txt
        -rw-r--r-- 1 user30 user30   29 juil. 21 09:36 newcontacts
        drwxr-xr-x 3 user30 user30 4096 juil. 21 14:38 perso
        -rw-r--r-- 1 user30 user30    0 juil. 21 17:27 toto
        drwxr-xr-x 2 user30 user30 4096 août  10 10:55 video
        ```
    === "explication"
        Dans cette commande on demande a `grep` de filtrer les résultat de `ls`  
        afin d'exclure les fichiers [tel] commençant par un t ou un T

### Commande `find` [recherche avancée]

`find <chemin> [critère de recherches] ([action à effectuer sur le résultat])`

Elle permet de spécifier différents critères de recherche tels que le nom du fichier, la taille, la date de modification, etc., de par sa grande variété de critères de recherche couplée aux différentes actions possibles sur le résultat.  

!!! Warning ""
    find est nativement récursive, elle cherchera dans tous les sous-dossiers par défaut  
    Elle ne se limite pas au dossier courant elle cherchera également dans tous les dossiers enfants

Quelques critères de recherche parmi les plus utilisés  

|         critères         | Description                                                                                                                                    |
| :----------------------: | ---------------------------------------------------------------------------------------------------------------------------------------------- |
|      -name "ficnom"      | Recherche en fonction du nom                                                                                                                   |
|        -user nom         | Recherche des fichiers par nom de l’utilisateur propriétaire                                                                                   |
|      -group groupe       | Recherche des fichiers par nom du groupe propriétaire                                                                                          |
| -type [f, d, l, c, b, p] | Recherche par type de fichier. les lettres en argument représentent les divers types de fichiers Unix                                             |
|      - size [+-]nb       | Recherche en fonction de la taille (Possibilité de préciser k, M ou G). Le caractère +/- permet d’indiquer "plus grand que" ou "plus petit que" |
|        -mtime nb         | Recherche des fichiers sur date de dernière modification, nb correspond au nombre de jours (1 pour la veille, 2 jours avant…)                |

!!! note ""
    === " `-mtime` "
        Stipule la date de la derniere modification du fichier
    === " `-ctime` "
        Stipule la date de création du fichier
    === " `-atime` "
        Stipule la date d'accès au fichier

???+ example "recherche `find`"
    === "recherche `find`"
        ```bash
        user30@deb:~$ find . -name "[Tt]el*"
        /home/user30/tel2020
        /home/user30/Tel-2018.txt
        /home/user30/perso/tel2018
        /home/user30/perso/tel2020
        /home/user30/perso/tel2019
        /home/user30/Tel-2020
        ```
    === "recherche `find + -name`"
        ```bash
        user30@deb:~$ find . -type d -name "*test*"
        ./dirtest01
        ./perso/dirtest02
        ```
    === "recherche `find + -size`"
        ```bash
        user30@deb:~$ find dirtest01/ -size +500k
        dirtest01/fic1M
        dirtest01/fic10M
        user30@deb:~$ find dirtest01/ -size -100K
        dirtest01/fic50k
        dirtest01/fichier01.txt
        ```
    === "recherche `find + -type`"
        ```bash
        user30@deb:~$ find dirtest01/ -type f -mtime -1
        dirtest01/ficnew
        ```

Quelques actions réalisables par la commande `find`  

|        Action         | Description                                                                                                  |
| :-------------------: | :----------------------------------------------------------------------------------------------------------- |
|       `-print`        | Affiche le nom complet des fichiers trouvés. Il s’agit de l’action par défaut.                                |
|       `-printf`       | Affiche le résultat avec les possibilités de formatage de la fonction `printf`du langage C (cf`man find`)  |
| `-exec command {} \;` | Exécute séquentiellement la commande *command* sur le résultat représenté par {}. Doit se terminer par `\;` |
|  `-ok command {} \;`  | Même fonctionnement que, `-exec`mais avec demande de confirmation à chaque exécution.                        |

???+ example "action `-exec command {} \;`"
    === "Exemple 1"
        ```bash
        user30@deb:~$ find . -type f -mtime -1 -exec ls -li {} \;
        15684 -rw-r--r-- 1 user30 user30   0 août  10  17:05 ficnew
        ```
        Dans cette exemple la commande `find` permet de chercher dans le dossier courant  
        un fichier de type `-type f` modifié la veille `-mtime -1` et d'afficher ce fichier ainsi que son inode `-exec ls -li {} \;`
    === "Exemple 2"
        ```bash
        user30@deb:~$ find . -type f -name "Edition" -exec cp -v {}.txt \;
        './Edition' -> '/tmp/./Edition.txt'
        ```
        Dans cette exemple `find` cherche le fichier standard nommé "Edition" dans le répertoire courant puis il va en créer une copie dans le dossier `/tmp` et ajouter au nom du fichier une extension .txt

## Expression régulière `regex`

Les expressions régulières (ou regex) sont des séquences de caractères utilisées pour décrire un motif de recherche dans du texte. Les expressions régulières sont largement utilisées dans les commandes et les outils de manipulation de texte sous Linux, tels que grep, sed, awk, etc.  

Les expressions régulières sont utilisées par les outils d’édition et de recherche dans les fichiers tels que `vi`, `grep`, `sed`, `awk`, `ed`, `ex` etc.  
Une expression régulière est construite à l’aide de différents caractères dotés d’une signification particulière.  

Les caractères d’expression régulière auront cette syntaxe : `regex` avec une syntaxe en bleu  
Les caractères normaux utiliseront celle-ci: `caractère` avec une syntaxe en violet  

### Les quantificateurs

Ils agissent sur les caractères qui les précèdent,  
Certains caractères, vus dans la section sur les métacaractères, ne s’utilisent plus de la même manière  

!!! tips " Quantificateurs "
    === " `*` "
        Répétition du caractère qui précède de 0 à *n* fois  
        `a*` correspond à: <rien> ou `a` ou `aa` ou `aaa` ...
    === " `\+` "
        Répétition du caractère qui le précède de 1 à *n* fois
        `a\+` correspond à: `a` ou `aa` ou `aaa` ...
    === " `\?` "
        Correspond à 0 ou 1 fois le caractère précédent
        `a\?` correspond à <rien> ou `a`

??? example " quantificateurs "
    === "`car\{m,M\}`"
        un caracyère répété au minimum `m` fois et au maximum `M` fois
        `ab\{1,3\}c` correspond à: `abc` ou `abbc` ou `abbbc`
    === "`car\{n,\}`"
        un caractère répété au minimum 'n' fois
        `es\{2,\}ai` correspond à: `essai`, mais aussi à `esssai`, `essssai`
    === "`car\{n\}`"
        un caractère répété 'n' fois exactement
        `[A-Z]\{3\}` correspond à une chaine de caractères composée de 3 majuscules

## Commande `locate`

Commande cherchant les éléments au sein d’une base de données et non sur un disque.  
Base de données ou sont indexé tous les fichiers présents sur les filesystem Linux.  

!!! warning "Locate"
    La commande `locate` nécessite une base de donnée à jour  
    Voila pourquoi un fichier peut etre introuvable directement après sa création  
    La base de donnée met généralement quelques sec/min à s'actualiser  
    Dans le cas contraire l'utilisateur **root** peut forcer la mise a jour via la commande  
    `updatedb`

??? example "commande `locate`"
    === "Exemple commande `locate`"
        ```bash
        #1 user30@deb:~$ touch explocate
        #2 user30@deb:~$ locate explocate

        #3 root@deb:~# updatedb

        #4 user30@deb:~$ locate explocate
        #5 /home/user30/explocate
        ```
    === "Explication"
        1 - création d'un fichier "explocate"  
        2 - recherche du fichier via la commande `locate`  
            la commande ne retourne rien car elle ne connait pas le fichier  
        
        3 - utilisateur **root** force la mise a jour de la base de donnée via la commande `updatedb`  
        
        4 - utilisateur simple relance la commande `locate`  
        5 - la commande retourne l'emplacement du fichier car elle sait maintenant ou il se trouve  
