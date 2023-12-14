# Texte sous Linux

## ^^Lire du texte^^

### Commande `cat`

Permets d’afficher l’intégralité d’un fichier à l’écran  
Elle a l’avantage d’être facile d’utilisation, mais inadapté aux fichiers longs  

`cat <fichier>`  

Possibilité également d’afficher 2 fichiers à la suite.  
Les fichiers seront concaténés comme dans l’exemple suivant

`cat <fichier> <fichier2>`

???+ example "Commande `cat`"
    === "cat + 1 fichier"
        ```bash
        user30@deb:~$ cat contacts.txt
        Anne-Sophie    548
        Romain         351
        Estelle        350
        user30@deb:~$ cat entete.txt
        Prenom         Tel
        ------         ---
        ```
    === "cat + 2 fichiers"
        ```bash
        user30@deb:~$ entete.txt contacts.txt
        Prenom         Tel
        ------         ---
        Anne-Sophie    548
        Romain         351
        Estelle        350
        ```

La commande `cat`permet également d’écrire du texte dans un nouveau fichier.  

`cat> <fichier>`

???+ abstract "écriture avec `cat`"
     ```bash
     user30@deb:~$ cat > newcontacts.txt # indique l'écriture dans le fichier 'newcontacts.txt'
     Sarah      255 # passage a la ligne suivante via la touche "entrée"
     Mehdi      548
     Fred       999
     [ctrl+D] # permet d'indiquer la fin de la saisie et procède a l'enregistrement du fichier
     ```

### Commande `more`

`more [-d -s] <fichier>`

Permet de lire un fichier intégralement page par page, contrairement à`cat`.  
La touche `espace`permet de faire défiler les pages,  
À la fin du document la commande `more`se coupe et un nouveau prompt apparait  
Cependant il est possible via la touche `q` de quitter la commande more, dans l’éventualité  où l’information est trouvée avant la fin du fichier.

!!! note "Option de `more`"
    === "option -d"
        affiche une aide succinct en bas de page
    === "option -s"
        supprime les lignes blanches en doublon au sein du fichier

```bash
user30@deb:~$ more /etc/passwd
mathieu:x:1000:1000:mathieu,,,:/home/mathieu:/bin/bash
user01:x:1031:1031::/home/user01:/bin/bash
user02:x:1032:1032::/home/user02:/bin/bash
user03:x:1033:1033::/home/user03:/bin/bash
user04:x:1034:1034::/home/user04:/bin/bash
user05:x:1035:1035::/home/user05:/bin/bash
user06:x:1036:1036::/home/user06:/bin/bash
user07:x:1037:1037::/home/user07:/bin/bash
--Plus--(65%)
```

### Commande `less`

`less [-i -s] <fichier>`

Commande dériver de `more` permettant de lire le fichier :  

- page par page
- ligne par ligne
- possibilité de remonter dans le fichier (via raccourci)
- possibilité de faire des recherches

!!! warning "Option de `less`"
    === "option -s"
        supprime les lignes en doublons
    === "option -i"
        permet d'ignorer la casse lors des recherches

À la fin du fichier le mot (END) apparait  
La commande ne s’arrête pas comme `cat`  
Cela permet de remonter le fichier.  

??? example "commande `less`"
    ```bash
    user30@deb:~$ less /etc/passwd
    user26:x:1056:1056::/home/user56:/bin/bash
    user27:x:1057:1057::/home/user57:/bin/bash
    user28:x:1058:1058::/home/user58:/bin/bash
    user29:x:1059:1059::/home/user59:/bin/bash
    user30:x:1060:1060::/home/user60:/bin/bash
    user31:x:1061:1061::/home/user61:/bin/bash
    user32:x:1062:1062::/home/user62:/bin/bash
    (END) # signifie la fin fichier
    ```

#### Commande interne à la commande

