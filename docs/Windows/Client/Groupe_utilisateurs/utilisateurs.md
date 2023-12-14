# Utilisateurs

la not° d'utilisateur est une notion crucial

win10 est partout dans les entreprises et est le point d'acces au systemes d'information de l'entreprise qui vous permet de travailler.
du coup

- etes vous une personne de confiance ?
- etes vous une personne ayant le droit d'acceder au données de l'entreprise?
  - les données pouvez vous :
    - les consulter
    - les modifier
      - quelle fichier
      - quelle dossier
    - avez vous acces a l'ensemble du systeme d'info ou simplement a une partie
  - etes vous un membre del'enterprise hors service informatique
  - etes vous exterieur a l'enteprise (prestataire)
  - etes vous membre de l'equipe IT
Toutes c'est questions doivent-etre traitées car il s'agit de la base de la sécurité informatique

- Id?
- Mdp?
- Acces en lecture ? En écriture ?
- a quelques fichiers ? a l'ensemble du réseau ?
- Simple utilisateur ? Tech Info ? administrateur de l'entreprise ? etc

La regle d'or est la suivante :
1 collaborateur de l'entreprise = 1 utlisateur du systeme d'information de l'entreprise
Acces au SI validé par :
couple : Id + MdP
Biométrie (windows hello)
objet tiers (carte a puce, badge..)
2nd authentification possible (SMS, lien de validation, etc)

## Gestion des utilisateurs

Utilisateur Local

- Propre a chaque ordinateur
- stocké dans la base de données locale SAM (Base Security Account Manager)
- ne peut exploiter que les ressources de l'ordinateur source

Utilisateur de domaine (rsx entreprise)
besoin d'etre reconnu par plusieurs ordinateur et/ou serveur

- stocké dans une base de données commune (annuaire Active Directory)
  - sur un serveur de l'entreprise (controleur de domaine)
  - Externalisé chez un prestataire (MS Azure ou autre)
- Authentification Kerberos sécurisée par le réseau
- un utilisateur peut ouvrir une session sur tous les ordinateurs du domaine
- un utilisateur (local,dedomaine) est identifié par le systeme grace a son **SID** (**S**ecurity **ID**entifier)

lors de l'identifiaction
l'ordinateur contact (de maniere securisé) le controleur de domaine et lui transmet ID et Mdp, le serveur controle la présence de l'utilisateur dans l'annuaire et donne le feu vert ou non a 'lordi pour l'ouverture de session.

## ouverture de session

- utilisateur locaux
  - utiliser un compte présent dans la base SAM
  - compte affichés par défaut sur l'écran d'accueil

- utilisateur du domaine
  - Jonction du poste au domaine de l'entreprise indispensable au préalable (inscription de la machine dasn la base de l'annuaire)
  - domaine selectionné par defaut et on peut entrer le couple ID & Mdp inscrit dans l'AD
    - Possibilité de s'authentifier a un autre domaine grace a l'annuaire de l'autre domaine

! les utilisateur locaux sont toujours présent dans la machine, apres une jonction de domaine, toujours identifiable mais ils n'apparaissent plus à l'ecran de connexion une fois l'ordinateur joint au domaine !

## catégories d'utilisateurs

1. Standard
   1. ouvrir une session et utiliser les ressources de l'ordinateur
   2. considere comme standard des qu'il devient membre du groupe utlisateur

