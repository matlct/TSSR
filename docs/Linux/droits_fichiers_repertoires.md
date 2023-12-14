# Droits sur les fichiers et répertoires

## Les droits Unix/Linux

### Les types de droits

Le compte utilisateur vous permet de vous connecter à Linux et définit les permissions et autorisations que vous pouvez effectuer.

Ainsi on distingue :

- Propriété: L’utilisateur et le groupe possédant le fichier, ce qui signifie qu’ils l’ont créé ou ils ont été attribués en tant que propriétaires du fichier ou du répertoire.
- Autorisations: représentent l’ensemble des actions que vous pouvez effectuer selon l'utilisateur que vous êtes (le compte d’utilisateur avec lequel vous êtes connecté) et le groupe à laquelle vous appartenez.

La commande `whoami` permet d'afficher l'utilisateur avec lequel vous êtes connecté.  
La commande `groups` et/ou `id` affiche mes groupes auquel l'utilisateur appartient.  

Les droits d'accès sur les fichiers sont directement inscrits dans l'inode des fichiers (répertoires).  
Ils sont découpés en trois colonnes :

- u (user)  ->  utilisateur propriétaire du fichier ou répertoire
- g (group) -> groupe propriétaire
- o (other) -> Autres

| Droit         | Octal | Fichier                                                                   | Répertoire                                                                       |
| ------------- | ----- | ------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| Lecture (r)   | 4     | Permet de lire, ouvrir le fichier                                         | Permet de lister le contenu du dossier                                           |
| Ecriture (w)  | 2     | Permet l'écriture/modification/changement de nom/suppression d'un fichier | Permet de modifier le contenu du dossier (créer,copier,renommer,supprimer)       |
| Execution (x) | 1     | Permet d'exécuter le fichier binaire ou script shell                      | Permet à un utilisateur de traverserr ou d'accéder à un fichier dans le dossier. |

> Droit octal:  
> Le 1,2,3 ne sont généralement pas utilisé.  
> Plus souvent les 7,6,5,4 et 0 signifiant aucun droit.  

Pour calculer des droits en octal, il faut additionner les valeurs des droits présents pour les 3 groupes:  

- rwx = 4+2+1 = 7
- rw- = 4+2   = 6
- r-x = 4+1   = 5
- r-- = 4

???+ tip "Exemple"
    rwxrwxr-x = 775  
    rwxr-x--- = 750  
    rw-rw-r-- = 664  

L'affichage des droits d'un fichier ou répertoire, sera possible avec la commande [`ls -l`](./Fichiers_Dossiers.md)

```bash
root@deb:~$ ls –l
total 16
-rw------- 1 user30 user30 616 09:34 Edition
drwxr-xr-x 2 user30 user30 4096 17:36 Nantes
lrwxrwxrwx 1 user30 user30 15 17:38 Quimper -> Rennes/Quimper/
drwxr-xr-x 3 user30 user30 4096 17:36 Rennes
-rw-r--r-- 1 user30 user30 33 17:35 todo.list
```

## Modifier les droits et propriétaires

### Modification des droits

#### Commande `chmod`

`chmod <option> [ugoa] [+ - =] [rwxX] fichier ou dossier`  

- option : [-R]
- [ugoa] :
    - [u] : user
    - [g] : group
    - [o] : other
    - [a] : all
- [+ - =] :
    - [+] : Ajoute des autorisations à un utilisateur spécifié.
    - [-] : Supprime les autorisations à un utilisateur spécifié.
    - [=] : Attribue des autorisations distinctes des utilisateurs spécifié et supprime les autorisations précédentes du segment utilisateur.
- [rwxX] :
    - [r] : read
    - [w] : write
    - [x] : execution
    - [X] : modifie les attributs d'un répertoire et des sous-répertoires ^^SANS^^ toucher aux fichiers qui s'y trouvent.

Permets de modifier les droits d'un fichier ou dossier  
chmod
Possibilité d'utiliser la commande de 2 façons:

- Absolue: en octal ou symbolique avec le signe "="
- Relative: en symbolique avec les signes "+" ou "-"

Attention à l'option [-R], le fait de réaliser un `chmod`de façon récursive doit être effectué de façon réfléchie et ne doit pas être généralisé à tous les usages.  
De plus l'attention doit être porté sur le fait de bien utiliser le [-R (majuscule)]. l'utilisation d'un [-r (minuscule)] retirerais les droits en lecture sur les fichiers ou répertoire selectionnés.  

??? tip "Exemple d'utilisation `chmod`"
    === "Modification permissions d'un répertoire notation symbolique"
        ```bash
        root@deb:~# chmod g+w,o-rx /data/commun
        ```  
        Ici on ajoute au groupe le droit d'écriture (g+w),  
        Et on retire aux autres les droits lecture et exécution (o-rx).
    === "Modification permissions d'un répertoire notation octale"
        ```bash
        root@deb:~# 770 /data/commun
        ```  
        Ici on accorde lecture, ecriture, exécution au utilisateur et groupe (77)  
        et aucun droit aux autres (0).  
    === "Modification permissions d'un répertoire ET de son contenu"
        ```bash
        root@deb:~# chmod -R g+w,o-rx /data/commun
        ```  
        Les droits ecriture son attribué au groupe (g+w)  
        Les droits lecture et execution sont retirés aux autre (o-rx)
        Ici l'utilisation du [-R] inclus la récursivité, le contenus du répertoire /commun sera également modifié.  

#### Commande `chown`

`chown <option> [user]:[group] fichier(dossier)`  

Permets de modifier l'utilisateur propriétaire et le groupe propriétaire.  

les options et syntaxe étant identique que la commande `chmod` elle ne seront pas réécrite ici.  

??? tip "Exemple d'utilisation `chown`"
    === "Modification utilisateur et groupe propriétaire"
        ```bash
        root@deb:~# chown penthium:users /data
        ```
        L'utilisateur "penthium" et le groupe "users" deviennent propriétaire  
        du répertoire **data**
    === "Modification uniquement le groupe propriétaire du dossiers"
        ```bash
        root@deb:~# chown -R :users /dat/commun
        ```
        Le groupe "users" devient donc le propriétaire de **/data/commun**  
        ainsi que de son contenu via l'utilisation de [-R].

## Modèle de droits et droits spéciaux

### Commande `umask`

`umask <valeur umask>`

^^**umask**^^ (**u**ser file creation **mask**) est un paramètre système déterminant les permissions par défaut appliquées aux nouveaux fichiers et répertoires créés.  
Il spécifie les permissions qui doivent être **désactivées** lors de la création d'un fichier ou d'un répertoire.  

!!! info inline end ""
    l'**umask** appliqué par défaut est le 022.  
    Il est impératif de laisser cet **umask** pour les utilisateurs root et systèmes (UID inférieur à 1000).  
    Voir la conf dans le fichier `/etc/profile` ou `/etc/bashrc`  

Par exemple, si le **umask** est 022 et qu'un fichier est créé, les permissions seront par défaut 644 (rw-r--r--).  
Le **umask** est exprimé en base 8, avec les chiffres correspondant aux permissions pour le propriétaire, le groupe et les autres :  

- 0 = --- (aucune permission)
- 1 = --x (exécution seulement)
- 2 = -w- (écriture seulement)
- 3 = -wx (écriture et exécution)
- 4 = r-- (lecture seulement)
- 5 = r-x (lecture et exécution)
- 6 = rw- (lecture et écriture)
- 7 = rwx (lecture, écriture et exécution)

Donc notre **umask** 022 donne :

- 0 = aucune restriction pour le propriétaire
- 2 = interdit l'écriture pour le groupe
- 2 = interdit l'écriture pour les autres