| commande | description                              |
| :------: | ---------------------------------------- |
| [space]  | faire défiler une page                   |
|   `e`    | faire défiler une ligne vers le bas      |
|   `y`    | faire défiler une ligne vers le haut     |
|   `h`    | accéder à l’aide-interne                 |
|   `G`    | se déplacer en début de fichier          |
|   `gg`   | se déplacer en fin de fichier            |
|   `q`    | quitter                                  |
| `/motif` | chercher "motif" dans le texte à l’écran |
|   `n`    | se déplacer à la prochaine occurrence    |
|   `N`    | se déplacer à la précédente occurrence   |

??? example "`less` + /[recherche]"
    ```bash
    user30@deb:~$ less /etc/passwd
    user30:x:1060:1060::/home/user30:/bin/bash
    user31:x:1061:1061::/home/user31:/bin/bash
    user32:x:1062:1062::/home/user32:/bin/bash
    /bash # stipule la recherche du terme "bash"
    ```

****

### commande `head`

`head [-v -n nb] <fichier> <fichier2>`

Permets d’afficher les premières lignes du fichier ce nombre peut-être défini via l’option [-n].  
Sans précision la commande affichera les 10 premières lignes.  

!!! note "Option de `head`"
    === "option -n"
        accompagné d'un nombre stipule le nb de ligne à afficher
    === "option -v"
        Affiche en en-têtes le nom du fichier pratique pour differencier plusieurs fichiers ouvert en même temps.

??? example "`head`"
    ```bash
    user30@deb:~$ head -n 4 liste.txt
    Première ligne
    ligne numéro 2

    quatrième ligne
    user30@deb:~$
    ```

****

### Commande `tail`

`tail [-f -v -n nb] <fichier> <fichier2>`

Similaire à la commande `head` à la différence que seules les dernières lignes seront visibles  
Très utile dans le cas de lecture de fichier de log  

!!! note "Option de `tail`"
    === "option -n"
        accompagné d'un nombre stipule le nb de ligne à afficher
    === "option -v"
        Affiche en en-têtes le nom du fichier pratique pour differencier plusieurs fichiers ouvert en même temps.
    === "option -f"
        Permet d'activer l'affichage en continue  
        [ctrl+c] afin d'arreter le défilement

??? example "`tail`"
    === "Exemple 1"
        ```bash
        user30@deb:~$ tail -n 3 liste.txt
        dixième ligne

        douzième et dernière ligne
        user30@deb:~$
        ```
    === "Exemple 2"
        ```bash
        root@deb:~# tail -n2 -f /var/log/syslog
        Jul 21 11:15:58 LinuxUtil systemd[1]: Started Cleanup of Temporary Directories.
        Jul 21 11:17:01 LinuxUtil CRON[498]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
        ```

****

### Commande `wc`

`wc [-c -l -m -w] <fichier>`

Permets de compter le nombre de lignes, de mots, de caractères ou d’octets dans un fichier texte.  

!!! note "Option de `wc`"
    === "option -l"
        Compte le nombre de ligne
    === "option -w"
        Compte le nombre de mot
    === "option -m"
        Compte le nombre de caractere
    === "option -c"
        Compte le nombre d'octet

??? example "`wc`"
    ```bash
    user30@deb:~$ wc -l liste.txt
    12 liste.txt # 12 lignes dans le fichier
    user30@deb:~$ wc -w liste.txt
    17 liste.txt # 17 mots dans le fichier
    user30@deb:~$ wc -m liste.txt
    107 liste.txt # 107 caractères dans le fichier
    user30@deb:~$ wc -c liste.txt
    113 liste.txt # 113 octets dans le fichier
    ```

## ^^Editer du texte^^

Objectifs :  

- Comprendre Vim et ses modes de fonctionnement
- Savoir ajouter ou supprimer du texte
- Utiliser les commandes spécifiques de VIM
- Gérer les différences des fichiers texte Windows et Linux

Présentation de différents éditeurs de texte Unix/Linux

