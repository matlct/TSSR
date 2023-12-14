# Administration Debian

Objectifs :  
Découvrir les différents modes d’installation possibles  
Apprendre à effectuer des installations de Debian GNU/Linux.  

## Les modes d’installation

Les différents supports d’installation permettant d’installer Debian sont les suivants :  

**Les CD-ROM ou DVD-ROM**

- Live-CD Debian
  - Un système directement fonctionnel depuis le DVD afin de tester si les composants sont fonctionnels et compatibles.
  - Permets de tester sans apporter la moindre modification sur la machine et le système d’exploitation déjà présent.
  - Debian se chargera depuis le cd-rom sur la mémoire vive de l’ordinateur
  - Propose l’installation.
  - Plusieurs versions disponibles selon le bureau choisi
    - GNOME
    - KDE
    - LXDE
    - XFCE
  - Architecture I386 et AMD 64
- DVD-ROM image complète
  - Permets l’installation du système complet sans accès à internet ou à un dépôt local
  - Beaucoup de paquets installés ne seront peut-être pas utiles
  - Ne contiens pas les dernières mises à jour
- CD-ROM Netinstall
  - Contient le minimum pour lancer l’installation et récupérer les fichiers depuis un dépôt internet ou local
  - Peut nécessiter une connexion internet
  - Permets la récupération des paquets à jour

!!! tip "Téléchargement ISO"
    https://www.debian.org/CD/http-ftp/#stable

**Les Périphériques USB**

Ce sont les mêmes images ISO utilisé pour les installations via CD ou DVD.  
Mais dans ce cas le support optique est remplacé par un support USB pour cela il faut créer une clé bootable via des logiciels tiers, parmi les plus connus on peut citer :  

- Ventoy (Windows, Linux)
- Balena Etcher (Windows, Linux, macOS)
- Rufus (Windows)
- Unetbootin (Windows, Linux, macOS)

**Le réseau local**

La plupart des BIOS et UEFI actuels permettent l’amorçage à partir du réseau grâce au **boot PXE**  
Au démarrage, la machine reçoit d’un serveur dédié une adresse IP et le nom du fichier d’installation à télécharger  

**Diverse autre méthode**

Pour du déploiement sur un grand nombre de machines, plusieurs méthodes plus ou moins automatisées existent :  

- FAI (Fully Automatic Installation) pour une installation sans intervention avec plusieurs informations déjà indiqué dans un fichier de réponse et de configuration
- CD personnalisés avec préconfiguration
- Déploiements avec outils de clonage :
  - FOG
  - Symantec Ghost
  - Acronis True Image
  - Clonezilla…

## Installer Debian

Pour s’installer, un système Linux doit contenir, au minimum, deux partitions :

- 1 partition Racine : / l’origine du système d’exploitation du FHZ Linux 
- 1 partition d’échange : SWAP

La quantité d’espace disque recommandée pour la partition de SWAP varie suivant la quantité de RAM installée ou allouée :

- RAM < 1Go SWAP = RAM x1.5
- RAM <= 2Go SWAP = RAM
- RAM > 2Go SWAP = 2Go ou + selon le besoin

Au démarrage de l’installation, et ce peut importe le média choisi (optique, amovible…), le choix est donné entre une installation graphique ou une installation simple qui utilisera un mode texte amélioré dit « semi-graphique ».  

Ce choix ne désigne pas le mode cible de l’installation de Debian.  

On peut installer un serveur Linux en passant par l’installation graphique, comme un PC de bureau avec interface graphique.  

Mode de l’installeur est différent du mode de fonctionnement

Installation manuelle debian  
https://debian-facile.org/doc:install:partitions-manuel

### ***su*** vs ***sudo***

#### École du **su**

!!! tip endline end « »
    dans un premier temps mettre un mdp simple avec des caractères ayant le meme emplacement que sur un clavier *qwerty*  
    Dans le second temps changer le mdp une fois la phase d'installation terminée.

```bash
user30@deb:~$ su -
Mot de passe :
root@deb:~#
```

Durant la phase d’installation, l’installeur saisit un mot de passe affecté à root  
Le simple fait d’effectuer cette action lui réserve, ***et a lui seul***, les pouvoirs d’administration  
Le premier utilisateur créé ne possédera quant à lui que des privilèges limités.  