!!! warning ""
    La valeur maximale des permissions pour un répertoire est de 777 (tous les droits à tous le monde).  
    La valeur maximale des permissions pour un fichier est de 666 (tous les droits pour tout les monde **sauf** l'exécution).  
    En effet pour éviter les problèmes un fichier ne sera **jamais** automatiquement autorisé exécution, cela afin d'eviter par exemple de considérer un fichier comme un script).  
    Cela provoque donc des différences de droits lors de la création d'un répertoire ou d'un fichier  
    Voila pourquoi le choix de l'**umask** sera toujours basé sur la création d'un répertoire et non d'un fichier.  

Il est bon de savoir que si un fichier tombe sur une autorisation d'exécution lors de sa création alors le système appliquera un "+1" sur l'octale ayant l'autorisation d'exécution.  
Par ex. umask 023 -> 666-023 =643 soit rw-r---wx => avec le "+1" cela devient 644 soit rw-r--r--  
Cela se traduit par : "tous fichier ayant une octale **impaire** lors de sa création se verra appliquer un "+1" sur cette octale impaire.  

Un **umask** est défini par ^^session^^.  
Il peut être modifié en utilisant la commande `umask <valeur_umask>` mais celui-ci ne sera modifié que pour la session courante de l'utilisateur, une fois déconnecté, le **umask** reviendra à sa valeur par défaut.  

Pour le rendre permanent Il faut le définir dans son fichier de configuration personnel soit :

- `~/.profile`
- `~/.bashrc`

??? note ""
    Chaque processus ou script peut définir son propre **umask** qui s'appliquera uniquement à ce processus

### SUID (Set User ID)

`chmod u+s <fichier>`  

Lorsque le **SUID** est activé sur un fichier exécutable, il permet à un utilisateur n'étant pas le propriétaire du fichier de l'exécuter avec les mêmes droits que le propriétaire.  
Cette permission ne peut pas être appliquée sur un répertoire.  
*Fonction tres utile pour les programmes nécessitant des privilèges spécifiques pour s'exécuter correctement*.  
Si un fichier bénéficie de cette permission cela sera visible par un "s" en lieu et place du "x" sur la partie utilisateur (1ere triplette de permissions)(--s --- ---).  
Un "S" majuscule signifie que la permission d'exécution n'est pas accordée.  
***passwd*** est un exemple classique, le SUID est activé pour que chaque utilisateur puisse changer son mdp sans avoir à passer par l'administrateur.  

### SGID (Set Group ID)

`chmod g+s <répertoires>`  

Le SGID fonctionne de la même manière que le **SUID** à la différence que celui-ci est appliqué au groupe et non à l'utilisateur.  
Lorsqu'il est activée sur un répertoire, tous les fichiers créés dans ce répertoire héritent du grouped urépertoire plutôt que du groupe primaire de l'utilisateur.  
Comme pour le **SUID**, le **SGID** sera symbolisé par "s" à la place du "x" mais sur la partie groupe (2eme triplette de permissions)(--- --s ---).  
Un "S" majuscule signifie que la permission d'exécution n'est pas accordée.  

### Sticky Bit

`chmod o+t <répertoire>`  

Si il est appliqué sur un fichier, celui-ci sera placé en zone **"SWAP"**, ce qui permet de le stocker en mémoire afin d'être relancé plus rapidement.
Lorsqu'il est activé sur un répertoire, seuls les propriétaire des fichiers peuvent supprimer ces fichiers! et ceux même si d'autres utilisateur ont des permissions d'écriture sur le répertoire.  
Cela est couramment utilisé pour les répertoires partagés où plusieurs utilisateurs ont des droits d'écriture.
Cette permission est représentée par la présence d'un "t" ou "T" à l'emplacement de la permission d'exécution de la partie "autre" (3eme triplette de permissions)  
Ce qui ce symbolise par --- --- --t.  

un "t" minuscule accord les permissions d'exécution.  
un "T" majuscule refuse les permissions d'exécution.  
