# Gestion PKI - Private Key Infrastructure

## Certificat par autorité de certification publique

Les OS et certains navigateurs comme FireFox embarque un certain nombre de certificats racines de confiance.  
Ils proviennent d'autorités de certification **publiques**.  
Tout certificat généré par une de ces autorités (ou par des serveurs secondaires) sera automatiquement approuvé puisque nous avons confiance dans l'autorité parente.  
Ces certificats sont souvent payants  
    - Exception sur des services comme "Let's Encrypt"  
Ils permettent de publier des services sur Internet avec implémentation du SSL.  

Microsoft met à disposition sur ses OS serveur le rôle AD CS aussi appelé PKI (Private Key Infrastructure).  
Ce rôle permet de générer des certificats qu'on pourra utiliser pour tous les services internes (web, Exchange...)  
Les machines clientes pourront faire confiance aux certificats générés sans action particulière, car le certificat racine sera automatiquement deployé sur toutes les machines de l'AD.  
Une fois la PKI en place, on pourra ajouter des services facilement.  
Il sera cependant toujours très compliqué de publier les services sur internet.  