!!! abstract "Éditeur de texte sous Unix/Linux"
    === "**Emacs**"
        Éditeur, ou plutôt famille d'éditeurs, ouvert, extensible, roche d nombreuses bibliothèques. Il est destiné à des programmeurs.
    === "**Nano**"
        Éditeur léger, avec coloration syntaxique. Souvent apprécié des débutants, il est moins puissant qu'un VIM ou Emacs.
    === "**Vim**"
        Éditeur natif de Linux, issu de son ancêtre ***Unix VI***, **Vim** est un éditeur puissant, utilisé autant par les administrateurs systèmes que les programmeurs. Implémentant nativement les commandes ex.

### Vim

- Natif dans tout système Unix/Linux
- Éditeur par défaut de certaines commandes, conçu pour fonctionner sur tous types de terminal
- Nommées *VI* sous Unix, les distributions Linux implémentent une déclinaison nommée ***Vim***
- ***Vim*** apporte la coloration syntaxique, plus d’option pour l’espace de travail, la possibilité d’annuler plusieurs commandes  

`vi [-R] [+n] [+/motif] <fichier> (<fichier2> <fichier3>)`

`vim [-R] [+n] [+/motif] <fichier> (<fichier2> <fichier3>)`

!!! note "Option de `vim`"
    === "option `-R`"
        Ouvrir le fichier en lecture seule
    === "option `+n`"
        Ouvrir le fichier et positionner le curseur en début de la ligne *n*
    === "option `+/motif`"
        Ouvrir le fichier et positionner le curseur sur la première occurrence du mot *motif*

??? example "`vi`"
    ```bash
    user30@deb:~$ vi Edition
    ```

<!-- insertion interface vim support de cours -->

^^**Vim** utilise 2 modes principaux^^

Mode ^^*Commande*^^ : déplacement du curseur, utilisation du presse papier, appel à la ligne de commande  

Mode ^^*Insertion*^^ : Saisie du texte par l’utilisateur. Se remarque par une indication sur la ligne de commande  

#### ^^Mode **commande**^^

|         commande         | Résultat                                     |   commande   | Résultat                                          |
| :----------------------: | -------------------------------------------- | :----------: | ------------------------------------------------- |
| [flèche gauche] ou `h` * | Vers la gauche                               |    `w` *     | Début du prochain mot ou ponctuation              |
|  [flèche bas] ou `j` *   | Vers le bas                                  |    `b` *     | Début du mot précédent ou ponctuation             |
|  [flèche haut] ou`k` *   | Vers le haut                                 |    `e` *     | Fin du prochain mot ou ponctuation                |
| [flèche droite] ou `l` * | Vers la droite                               |     `:n`     | Se déplacer à la ligne `n`                        |
|           `0`            | Premier caractère de la ligne                | `gg` ou `:0` | Début du fichier                                  |
|           `^`            | Premier caractère du premier mot de la ligne | `G` ou `:$`  | Fin du fichier                                    |
|           `$`            | Dernier caractère de la ligne                |     `%`      | Se déplacer à la prochaine accolade ou parenthèse |

`*`: Ces commandes peuvent être multipliées par le nombre `n`  
`5+[flèche bas]`: pour descendre de 5 lignes par exemple  

^^Rechercher un mot dans le texte^^  

`/motif` - Rechercher le terme "motif"  
`n`      - Se déplacer vers la prochaine occurrence  
`N`      - Se déplacer vers l’occurrence précédente  

^^Utiliser la ligne de commande^^  

`:w`     - Enregistrer les modifications  
`:wq`    - Enregistrer et quitter **Vim**  
`:x`     - Autre manière pour enregistrer et quitter  
`:q`     - Quitter un fichier sans modification  
`:q!`    - Quitter en ignorant les modifications  

#### ^^Mode **insertion**^^

^^Passer en mode insertion^^  

`a`      - Insertion après le caractère courant  
`i`      - Insertion avant le caractère courant  
`o`      - Insertion au début d’une nouvelle ligne suivant l’actu  
`A`      - Insertion à la fin de la ligne courante  
`I`      - Insertion au début de la ligne courante  
`O`      - Insertion au début d’une nouvelle ligne précédant l’actuelle  

^^Sortir du mode insertion^^  

