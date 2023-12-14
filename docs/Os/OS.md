# Comment définir un système d'exploitation ?

Un systeme d'exploitation ou (Operating System = OS) en anglais un logiciel qui est édité et proposé par :

- Des communauté (Linux...)
- Des groupes privés (MicroSoft, Apple...)
- Des fabricant de matériel (Synology,Qnap, Samsung...)

Il pilote (donne des ordres) les dispositif matériel.
Les ordres sont données par l'utilisateur, ainsi que par des application mise a la disposition de l'utilisateur.
Sans utilisateur le systeme d'exploitation ne peut pas faire grand chose.
Le résultat du travail effectué par le matériel est rendu par défaut à l'ecran ou bien vers d'autre peripheriques (ex: une imprimante).

## Quelles sont ses fonctions principales ?

Le systeme d'exploitation gère :

- **Le Processeur**: C'est l'OS qui lui envoi des ordres, ordre donné par l'utilisateur ou par l'intermediaire d'un logiciel,
- **La Mémoire Vive**: il va chercher les resultats des calculs (en RAM) effectué par le processeur pour les retranscrire à l'utilisateur,
- **Les Applications**: Il en optimise l'éxécution en leurs attribuant les ressources nécessaire et il partage l'ensemble des ressources matériel aux applications ouverte simultanément.
- **Monitoring**: Il fournit des informations sur le bon fonctionnement de la machine via:
  - Des **tableaux de bord** affichant les informations en temps reel
  - Des **journaux (log)** archivé sur plusieurs semaine
- S'assure de l'utilisation des **periphériques** dans les meilleurs conditions
- S'assure d'une bonne communication entre la carte mère et les périphériques via les bus
- S'assure du bon fonctionnement via les **pilotes (Drivers)**
  - Drivers = manuels d'utilisation des périphériques pour l'OS
- **Proteger l'acces aux ressources**:
  - Il priorise les **accès** lorsqu'un conflit d'accès apparait
  - Protege l'acces aux ressources: chaque OS s'appuie sur un principe de privilege d'acces (Les actions et accès d'un simple utilisateur seront réduite comparé aux accès d'un administrateur de la machine. l'OS veillera à permettre l'accès à des informations et/ou ressources au seul personne concernés |une personne non autorisée à consulter une données aura une notification système|)
[image du cours schéma OS]

## De quoi est-il composé ?

- **Un noyau (ou kernel)**: L'element de l'OS en lien direct avec le matériel, ce noyau peut evoluer, etre mis a jour, des modules complémentaires peuvent venir si greffer.
- **CLI** (**C**ommand **L**ine **I**nterface) ou **Shell**: Interpréteur de commande jouant le rôle d'intermédiaire entre l'utilisateur et l'OS. En fonction du Systeme d'Exploitation les shell peuvent differer
- **GUI** (**G**raphical **U**ser **I**nterface): Permet une interaction plus naturel, plus friendly, pour les utilisateurs non initiés au Shell. A noter que sur certain OS les **GUI** sont facultatives.

Certain Systeme propose nativement leurs interface graphique (historiquement MicroSoft). D'autre OS laissent le choix à l'utilisateur d'en utiliser ou non.

- **Systeme de fichiers**: il permet le bon fonctionnement de l'OS via les indispensables fichiers systemes mais il permet également aux utilisateurs de conserver leurs données dans le temps afin de pouvoir les reutiliser.
  - Ils organisent les données et eventuellement securise l'accès aux données au seins d'un espace de stockage (ex: Disque Dur, Cles USB)

## Ou peut-on les trouver ?

Plus la technologie évolue, plus nous utilisons d'outils connecté piloté via des systemes d'exploitation ils sont  donc trouvables partout autour de nous.
On pense en priorité à :

- Nos ordinateur personnel,
- Au travail via les serveur de notre entreprise et nos poste client
- Nos téléphone portable/tablette (Android/IOS)
- Les montres connecté (Androidwear ou watchOS)
- Du matériel reseau comme par exemple dans les switch & les routeurs (Ios cisco/ HP com wear),
- Les televisions avec AndroidTV etc,
- Des voitures (ordinateur de bord etc).

## Systeme d'exploitation Linux

Un systeme d'exploitation est un composant logiciel principal, qui permet d'exploiter un ordinateur, c'est lui qui permet l'utilisation d'un clavier, d'une souris, d'avoir un retour des actions a l'ecran etc  
c'est un programme (ou ensemble de programmes) chargé de gerer les ressources matérielles d'un ordinateur et de les mettre à disposition des utilisateurs.

