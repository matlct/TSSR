TCP souhaite un acquittement de paquet (controle d'erreur)
UDP n'as pas besoin de retour

A->B impossible le poste B ne peut communiquer car pas sur le meme reseau que la passerelle.
A->C Possible car le s-rx le permet (/8)
A->D Possible via la passerelle
A->E impossible car E (/16) alors que le routeur est en (/24) donc pas de connaissance du sur-rsx E

B-> ne peut communiquer avec aucun des postes (pas la bonne IP)

C->A 
C->B
C->D Possible via la Passerelle
C->E impossible meme raison que (A->E)

Bien verifier les masques et les passerelles.

!!!!
Masque de F empeche la communication vers ->D & ->E
comme le masque F est /8 il ne peut atteindre le reseau 172.20 en /16 car pour lui il s'agit du meme reseau en 172.X.X.X
donc aucun interet pour lui de sortir via la passerelle.
vulgairement il tente de joindre un équipement qui pour lui est dans son réseau mais non branché

fournir les sauts afin d'atteindre les Routeurs avec le moins de saut possible

R1: 13.107.32.0/19 R2
    13.107.64.0/18 permet d'atteindre le rx .64 .96
    13.107.128.0/17 permet d'atteindre le rx .128 .160 .192 .224

# Table de routage
un routeur ne vois que son voisin !
dans notre cas le réseau est linéaire !

--R1--R2--R3--R4-- R=Routeur

R1 ne verra que R2
R2 ne verra que R1 & R3
R3 ne verra que R2 & R4
R4 ne verra qur R3

![exercice table routage](./base%20du%20réseau/Exercice%20table%20routage.png)

Résumé de route!
pour agreger un rs convertir les adresses en binaire et prendre le masque englobant