Simplement par la touche [echap]  

^^Commandes diverses^^  

|       Commande        | Résultat                                                                                                                                                                                       |
| :-------------------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|          `u`          | Annuler la dernière action (équivalent du [ctrl+z])                                                                                                                                            |
|      `[ctrl+r]`       | Refaire la dernière action annulée                                                                                                                                                             |
|         `:n`          | Passer au prochain fichier ouvert                                                                                                                                                              |
|         `:N`          | Passer au précédent fichier ouvert                                                                                                                                                             |
| `:w [nom_de_fichier]` | Enregistrer le contenu de l’espace de travail dans `[nom_de_fichier]`                                                                                                                          |
|        `:!cmd`        | Exécuter la commande du shell cmd sans quitter **Vim**                                                                                                                                         |
|          `:`          | Place le focus sur la ligne de commande **Vim**. Il débute toute utilisation de celle-ci. Il est possible de naviguer dans l’historique des commandes comme on le ferait depuis le shell Bash. |

### ^^Copier/Coller/Remplacer et Supprimer du texte avec **Vim**^^

!!! warning "Important"
    === "Le presse-papier" 
        ou Tampon  
        Il s'agit du presse-papier de **Vi** et non le presse-papier du système d'exploitation

### Supprimer du texte

| cmde  | Description                                                 |
| :---: | ----------------------------------------------------------- |
| `nx`  | Suppression du ou des ***n*** caractères suivants           |
| `nX`  | Suppression ou des ***n*** caractères précédents            |
|  `D`  | Suppression du reste de la ligne à droite du curseur        |
| `ndw` | Suppression de ***n*** mots                                 |
| `ndd` | Suppression de ***n*** lignes à partir de la ligne courante |

### Copier/coller du texte

| cmde  | Description                                                    |
| :---: | -------------------------------------------------------------- |
| `np`  | Coller ***n*** fois le contenu du tampon à la suite du curseur |
| `nP`  | Coller ***n*** fois le contenu du tampon avant le curseur      |
| `nyw` | Copier les ***n*** mots suivant le curseur                     |
| `nyy` | Copier les ***n*** lignes suivantes                            |

### Couper du texte

| cmde  | Description                          |
| :---: | ------------------------------------ |
| `nx`  | Couper ***n*** caractères suivants   |
| `nX`  | Couper ***n*** caractères précédents |
| `nD`  | Couper le reste de la ligne          |
| `dw`  | Couper ***n*** mots                  |
| `ndd` | Couper ***n*** lignes                |

!!! tip "Tampon d’annulation"
    La dernière suppression est stockée dans un tampon mémoire appelé **tampon d'annulation**

