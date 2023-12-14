# <span style="color: #3498DB;">Couche Liaison de données</span>

- Présentation effectuée ? OK !
- Session établie ? OK !
- Transport en cours ? OK !
- Adresses IP précisées ? OK !

Il reste la liaison physique à établir entre les 2 hôtes.

La ou la couche réseau établi une liaison logique (elle détermine la meilleure route `logique`à utiliser)
La couche `liaison`effectue une liaison physique en assurant, dans certains cas, la correction d’erreurs pouvant survenir dans la couche physique.

Elle fragmente les données en plusieurs trames (envoyé 1 par 1 dans le réseau local).

Elle doit gérer l’acquittement des trames

!!! warning "Protocole utilisé sur cette couche"
    – Ethernet  
    – PPP (Point to Point Protocol)  
    – HDLC (High-Level Data Link Control)  

!!! note "Unités de la couche Liaison"
    - trames (*frames*)  

## <span style="color: #F39C12;"><u>Moyen de la couche Liaison</u></span>

Sur la couche liaison c'est l'adresse MAC qui s'occupe de transmettre les informations.  

Une adresse MAC est une adresse Unique et Physique, elle est stocké dans la carte réseau ou une interface réseau.  

Une adresse MAC est un nombre héxadécimal à 12 chiffres sur 6 octets (**48 bits**)  

- les 6 premiers chiffres correspondent à l' ***ID_Constructeur***  
- les 6 derniers chiffres correspondant à l'***ID_Périphérique***  

