# Les Unités de données

Durant la communication entre 2 hôtes, chaque information transmise est une donnée.  

Cette `donnée`a plusieurs unités selon la couche traversée, il s’agit bien de la même donnée, mais sous plusieurs appellations.  

Les données transmises sont ainsi appelées :  

- PDU (**P**rotocol **D**ata **U**nits) : unité de données du protocole  

!!! info ""
    === "Composition d'un PDU"
        Un PDU est composé de :  
        - Un SDU : unité de données du service n  
        - UN PCI : Information de contrôle du protocole n (en-tête)  

    !!! info "les PDU à travers les couches"
        Au passage de chaque couche le nom PDU sera précédé de l'initiale de la couche dont elles vient:  
        === "APDU"
            Passage de la couche [Applicative](./7_Couche_Applicative.md) à la couche Présentation  
            Application Protocol Data Unit
        === "PPDU"
            Passage de la couche [Présentation](./6_Couche_Presentation.md) à la couche Application <u>OU</u> Session  
            Presentation Protocol Data Unit
        === "SPDU"
            Passage de la couche [Session](./5_Couche_Session.md) à la couche Présentation  
            Session Protocol Data Units  


Une fois dans la couche [Transport](./4_Couche_Transport.md) (petit rappel la couche transport découpe les données en segment) la logique veut donc que les PDU deviennent donc des… segments

!!! tips ""
    le terme **TPDU** (**T**ransport **P**rotocol **D**ata **U**nits) est également correcte pour la couche transport

Arrivé dans les couches 3/2/1, les données deviennent :

- Réseau = paquets
- Liaison = trames (*frames*)
- Physique = bits

Donc si quelqu’un vous dit qu’il a perdu des paquets vous savez que votre problème devrait être (normalement) dans la couche réseau de votre infrastructure, etc.

![unités de données OSI](./img/unités%20de%20données%20OSI.jpg)

!!! warning ""
    Sur le schéma, la mention `Datagram`est le nom d’un PDU transmis via un service non fiable (ex.:UDP)
