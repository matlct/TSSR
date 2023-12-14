# Masque de Sous-Réseau

## <span style="color: #F39C12;"><u>La création de sous-réseaux</u></span>

Le calcul des masques de sous-réseaux est une étape indispensable pour obtenir le nombre d'hôtes disponibles dans un réseau.  
Cela permet de determiner, en fonction ses besoins, le nombre de sous-réseaux à mettre en place pour effectuer une segmentation.  
C'est également un moyen d'obtenir l'adresse du réseau ainsi que l'adresse de broadcast du réseau.  

La création de sous-réseaux permet :  

- de limiter l'impact des diffusions ARP
- Equilibrer le trafic réseau
- Isoler des machines
- Mettre en place un peu de sécurité
- Optimiser l'utilisation des adresses IP

## <span style="color: #F39C12;"><u></u>Masque de sous-réseau?</span>

!!! Rappel "Pour rappel !"
    Une adresse IPv4 est constitué de 4 blocs de chiffre allant de "0" à "255".  
    Chaque bloc correspond à 1 octet lui même égal à 8 bits.  
    Une IPv4 est codée sur 4 octets donc 32 bits.  
    - La 1ere partie correspond à l'*<span style="color: #F50C0C">ID_Réseau</span>*  
    - LA 2eme partie correspond à l'*<span style="color: #28F50C">ID_Hôtes</span>*.  

la création d'un sous-réseaux vas faire apparaitre une nouvelle partie dans l'adresse IP:  

- *<span style="color: #F50C0C">ID_Réseau</span>*
- *<span style="color: #F58F0C">ID_ss-réseau</span>* (créé à partir de bits issus de l'*<span style="color: #28F50C">ID_Hôtes</span>*)
- *<span style="color: #28F50C">ID_Hôtes</span>*

Le masque de sous-réseau délimite la partie *<span style="color: #F50C0C">ID_Réseau</span>* et la partie *<span style="color: #28F50C">ID_Hôtes</span>*  

Le masque de sous-réseau peut s'écrire de deux façons différentes :   

- Notation décimales : 255.255.255.0, 255.0.0.0, 255.255.248.0, etc.
- Notation CIDR : /8, /16, /22, /24, etc.

La notation CIDR est la norme aujourd'hui et sachez qu'elle commence à /0 pour 0.0.0.0 et se termine à /32 pour 255.255.255.255.  

