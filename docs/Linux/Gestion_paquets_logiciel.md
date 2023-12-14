# Gestion des paquets

## Gestion des dépôts

Les paquets logiciels, et leurs sources, sont disponibles sur internet dans des repository (des dépôts similaires aux « stores » Android, iOS, etc.)  
Lorsqu’une machine est installée, les dépôts officiels Debian sont configurés automatiquement, cela facilite :  

- La mise à jour de toute la distribution, pouvant être :
  - mise à jour de s&curité
  - mise à jour complète du système et des paquets
- l’installation de nouveaux paquets :  
  - Il n’est pas nécessaire de faire des recherches sur internet, le gestionnaire de paquets se charge de les trouver

Le fichier **/etc/apt/sources.list** contient la configuration des dépôts.  

```bash
root@deb:~# vim /etc/apt/sources.list
#deb cdrom:[Debian GNU/Linux 10.0 Buster Official amd64 NETINST ]/ buster main
# dépot de base de la distribution
deb http://ftp.fr.debian.org/debian/buster main
deb-src http://ftp.fr.debian.org/debian/buster main
# security updates - mise à  jours de sécurité
deb http://security.debian.org/buster/updates main
deb-src http://security.debian.org/buster/updates main
# buster-updates, previously known as 'volatile'
deb http://ftp.fr.debian.org/debian/ buster-updates main deb-src http://ftp.fr.debian.org/debian/ buster-updates main
```

### fichier sources.list

`deb http://ftp.fr.debian.org/debian/ buster main contrib`

le ^^premier champ^^ indique le type de paquet :  

* deb : paquet binaire
* deb-src : paquet source

Le ^^deuxième champ^^ indique le type et le chemin de la source. il peut commencer par :  

* http:// : site web de téléchargement ;
* ftp://: site FTP de téléchargement ;
* file:// : répertoire local ;
* cdrom:[…] : suivi entre crochets du label du CD, indique un CD-ROM ou DVD-ROM

le ^^Troisième champ^^ spécifie la branche disponible :  

* oldstable : l’ancienne version stable
* stable : la version officielle actuelle
* buster: une version spécifique, cela peut être la version officielle
* testing: la prochaine version stable
* unstable: version portant toujours le nom de Sid
* experimental: il est préférable de la laisser aux développeurs

Le ^^quatrième champ et les suivants^^ indiquent la section, dont l’objectif est de filtrer les paquets à installer :  

* main : les paquets Debian standards, ils sont **tous libres**
* contrib : ces paquets sont libres, mais *dépendants de paquets qui ne le sont pas*, ils présentent donc une dépendance vers **non-free**
* non free : des paquets sous licence non libre

Il est possible d’utiliser des fichiers sources indépendants déposés dans le dossier **/,etc/apt/sources.list.d**

## Gestion des paquets

Les différentes opérations de gestion des paquets seront réalisées avec deux outils :  
`apt-get` / `apt-cache` et `apt`  

!!! warning ""
    === "Utilisateur Standard"
        Utiliateur standard pourra réalisées:  
        - opérations de recherche  
        - consultation
    === "root"
        Pourra réaliser toutes opérations  
        pouvant altérer le système

### Commande courante de gestion

#### Mettre a jour la base de données des paquets disponibles  

```bash
root@deb:~# apt update
root@deb:~# apt-get update
```

#### Mettre à jour la distribution sans supprimer de paquets  

```bash
root@deb:~# apt upgrade
root@deb:~# apt-get upgrade
```

#### Mettre à jour la distribution avec éventuelle suppression de paquets obsolètes  

```bash
root@deb:~# apt full-upgrade
root@deb:~# apt-get dist-upgrade
```

#### Installer des paquets  

```bash
root@deb:~# apt install paquet1 <paquet2>
root@deb:~# apt-get install paquet1 <paquet2>
```

#### Désinstaller des paquets  

```bash
root@deb:~# apt remove paquet1 <paquet2>
root@deb:~# apt-get remove paquet1 <paquet2>
```

#### Désinstaller un paquet en supprimant les fichiers de configuration  

```bash
root@deb:~# apt purge paquet1
root@deb:~# apt-get purge paquet1
```

