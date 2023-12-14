## Prérequis et Installation

l'installation d'une solution de virtualisation de serveur nécessite certains prérequis matériels en effet comme toute solution de virtualisation hyper V nécessite que l'hôte de virtualisation possède les prérequis au niveau du CPU.  
nous avons déjà vu ses prérequis qui sont l'intel VT-x avec un numéro de version en fonction de la génération de microprocesseurs ou AMD-v.  
Hyper V fonctionne également uniquement à partir de Microsoft Windows, il faut au minimum utiliser la version 2008 de la distribution serveur de Windows.  
Hyper V peut également fonctionner sur la solution cliente de Windows à partir de Windows 8 pro en version 64 bits.  
Hyper V existe sur 2 solutions bien distinctes la version serveur autonome, qui dispose de la console de gestion hyper V et d'une console PowerShell.  
La gestion des machines virtuelles peut se faire soit avec le modèle hyper V pour PowerShell soit avec un second système Windows Server ou un système client Windows 10, sur lequel sont installés le module de gestion hyper V à partir de l'installation des outils RSAT.  
Sur les versions Windows Server il y a un rôle à installer, ce rôle s'appelle hyper V il s'installe à partir du gestionnaire de serveur la console de gestion s'installe également en même temps que le rôle .  

## Mise en oeuvre

Comme toutes solution de virtualisation hyper V permet de créer et de gérer des machines virtuelles ces machines virtuelles vont bénéficier des ressources mises à disposition par l'hôte, la gestion de ces machines virtuelles se fera soit par la console MMC, soit par l'outil en ligne de commande powershell avec le module hyperV.  
Dans la partie console l'interaction avec le système hôte va se faire avec la combinaison touche ++contrôle+alt++ cette combinaison de touche va nous permettre de récupérer les entrées clavier et également les actions faites à la souris.  
Les VM vont être stockées dans des fenêtres indépendantes, ces fenêtres vont pouvoir être réduites et déplacées avec les touches d'action.  
On peut utiliser également des médias amovibles comme les clés USB et disque dur externe , ces périphériques pourront être reliés directement aux machines virtuelles.  
Dans les différentes fonctionnalités , chaque VM sera donc affiché dans une console indépendante.  
Chaque matériel sera représenté comme le bios , la mémoire , les disques durs , les lecteurs DVD. Il est possible de faire des instantané de chaque machine virtuelle il est conseillé de faire ces instantanés lorsque la machine est éteinte sinon dans le cas d'un instantané sur une machine allumée la mémoire vive sera stockée et augmentera la taille de l'instantané.  
Il est également possible d'importer et d'exporter les machines virtuelles d'une solution hyper V vers une autre solution hyper V, attention cela nécessite la version 2 d'Hyper-V (Depuis une version 1 vers une version 2 ne sera pas possible).  
Dans les spécificités d'hyper V on va retrouver un outil orienté serveur, cet outil vas proposer de nombreuses fonctionnalités donc de la haut disponibilité.  
Cet outil va nécessité néanmoins d'avoir une certaine habitude à l'utilisation.  
Il y a également les fichiers qui permettent de stocker le paramétrage des machines virtuelles ainsi que les fichiers de disque dur, qui vont devoir être déplacés à la main ou modifier manuellement pour interagir avec la configuration des machines virtuelles.  
La combinaison de touche , ++ctrl+alt+del++, qui est nécessaire pour ouvrir une session sur un système Server, va se faire avec hyper V avec la combinaison de touches , ++ctrl+alt+end++.  
En résumé, l'utilisation d'hyper V reste facile mais nécessite un temps d'adaptation par rapport à une solution de virtualisation de type poste de travail.  

## Paramétrages Réseau

