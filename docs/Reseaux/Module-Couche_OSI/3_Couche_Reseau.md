# Couche Réseau

Maintenant que la couche [transport](./4_Couche_Transport.md) à indiqué le numéro de port à utiliser, reste à avoir l'adresse IP du récepteur.

La couche `réseau` se charge du [routage](./) des données entre le point A et le point B & de l'adressage.

Sur cette couche aussi l'en-tête subit une modification, en plus de l'en-tête ajouté par la couche [transport](./4_Couche_Transport.md) on lui rajoute :

- IP source
- IP destinataire

! Le protocole IP est bien sur le plus utilisé a ce niveau !

!!! note "Unités de la couche Physique"
    - paquets
