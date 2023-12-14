# <span style="color: #3498DB;">Couche Transport</span>

Prenons l'exemple d'un envoi de mail  

Une fois la session établie, par votre couche [session](./5_Couche_Session.md) la couche `transport`prend le relais afin de préparer votre mail pour l’envoi.  

!!! danger ""
    Le nom de cette couche est trompeur  
    Elle n’est pas responsable à proprement parler du transport des données, mais elle y contribue à l’aide des 3 dernières couches  
    [Réseau](3_Couche_Reseau.md),  
    [Liaison de données](2_Couche_Liaison.md),  
    [Physique](1_Couche_Physique.md).  

La couche transport divise les données en plusieurs segments (ou séquences) dans la couche transport de l’hôte émetteur et les réunit dans la couche transport de l’hôte récepteur.  

Elle choisit (en fonction des contraintes de communication) la meilleure façon d’envoyer une information  

- Devrais-je m’assurer que la transmission à réussi ou juste envoyer ?
- Quel port devrais-je utiliser ?

La couche transport modifie également l’en-tête des données en y ajoutant des informations de port :  

- Port de destination : Application à contacter
- Port local d'écoute : Port local aléatoire ouvert pour la réponse

## <span style="color: #F39C12;"><u>Les Protocoles TCP & UDP</u></span>

!!! tip "Les 2 protocoles présent"
    === "TCP"
        **T**ransmission **C**ontrol **P**rotocol  
        - Orienté connexion (garantit la transmission de données)  
        - Fiable (garantit la livraison de paquets est obligatoire)  
    === "UDP"
        **U**ser **D**atagram **P**rotocol  
        - Orienté non connexion (ne garantit pas la transmission de données)  
        - non Fiable (ne garantit pas la livraison de paquets : aucune mécanisme de vérification de la perte de paquets)  
        - Principalement utilisé pour les applications en temps réel (la ou le retard de paquet est mieux géré que la perte de paquet)  


!!! note "Unités de la couche Transport"
    – Segment