Comme toute solution de virtualisation l'accès au réseau par les machines virtuelles va être déterminé par le type de profil auquel la machine virtuelle va être reliée.  
En effet hyper V permet d'utiliser 3 types de réseaux selon la configuration souhaitée.  
Le mode privé va permettre aux machines virtuelles de communiquer uniquement entre la machine hébergeant la solution de virtualisation, donc l'hote, et les machines virtuelles les machines virtuelles pourront communiquer entre elles et également bénéficier des services installés sur l'hote de virtualisation.  
Cette hote de virtualisation étant un système d'exploitation Windows Server les machines pourront bénéficier de services réseaux comme le service DNS ou le service DHCP.  
Le mode suivant est le mode interne uniquement dans ce cas là les machines virtuelles ne pourront communiquer qu entre elles.  
Le mode externe qui va être l'équivalent des configurations type bridge que l'on retrouve sur d'autres solutions de virtualisation vont permettre aux machines virtuelles d'avoir les mêmes services que la machine hote, elles vont pouvoir communiquer sur le réseau physique bénéficier des services du réseau physique comme le serveur DHCP le serveur DNS ou la fonction de routage pour accéder à internet et à d'autres réseaux, Attention néanmoins avec cette fonctionnalité la machine virtuelle se trouve pleinement exposée au réseau.  
Le dernier profil va être le réseau externe dédié cette fonction là va être propre à hyper-V on ne retrouve pas d'équivalent sur d'autres solutions de virtualisation dans cette méthode de fonctionnement , la carte réseau externe est associée de manière exclusive à une carte physique de l'hote. Ce qui a pour effet de dédier une carte réseau physique à une machine virtuelle. Donc la machine virtuelle communique intégralement avec cette carte réseau, mais la machine hote n'a plus l'accès à cette carte reseau.Cette fonctionnalité là peut être intéressante lorsque la machine virtuelle héberge des services très spécifiques comme par exemple du stockage de type SaaS du protocole de type ISCSI, c'est services qui vont être dirigés exclusivement sur un réseau de stockage par exemple. En résumé , la gestion de réseau se fait en fonction du besoin de la machine virtuelle.  
Pour assigner un profil réseau à une machine virtuelle . Il est possible de le faire directement depuis la console de gestion . En effet , on va pouvoir créer un réseau virtuel par la fonction nouveau réseau virtuel. Les conséquences de la création d'un nouveau réseau virtuel, cela va créer un switch virtuel, ce switch Virtuel, on va ensuite lui assigner un rôle.  
On peut lui assigner le rôle de réseau externe, de réseau interne ou de réseau privé.  
Le réseau externe permettra d'accéder au réseau physique connecter à l'hote,  
Le réseau interne va uniquement connecter l'hôte et les machines virtuelles et  
Le réseau privé comme on la vue précédemment ne fera que interconnecter les machines virtuelles connectées à ce commutateur.  
Il est également possible de ne pas définir de profil réseau dans ce cas là , la machine virtuelle sera totalement isolée.  
La création des machines virtuelles va se faire par l'option "assistant au nouveau ordinateur virtuel".Le choix a effectué va être de désigner une machine de génération 1 ou de génération 2 . Ce choix est très important car il va permettre ou pas d'utiliser des systèmes d'exploitation récents. En effet, les machines virtuelles de génération une ne permettent pas d'utiliser la fonction de démarrage UEFI. Fonction de démarrage que l'on retrouve sur tous les systèmes d'exploitation depuis Windows 8 et également sur les systèmes d'exploitation open-source. Les machines de génération 2 sont des machines qui vont avoir des fonctionnalités avancées et ce sont également les machines de génération 2 qui vont pouvoir être exportées d'un hyperviseur hyper-V vers un autre hyperviseur hyper-V voire une autre solution de virtualisation de serveurs.  
Les prérequis sont les mêmes que sur une solution de virtualisation du poste de travail, c'est à dire qu'il va falloir gérer l'emplacement de stockage ainsi que les différents paramètres matériels concernant l'attribution du CPU de la RAM des éléments de stockage ainsi que de l'image ISO qui va permettre de faire l'installation du système.  

## Gestion de l'hyperviseur

La console Hyper V qui est intégré sur les systèmes serveurs disposant du rôle hyper V ou du système client disposant des outils d'administration hyper V va permettre de gérer un ou plusieurs serveurs disposant du rôle hyper-V.  
On retrouve dans la partie gauche ici la liste des serveurs qui sont actuellement disponibles sur la console de gestion ces serveurs peuvent être des serveurs locaux ou des serveurs distants.  
Ensuite pour chaque serveur nous avons ici la liste et l'état des machines virtuelles héberger sur ces serveurs.  
Dans la partie du dessous nous avons l'information sur la machine virtuelle sélectionnée nous allosn retrouver l'historique des instantanés si des instantanés ont été faits sur cette machine virtuelle également la date de création de la machine virtuelle ainsi que les différents éléments matériels de la machine virtuelle.  
Sur la partie de droite nous allons avoir la gestion du serveur qui va nous permettre de créer une nouvelle machine virtuelle de créer un nouveau commutateur virtuel afin de créer un nouveau profil réseau puis de les mettre à disposition de là ou des machines virtuelles disponibles sur ce serveur.  
Il est également possible d'importer des machines virtuelles avec la fonction importe disque il est aussi possible d'arrêter le rôle hyper V sur ce serveur.  
Dans la partie basse nous avons toutes les commandes pour la gestion de la machine virtuelle la fonction connect va nous permettre d'ouvrir une console de gestion unique pour cette machine virtuelle les autres fonctionnalités vous concerner l'exportation le déplacement ou la modification des différents paramètres de la machine virtuelle comme la capacité en mémoire ou le stockage.  
Il est également possible de supprimer cette machine virtuelle ou de l'exporter pour pouvoir ensuite la réimporter sur un autre hyperviseur.  

