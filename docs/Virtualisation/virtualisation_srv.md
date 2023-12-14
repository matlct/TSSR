## Type de Serveurs

Les solutions de virtualisation s'appuie sur des serveurs physiques répartis en 3 grandes catégories.  

<figure markdown=1>
![image](./img_virtu_serveur/type-srv2.png)
</figure>

Ces catégories vont déterminer :  

- la puissance,  
- la performance  
- la robustesse d'exploitation.  

<u>La 1ere catégorie: Serveurs Tours</u>:  

Ils sont équivalent à des tours informatique classiques, à la différence quelles vont emporter des CPU plus puissants et plus nombreux, des quantités de RAM, beaucoup, plus importante (allant jusque plusieurs To).  

Les solutions tours de part leurs facilités de deployement, seront utilisées pour de la virtualisation dans des petites et moyennes structures,  
En effet elles ne nécessitent pas d'infrastructures techniques supplémentaires, elles peuvent être raccordées directement aux solutions de réseau ou au solutions de raccordement électrique et de secours (type Onduleur).  

Cependant ces solutions de type tours sont encombrantes et génère également un bruit important.  

<u>La 2eme catégorie: Serveurs Racks</u>:  

Les solutions de type Racks nécessitent, quant à elles, l'installation d'un chassis permettant de les heberger.  

Concernant la configuration technique celle-ci sera quasiment identique au serveur Tours, en effet il pourront également acceuillir plusieurs CPU ainsi qu'une quantité de mémoire équivalente au catégorie 1.  

A la différence des serveurs Tours, les serveurs Rack nécessiteront une configuraton réseau et électrique établie et installé avant la mise en place des serveurs.  
Des chemins de câble doivent être mis en place pour faciliter l'insertion des racks dans les structures.  
Ces structures (baie de brassage) sont statiques, a la différence d'un serveur tours beaucoup plus mobile, et doivent être correctement organisées.  

Les serveurs de type Rack seront destinés à des structures intermédiaire ayant un besoin de puissance et d'évolutivité importante.  

<u>La 3eme catégorie: Serveur Chassis+Lames</u>: 

Dédié aux entreprises nécessitant une grande modularité et ayant un besoin de puissance.  
Ce type de serveur est modulaire grâce aux lames venant s'intégrer aux chassis.  

Une lames contiendra :  

- 1 CPU  
- RAM (la quantité variera selon la lame)  
- Stockage  

Cette modularité est permise par le fait que chaque lames aura un rôle précis dans le chassis.  
Certaine seront dédiées au calcul et soliciteront leur CPU, d'autre seront utilisées pour le stockage, etc.  
Il sera également facile de faire évoluer le matériel. De nouvelles lames, comportant de nouveaux composants, sont régulièrement mis à disposition par les constructeurs permettant ainsi de monter en puissance de CPU, quantité de RAM, etc.  
A savoir que certaines lames, insérer dans un chassis, peuvent rester dans un état "Passif" afin d'assurer une reserve chaude en cas de défaillance d'autre lames.  

Ces serveur de type Chassis seront destinés aux entreprises de grande envergure ou pour les **Data Center**, qui ensuite seront à disposition d'autres entreprises.

Toutefois ces châssis nécessitent une alimentation électrique et un secours électrique permanent, ainsi qu'un système de refroidissement de très bonne configuration.  

## Fournisseurs de solutions de virtualisation

Voici les 4 fournisseurs les plus importants de solutions de virtualisation niveau serveur.  
Ces 4 fournisseurs, ces constructeurs, vont mettre a disposition des solutions complètes de virtualisation comportant chacunes un hyperviseur, permettant l'emploi des fonctionnalites de chaque solutions.  

Chez VMware, la solution vSphere, fonctionnant autour de l'hyperviseur ESXi permettant de virtualiser des serveurs, des postes de travail, des applications, du réseau, etc.  

La solution Hyper-V, également la plus répandue pour la simple et bonne raison que l'achat d'une licence Windows Server permet l'acquisition en même temps de la solution Hyper-V.  
Elle permet de virtualiser des serveurs, mais également par l'intermédiaire du rôle RDS (Remote Desktop Serveur) de mettre a dispositions des VDI.  

Chez Xen nous allons retrouver la solution XenServeur.  
Cette solution sera orientée sur la fourniture de base de travail VDI (Virtuel Desktop Infrastructure).  
Le constructeur Citrix ayant acquis cette solution à dédier son hyperviseur à la fourniture de VDI.  
On peut le voir chaque fournisseur va dédier sa solution à un métier où rester très généraliste.  