Exemples de systèmes d'exploitation:

- Systemes Propriétaire (intégralement lié a un fabricant)
  - AS400 (IBM)
- Systèmes ouvert mono poste, mono tâche (micro)
  - DOS sous license propriétaire mais permet une plus grande plage d'installation et d'utilisation
- Système ouvert multi-poste, multi-tache, multi-plateforme
  - UNIX, GNU/Linux, Windows, OS-X

## Composantes d'un système d'exploitation

Schéma en couche

<!-- inserer image du schéma de couche sur support de cours-->

1. **Matériel** avec lequel le systeme d'exploitation echangera carte mere, processeur, memoire vive et disque dur mais également écran, clavier, souris, carte graphique, carte son et autres périphérique externe
2. **Noyau** chargé des échanges avec le matériel et les couches logiciel supérieur, il est le coeur du systeme d'exploitation
3. **Shell** l'interface principale par laquelle l'utilisateur pourra utiliser des ressources de l'ordinateur et les logiciels et application disponible. Dans le monde Windons c'est la GUI mais parfois une console type CMD ou PowerShell. Dans le monde linux c'est principalement la ligne de commande, le shell nommée Bash.
4. **Application(s)** toutes les applications disponible à l'utilisateur, un editeur de texte comme word ou `vi`sous linux, d'un browser comme firefox google chrome etc
5. **Utilisateur(s)** Si les app sont souvent la finalité de l'utilisateur il intéragit d'abord avec le shell pour lancer le programme et avoir acces a ses dossiers, ses fichiers.  

Le noyau UNIX/Linux est le programme principal du système.  

- Il a pour role de :
  - Gérer les ressources (périphériques,mémoire...)
  - Ordonnancer les différentes tâches (processus) cadenser les diverses taches pour quelle puisse s'executer en meme temps sans qu'une seule ne vienne s'accaparer l'intégralité des ressources disponibles
  - Mettre ces ressources à la disposition des utilisateurs
- Dans un sens plus large, on entend souvent par noyau linux, le noyau lui-même ainsi que l'ensemble essentiels au système.
- On utilise également le mot anglais Kernel.

## Connexion à un systeme Linux

Pour la connexion un utilisateur doit disposer un compte

- identifiant
- mot de passe

> le mdp ne sera pas afficher pour des mesures de sécurité

### connexion direct

plusieurs maniere sont possible de ce connecter:

- directement sur un SRV ou une VM, via la console méthode disponible pour la 1ere installation du système ou en cas de panne (également appelé la **boite noire**).
- via une interface graphique

### Connexion distante

Connexion distante en **ssh** a travers:

- une fenetre `cmd.exe` (windows récent)

```cmd
C:\Users\Math>ssh user12@10.106.200.126
user12@10.106.200.126's password:
Linux srv-formateur 4.19.0-8-amd64 #1 SMP Debian 4.19.98-1+deb10u1 (2020-04-27) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Mon Jul  3 16:52:37 2023 from 172.25.128.2
user12@srv-formateur:~$
```

- un logiciel dédié (par exemple **Putty**)
Putty est le plus connu des logiciels de connexion **ssh**  
il est Open Source  
il permet la copie de fichiers pscp & psftp
<!-- inserer capture d'écran putty-->

il y a bien d'autre logiciel de connexion a distance depuis windows:

- Kitty: "Fork" de Putty.  

??? quote "Fork"
    Nouceau logiciel basé sur les sources d'un précédent.
    Souvent suite a des divergences de developpeur ou apres le rachat d'une entreprise.

- mRemoteNG: Solution reutilisant putty pour l'inclure dans une interface plus ergo et permet l'utilisation de conneion RDP pour ce connecter sur des serveur windows. Soft multi-protocole (linux, windows, citrix, VNC...)

- MobaXtrem : logiciel propriétaire proche de mRemoteNG mais payant pour les entreprises

### Deconnexion d'une session distante

Dernieres etapes importante!  
Plusieurs méthodes sont possibles et variables selon le shell utilisé.

- **exit** : Commande la plus utilisée. Compatible avec la quasi-totalité des shells, à commencer par bash  
- **logoutù** : autre commande disponible pour bash (mais pas bourne)
- **^D** : [ctrl]+D, raccourci clavier permettant de fermer une session.

/// note | CTRL
La syntaxe `^` est associé a la touche [ctrl]  
exemple sur Windows un raccourci copié [ctrl+C]  
sera affcihé [^+C]
///