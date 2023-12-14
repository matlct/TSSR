# Gestion des utilisateurs et groupes

## Considérations générales

### Les identifiants

Sous Linux, les utilisateurs sont représentés par deux valeurs importantes:  

- L'**UID**: identifiant ^^utilisateur^^
- Le **GID**: identifiant du ^^Groupe Principal^^

Il est possible qu'un utilisateur appartienne à plusieurs groupes.  
Il y aura donc les notions de groupe principal et de groupe secondaire.  
Le groupe principal est le groupe attribué à l'utilisateur au moment de sa connexion.  

### Les types d'utilisateurs

Les utilisateurs sont classés en 3 catégories:  

- **root**: UID=0, GID=0
  Il s'agit du super-utilisateur du système. Il a tout pouvoir. Il est donc conseillé d'être le ^^moins possible^^ sous cette identité, voire fortement conseillé de ne pas se connecter avec mais de faire ^^une élévation de privilèges^^ via la commande **su -**.  
  Sur certains systèmes, il sera impossible de se connecter en root dans l'interface graphique.  
- **daemon**: UID= 1-999, GID= 1-999
  Plage d'UID et GID réservé par Linux pour ces utilisateurs.  
  Les utilisateurs compris entre 1 et 999 pour leur UID/GID représentent les utilisateurs applicatifs (les services).  
  En effet sous Linux 99% des services ne sont pas exécutés sous l'identité de root mais sous leur propre identité à des fins de sécurité.  
- **Utilisateur**: UID et GID > 1000
  Les utilisateurs "humains" sont représentés par des UID/GID supérieurs à 1000  

## Les fichiers liés à la gestion des groupes

Les informations concernant les groupes d'un systèmes Linux sont contenus dans les fichiers **/etc/group** et **/etc/gshadow**  
Nous pourrons y prendre des informations, mais nous ne les modifierons jamais directement  
La manipulation des groupes devra se faire par les commandes dédiées  

#### Fichier /etc/group

Ce fichier est composé de plusieurs champs, séparés par le caractère:  

```bash
root@deb:~# cat /etc/group
root:x:0:
daemon:x:1:
[...]
user:x:1000:
jmartin:x:1001:
sdia:x:1002:
abenabel:x:1101:
informatique:x:1500:jmartin,abenabel,sdia
```

Analyse de colonnes  
`nomgroupe:passechiffré:GID:membres,de,ce,groupe,secondaire`  

En général, il y a un "x" dans la colonne du mot de passe, cela indique que le mot de passe est dans un fichier **/etc/gshadow**  

```bash
user:x:1000:
jmartin:x:1001:
sdia:x:1002:
abenabel:x:1101:
informatique:x:1500:jmartin,abenabel,sdia
```

#### Fichier /etc/gshadow

Ce fichier contient les informations cachées sur les groupes séparés par le caractère ":". Il est rarement utilisé  

```bash
root@deb:~# cat /etc/gshadow
root:$6$c.n9lt$tmf169GMlTRp/ :18684:0:99999:7:::
daemon:*:18001:0:99999:7:::
bin:*:18001:0:99999:7:::
sys:*:18001:0:99999:7:::
[...]
jmartin:$6$X1URi$CDj5CU5G12Ex.:18153:0:99999:7:::
sdia:$6$X0RisM$JngFdwTEmaOfH.:18592:0:99999:7:::
abenabel:$6$gjD5IZ$EtlYhsMJngFw:18457:0:99999:7:::
```

Analyse de colonnes  
`nomgroupe:passechiffré:administrateurs:membres,du,groupe`  

Si le champ du mot de passe contient les caractères "!" ou "*", les utilisateurs ne pourront pas utiliser le mot de passe pour accéder au groupe.  
Si le champ est vide, dans ce cas seul les membres du groupe pourront obtenir les permissions du groupe.  
Le champ administrateur contient la liste des administrateurs du groupe séparé par des virgules. Les administrateurs peuvent modifier le mot de passe et les membres du groupe.  

### Commandes de gestion des groupes

#### Commande `groupadd`

`groupadd <options> [nom du groupe]`  

Option usuelle:  

- [-g]: valeur numérique de l'identifiant du groupe. Cette valeur doit être unique  
  Par défaut, le plus petit identifiant supérieur au GID_MIN et aux identifiants des groupes existants est utilisé.

#### Commande `groumod`

`groupmod <options> [nom du groupe]`  

Options usuelles:  

- [-g [GID]]: change le GID d'un groupe. Attention aux orphelins des fichiers crées préalablement.
- [-n [nouveau nom]]: change le nom du groupe

#### Commande `groupdel`

`groupdel <options> [nom du groupe]`  

Commande permettant de supprimer un groupe uniquement s'il est vidé de tous ses membres avant.  

#### Commande `gpasswd`

