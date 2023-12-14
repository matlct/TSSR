## vSphere

La solution de virtualisation de serveur VMware vSphere faire a connu une nouvelle évolution.  
en effet jusqu'à la version 5 la plateforme n'utilisait pas d'interfaces web de gestion, la gestion de la solution était faite par l'intermédiaire d'un logiciel que l'on appelle le client lourd qui permettait d'administrer à partir soit de l'hyperviseur , soit du serveur vCenter la totalité des fonctionnalités de la vSphere.  
A partir de la version 6.0 la vSphère va être administrable depuis une interface web. Cette interface web va être hébergée soit sur l'hyperviseur, soit directement sur le serveur vCenter.  
Le serveur V Center , qui assure la gestion globale de la vSphere.  
La transition entre la version 5 et les versions plus récente va également faire apparaître la possibilité d'avoir un vCenter en mode appliance, c'est à dire que le vCenter va devenir une application légère cette application va être limitée dans ses capacités elle ne pourra plus supporter un nombre illimité de machines virtuelles ni d'hyperviseur mais elle a l'avantage d'être beaucoup moins gourmande en ressources elle va également pouvoir être hébergée en tant que machine virtuelle à l'intérieur d'un hyperviseur.  
Le client web vSphere va également évoluer entre la version 6.0 et la version 6.5 en effet la version 6.0 nécessite un navigateur web disposant de la fonctionnalité Adobe flash Player cette fonctionnalité étant petit à petit vouée à disparaître sur les navigateurs la version 6.5 de sphère utilise l'HTML 5.0 qui ne s'est qui ne qui ne nécessité plus VMware Flash Player

## Composant d'un solution vSphere

