# Assistance avec GLPI

<u>Objectifs</u>  

- Découvrir la création d'un ticket
- Découvrir le traitement d'un ticket
- Appréhender la base de connaissance

## Le ticket

En informatique, tout fonctionne à base de ticket  
Cela permet de solliciter la DSI  
Un ticket passera par plusieurs status : cycle de vie du ticket  
Peut-être de 2 types :  
- Incident
- Demande
Doit compter un minimum d'information  
Offre de nombreux avantages:
- Traçabilité
- Détection des problèmes
- Répartition des tâches
- Communication

## L'assistance sous GLPI

Système de gestion de tickets / outil de ticketing  
Conforme aux bonnes pratques ITIL  
Recueil des sollicitations utilisateur pour une gestion centralisée  
Différents canaux de communication possibles  
Saisie, suivi et traitement du ticket  
Cycle de vie des tickets  
Statistiques possibles  

## Flux d'entrée

<u>Trois grandes façons de créer un ticket</u>  

![ticket GLPI](./img/ITIL/../../../img/ITIL/ticket_GLPI.png)

## Cycle de vie d'un ticket

![cycle_vie_ticket](./img/ITIL/../../../img/ITIL/cycle_vie_ticket.png)

## Traitement d'un ticket

### Aperçu

![traitement ticket](./img/ITIL/../../../img/ITIL/aperçu_ticket.png)

### Attribution

Utilisateurs, groupes ou fournisseurs  
Représente les techniciens ou groupes de compétences en charge du ticket  
Utilisé lors des escalades fonctionnelles  
Raccourci pour s'attribuer nominativement le ticket  
Peut-être automatisé en fonction de critères à la création du ticket  
Ticket visible pour traitement par les groupes et utilisateurs attribués  

![attribution ticket](./img/ITIL/../../../img/ITIL/atrtibution_ticket_glpi.png)

### Observateurs

Utilisé lors des escalades hiérarchiques  
Utilisateurs et groupes  
Notifications sans traitement possible du ticket  
Va permettre de suivre l'évolution du ticket  
Peuvent être ajoutés automatiquement à la création en fonction de critères  

![observateur ticket](./img/ITIL/../../../img/ITIL/observateur_ticket_glpi.png)

### SLA

Doivent être facilement identifiables  
Le type : **Temps de résolution**  
La durée maximum de résolution souhaitée  
Possibilité de créer des niveaux d'escalade  

![SLA GLPI](./img/ITIL/../../../img/ITIL/SLA.png)

### Validation

Les valideurs reçoivent une notification de validation  
Ils approuvent ou refusent en accédant au ticket à valider.  

![validation ticket](./img/ITIL/../../../img/ITIL/1_validation_ticket_GLPI.png)

![validation ticket 2](./img/ITIL/../../../img/ITIL/2_validation_ticket_GLPI.png)

### Traitement

Onglet **Traitement du ticket**  
4 possibilités :  
- Suivi
- Tâche
- Solution
- Document

![traitement ticket](./img/ITIL/../../../img/ITIL/triatement_ticket_GLPI.png)

### Clôture

La clôture du ticket s'effectue à l'approbation de la solution  
Peut-être effectuée par le demandeur ou le rédacteur (ticket par téléphone)  
Accessible par le mail de validation ou le menu ticket de l'interface simplifiée  
Commentaire obligatoire en cas de refus  
Possibilité de planifier ou rendre la clôture immédiate à la résolution  

![clôture ticket](./img/ITIL/../../../img/ITIL/cloture_ticket_GLPI.png)

## Ticket : Eléments liés

Liaison de CI possible à la création d'un ticket  
Utile pour le diagnostic  
Utile pour les statistiques  
Nécessite une CMDB à jour et bien renseignée  

![élements liés](./img/ITIL/../../../img/ITIL/element_ticket_GLPI.png)

## Base de connaissance

### Article

Objectifs:  

- Centraliser des connaissances internes aux différents techniciens
- Mettre à disposition des utilisateurs des informations (FAQ)

Accessible depuis **Outils => Base de connaissances**  
Restriction à un nombre d'acteurs  
Validation de publications d'articles  
Gestion des révisions  
Liaison possibles avec les tickets et les éléments d'inventaire (CI)  
FAQ: sous-partie de la base de connaissances à destination des utilisateurs  
Organisation possible par catégories et restrictions temporelles  

### Création

Création d'un article  
Ajout des cibles  
Usage public ou non  

Article sans cible = Article non publié  
Apparaît dans **Gérer**  
Visible que par son créateur  

![création ticket GLPI](./img/ITIL/../../../img/ITIL/base_de_co_création.png)

### Cibles

Vont permettre de publier l'article à différents personnes  
Entité - Profil - Groupe - Utilisateur  

![Cible base de co](./img/ITIL/../../../img/ITIL/base_de_co_cibles.png)

## Base de connaissances publiques

Eviter la création systématique d'un ticket  
**FAQ** (**F**oire **A**ux **Q**uestions)  
Accessible depuis l'interface simplifiée  
Accès rapide ou par catégories  

![base connaissance publiques](./img/ITIL/../../../img/ITIL/base_de_co_publiques.png)