`gpasswd <options> [nom du groupe]`  

Options usuelles:  

- [-a [utilisateur]]: ajoute "utilisateur" au groupe.
- [-d [utilisateur]]: supprime "utilisateur" du groupe.

#### Exemple utilisation commande groupe

??? tip "Exemple manipulation de groupe"
    === "Création de groupe"
        ```shell
        root@deb11:~# groupadd admin
        root@deb11:~# groupadd stagiaires
        root@deb11:~# groupadd documentation
        root@deb11:~# groupadd vip
        ```

#### Commande `chgrp`

`chgrp <nom_du_groupe> [fichier/dossier]`  

Options usuelles:  

- [-R]: Récursif change le groupe des fichiers sans les appliquer
- [-v]: mode verbeux
- [-c]: affiche les changements effectués sasn les appliquer
- [--dereference]: modifie le groupe du fichier cible lui-même et non du lien symbolique

Permets de changer le groupe propriétaire d'un fichier ou dossier.  

nom_du_groupe correspond au groupe auquel on veut assigner la propriété du fichier/dossier.  

Seule le `root` peut changer le groupe propriétaire.  

## Les fichiers liés à la gestion des utilisateurs

Les informations concernant les utilisateurs d'un système Linux sont contenus dans les fichiers **/etc/passwd** et **/etc/shadow**  
Nous pourrons y prendre des informations, mais nous ne les modifierons jamais directement.  
La manipulation des utilisateurs devra se faire par les commandes dédiées.  

#### Fichier /etc/passwd

Ce fichier est composé de plusieurs champs, séparés par le caractère ":"  

```bash
root@deb:~# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x 1 1:daemon:/usr/sbin:/usr/sbin/nologin
[...]
jmartin:x:1001:1001:Jean Martin -
Logistique:/home/jmartin:/bin/bash
sdia:x:1002:1002::/home/sdia:/bin/sh
abenabel:x:1002:1002:Ashanti Ben
Abel:/home/abenabel:/bin/bash
```

`nom:motdepassechiffré:UID:GID:nom complet:/répertoire/personnel:/shell`  

En général, il y a un "x" dasn la colonne du mot de passe, cela indique que le mot de passe est dans le fichier **/etc/shadow**  
Le champ **UID** indique le numéro qui est l'identifiant unique de l'utilisateur  
Le champ **GID** détermine quel est le groupe principal de l'utilisateur.  
Le champ **nom,complet** comporte des informations complémentaires comme le nom complet, le téléphone, etc. Ces informations peuvent être directement indiquées lors de la création de l'utilisateur ou via la commande `chfn`.  
Le champ **répertoire personnel** contient le chemin du répertoire d'accueil de l'utilisateur, si celui-ci a été créé.  
Le champ **shell** correspond au chemin du binaire correspondant au shell de l'utilisateur. Il est possivle de le modifier avec la commande `chfn`.  

#### Fichier /etc/shadow

Ce fichier contient les informations cachées des utilisateurs séparées par le caractère ":"  

```bash
root@deb:~# cat /etc/shadow
root:$6$c.n9lt$tmf169GMlTRp/:18684:0:99999:7:::
daemon:*:18001:0:99999:7:::
bin:*:18001:0:99999:7:::
sys:*:18001:0:99999:7:::
[...]
jmartin:$6$X1URi$CDj5CU5Gl2Ex.:18153:0:99999:7:::
sdia:$6$X0RisM$JngFdwTEmaOfH.:18592:0:99999:7:::
abenabel::$6$gjD5IZ$EtlYhsMJngFw:18457:0:99999:7:::
```

`user:motdepasse:datedernierchangement:agemini:agemax:périodeavertissement:périodeinactivité:datefinvalidité:champréservé`  

- **User**: champ contenant le nom de l'utilisateur  
- **Mot de passe**: champ contenant le hash du mot de passe. Cette colonne est composée de 3 champs séparés par des "$"  
- **Premier champ**: algorithme de hashage
  - $1$ signifie MD5
  - $2a$ signifie Blowfish
  - $2$ signifie Blowfish (manipulation correcte de caractères 8 bits)
  - $5$ signifie SHA-256
  - $6$ signifie SHA-512

- **Deuxième champ**: le sel (ou grain de sable). C'est une chaîne de caractère aléatoire qui sera ajoutée au mot de passe avant de faire son hash.  
- **Troisième champ**: le hash du mot de passe + sont sel. Le hash est une chaîne de caractère unique généré par l'algorithme de hash. Plus l'algorithme est fort plus le hash 
  est complexe à décrypter.  

Le fait d'utiliser un sel dans le stockage des mots de passe permet d'augmenter la sécurité des mots de passe. Le principe du hash est de générer une chaîne de caractère unique d'une certaine taille par rapport à une chaine de caractère donnée. Donc si deux utilisateurs ont le même mot de passe, par exemple "Pa$$w0rd", alors les hash purs seront identiques. L'ajout du sel fait en sorte que les hashs soint différents, pourtant les utilisateurs ont le même mot de passe.  