L'hyperviseur KVM aujourd'hui intégré dans tous les noyaux Linux,  
Toute distribution, actuelle, à base de noyau Linux va avoir la possibilité par l'ajout de l'interface graphique QEMU (ou en ligne de commande) de virtualiser des serveurs Linux ou Windows.  
Cette hyperviseur va se retrouver dans la distribution Linux Proxmox, qui en plus va intégrer une interface web de gestion de serveur.  

Comme ont vient de le voir chaque constructeur va orienter sa solution en fonction d'un besoin.  
Certaines solutions vont être totalement autonomes comme VMware ou d'autres vont dépendre de fonctions additionnelles comme KVM, dépendant de la fonction QEMU, où se retrouver au sein d'une distribution complète comme proxmox ou dans le cadre d'hyperV nécessité l'utilisation de Windows Server.  

## La machine hôte

chaque serveur vas vous avoir une spécificité matérielle et chaque solution va tirer parti de ces solutions matérielles.  
la machine hote va être le centre de la solution de virtualisation en effet les performances de virtualisation seront liées directement à la machine hote et à l'intégration de la solution de virtualisation sur cette hote.  
Il doit respecter des contraintes pour pouvoir héberger des machines virtuelles quel que soit la solution de virtualisation.  
Dans le cas d'une machine de type tours ou de type rack et également dans le cas d'une lame, le processeur ou les processeurs présents sur ces machines doivent respecter la contrainte de l'instruction CPU.  
Tout CPU de la famille de type Intel doit avoir la fonctionnalité de type VT-x d'une version différente selon les générations du processeur et pour les processeurs de la famille AMD l'instruction de type AMD-v.  
Il y a également une deuxieme fonctionnalité que l'on appelle le SLAT,  
le SLAT qui va cette fois ci intervenir au niveau de la RAM. En effet, sans cette fonctionnalité, la quantité de mémoire allouée à la machine virtuelle serait doublée puisque la machine virtuelle réserverait une quantité de mémoire pour démarrer et pendant son fonctionnement et cette quantité de mémoire devrait être réservée au niveau de la machine hote, y compris lorsque la machine virtuelle n'est pas en fonction.  
Grâce à la fonctionnalité SLAT que l'on retrouve dans la famille de processeur Intel sous le nom de EPT ou dans la famille de processeur AMD sous le nom de NPT ou RVI selon les générations de processeurs.  
la quantité de ram utilisée réellement par la machine virtuelle sera réservée directement sur le système.  
la fonction SLAT évite ce que l'on appelle un double adressage donc une double réservation une donnée présente dans la mémoire vive de la machine virtuelle va être présente dans la mémoire vive de la machine physique mais il n'y aura pas 2 fois la même instruction réservée sur la machine physique.  
Donc une fois que l'on a choisi notre solution de virtualisation et notre machine, il faut bien vérifier que tous les prérequis à la virtualisation sont en place.  

## L'Hyperviseur

Element centrale d'une solution de virtualisation l'hyperviseur va venir directement réserver les performances sur notre hote.  
une fois les prérequis de l'hote satisfait la solution de virtualisation va par l'intermédiaire de l'hyperviseur venir travailler avec les composants matériels de notre machine hote.  
l'hyperviseur va être différent en fonction de la solution de virtualisation pour VMware on va retrouver l'hyperviseur ESX pour les générations 1 à 4 et ESXi pour les générations 5 à 8.  
Cette hyperviseur ce matérialise par un logiciel installer avec son propre système d'exploitation et va permettre par l'intermédiaire du driving de récuperer les performances matérielles et de les allouer à la solution de virtualisation.  
Chez Microsoft, l'hyperviseur est hyper-V. Cet hyperviseur est de niveau 1 pour la solution autonome Microsoft Windows Server hyper V ou de types 2 pour la fonction hyper V intégrée à Windows.  
l'hyperviseur est caractérisé par un logiciel.  
Ce logiciel va être chargé de l'interface avec le matériel.  
Il est important de vérifier la compatibilité logiciel avec la machine hote.  

## Solution de Gestion Unique

