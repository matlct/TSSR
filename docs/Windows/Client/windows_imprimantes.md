# Gestion des imprimantes avec windows

definition de notion uatour des imprimante:

- Péripherique d'impression : le matériel = moteur permettant de sortir une feuille blanche a partir d'une feuille blanche
- Imprimante : le logiciel = envoie l'ordre d'impression au périphérique d'impression
              - pilote gere le peripherique
              - configuration (specifique/pardefaut) imprime en recto/verso etc.
              - file d'attente d'impression (dans laquel s'enchaine 1 a 1 les tx d'impressions)
              - port d'impression derriere lequel est relié le peripherique d'impression
- File d'attente d'impression : Service spourleur = conversion numérique du document (image, doc txt) dans un langage brut/electronique interprétable par le peripherique d'impression. envoi du job 1 a 1 vers le port d'impression
- Imprimante locale : Périphérique d'impression directement relié a l'ordinateur via un port local (USB)
- imprimante partagée : imprimante locale partagée sur le reseau grace a l'OS de l'ordinateur, Disponible si et seulement si l'ordinateur est allumé car celle-ci est partagée via l'OS.
- imprimante réseau : Imprimante indépendante. Possede son propre OS, sa propre interface réseau, un service web pour la configuration via une interface web dispo depuis le navigateur

## Utilisation et configuration

### Imprimante locale

Elles peuvent etre reconnu directement par le systeme si un pilote generique est disponible dans le magasin de pilote windows,
pour beneficier de toutes les fonctionnalités du peripheriques il faudra installer le pilote signé du fabricant (pour rappel les pilotes generique ne disposent, généralement, que des fonctionnalitées de base)
Les imprimantes possedent leurs propre parametre de sécurité NTFS, en fonction des besoins on pourra autoriser, refuser des actions sur celles-ci
    - simple impression (possibilité d'integrer un document dans la fil d'attente)
    - gestion des documents (gerer la fil d'attente)
    - gerer l'imprimante : deleguer le controle a un membre de l'entreprise qui n'est pas forcement technicien ou admin info
les imprimantes locale peuvent etre visualiser et gerer depuis le panneau de configuration
depuis celui-ci vous avez la possibilité de

- visualiser la file d'attente
- definir une imprimante par défaut
- editer ses propriétés (nom, emplacement physique)
- gerer les options avancés (plage horaire d'utilisation etc.)

Possibilité de les partager (via l'onglet *partage*) grace au reseau et grace a l'ordinateur local (si allumé et disponible) et d'y acceder via le chemin UNC.

### Imprimante et le réseau

En entreprise les imprimantes sont généralement raccordé sur le reseau de celle-ci.
Pour cela il y a la possibilité de rajouter le role de **serveur d'impression** sur un serveur
Ce role permet de :

- centraliser tous les partages,
- les logs
- informations d'utilisation des toners et des bacs de feuille
- etc

il permet de gerer l'ensemble desz imprimantes reseaux, et d'en simplifier l'acces et la maintenance.

Depuis un poste client afin de beneficier d'un **service d'impression** il faudra y acceder via son chemin UNC (comme pour tous partage reseau)
Le serveur proposera la liste des imprimantes de l'entreprise, il suffira d'effectuer un clic droit puis connecter afin de lié le poste local et l'imprimante.

### Service Spouleur d'impression

Il s'agit du point centrale d'une imprimante !
C'est un programme, un service, qui traite la file d'attente. Il envoi les travaux 1 par 1 au peripherique d'impression.

Pour permettre au **service spouleur** de travailler efficacement, lorsque qu'une imprimante est tres sollicité, lorsqu'une file d'attente est tres chargées, nous aurons la possibilité de creer un **Pool d'impression**
Cela permet de creer une liaison entre une imprimante et plusieurs peripheriques d'impression, le spouleur aura donc la possibilité de diviser par 2, 3 ou 4 le temps de traitement des travaux de la file d'attente, ces memes travaux seront partagés sur tous les periphériques d'impression présent dans le pool
