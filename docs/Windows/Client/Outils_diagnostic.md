# Les problématiques

## Performances : Est-ce que le systeme est en mesure de réaliser les taches ?

Ils peuvent etre causés par de mauvaise performances du systemes d'exploitation et du matériel.
Niveau matériel il faudra surveiller les 4 elements majeur de l'ordinateur:

1. Processeur
2. Memoire vive
3. Stockage
4. Carte réseau

## Fiabilité: Est-ce que le systeme a le comportement attendu ?

est-ce que l'ordinateur de l'utilisateur peut correctement faire son travail quotidien?
est ce que l'ordinateur demarre vite et sans probleme?
Est-ce que tous les services dont j'ai besoin sont demarrés ?
est-ce que toutes mes applications professionnel demarre et fonctionne correctement ?

## Les methodes disponibles pour répondre a ces questions

1. Analyse en temps réel : afin de voir un probleme en cours
2. Analyse sur un historique : afin de voir un (ou des) dysfonctionnement survenu dernierement
3. Diagnostic automatique : inclus nativement dans windows
                            >En general non utilisé par les equipes techniques car les process et les resultats ne sont pas assez transparent (voir inexistant)

**Analyse en temps reel** : Comment Proceder ?

Afin de visualiser ce qui ce passe sur mon systeme actuellement ,windows propose plusieurs outils, plusieurs tableaux de bord :

- le **gestionnaires de tâches**: permet de lister:
  - les processus en cours d'execution,
  - l'etat des services,
  - les taux d'utilisation du matériel (performance processeur et memoire)
- **Observateur d'évènements** : appelé egalement **journaux d'evenement** ou **log** permet de trouver des indices sur les dysfonctionnement
- **Moniteur de ressources** : Tableau de bord complémentaire au **Gestionnaire de taches**, il donne des détails sur l'utilisation actuel des 4 composants principaux
- **Analyseur de performances** : Permet de positionner des sondes (compteurs), de declencher des sondes sur un choix de plusieurs centaines d'elements du systeme.

>Tres utilisé sur des serveurs et en derniers recours si les autres outils d'analyse sont pas aidés

**Analyse sur un historique** :

- **Historique de fiabilité** : propose une vue synthetique, resumé de l'etat de santé de windows. Il recense les evenements majeur du systeme dans le temps
- **Observateur d'evenements**: A disposition pour remonter le temps et enqueter sur la cause d'un dysfonctionnement passé ou qui se repete regulierement (les evenements sont mémorisés dans des journaux de 20Mo par défaut)
- **Analyseur de Performances** : permet de planifier des compteurs (sondes), dans des plages horaires (heure de nuit, bureau fermé etc.), afin de recuperer un rapport d'analyse generer par l'outil

**Diagnostic automatique** :

Utiliser pour des analyses poussée du matériel.

- **diagnostic de mémoire Windows** : redemarre automatiquement le systeme et lance une serie de tests sur la mémoire physique
- Composant **Résolution de probleme**: série de packs de résolution de probleme intégrés à Windows.
    >Ils sont orientés utilisateur, il n'est pas possible de choisir ou consulter la solution trouvée

## Dans quel but ?

Les outils d'analyse sont a disposition pour trouver des **indices**, pour comprendre et faire des recherches.
En complément il sera, quasiment, obligatoire d'utiliser d'autre ressources:

- Recherches sur internet : il existe bien souvent une solution au probleme.
  - Le site **technet** est le site officiel des techniciens microsoft, est tres riche en procedure et en résolution de probleme.
- Aide Windows,
- Forum.

## Point de restauration système

Les **Point de restauration systeme** agissent comme un journal, ils enregistrent les modifications du systeme.

- Le systeme peut etre restaurer à un état antérieur, et cela plus rapidement qu'une restauration complète via les enregistrements
- Sauvegarde la base de registre, certains fichiers systeme et les programmes
- ! ne sauvegarde pas la DATA ! pour cela l'utilisation d'un logiciel de sauvegarde avant une restauration est nécessaire.
- L'outils est désactivé par défaut
- Doit etre activé Volume par Volume

Apres activation de la fonctionnalité, les points de restauration sont crée :

- Chaque jour
- A chaque evenement important survenant sur le systeme
  - Installation d'un pilote
  - Désinstallation d'un logiciel
  - ...
- Manuellement

L'outils est disponible via les propriétés avancé du systeme et dans l'onglet **Protection du systeme** (ou via *sysdm.pl*)
Un espace protégés est alloué pour le stockage des points de restauration (methode FIFO), il est possible d'en determiner la taille.
Si celui-ci est totalement occupé alors le points de restauration le plus récent ecrasera le plus ancien.

La restauration peut etre effectué via l'onglet nommé au dessus ou, si le systeme est entierement planté, via WinRE

## Récuperer le systeme

<!-- inserer une image du menu WinRE -->

## WinRE

il s'agit de l'outil officiel et natif de récupération de l'OS principal de la machine.
WinRE est un systeme d'exploit leger qui permet de reparer le sys d'exploit principale lorsque celui ne repond plus.
Il embarque des outils de diagnostic et de réparation, il offre également la possibilité de revenir a une config d'usine

## Comment lancer WinRE ?

En premier lieu WinRE est un syst d'exploit secondaire, il doit etre disp sur un support bootable.
C'est le cas du DD principal de l'ordinateur, un volume est reservé, sur le DD, pour cet OS de secours.

Pour le lancer :

- via le menu demarrer il suffit de cliquer sur redemar tout en maintenant la touche `shift` (MAJ)
- via la ligne de commande ``shutdown /r /o`` (/r = reboot | /O = winRE | /T= temps avant redémarrage (ex /t 0 = redémarrage immédiat))
- via le menu **Parametre**>**Mise a jour de sécurité**>**Récupération**>**Redémarrer maintenant**
- via le support d'installation, dans le cas au le DD principal connait un probleme et ne peut lancer WinRE, il faudra ce rendre dans le menu **Réparer l'ordinateur**

Lancement automatique de WinRE si il considere que le systeme principal n'est pas assez fiable:

- Apres 2 echecs consécutifs du démarrage du systeme d'exploitation
- Apres 2 arrets imprévus survenus moins de 2 min après le démarrage.

## Récupération du systeme

- **WinRE** propose de restaurer le systeme via un point de restauration systeme disponible, pour cela il faut etre administrateur,
- **sauvegarde de l'image systeme** Il sera possible de restaurer entierement le systeme.
- **Invite de commande** `cmd`executée en tant qu'administrateur, permet d'utiliser des outils de diagnostic ou de réparation

> Si Windows provient d'une **Man** (**M**ise **A** **N**iveau) possibilité de retrograder vers la version précédente.

## Windows ne veut pas demarrer ?

Cela est certainement due a un probleme dans la sequence de demarrage pour cela nous pouvons lancer une séquence de demarrage differente:

- **Mode sans echec** : Windows 10 leger et qui ne demarre que les elements indispensables
- **Mode basse résolution** : Dans le cas ou la carte graphique fait défaut et que rien ne s'affiche a l'ecran
- **Sans prise en compte de la signatures des pilotes** : Dans le cas ou un peripherique ne fonctionne pas faute de certificat

Outils de redémarrage syteme :

permet en autre de :

- reconstruire/réparer le MBR ou la GUID PArtition Table éventuellemnt manquant ou corrompu
- Reconstruire/réparer le magasin BCD (Boot Configuration Data) cela correspond a un ensemble de fichier qui prennent en charge et coordonne le démarrage habituel de Windows