La solution de virtualisation va s'appuyer en grande partie sur le logiciel de l'hyperviseur.  
en effet comme on vient de le voir le logiciel de l'hyperviseur est directement en lien avec la machine physique.  
toutefois ce logiciel ne permet pas de gérer la virtualisation de serveur en effet ce logiciel est dédié uniquement au lien avec la machine hote.  
chaque solution va ajouter un outil de gestion qui est propre à chaque solution.  
Pour VMware, nous vous retrouvons donc la solution vSphere qui va intégrer un client web, une interface web dans lequel nous allons pouvoir récupérer les ressources mises à disposition et créer de nouvelles machines virtuelles.  
Cet outil de gestion va être accessible, soit par l'intermédiaire d'une console, soit par l'intermédiaire d'une ligne de commande, soit par l'intermédiaire d'une interface graphique.  
dans le cas de Microsoft hyper V on retrouve une MMC , une multimédia console propre à Windows et dédié à hyper-V.  
dans cette console graphique , nous allons pouvoir gérer le comportement à la fois de l'hyperviseur , des machines virtuelles liées à cette hyperviseur , mais également de toute la gestion du réseau des périphériques et également des dossiers partagés entre les machines virtuelles et les machines physiques.  
L'outil de gestion de solutions est indispensable, on le nomme Virtual machine manager.  
Il permet comme sur VMware workstation, de pouvoir construire des missions virtuelles à partir du matériel. Il permet également d'interargir avec des machines virtuelles en fonctionnement , de gérer leur extinction , le redémarrage et également de pouvoir modifier leur configuration .Ce composant est systématiquement intégré à tout hyperviseur présent dans une solution de virtualisation .

## Les machines virtuelles

Les VM vont être hébergés et créés sur la solution de virtualisation par l'intermédiaire de l'hyperviseur.  
leur fonctionnement va dépendre en totalité des performances et des ressources que l'hyperviseur va mettre à disposition par l'intermédiaire de l'hote.  
ces machines virtuelles vont être caractérisées de la même façon par la présence d'un fichier qui va indiquer leurs caractéristiques, matérielles et logicielles, comme le type de plate forme utilisé le système d'exploitation hote et toutes les caractéristiques de la machine virtuelle.  
ensuite nous allons retrouver un fichier d'images disques qui va correspondre au disque dur virtuel associé à la machine virtuelle.  
il faut un fichier par disque dur virtuel ces fichiers vont avoir une taille qui va être qui va dépendre de la quantité de données à stocker par la machine virtuelle.  
Nous avons également des ressources comme la RAM qui va être contenue dans un fichier de type VRAM. Ce fichier va être détruit lorsque la machine virtuelle s'arrête. C'est un fichier d'échange qui va faire le lien entre la mémoire virtuelle associée à la machine virtuelle et les enregistrement de la mémoire physique hébergée sur l'hote.  
Les ressources CPU vont être réservées directement par l'hyperviseur et mis à disposition à la machine virtuelle.  
Pour la partie réseau, une machine virtuelle va pouvoir avoir plusieurs cartes réseau disponible avec différents topologies, différents modes de fonctionnement.  
Les réseaux accessibles par les machines virtuelles, dépendent directement des connexions réseau disponibles sur l'hote de virtualisation.  
En effet, le mode de type bridge permet de faire le lien entre le réseau physique raccordé à l'hôte physique et les cartes réseaux virtuelles liées aux machines virtuelles par l'intermédiaire de l'hyperviseur et de la solution de virtualisation.  

En résumé une machine virtuelle est hébergée sur un hyperviseur.  
les caractéristiques de l'hote de virtualisation vont indiquer les performances de la machine virtuelle, notamment l'accès au réseau, la quantité de RAM maximales disponibles et toutes ces caractéristiques sont regroupées dans des fichiers qui déterminent la machine virtuelle.  

## Solutions de gestion globale

