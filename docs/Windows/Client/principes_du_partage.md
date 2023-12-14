# les principes du partage

- permet d'acceder a une ressource
  - hebergée par un serveur
  - depuis un systeme d'exploit client
  - en passant a travers le reseau

il y a 4 elements essentiel derriere un partage:

1. la ressource
2. le serveur
3. le client
4. le reseau

## qu'est ce qu'une ressource ?

**les ressources** accessible depuis le reseau sont des fichiers (via le partagee de dossier, d'arborescence ou de volume entier et des imprimante)(def. MS d'une resrouce partageable)
**Les serveurs** qui herberge ces ressources peuvent etre:

- OS client (win10)
- OS serveurs (Win serveur)
- copieur
- une tablette
- un smartphone
- tout hote possedant des ressources et une carte reseau
**les clients** qui peuvent acceder a une ressource partagée
tout type de systeme connecté au réseau peut acceder aux ressources partagées
- Serveur
- poste client fixe ou portable
- copieur
- tablette
- ...

## Qui peut Partager ?

partager = modifier le systeme. il faudra donc des privileges d'aministration

## qui a acces au partage ?

on partage les ressources au seules personne concernées

- une authentification est requise (compte local, du domaine)
- 3 nivx d'acces sont définis sur la ressource partagée
  1. lecture
  2. Modifier
  3. controle total
- 2 vérification d'identités sont effectuées
  1. au niveau du partage
  2. au niveau des droits NTFS
- les autorisations du partage sont restrictives
ex: l'utilisateur "john" a l'autorisation en lecture au niveau du partage et la modification au nx des droits NTFS, il n'aura au final droit qu'a un droit de lecture car les droits du partage sont restrictif

## Comment acceder aux fichiers partagés depuis win10 ?

- momentanement depuis l'explorateur windows via le chemin UNC (Uniform Naming Convention) \\serveur(nom ou IP)\nom_du_partage
- durablement en montant un lecteur reseau via la fonctionnalité **connecter un lecteur reseau** (accessible dans explorateur windows via une lettre de lecteur)
  - les lecteurs mappés sont memorisés avec le profil utilisateur et dispo des l'ouverture de session
- en ligne de commande en utilisant
  - **net use** x:[UNC]
  - commande **net view** liste les partages
- En Powershell avec la cmdlets:
  - New-SmbMapping (ex: new-smbmapping -localpath 'R:' -remotepath '\\SRV-FIC\compta')

## Comment partager des ressources depuis un serveur ?

! Bonne pratique : toujours passer par le ***partage avancé...*** !

Avec l'explo windows depuis les propriété du dossier [onglet partage]
**Partager...** puis le menu déroulant "accorder l'acces à..." ainsi que le bouton **partager[avec bouclier]** correspond a la mise en place de **partage de base** (orienté utilisateur) simplifié et automatique [a eviter]
**Partage avancé** onglet partage depuis les propriétés du conteneur
par défaut l'entité **tout le monde** possede un acces en lecture.

- bonne pratique: pour la sécu, supprimer l'entité tout le monde car elle contient le groupe "invité" & l'utilisateur "invité" a la place ajout de l'entite "utilisateur authentifiés", les droits du partage étant restrictif il faut accorder l'acces en controle total pour les "utilisateurs authentifiés".
- Aucun danger a mettre en controle total car affinages des authorisations d'acces avec les droits NTFS de la ressources

depuis le composant mmc avec l'outil enfichable **dossiers partages** (fsmgmt.msc)

- lister les partages
- creer des nouveaux (assistant de creation)
- vues sessions et fichiers ouvert (id utilisateur actuellement connecté aux partages et liste en tps reel les fichiers ouvert par les utilisateurs)
- affichage des partages administratif generes automatiquement par le systeme, a l'installation du systeme ou a l'ajout d'un nx volume(nom terminant par $) ils sont caché et n'apparaissent pas sur le rsx, seul le compte admin peut y acceder

depuis l'invite de commande

- net share pour lister et configurer les partages
  - ex: net share commun=d:\note_de_service /grant:"utilisateur authentifiés",FULL [bonne pratique données l'acces aux utilisateurs authentifiés en controle total |droit restrictif de partage | droit ajuste avec la securité NTFS]

en powershell avec la cmdlets **new-smbshare**
  ex: new-smbshare -name "VSMFiles" -path "c:\ClusterStorage\Volume1\VMFiles" -FullAccess "authenticated users" [bonne pratique données l'acces aux utilisateurs authentifiés en controle total |droit restrictif de partage | droit ajuste avec la securité NTFS]

## Session à distance

Acces distant au poste :

- possible grace a la fonctionnalité **bureau à distance**
- Authentification avec un compte valide (local ou de domaine)
- Necessite des privileges specifiques
- meme nivx de fonctionnement qu'une session locale

Utlisation courante :

- Maintenir des postes (1 seule session locale ou distante)
- Acceder a distance aux serveurs (2 sessions simultanées depuis windows 2008)
- Acceder a son environnement de travail depuis l'exterieur (VPN Virtual Private Network)

Les Limites

- Mode maintenance sur un poste client (pas d'interaction possible avec l'utiliateur) 1 session locale ou distante ce qui ne permet pas de faire du depannage en tps reel avec l'utilisateur
- sur les serveurs, 2 sessions avec des comptes differents
  - blocage (a distance) si les sessions restent ouvertes
Pour le support utilisateur (aide, depannage en tps reel) d'autre solution sont disponible:
- teamviewer
- vnc
- Microsoft remote assistance (nativement sur les OS)

Pour ce connecter a plus de 2 en simultané sur un serveur il faut activer le role MS RDS (Remote desktop service)

## Comment ce connecter à distance sur un poste win10

via l'outil natif connexion bureau a distance

- Ensemble d'onglets pour personnaliser la connexion
- sauvegarder les parametres
- Mappez vos ressources locales sur le poste client
  - cles usb
  - imprimante
  - presse-papier pour faire du copy/paste du distant vers la machine local

accessible via la commande mstsc

## config du poste cible (celui ou l'on veut prendre la main)

activation de la fonctionnalité via l'onglet utilisation a distance dans les param syste avance de windows.

- Rubrique **systeme** du panneau de conf
- **Parametres systemes avancés**
- onglet **Utilisation a distance**

! La fonct° est nativement desactivée pour des raisons de sécurité.!
2 nvx d'identification/authentification sont disponible pour ouvrir une session sur un bureau distant

1. Authentification Standard : compatible avec tous type de logiciel client bureau a distance
2. Authentification NLA (Network Level Authentication): basé sur uen double authentification
   1. sur le reseau avant de ...
   2. s'authentifier sur la machine distante le client connexion bureau a distance est compatible avec ce niveau d'authentification

Par defaut seule les administrateur sont autorisé a ouvrir une session distante.
Possibilité de donner l'acces a d'autre utilisateur via le groupe prédéfinis **Utilisateur du bureau a distance**

## mecanisme de fonctionnement

l'interaction entre la machne local et la machine distante ce fait via le Protocole **RDP** (Remote desktop protocol) en écoute sur le ports 3389. ce protocole envoi les mouvements de souris et les frappes clavier puis recupere le raffraichissement d'affichage de la machine distante.
la fonctionnalité ouvre automatiquement les acces dans le pare-feu

les rsx sont les fondations des systemes d'information des entreprises.
Ils sont indispensable, les services s'appuie sur le rsx pour etre accessible a tous.
les OS clients ont pour objectif principal d'acceder au services de lentreprise grace a un rsx.
Il est donc naturel de securisé ces acces via, entre autre, des demandes d'authentification