- **Date de dernier changement de mot de passe**: nombre de jours depuis le 1er Janvier 1970 déterminant le dernier changement du mot de passe. une valeur à 0(zéro) force le changement du mot de passe pour l'utilisateur à la prochaine connexion. Si ce champ est vide, l'utilisateur ne subit pas les options de vieillissement du mot de passe.
- **Àge minimum**: l'âge minimum est la durée en jour que l'utilisateur devra attendre avant de pouvoir changer son mot de passe de nouveau. Un champ vide ou à 0 signifie qu'il n'y a pas d'âge minimum l'utilisateur pourra donc changer son mot de passe quand il le souhaite. Si le caractères 1 est rentrée celui-ci pourra le changer 1 fois par jour.  

## Commandes de gestion des utilisateurs

### Commande `useradd`

`useradd <options> [utilisateur]`  

Options usuelles:  

- [-m]: useradd crée le répertoire d'accueil de l'utilisateur.
- [-d [/chemin/rep/accueil]]: répertoire d'accueil de l'utilisateur. Si non indiqué, useradd utilisera le nom de l'utilisateur et la valeur de la variable **HOME** du **fichier /etc/default/useradd**.
- [-u [UID]]: indique l'UID de l'utilisateur. Si non renseigné, **useradd** utilisera le plus petit UID disponible.
- [-g [GID]]: indique le GID du groupe **principal** de l'utilisateur. Si pas précisé il sera crée un groupe au nom de l'utilisateur.
- [-G [groupe1,groupe2,groupe*n*]]: indique la liste des groupes secondaires de l'utilisateur séparés par des ",".
- [-s]: indique le shell de l'utilisateur sous la forme du chemin absolu du binaire.
- [-r]: indique la création d'un utilisateur système.
- [-c]: Indique le nom complet.

Lors de la création d'un utilisateur, si l'option [-m] est passée à **useradd**, alors useradd copiera le contenu du répertoire /etc/skel dans le répertoire d'accueil de l'utilisateur.  

### Commande `usermod`

`usermod <options> [utilisateur]`  

Options usuelles:  

- [-d [/home/DIR]]: indique le nouveau répertoire d'accueil de l'utilisateur. Si l'option [-m] est fournie, le contenu du répertoire actuel sera déplacé dans le nouveau répertoire d'accueil.
- [-e [DATE FIN VALIDITE]]: date à laquelle le compte utilisateur sera désactivé. La date est indiquée dans le format AAAA-MM-JJ ou en nombre de jours depuis le 1er Janvier 1970. Un paramètre DATE_FIN_VALIDITE *vide* **désactivera** l'expiration du compte.
- [-f [DUREE INACTIVITE]]: nombre de jours suivant la fin de validité d'un mot de passe après lequel le compte est **définitivement** désactivé. Une valeur de 0 désactive le compte dès que le mot de passe a dépassé sa fin de validité, et une valeur de -1 désactive cette fonctionnalité.
- [-g [GID]]: nom du nouveau groupe principal de l'utilisateur. Tout fichier du répertoire personnel de l'utilisateur appartenant au groupe principal précédent de l'utilisateur appartiendra à ce nouveau groupe.

Le groupe propriétaire des fichiers en dehors du répertoire personnel de l'utilisateur doit être modifié manuellement.  

