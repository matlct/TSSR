# <span style="color: #3498DB;">Couche Physique</span>

Le mail est maintenant formaté et prêt à l’envoi, il faut maintenant le mettre sur le média.

La couche `Physique`reçoit les trames de la couche [liaison](./2_Couche_Liaison.md) et les convertit en succession de bits qui seront ensuite envoyés sur le média.

Cette couche transmet donc les bits en signaux électriques ou optiques.

On y trouve des services tels que :

- Détection de collisions
- Multiplexing
- Modulation
- Circuit Switching
-…

!!! note "Unités de la couche Physique"
    - **bit**

## <span style="color: #F39C12;"><u>Moyen de Transmission</u></span>

La connexion est effectué via la carte réseau  

- La carte réseau est présente sur les couches 1 & 2 du modèle OSI
    - Couche 1 : connectique et modulation de données (Transmission des bits en signaux électriques ou optiques)
    - Couche 2 : Adresse Physique (Adresse MAC)

## <span style="color: #F39C12;"><u>Support de Transmission</u></span>

### <span style="color: #1ABC9C;">Câble Cuivre</span>

<figure markdown="1">
![image](./img/coupe_cable.png){width=600}
<figcaption>coupe d'un câble cuivre</figcaption>
</figure>

<figure markdown="1">
![image](./img/cablage_rj.png){width=600}
<figcaption>Cablage Rj45</figcaption>
</figure>

### <span style="color: #1ABC9C;">Fibre Optique</span>

<figure markdown="1">
![image](./img/composition%20fibre.webp){width=600}
<figcaption>Plan Coupe Fibre Optique</figcaption>
</figure>

<figure markdown="1">
![image](./img/caract_fibre.png){width=600}
<figcaption>Caractéristique Fibre Optique</figcaption>
</figure>

<figure markdown="1">
![image](./img/connecteur-de-fibre-optique.jpg){width=600}
<figcaption>Connecteur Fibre Optique</figcaption>
</figure>