#### École du **sudo**

```bash
user30@deb:~$ sudo -i
[sudo] Mot de passe de user30 :
root@deb:~#
```

!!! warning endline end ""
    Il est fortement déconseillé de créer un seul utilisateur avec le privilège sudo.

Si durant la phase d’installation, l’installeur ne saisit pas de mot de passe pour le compte root, c’est le premier utilisateur qui aura la possibilité d’effectuer une *élévation de privilège via son propre mot de passe* avec la commande ***sudo***  

Il est possible après l’installation d’affecter un mot de passe au compte root afin de l’activer et ainsi libérer l’utilisateur principal de son rôle *sudo*  

```bash
user30@deb:~$ sudo passwd root
[sudo] Mot de passe de user30:
root@deb:~# passwd
Nouveau mot de passe :
Retapez le nouveau mot de passe :
passwd : le mot de passe a été mis à jour avec succès
```

### Partitionnement des disques

Cette phase consiste à choisir comment subdiviser son disque pour créer les différents points de montage du système  

Actuellement, la technologie LVM est à préférer.  

[Voir la fiche Partitionnement](./Partitionner_disque.md)

### Sélection des logiciels

Dans le cas d’une installation *Netinstall* le configurateur demandera le dépôt ou l’on souhaite récupérer les paquets et applications souhaités.  

Si l’installation a été effectuée depuis un média optique ou amovible avec une version complète, l’installeur proposera différentes pâtes (paquets) à installer, possibilité d’installer une interface graphique, des paquets pour serveur web, SSH…

### Installation du programme de démarrage GRUB

il s’agit de la dernière étape de l’installation, il faudra toujours installer le programme de démarrage (le GRUB) sur* /dev/sda*  
Si cela n’est pas validé, il ne sera pas possible de démarrer le système (même si celui-ci est bien présent sur la machine)

## Mode Maintenance

Il est parfois nécessaire de passer en mode maintenance sur un ordinateur ou un serveur pour diverses raisons  

- Le système ne démarre plus suite à une mise à jour ou une installation
- Le mot de passe de l’utilisateur root est perdu
- Récupération de données

### GRUB

!!! danger inline end ""
    Ce mode n'est pas fonctionnel en mode "sudo sans mot de passe" pour l'utilisateur

Passer par le *boot manager* GRUB pour passer en mode maintenance.  
Utilisez les flèches pour choisir le noyau souhaité puis appuyez sur la touche « e ».  

Modifier la fin de la ligne suivante :  

`linux  /vmlinuz[version_du_ficher] root=/dev/mapper/debian--vg-sys ro quiet`  

par :  

`linux  /vmlinuz[version_du_ficher] root=/dev/mapper/debian--vg-sys ro single`  

Valider avec [ctrl+x] ou [F10].  
Saisissez le mot de passe root. ­^^¡ Attention le clavier est au format **QWERTY** en-US !^^  
Après vos actions en mode maintenance, la séquence de touches [ctrl+d] vous permettra de poursuivre le chargement vers la cible **rescue.target**  

#### GRUB sans mots de passe root

Comme ci-dessus, nous passons par le boot manager pour accéder au mode maintenance.  

Il faut toujours modifier la ligne précédente, mais cette fois il faut remplacer ***quiet*** par ***init=/bin/bash***  

`linux  /vmlinuz[version_du_ficher] root=/dev/mapper/debian--vg-sys ro init=/bin/bash`  

Il faudra également valider avec [ctrl+x] ou [F10]  
Une fois de plus, le clavier sera en **QWERTY** en-US  

Le système est démarré, mais le système de fichier racine est en lecture seule.  
Il faut lancer la commande suivante pour obtenir l’accès en écriture :  

```bash
root@(none):/# mount -o remount,rw /
[   88.5124578] EXT4-fs (dm-0): re-mounted. Opts: errors=remount-ro
root@(none):/#
```

Après cette manipulation, synchronisez l’écriture des données en RAM vers le disque avec la commande : `sync`  

!!! danger « RAPPEL »
    Arret propre de la machine impossible  
    Il faut forcer l'extinction par un **PowerOff** electrique
