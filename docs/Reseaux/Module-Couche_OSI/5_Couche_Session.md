# Couche Session

Prenons l'exemple d'un envoi de mail

Une fois formaté par la couche supérieur `Présentation`, votre mail est prêt à être envoyé.
La couche `session` vas ouvrir une sessions avec le bon Protocole/Port servant à l'envoi du mail sur la couche suivante.

La couche session s'occupe de :

- La gestion des sessions
  - Ouverture
  - Fermeture
  - Restauration (si une session est terminée la "reconnexion" s'effectuera dans cette couche)
- Gestions des permissions (quelle application peut faire quoi)

Les protocoles de la couche 5, tels que X.225, déterminent comment la communication s’effectuera.
Il existe 2 types de communication :

- **Half Duplex (HDX)**: Permettant la communication tour par tour
- **Full Duplex (FDX)**: Permettant la communication en simultané
- **Simplex** : Communication possible dans un sens seulement (ex. : TV hertzienne) non représenté dans le schéma ci-dessous

<figure markdown="1">
![Schéma communication](./img/half_Full%20Duplex.jpg){width=300}
</figure>

!!! note "Unités de la couche Session"
    – SPDU