- [-G [groupe1,groupe2,goupe*n*]]: liste des groupes secondaires de l'utilisateur. Si l'utilisateur appartient déjà à des groupes secondaires, il est peut-être utile d'ajouter l'option [-a] afin de ne pas perdre ces appartenances. Le groupe propriétaire des fichiers en dehors du répertoire personnel de l'utilisateur doit être modifié manuellement.
- [-a]: ajouter les groupes supplémentaires à l'utilisateur. À n'utiliser qu'avec l'option [-G]
- [-s [shell]]: chemin du nouveau shell de l'utilisateur (peut être configuré à l'aide de commande `chsh`)
- [-L]: verrouille le mot de passe de l'utilisateur.
  Cette option ajoute un "!" devant le hash du mot de passe dans /etc/shadow.
  Remarque: pour verrouiller le compte (et pas seulement l'accès par un mot de passe), il est également nécessaire de placer DATE_FIN_VALIDITE à 1.
- [-U]: déverrouille le mot de passe de l'utilisateur

### Commande `userdel`

`userdel <options> [nom du groupe]`  

Permets de supprimer un utilisateur

Option usuelle:  

- [-r]: les fichiers présents dans le répertoire d'accueil de l'utilisateur seront également supprimés. Les fichiers de l'utilisateur présents dans d'autres répertoires ne seront pas supprimés.

### Commande `passwd`

`passwd <options> [utilisateur]`  

En plus de pouvoir changer le mot de passe, si **root** l'exécute, **passwd** modifiera suivant les options passées les champs du fichier /etc/shadow.  

Options usuelles:  

- [-e [utilisateur]]: annuler immédiatement la validité du mot de passe d'un utilisateur. Celui-ci sera obligé de changer son mot de passe à sa prochaine connexion.
- [-l [utilisateur]]: verrouille le mot de passe en ajoutant un "!" devant le hash du mot de passe dans /etc/shadow.
- [-u [utilisateur]]: déverrouille le mot de passe en supprimant le "!" devant le hash du mot de passe dans /etc/shadow.

### Exemple commande utilisateur

??? tips "Exemple de manipulation d'utilisateur"
    === "Création d'un utilisateur"
        François:  
        - shell  
        - répertoire personnel /home/francois  
        - mdp: password (n'expire pas)  
        - Groupe Principal : admin  
        - Groupe Secondaires : stagiaires et documentation  
        ```shell
        root@deb11:~# useradd -m -s /bin/sh -g admin -G stagiaires,documentation francois
        root@deb11:~# id francois
        uid=1001 (francois) gid=1001 (admin) groupes=1001 (admin),1002 (stagiaire),1003 (documentation)
        root@deb11:~# passwd francois
        Nouveau mot de passe :
        #le mot de passe est tapé à l'aveugle
        Retapez le nouveau mot de passe :
        #le mot de passe est tapé à l'aveugle
        passwd: password updated successfully
        ```
    === "Création d'un utilisateur avec un répertoire personnel modifié"
        Frédéric:  
        - shell "bash"  
        - répertoire personnel /home/fred  
        - mdp: AchAngEr (mdp à changer à la première ouverture de session)  
        - Groupes secondaires: stagiaires et documentation  
        ```shell
        root@deb11:~# useradd -d /home/fred -s /bin/bash -G stagiaires,documentation frederic
        # dans la ligne précédente le [-d] permet de spécifier un répertoire personnel spécifique au lieu de /home/frederic
        root@deb11:~# id frederic
        uid=1002 (frederic) gid=1005 (frederic) groupes=1005 (frederic),1002 (stagiaire),1003 (documentation)
        root@deb11:~# passwd frederic
        Nouveau mot de passe :
        Retapez le nouveau mot de passe :
        passwd updated successfully
        root@deb11:~# passwd -e frederic
        # le [-e] ici ajoute une expiration au mdp, celui-ci devra le changer à la prochaine ouverture de session
        passwd: password expiry information changed
        ```
    === "Désactivation d'un compte via `usermod`"
        ```shell
        root@deb11:~# usermod -L -e 1 frederic
        # l'option [-L] verrouille le compte et [-e 1] force sa date d'expiration
        root@deb11:~# su - frederic
        Votre compte a expiré; veuillez contacter votre administrateur système.
        ```

## Changement d'identité et élévation de privilèges

### Commande `su`

`su <options> [utilisateur]`

**su**  
Permets de changer d'utilisateur ou d'exécuter une commande sous l'identité d'un autre utilisateur.  
Si la commande est invoquée par un simple utilisateur, il faudra qu'il connaisse le mot de passe de l'autre utilisateur.  
Permets également de devenir **root**  

Options usuelles:  

- [-s [shell]]: préciser le shell à utiliser pour l'ouverture de session.
- [-] ou [-l[utilisateur]]: faire un changement complet d'identité (charge les variables d'environnement de l'utilisateur cible).
- [-c [cmd]]: exécuter la commande, il est conseillé de mettre la commande entre simple quote.

### Commande `sudo`

`sudo <options> [commande]`  

Permets de déléguer des tâches d'administration à certains utilisateurs.  
Ex. Il sera possible d'accorder les privilèges de gestion des utilisateurs à un groupe d'utilisateurs.  

!!! warning inline end ""
    Afin qu'un utilisateur puisse utiliser la commande **sudo**, il faut qu'il soit renseigné dans le fichier de configuration /etc/sudoers et renseigner les commandes qu'il pourra utiliser.

```bash
jdoe@deb:~$ sudo apt update
[sudo ] Mot de passe de jdoe
Réception de http://deb.debian.org/debian
stretch updates InRelease [91,0 kB
```

Il est possible de donner tous les droits **root** à un utilisateur en ajoutant le groupe **sudo** à l'utilisateur.  
L'utilisation de la commande **sudo** demande le mot de passe de l'utilisateur et non celui de root. L'elevation de privilège sera gardée en mémoire pour cinq minutes par défaut.  

```bash
jdoe@deb:~# sudo -i
[sudo] Mot de passe de jdoe
root@deb:~#
```