Une solution de virtualisation se compose d'un hyperviseur qui est le centre de la solution puisque il est lié sur un autre physique, et à partir de cet hôte physique il met à disposition les ressources présentes sur celui ci.  
Toutefois, les solutions de virtualisation vont être capables de répartir la puissance de plusieurs hotes au sein d'une seule et même solution.  
Les machines virtuelles vont toutes être créées et hébergées sur un hyperviseur mais ces hyperviseurs vont être regroupés au sein d'un seul et même élément.  
Si nous prenons le cas d'Hyper-V, l'hyperviseur de Microsoft, plusieurs hyperviseur de type hyper-V peuvent être regroupés dans un contexte qui est propre à Microsoft, le contexte active directory.  
Dans ce cas là les hyperviseurs sont regroupés au sein d'un même domaine ce qui va permettre de répartir les ressources propres à chaque hyperviseur au sein d'un domaine.  
Dans ce domaine, les machines virtuelles qui vont être hébergées vont pouvoir être réparties sur l'un ou l'autre des hyperviseurs présents dans ce domaine.  
La mise en place d'un domaine permet d'atteindre une gestion globale. Cela permet d'avoir des fonctionnalités propres à la gestion globale.  
Par exemple, et nous l'aborderons dans d'autres chapitres, nous allons pouvoir avoir du faillover, le faillover consiste dans le cas de la perte d'un hyperviseur, soit d'une perte de liaison réseau, soit une perte technique de l'hyperviseur, un arrêt ou une panne, les machines virtuelles vont pouvoir être réparties sur les autres hyperviseurs encore disponibles.  
Dans le cas des solutions de VMware chaque hotes va avoir un hyperviseur de type ESXi, cet hyperviseur de type ESXi va ensuite communiquer avec un système propre, a VMware que l'on nomme le VCenter le VCenter qui qui est une machine indépendante qui peut également être une machine virtuelle Ce VCenter va jouer le même rôle que le contrôleur de domaine pour Microsoft. En effet, le VCenter va être capable d'interconnecter chaque hyperviseur et de répartir les machines virtuelles au sein de ces hyperviseurs .Par exemple , le V Center , va dans le cas où un hyperviseur n'a plus suffisamment de mémoire vive disponible. Le VCenter va déplacer de lui même, une machine virtuelle d'un hyperviseur saturé à un hyperviseur disposant de mémoire vive disponible.  
le VCenter va également se comporter comme étant un objet de surveillance .Il va permettre de vérifier l'espace disque disponible que les performances sont continues et dans le cas d'une défaillance, il va pouvoir déplacer les machines virtuelles sur les hyperviseurs disponibles après un arrêt brutal de ESXi ou une défaillance d'un hyperviseur.  
Les solutions de gestion globale se gèrent de la même façon qu'un hyperviseur autonome.  
Du côté de VM Ware, nous allons avoir accès à une console web, Cette console web est disponible depuis le VCenter.  
Du côté d'hyper V et de Microsoft, la gestion du domaine se fait par le contrôleur de domaine et les hyperviseurs une fois regroupés au sein du domaine seront accessibles par le contrôleur de domaine.  
En résumé sur la solution de VMware le fait de passer à une gestion globale, va ajouter des fonctionnalités, va augmenter la tolérance à la panne et va permettre d'avoir un outil unique de gestion centralisée d'un nombre important d'hyperviseur et ainsi d'atteindre un centre de données qui va être disponibles et qui va nous permettre d'héberger un nomnbre très important de machines virtuelles.  
Du côté de la solution de Microsoft, les possibilités sont les mêmes, mais le prérequis est un contrôleur de domaine et une gestion de type active directory.  

## Récapitulatif visuel des éléments

Module le lien depuis la machine physique jusqu'à la gestion en mode autonome ou global de nos machines virtuelles.  
Pour récapituler les étapes et les points clés de cette solution nous allons reprendre à partir de la machine hote.  
Cette machine hote doit être choisie en fonction du but à atteindre.  
En effet, en fonction du nombre de machine virtuels et des performances requises sur ces machines virtuelles, le choix d'un serveur modulable ou de grandes performances doit être fait en amont du choix de la solution de virtualisation.  
La solution de virtualisation va venir par l'intermédiaire d'un logiciel propriétaire s'installer sur cette machine hote puis une fois l'hyperviseur en fonction, les machines virtuelles vont être déployées, créées, gérer et installer par une console de gestion, la VMM virtuelle machine manager.  
Les machines virtuelles peuvent ensuite être gérées de manière différente, nous allons pouvoir les gérer de manière autonome. Dans ce cas là, les machines virtuels dépendront d'un seul et unique hyperviseur qui sera lui même installé sur un seul et unique hote physique.  
Il est également possible d'avoir un ensemble d'hyperviseurs chacun étant hébergé sur sa propre machine hote. Il faudra dans ce cas là rajouter un élément de gestion globale à ces hyperviseurs qui va être dans le cas de vSphere , le module VCenter , qui se présente sous la forme d'un logiciel.  
Ce logiciel va être installé sur un système d'exploitation, ce système d'exploitation peut soit lui même être une matière virtuelle hébergée au sein d'un hyperviseur , où être hébergé sur une machine autonome.  
Une fois ce VCenter en fonction, il va interconnecter chaque hyperviseur VMware puis va decider des emplacements en fonction des ressources disponibles et des caractéristiques de chaque machine.  
La gestion d'une solution autonome ou globale se fera toujours par une interface web pour les produits de vSphere ou une interface console ou ligne de commande pour les produits Microsoft.  
Dans le cas des produits Microsoft, l'hote et l'hyperviseur seront par l'intermédiaire d'un système d'exploitation Windows Server, Le lien, puis la gestion des machines virtuelles et la gestion autonome ou globale se feront la console MMC hyper U ou le module hyper V pour PowerShell dans le cas d'une gestion globale chez Microsoft le prérequis est de disposer d'un contrôleur de domaine avec la fonctionnalité de type active directory puis d'intégrer chaque hyperviseur, chaque hyperviseur hébergeant une solution Windows Server, ces solutions devront être ajoutées au domaine active directory.  
Une fois les solutions globales mises en place , nous allons pouvoir bénéficier de fonctionnalités de virtualisation avancée.  