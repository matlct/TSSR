# Couche Applicative

Prenons l'exemple d'un envoi de mail  

La couche applicative fait office d'interface pour donner l'accès à ces services.
Ces services vous permettent notamment:

- Transfert de fichiers (FTP...)
- l'envoi de mail (SMTP...)
- Etablir une session à distance (Telnet/SSH)
- Visualiser une page web (HTPP/HTTPS)
- ...

!!! note "Unités de la couche Applicative"
    APDU

## Voyons la couche Application plus en détail

La couche application est, en quelques sorte, une couche interface.
"interface" signifie que cette couche sert de point de contact (ou d'interaction) avec l'utilisateur (IHM) et les services réseaux.

- ex: navigateur web via HTTP

La couche applicative héberge principalement :

- **API** (**A**pplication **P**rogramming **I**nterface): c’est grosso modo des fonctions permettant de cacher le code source.
- **SERVICES** :
  - Navigateur Internet,
  - Messagerie,
  - Résolution Nom de domaine.
  
!!! info "Protocole présent sur cette couche"
    === "FTP | port = 21"
        File Transfert Protocol = Service de transfert de fichier
    === "HTTP | port = 80"
        Hyper Text Tranfert Protocol = Protocole autorisant le transfert de fichiers sur le web
    === " HTTPs |port = 443"
        Identique au "HTTP" mais sécurisé via l'obtention d'un <u>certificat SSL/TLS</u>
    === "SMTP | port = 25"
        Simple mail Transfert Protocol
    === "Telnet"
