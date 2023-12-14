# Gestion des groupes

tout utilisateur doit appartenir a au moins 1 groupe pour utiliser le systeme
les groupes sont identifié par le systeme grace a un SID (Security IDentifier)
lorsqu'un utilisateur est ajouté a un groupe, le SID du groupe enrichi le jeton d'acces de l'utilisateur.

!un jeton d'acces c'est l'ensemble des SID associé a un utilisateur, le jeton d'acces contient alors le SID de l'utilisateur mais aussi l'ensemble des SID de tous les groupes auquel appartient l'utilisateur !

## catégorie de groupes

*Groupes locaux*
Permet majoritairement au technicien de

- gerer les authorisations d'acces aux ressources
- gerer les privilges d'administration

*Groupes prédéfinis (présent nativement)*
Permet de configurer les privileges et de deleguer des taches d'administration standard comme par exemple :

- gerer des sauvegardes
- configurer la carte réseaux
- lire les journaux d'evenements

*Entités intégrées de sécurité*
Groupe transparant affecté au utilisateur automatiquement par windows

- non visible dans les consoles
- affectation automatique
- utilisés par le systemes pour les gestion des permissions (tout le monde, utilisateur authentifiés...)

## Stratégie de Groupe Local

### La base de registre windows

La base de registre windows, il s'agit

- d'une base de données native a destinations du systeme, elle est hierarchique et centrale
- stocke toutes les informations de configuration du systeme (du 1er demarrage et durant toute sa durée de vie)
  - pour un ou plusieurs utilisateurs,
  - programmes,
  - périphériques matériels
- utilisé depuis windows 98
- contient des milliers de parametres

Windows consulte en permanence les informations contenues dans le registre de cette base dans le but d'executer dans les meilleurs conditions les ordres que l'utilisateur lui donne.

La base de registre est consultable via la commande `regedit`

>A manipuler avec la plus grande précaution

### Les RUCHES

les données de la base de registre sont regroupées sous 5 catégories (ou **ruches**)

1. HKEY_CLASSES_ROOT : informations sur les applications (objets OLE, extensions)
2. HKEY_CURRENT_USER : Configuration relative à l'utilisateur actuel qui a ouvert une session sur l'ordinateur
   (= HKEY_USERS \ SID)
3. HKEY_LOCAL_MACHINE : Contient des informations de configurations spécifiques a l'ordinateur (pour n'importe quel utilisateur ayant utilisé l'ordinateur)
4. HKEY_USERS : Contient tous les profils utilisateur chargés activement sur l'ordinateur
5. HKEY_CURRENT_CONFIG : Profil materiel utilisé par l'ordinateur

Pour la gestion/configuration des stratégie de Groupes Locaux il faudra particulierement travaillé avec les ruches 2 & 3

LEs ruches contiennent des clés, qui peuvent elles meme contenir d'autre clés, comportant des valeurs.
Ces valeurs peuvent etre sous forme:

- binaire :
  - On/Off
  - 1/0
  - True/False
- hexadecimal
- chaine de caractere

[exemple de cours imprimante]

clé drivername = chaine de caractere : nom du pilote
clé set as defaut & Shared = possède des valeurs a 0 cela sous entent que cette imprimante n'est pas l'imprimante par défaut de l'utilisateur et quelle n'est pas partagée

## Les LGPO (Local Group Policy Object)

Elles permettent de gerer le comportement du poste de travail et des utilisateurs avec une seule et même console:

- via le composant logiciel enfichable "editeur d'objet de stratégie de groupe"
- via la console stratégie de securité local, plus orienté securité du systeme (appelable via le raccourci `secpol`)

Elles vont nous permettes de reduire le temps consacré a la gstion du poste de travail
toutes base de données est liée a des applications qui les exploitent de facon plus efficace et de facon plus conviviable.

Les LGPO permettent:

- modifier et renforcer les stratégie de mdp
- Agir sur les privileges d'administration du systeme
- Uniformiser/configurer l'aspect du poste de travail pour les differents utilisateur
- Restreindre l'acces a certain parametre (panneau de configuration), certain menu du systeme (invite de commande) afin de fiabiliser et securisé le poste de travail
- demarrer des scripts a l'ouverture/fermeture de session utilisateur
- ...

le composant logiciel enfichable "editeur d'objet de stratégie de groupe" permet d'agir sur

- la ruche 3, eventuellement agir sur la ruche d'un ordinateur distant
- la ruche 2, il agit donc sur les utilisateurs de la base SAM ainsi que sur des groupes prédéfinis (les groupes locaux n'apparaissent pas)
  - administrateur
  - non administrateur

La console permet de naviguer parmis les parametres sur lesquel nous pouvons agir
chaque parametre peut-etre active ou desactivé, par défaut chaque parametre est non configuré, c'est le systeme qui décide par défaut.
Les parametres peuvent etre commenté pour les eclairer, laisser des traces.
Ils possedent également des conditions, les conditions sont listé dans le cadre "prise en charge sur"
[screen pdf cours]
dans notre exemple il s'agit de supprimer le lien jeux du menu demarrer, cela ne sera possible que sur Windows Server 2008, windows 7 et Windows Vista.
Chaque parametre possede une aide.