## Console d'ordinateur visuel

Nous venons de voir la console permettant de gérer le rôle hyper-V.  
Cette console va être dupliquée et rendue unique pour la gestion de chaque machine virtuelle.  
En effet toutes les machines virtuelles hébergées sur un serveur hyper-V vont bénéficier d'une console graphique de gestion qui va être unique.  
Cette console va nous permettre de modifier ici le comportement de base de l'information virtuelle. Nous allons avoir accès à des paramètres. Ces paramètres vont être notamment les commandes d'allumage et d'extinction. La modification des paramètres de la machine virtuelle ainsi que la modification du comportement, notamment des touches de raccourci ou des touches d'action.  
Le bandeau inférieur va nous permettre d'avoir les fonctions dites raccourcies, Ces fonctions sont les fonctions les plus utilisées dans la gestion d'une machine virtuelle. On y retrouve la possibilité d'envoyer une combinaison de touches ++ctrl+alt+del++ il y a également la gestion des instantanés avec la prise d'un instantané où la consultation de l'historique des instantanés.  
Il est possible avec la flèche retour arrière de remettre la machine à son État instantané le plus proche.  
Il est également possible de gérer l'allumage et l'extinction des machines à partir de ce bandeau.  
La partie supérieure droite concerne la fermeture de la console, Attention, le fait de fermer la console d'une machine virtuelle, ne met pas en pause ni n'éteint cette machine virtuelle.  
En effet , le process va continuer à fonctionner sur le serveur hyper V simplement nous n'aurons plus de console de gestion de cette machine.  

## Exportation et Importation

Il est possible avec hyper V d'exporter puis de réimporter des machines virtuelles.  
Ces manipulations nécessitent de retravailler les fichiers qui permettent de stocker cette machine virtuelle.  
Pour pouvoir être dupliqué ou déplacé il faut d'abord passer par la phase d'exportation, l'exportation est disponible depuis la console de gestion des machines virtuelles du serveur hyper-V.  
Pour pouvoir importer une machine virtuelle , on doit disposer de la totalité des fichiers de configuration de cette machine virtuelle.  
L'importation peut également se faire sans dupliquer la totalité des fichiers dans ce cas là on ne pourra faire qu'une seule et unique importation de la VM.  
En effet, dans l'importation sans duplication de fichiers on va simplement déplacer la machine virtuelle d'un hyperviseur vers un autre , mais cette machine ne sera plus disponible sur l'hyperviseur d'origine.  
La 2eme option "dupliquer tous les fichiers" va copier la machine virtuelle d'un hyperviseur vers un autre et va également modifier les valeurs des adresses Mac des cartes réseau de la machine dupliquée afin de ne pas avoir de doublons d'adresse Mac sur le réseau.  
Il faut toutefois être vigilant car si le process ne fonctionne pas, et bien on peut se retrouver avec des machines virtuelles qui disposent de la même adresse Mac et cela peut empêcher de faire communiquer les machines virtuelles sur le réseau.  
En exemple, on peut citer d'abord l'exportation de la VM dans un emplacement dédié, donc la copie de tous les fichiers sur un espace de stockage dédié à l'exportation des machines virtuelles.  
Puis ensuite de la copie de ce répertoire vers le nouvel hyperviseur et enfin de l'importation sans duplication de fichiers.  
L'importation sans duplication de fichiers va simplement déplacer les éléments que l'on a copiés depuis l'hyperviseur d'origine vers l'emplacement de travail de la machine virtuelle et comme nous avons fait une copie préalable de ces fichiers et bien nous pouvons continuer à soit recopier ces fichiers sur un nouvel hyperviseur ou les rapatriés sur l'hyperviseur d'origine.  
Attention, il faut véritablement sélectionner le dossier complet car contrairement à d'autres solutions de virtualisation, il n'y a pas qu'une seule dossier pour constituer une machine virtuelle, mais bien plusieurs dossiers.  