* Il est possible d’utiliser d’autres tampons d’annulation que celui par défaut en précisant des tampons de *a* à *z* précéder du caractère["].
      * `"lyy`    Copier la ligne courante dans le tampon `l` 
      * `"lp`     Copier le contenu du tampon `l`
* Les tampons d’annulation sont internes à une instance de **Vim**
* Il est possible d’utiliser les tampons dans tous les fichiers ouverts dans une instance de **Vim**
* À la fermeture de **Vim**, ces mémoires sont vidées

### Changer/Remplacer du texte

|      cmde       | Description                                                                             |
| :-------------: | --------------------------------------------------------------------------------------- |
|      `ncl`      | Effacer (couper) ***n*** lettres et passer en mode insertion                            |
|      `ncw`      | Effacer (couper) ***n*** mots et passer en mode insertion                               |
|      `ncc`      | Effacer (couper) ***n*** lignes et passer en mode insertion                             |
| `r[caractères]` | Remplace le caractère sous le curseur par le [caractère]                                |
|       `R`       | Passer en mode Remplacement (Mode Insertion ou le texte saisi remplace le texte actuel) |

### The Power of "G"

Syntaxe globale :  

`:<ligne> g/regex de recherche/commande de modification`

Version courte :  
`<g/<recherche>/s//<nouveau>/g`

!!! example "Utilisation g/../g"
    === "Substitution 1"
    ```bash
    :<lignes> g/rechlign/s/rechmod/nouveau/g
    :10,15 g/Suppression/s/caractères/lettres/g
    ```
    Dans cette exemple la commande va permettre de remplacer le mot **caractères** par **lettres** sur les ligne **10 à 15** dans les phrases commençant par **Suppression**
    === "Substitution 2"
    ```bash
    :g/<recherche>/s//<nouveau>/g
    :g/Suppression/s//Retirer/g
    ```
    Permet de remplacer, sur l'intégralité du fichier, de substituer le mot **Suppression** par le mot **Retirer**
    ```bash
    :g/Suppression/s/^#//
    ```
    Permet de substituer par *rien* le caractère **#** sur les lignes commençant par le mot **Supression**

### Personnaliser l’environnement **Vim**

La modification de l’éditeur **Vim** est possible via la commande `set`  
Pour cela il suffit de taper, sur la ligne de commande `:set`  

|      cmde       | Description                             |
| :-------------: | --------------------------------------- |
|     `:set`      | Afficher les options personnalisées     |
|   `:set all`    | Afficher toutes les options disponibles |
|  `:set option`  | Activer une option                      |
| `:set nooption` | Désactiver une option                   |
| `:set option?`  | Afficher le statut d’une option         |

|   Options    | Description                                                     |
| :----------: | --------------------------------------------------------------- |
| `compatible` | Activer le mode compatible de **Vi** pour **Vim**               |
|  `showmode`  | Afficher le mode de travail sur la ligne de commande            |
| `autoindent` | Indentation automatique, utile en programmation/scripting       |
|   `number`   | Afficher les numéros de lignes                                  |
| `ignorecase` | Pas de distinction minuscule/majuscule lors des recherches      |
|  `tabstop`   | Définir le nombre de caractères d’une tabulation (par défaut 8) |

Afin de ne pas avoir à retaper les options souhaitées à chaque redémarrage de session,  
il est possible d’enregistrer les options choisies dans un fichier de paramètres `~/.vimrc`  

!!! warning ""
    Dans le fichier `~/.vimrc` il n'est pas nécessaire d'inclure `:`.  
    Les `:` ne sont utile que dans la ligne de commande.
    Dans le fichier la syntaxe sera:  
    set nocompatible  
    set number  
    syntax on  

### Aide-interne

La commande `:help` (version courte`:h`) permet de se rendre dans l’aide de **Vim** (en Anglais)  
Lancée seule, la commande nous amène sur la page "**Vim - main help file**"  
En général, on l’utilise avec un terme à rechercher : `:help insert`  
Pour sortir, comme dans **Vim** : `:q`

### Fin de ligne en Fichier Texte

Les fins de ligne sont traitées différemment entre Windows et Linux.  

Ceux-ci sont générés par des caractères spéciaux invisibles nommée  

- [CR] (carriage return) \r : Windows
- [LF] (Line Feed) \n : Windows et Linux

Dans le cas d’une lecture de fichier, généré sur Windows, les caractères [\r] seront visibles.  
Ces caractères peuvent poser problème à la lecture et à l’exécution du fichier sur un système Linux.

Via l’option ***set:fileformat=unix*** (version courte **ff=unix**) il sera possible de passer le fichier du mode **dos** à **Unix**  

Dans `.vimrc` activer l’option ***fileformats=unix*** (version courte ***ffs=unix***) pour visualiser ce caractère`\r`.  
S’il est présent, il sera représenté par les caractères `^M`  

Possibilité de convertir ce fichier, plus facilement que dans **Vi**, via les commandes :  

- **dos2unix** et **unix2dos** issu du paquet *dos2unix*
- **fromdos** et **todos** issus du paquet *tofrodos*

!!! warning ""
    les paquets *tofrodos* et *dos2unix* se pas forcément installé sur le Linux utilisé  
    Dans ce cas l'installation de ceux-ci sera possible sinon le passage par **Vim** sera obligatoire

Sous Windows 