2. Administrateur (possede plus de privilege qu'un utlisateur standard)
   1. peut toujours ouvrir une session et utliser les ressources de l'ordinateur
   2. Peut modifier le systeme
   3. etre membre du groupe administrateur
   4. utilisateur crée à l'instalation du systeme fait partit du groupe administrateur (est referencé dans la base SAM)
   5. autre compte *administrateur* (compté générique car il n'identifie personne) pré-existant dans le systeme (referencé dans la base SAM), il est desactiver nativement car cela represente une faille de sécu

3. Compte invité
   1. Pour une utlisation restreinte et temporaires des ressources de l'ordinateur
   2. Pas besoin de mdp pour accéder au ressources (utlisateur non authentifier)
   3. compte désactivé par défaut (compte générique comme le *administrateur*)

## Gestion des profils

chaque utilisateur a son propre profil, le profil est l'esp. perso de l'utilisateur il en est propriétaire
un utilisateur possede un profil des lors qu'il ouvre une session pour la premiere fois, un profil perso est créé

- dans le dossier c:\users
- propre a chaque utilisateur (autant de sous dossier que d'utilisateur ayant ouvert au moins une fois une session sur l'ordinateur)
- contient tous les parametres et données de l'utilisateur :
  - documents
  - Télechargement
  - bureau et raccourci qu'il contient
  - images
  - etc

Profil Public commun a tous les utilisateurs se que contient le profil public se repercutera sur les profil perso des utilisateurs

Profil par défaut: sert de base a la création des profil d'utilisateur (possibilité de le modifier, l'enrichir, le faire evoluer)

## Comment gerer les profils ?

connaitre les bonnes pratique de gestion de profil
chaque sous dossier dans c:\users est lié a un utyilisateur et contient des jointure avec le DD et notamment avec la base SAM qui elle est meme est contenu dans la base de registre de l'ordi.
il est donc fortement deconseillé de manipuler les profils directement depuis le rép. c:\users.

Il faut passer par les parametres systemes avancés (sysdm.cpl onglet parametres systemes avancés)

- supp des profils
- modifier le type du profil
- gestion du profil par défaut

## les outils

Plusieurs possibilité pour gere les utilisateurs et les groupes.

graphiquement depuis la console mmc

- lusrmgr.msc (gestion des utilisateurs et groupes locaux)
- compmgmt.msc (gestion de l'ordinateur)

menu **comptes d'utilisateurs** dans le panneau de configuration (orienté utilisateur que technicien systeme ! utilisation deconseillé !)

en ligne de commande avec le shell cmd.exe (gestion utilisateur et groupes)

- net user (net help user pour l'aide détaillée)
- net localgroup (net help localgroup)

Configuration en Powershell

- notamment avec les cmdlets associé au nom localuser et localgroup ou localgroupmenber

## UAC

(controle de compte utilisateur)
sans action particuliere le systeme loge tous les utilisateur a la meme enseigne... meme les administrateurs  
Toutes action sur le systeme est considerer comme un utilisateur standard (meme en temps que membre du groupe administrateur)*

il faut donc justifier le droit d'utiliser des privileges d'administration, et c'est la que l'UAC intervient.

- par l'intermediaire de l'UAC, le systeme n'accorde les privileges que lorsque c'est nécessaire
- elevation de pouvoir symbolisée par le "bouclier"
- si utilisateur membre du groupe administrateur une validation est requise
- dans le cas contraire un authentification administrateur est requise

Pourquoi ces controles ?

- lutter contre les actions des programmes malveillants
- avertir face a un parametre sensible du systeme

! il est deconseillé de desactiver l'UAC ! (en rouge)

Comment le configurer ?

- via le panneau de configuration
- via la console de stratégie locale
  - secpol.msc
  - stratégie locales>options de sécurité
  - valeurs **controle de compte utilisateur**

en genreal la configuration par defaut du niveau de l'UAC est suffisante.

Pour certaine il est necessaire de demander l'elevation de droit.
ex: je souhaite modifier le systeme via `cmd.exe` il faudra lancer la console avec des privilege d'administration (clic droit lancer la console en administrateur)

Récapitulatif module

utilisateur :

- nom ouverture de session & mdp
- profil local contenant les donnees personnelles de l'utilisateur (crée a la premiere ouverture de session)
- SID unique identifiant l'utilisateur sur le systeme
- appartenances de groupes définies dans l'onglet **Membre de**
- l'ensemble des SID constituant le **jeton d'acces**, ouvrant des accès & accordant des privileges d'administration

! informations des **jetons d'acces** consultables avec la commande whoami /user