#### Nettoyer le dépôt local des fichiers téléchargés suite à mise à jour et autres  

```bash
root@deb:~# apt clean
root@deb:~# apt-get clean
```

#### Chercher un paquet correspondant à une expression rationnelle  

```bash
root@deb:~# apt search regex
root@deb:~# apt-get search regex
```

#### Obtenir des informations détaillées sur un paquet  

```bash
root@deb:~# apt show paquet
root@deb:~# apt-cache show paquet
```

### Commande `dpkg`

`dpkg` est la base du système de gestion des paquets Debian. Il est l’équivalent de la commande `rpm`pour les distributions de la branche RedHat. Il a été conçu pour :

* Installer / mettre à jour des paquets Debian
* Supprimer des paquets
* Fournir des informations

`dpkg` Permets d’obtenir des informations précieuses sur les paquets ou les fichiers installés à partir de paquets.  

#### Lister les paquets disponibles dans les dépôts et contenant la chaine « ftp »  

```bash
root@deb:~# dpkg –l "*ftp*"
Souhait=inconnU/Installé/suppRimé/Purgé/H=à garder
| État=Non/Installé/fichier-Config/dépaqUeté/échec-conFig/H=semi-installé/W=attend 
Err?=(aucune)/besoin Réinstallation (État,Err: majuscule=mauvais)
||/ Nom                 Version            Architecture Description+++-===================-==================-============-=====================================ii openssh-sftp-server 1:7.9p1-10+deb10u2  amd64        secure shell (SSH) sftp server module
un pure-ftpd           <aucune>            <aucune>     (aucune description n'est disponible)
un sftp                <aucune>            <aucune>     (aucune description n'est disponible)
```

#### Lister les fichiers installés pour un paquet présent sur le système  

```bash
root@deb:~# dpkg -L telnet
[...]
/usr/bin/telnet.netkit
/usr/share
/usr/share/doc
/usr/share/doc/telnet
/usr/share/doc/telnet/README
/usr/share/doc/telnet/changelog.Debian.gz
[...]
```

#### Chercher le paquet à l’origine d’un fichier  

```bash
root@deb:~# dpkg -S /usr/bin/scp
openssh-client: /usr/bin/scp
```

### Les fichiers journaux

Ils permettent de consulter l’historique des installations et mise à jour.  
Chaque utilitaire dispose de son propre fichier de logs :  

* `apt-get`& `apt`: interroge le fichier **/var/log/apt/history.log
* `dpkg`: interroge le fichier /var/log/dpkg.log

Les commandes `apt-get`& `apt`s’appuient sur `dpkg`pour l’installation proprement dite.  
On doit donc retrouver dans les logs de dpkg toutes les interventions réalisées sur les paquets.  

## Installation à partir des sources

!!! note inline end ""
    Il est important de faire un espace de compilation spécifique à un utilisateur qui n'est pas root afin d'éviter des problématiques systèmes et sa sécurisation

Il s’agit de la méthode native d’installation sur les systèmes Unix/Linux  

Cette technique n’est pas la plus simple, et varie énormément suivant le type de source récupéré.  
Il y a tout de même un cheminement à suivre.  

### Lecture de la documentation

La documentation est généralement disponible sous un fichier **README** ou **INSTALL**.  
Celui-ci contient généralement les autres étapes de la construction de l’application, avec la liste des dépendances de construction de fonctionnement.

### Préparation de la compilation

Cette étape va vérifier s’il y a toutes les dépendances de compilation sur le système puis générer un fichier **Makefile** contenant toutes les informations de compilation et d’installation.

```bash
user@deb:/opt/sources/application$ ./configure
```

### Compilation

!!! tip ""
    A l'issue de cette étape, l'application n'est toujours pas installée dans le système, mais elle est totalement fonctionnelle.

Cette étape va permettre de créer l’application compilée à partir de ses sources en se basant sur le fichier **Makefile** contenant toutes les informations de compilation.  

```bash
user@deb:/opt/sources/application$ make
```

### Installation

C’est la seule étape à réaliser avec les privilèges root car cette étape est une simple copie de l’application dans les répertoires système comme **opt/bin** par exemple.

```bash
root@deb:/opt/sources/application# make install
```