La solution de virtualisation vSphere de VMware est composée de différents éléments.  
Dans ces éléments nous allons retrouver le point central qui va être l'ESXi.  
On peut également retrouver dans des versions précédentes, les hyperviseurs que l'on nommait ESX à partir de la version 5, ces hyperviseurs vont s'appeler ESXi car il comporte leur propre interface web d'administration et nous pourrons les administrer eux mêmes sans passer par une solution de centralisation.  
L'hyperviseur va donc être placé au centre de la vSphere car c'est l'élément qui permet de mettre à disposition les ressources physiques telles la RAM, le CPU, le stockage et les accès réseau.  
Cette hyperviseur ESXi va également être utilisée par le vCenter.  
La solution de regroupement d'hyperviseur qui va assurer la liaison entre les différents ESXi.  
C'est ESXi et ce vCenter vont pouvoir être administrés à partir du client des vSphere. Si l'ont est sur des solutions à partir de la version 5 qui est un logiciel à installé sur le système d'exploitation client type Windows ou Linux, ce client va permettre d'administrer indépendamment chaque hyperviseur ESXi ou d'administrer la totalité de la vSphere si celle ci utilise la fonctionnalité vCenter.  
Sur chaque ESXi, nous allons retrouver des machines virtuelles. Ces machines virtuelles quant à elles pourront être administrées , soit directement dans l'interface web de l'ESXi qui hébergent la machine virtuelle , soit si on utilise un vCenter directement dans l'interface web d'administration du vCenter.  
Le vCenter faisant la liaison avec la totalité des éléments de la vSphere à partir de son interface d'administration nous avons la possibilité soit de déterminer le comportement de chaque hyperviseur ESXI, soit de décider d'une modification globale à tous les hyperviseurs.  
Également au niveau des machines virtuelles , c'est grâce à la globalisation du vCenter que l'on va pouvoir déterminer des restrictions de capacité ou des restrictions d'utilisation de ressources pour les machines virtuelles, c'est également à partir de l'interface d'administration du vCenter que nous allons pouvoir déplacer une machine virtuelle d'un hyperviseur a un autre.  
Ici le vCenter a un rôle d'encadrement et de surveillance et le client vSphere à partir duquel l'administrateur ou le technicien va intervenir a un rôle de surveillance et de commande ou d'administration sur la totalité de la vSphere.  
Attention tout de même dans une vSphere la totalité des éléments doit être concordant au niveau des versions.  
En effet, si plusieurs hyperviseurs sont dans une version ESXI différentes, typiquement une version x.0 sur un hyperviseur x.5 sur un autre.  
Alors le vCenter devra être dans la version la plus élevée pour pouvoir administrer la totalité des hyperviseurs.  
Il est recommandé pour la fiabilité de la vSphere, d'avoir des versions d'éléments homogènes.  
En effet, on préconise une version de vCenter la plus récente possible et des versions concordantes sur les ESXI.  
Pour terminer, il n'est pas possible d'avoir des versions différentes entre les hyperviseurs et le V Center.  
Un hyperviseur de type 6.5 ne pourra pas fonctionner avec vCenter de type 7 (qu'ils soient en 7.0 ou 7.5).  

## Principales fonctionnalités

Dans le module précédent nous avions indiqué les possibilités offertes par le vCenter.  
En effet le vCenter va permettre de disposer de fonctionnalités avancées.  
C'est fonctionnalités avancées nécessite d'avoir un nombre d'hyperviseurs minimum la préconisation veut que 3 hyperviseurs ayant des capacités identiques et des versions d'hyperviseur identiques permettent d'avoir un fonctionnement optimal des fonctionnalités de la vSphere.  
c'est fonctionnalités de la vSphere vont avoir plusieurs rôles :  
le premier va être de consolider l'infrastructure de virtualisation en effet le fait de disposer de plusieurs hyperviseurs va permettre en cas de défaillance va permettre de remplacer sans arrêt de production une machine virtuelle par une autre, voir de déplacer des machines virtuelles d'un hyperviseur à un autre sans avoir à arrêter la machine virtuelle.  
Ces fonctionnalités avancées fonctionnent grâce au vCenter qui étant indépendant d'un hyperviseur va pouvoir declencher des actions en cas de défaillance d'un hyperviseur.  Parmi ces fonctionnalités avancées , nous avons le vMotion.  
Fonctionnalités de VMware qui permet de déplacer une machine virtuelle d'un hote vers un autre hôte.  
Cette fonction est une fonction dite "à froid". Les prérequis sont nombreux pour pouvoir assurer cette fonctionnalité.  
Nous les verrons à la suite de ce module.  
Cette fonctionnalité va permettre de déplacer manuellement par une opération d'un technicien ou d'un administrateur, une machine virtuelle d'un hyperviseur vers un autre hyperviseur sans procédé à l'arrêt de la machine virtuelle.  
La seconde fonctionnalitée basé sur le même principe ne concerne que les fichiers de stockage de la machine virtuelle.  
En effet , nous allons aborder dans les prochains modules les différentes solutions de stockage nécessaires à une vSphere dans le cas ou nous pouvons utiliser une solution de stockage externe aux hyperviseurs donc ne dépendant pas des hotes de virtualisation, nous pourrons utiliser la fonctionnalité "storage vMotion" cette fonctionnalité va permettre de déplacer les ressources de stockage d'une machine virtuelle d'un hote sur lequel elle est hébergé initialement vers un système de stockage qui n'a aucune dépendance par rapport à un hyperviseur.  
Dans ce cas si la machine n'a plus de dépendance au niveau du stockage on peut tolérer la perte mécanique d'un hyperviseur la machine virtuelle continuera à fonctionner sur un autre hyperviseur sans stockage n'étant pas lié a l'un ni à l'autre de nos hyperviseurs.  
Il existe beaucoup d'autres fonctionnalités comme la fonctionnalité HA est FaultTolerance, c'est fonctionnalité là vont être l'identique de vMotion et Storage vMotion mais c'est fonctionnalités là sont vite "chaudes" c'est à dire qu'il n'y a pas d'action manuelle d'un technicien ou d'un administrateur pour déclencher le déplacement de la machine virtuelle mais c'est le vCenter lui même qui va prendre la décision de déplacer ou le stockage de la machine virtuelle ou la machine virtuelle vers un autre hyperviseurs c'est fonctionnalité là ne sont pas abordés ici on abordera simplement le vMotion et le Storage vMotion.  

## Tableau comparatif des couts

La solution de virtualisation VMware est répartie selon plusieurs schémas ces schémas vont inclure des coûts au niveau des licences d'acquisition.  
En effet la vSphere va pouvoir être répartie sur un nombre important de machines virtuelles, notamment dans un concept de data Center.  
La répartition du coût va se faire en fonction de 2 principes, le nombre de processeurs qu'ils vont être mis à disposition pour les machines virtuelles et également le nombre de machines qui vont entrer dans la composition de la vSphere.  
Dans le premier cas la licence pour exploiter l'hyperviseur de VMware seul ne nécessite pas l'achat d'une licence.  
En effet , le logiciel de l'hyperviseur est construit autour d'une distribution Linux open source.  
Cette distribution ne peut donc pas être vendue.  
Toutefois, elle permet simplement de créer des machines virtuelles, mais elle ne permet pas d'avoir une gestion globale à partir du vCenter.  
La gestion se fera en mode autonome hyperviseur par hyperviseur.  
Toutefois, pour de petites entreprises ou pour la découverte de la solution de virtualisation, l'utilisation d'un ESXi en mode système standalone (en mode autonome) permet de connaître et d'appréhender les bases de la solution.  
La première étape va constituer la suite dite "essential". En effet , VMware mais à disposition , une version essentielle de sa vSphere.  
Cette version va se retrouver limitée en termes de fonctionnalités. Toutefois, les fonctionnalités qui ne sont pas accessibles sont des fonctionnalités nécessitant un nombre très important de machines et de ressources.  
Les fonctionnalités disponibles dans la version essential ne seront pas limitées dans le temps. Elles seront acquises pour une durée illimitée. Elles seront toutefois limitées à 6 processeurs . VMware limitant le nombre d'utilisations de processeurs dans sa vSphere pour la version essential. On ne pourra pas dépasser plus de 6 processeurs dans la vSphere. La répartition logique voudrait que 3 hyperviseurs soient présents , chaque hyperviseur comportant 2 processeurs.  
Puis nous avons une licence pour le vCenter Server dans sa version essential, cette licence va permettre de pouvoir à l'opposé d'un ESXi seul de pouvoir gérer , la vSphere de manière globale. Toutefois , le vCenter etant dans à sa version essential des fonctionnalités ne seront pas disponibles.  
La version destinée aux entreprises de taille intermédiaire qui nécessitent d'avoir un système de virtualisation optimale et sur.  
Va être la version standard La version standard n'est pas limité dans le temps donc les droits sont acquis indéfiniment.  
le logiciel standard comprend un seul CPU et une seule licence de vSPhere V Center serveur.  
Il faut donc multiplier le coût de la licence standard par le nombre de processeurs présents dans la vSphere.  
En Conditions d'exploitation idéales on peut retrouver 3 à 6 serveurs, si chaque serveur comprend 2 processeurs, il faut multiplier le droit de licence par 12.  
Puis si la taille de la vSphere augmente encore une seconde licence vCenter serveur sera nécessaire et ainsi de suite pour pouvoir au fur et à mesure augmenter les capacités de la vSphere.  
Enfin la version vSphere entreprise plus va intégrer l'ensemble des fonctionnaires de la vSphere par rapport à la version standard qui ne permet pas d'atteindre certaines fonctionnalités très évoluées.  
C'est fonctionnalités vont être dans le calcul ou la recherche ou l'intelligence artificielle.  
La version vSPhere entreprise plus intègre la totalité des fonctionnalités de la vSphere.  
Aucune limite dans le temps et cette licence ne permet l'utilisation que d'un seul CPU pour le vCenter Server, il faudra donc multiplier le coût de cette licence par le nombre de processeurs de vCenter Server uniquement.  
Sachant qu'un vCenter serveur peut utiliser peut administrer 6 hyperviseurs au delà de 6 hyperviseurs, quel que soit le nombre de processeurs de chaque hyperviseur.  
Il faudra acquérir un nouveau droit de vSphere entreprise plus par vCenter Server.  
En résumé, le droit d'acquisition de licences ne sont pas limitées dans le temps.  
Ils correspondent soit à un besoin d'une fonctionnalité précise, soit un besoin de renforcement d'une infrastructure de virtualisation.  
Il est très important de bien dimensionner son besoin avant de faire l'acquisition d'une licence vSphere.  

## Les Licences

Nous avon vu que les licences étaient liées soient à des fonctionnalités soit à des capacités au niveau d'un data Center.  
En effet chaque licence va être liée à un nombre de processeurs présents dans la vSphere.  
Sur ce tableau nous allons ici détailler les licences et leurs fonctionnalités dans un concept, notamment par rapport à la taille d'une de l'entreprise et au besoin de ces entreprises.  
Pour une petite et moyenne entreprise on va plutôt dédier sur une version essentials la version qui va nous permettre d'aller jusqu'à 6 CPU plus 1 vCenter en version essentials c'est à dire avec des fonctionnalités classiques.  
Dans le cas d'une PME qui nécessiterait des besoins spécifiques il existe également une version "essentials plus" qui va inclure quelques fonctionnalités additionnelles attention toutefois à bien faire attention à ce que ces fonctionnalités additionnelles ne nécessitent pas une puissance supérieure à 6 CPU, en effet la version essentials et "essentials plus" reste bridé à 6 CPU maximum.  
Le couts de revient peut être divisé par la durée dans le temps, ces versions là poses toutefois un problème puisqu'elles ne peuvent pas être évoluées vers une version "standard", il n'est pas possible de repasser ou de faire évoluer ces licences il est nécessaire de racheter une version standard on ne peut pas convertir une licence "essentials plus" vers "standard" ces 2 licence inclut également une version de "vCenter Foundation".  

Dans le cas d'une entreprise intermédiaire, d'une grande entreprise ou d'une entreprise où aura besoin de fonctionnalités spécifiques.  
Il existe 3 possibilités :  
La première possibilité est la version standard qui inclut ses fonctions additionnelles à la version essentials mais qui attention vont être limitées en nombre de licences vCenter Server.  
La version "Entreprise plus" qui inclut la totalité des fonctionnalités et qui elle même va être limitée par rapport au nombre de licences vCenter Server.  
Également, il existe une version platinum. Cette version n'est pas côtée directement, cette version inclut un support et une assistance préférentielle de la part de VMware.  Cette version Platinum est une version totalement personnalisable en fonction des besoins d'une entreprise. Toutefois , le coût de l'étude de cette solution n'est a la disposition que de quelques grandes entreprises.  

Donc une entreprise , connaissant son besoin précis , ira vers une solution essentials et essentials plus.  
Une entreprise qui souhaite avoir une forte évolution ou la possibilité d'utiliser des fonctionnalités avancées , utilisera ou la version "standard" ou la version "entreprise Plus".  
Attention toutefois dans ces versions là, il y a une limite de quantité maximale de RAM par hote.  
