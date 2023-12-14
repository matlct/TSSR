# Reseau Windows

Centre reseau et partage permet de configurer le comportement du systeme sur le reseau

- accesible depuis l'icone reseau de la barre de notification
  - parametre reseau et internet > Centre réseau et partage
- accessible depuis le panneau de configuration
  - reseau et internet > centre réseau et partage

Donne des indications sur :

- la connectivité du poste
- les connexions réseau détectées (si le poste possede plusieurs carte rsx)
- les profils réseau et les emplacements associés aux cartes

il permet de configurer également des fonctionnalités de partage ainsi que les cartes rsx

une carte rsx est associé a un profil prédéfini (nommé egalement emplacement rsx)
le profil sert en priorité a ce que le pare-feu s'adapte a l'emplacement ou l'on ce connecte (pratique dans un contexte de mobilité)

[inserer screen support cours]
1er emplacement présenté :

- Réseau Privé =
  - rsx de confiance
  - connectivité maitrisé
  - sécurisé
  - pare feu s'adapte et laisse passer la quasi totalité des communications

Emplacement

- rsx avec domaine
  - emplacement avec plus de confiance
  - le pare feu laissera passer plus de  communication notamment avec le controleur de domaine ainsi qu'avec les machines joint au domaine
  - profil non modifiable une fois l'ordinateyr joint au domaine de l'entreprise

Emplacement

- resau public
  - rsx ouvert a tous et donc plus risqué moins sur
  - le pare-feu vas bloquer la quasi totalité des communications
  - profil appliquer automatiquement si aucune passerelle par défaut ou lorsqu'aucun domaine n'est detecté
  - activation manuel possible si on decide de rendre l'ordinateur invisible sur le reseau

## Config de la carte réseau

acces depuis panneau de config ou centre réseau et partage
ncpa.cpl meilleurs moyen d'y acceder

mode statique:

- en renseignant manuellement
  - adresse IP
  - masque de sous-rsx
  - passerelle
  - serveur DNS

mode dynamique

- fourni par:
  - serveur DHCP
  - service APIPA
    - nativement présent et opérationnel sur lessysteme windows permet de fournir une configuration temporaire (si aucun serveur dhcp n'est joignable)
    - 169.254.0.0 /16
    - permet de communiquer, uniquement, avec les autres machines du rs local adressé en APIPA

## outil permettant le bon fonctionnement de la carte et d'investiger

graphiquement :

- zone de notification (etat de la connexion)
- centre rsx et partage
  - assistant **resoudre les problemes** : orienté utilisateur

invite de commande :
plus précis & plus efficace

- ipconfig: afficher la configuration et interargir avec la pile reseau (DNS/DHCP)
- arp: agit sur le cache arp
- ping: test de la connectivité rs
- tracrt: utilise (comme pour `ping`) le protocole icmp qui affiche l'itineraire d'un paquet
- netstat: verification de la couche 4
- nslookup: verif et diagnostic de la resolution de nom.

## qu'est ce qu'un pare-feu et pourquoi en utiliser ?

windows embarque nativement un pare-feu afin de se proteger de l'exterieur
le pare-feu est un service qui observe et filtre les com rsx entrante et sortante du systeme.
c'est un service qui permet au system d'etre protege contre les acces non autorisé.
oar défaut le pare-feu est activé, il bloque certaine connexion en entrée et laisse passer les connexions sortante.le pare-feu est composé de regle prédéfini porposé par le systeme.

Ces regles prédéfinis sont facilement activable depuis les console de gestion et s'adapte en fonction du profil rsx detecté. possibilité de créer des regles personnalisé.

Le pare-feu win comporte 3 nx de configuration:
[inclure screen cours]

1. (Utilisateur)permet d'activer ou de desactiver totalement le fonctionnement du pare-feu par profil rsx
   1. depuis le composant **verifier l'etat du pare-feu** pour l'activation/desactivation
2. (programme)plus précis que le 1er, authorise granulairement le traffic genere par une app particuliere, il suffit de selectionner l'app dans la list et de lui laisser la possibilité de generer du flux rsx
   1. avec la fonction **autoriser une application via le pare-feu windows**: fournit un ensemble de regles generiques activées automatiquement et paramétrables
3. permet de gerer les regles entrante et sortante de maniere plus précise encore, possibilité de filtrer le traffic entrante en fonction des adresse IP source ou en fonction des ports de destination. Pour ca des regles prédéfini peuvent ou aider ou creer nos propre regle.
   1. avec la console **Pare-feu windows defender avec fonctions avancées de sécurité**: donne acces au paramétrage detaille de l'ensemble des regles, permet egalement d'afficher une vue globale des regles acitvées

accesible depuis le panneau de config ou via firewall.cpl.