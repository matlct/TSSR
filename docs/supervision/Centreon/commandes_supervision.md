## Les commandes de supervision

Le moteur de supervision a pour rôle de lancer des commandes de supervision à intervalles réguliers (par défaut toutes les 5 min).  

Une des premières étapes dans la mise en place de supervision sera de définir ces ommandes qui permettront de faire nos vérifications, qu'on appelle également "checks".  

### Commandes de vérification

Chaque hôte pourra être associés à différents services.  
Par exemple, une charge CPU, consommation mémoire, débit sur une interface réseau, etc.  
La vérification de ces hôtes et services va nécessiter l'exécution d'une commande qu'on appellera **sonde de supervision** dans ce contexte.  
En fonction de ce que l'on souhaitera superviser, nous avons à notre disposition un ensemble de binaire/script issu des historiques "Nagios-plugins" ou des modernes "Centreon-plugins" en Perl.  

### Ou les trouver ?

Elles se trouvent dans 2 "jeux" de commandes :  

- **Les commandes Nagios** (Nagios Plugins), commandes historiques de Nagios à installer (par paquets de la distribution), on les retrouve dans `/usr/lib64/nagios/plugins`  
- Les commandes **Centreon Plugins**, installable via les "plugin pack", on les retrouve dans `/usr/lib/Centreon/plugins`  
    - Il existe une multitude de plugins packs, certains sont gratuits, d'autres payants.  

### Fonctionnement

Sur chacun des hôtes et services que nous superviserons sera associée une commande de vérification.  
L'exécution de cette commande, notre **check**, aura pour objectif de déterminer un **statut**.  
C'est ensuite ce **statut** qui permettra de déterminer l'état de notre hôte ou service.  
Pour déterminer ce **statut**, le moteur de supervision (Centreon-Engine) à l'origine de la commande de vérification lira le code retour de la commande.  

Prenons l'exemple de la vérification du service CPU d'un hôte lambda.  
Une commande est associée à ce service :  

1. Le moteur de supervision récupère la commande et l'exécute  
2. La commande s'exécute et procède à différentes interrogations et traitements  
3. Le moteur de supervision récupère le code retour et en détermine un statut  
4. C'est ce statut qui lui permettra d'entrependre des actions que l'on verra plus tard  

## Les statuts

<u>Pour un Hôte</u>  

<figure markdown=1>
![image](./img/8.png){width=400}
</figure>

<u>Pour un Service</u>  

<figure markdown=1>
![image](./img/9.png){width=400}
</figure>

## Ecrire des sondes

### Sondes Nagios

On retrouve les sondes dans le répertoire `/usr/lib64/nagios/plugins`  
Chaque sonde a le paramètre `-h` (obtenir de l'aide, à lire)  
D'autres options communes comme `-c` (seuil CRITICAL) et `-w` (seuil WARNING)  

Une fois exécutée, une commande va retourner :  

- Des informations textuelles qu'on pourra visualiser depuis l'interface de supervision  
- Des données de performance qui permettront d'alimenter des graphiques  
- Un code de retour pour permettre au moteur de supervision de déterminer un statut  

### Plugins SNMP

Celles-ci ce trouve à l'emplacement `/usr/lib/Centreon/plugins`  
Triés par domaine  

### Plugins NRPE

Le plugin **NRPE** se trouve à l'emplacement suivant :  
`/usr/lib/nagios/plugins` et se nomme **check_centreon_nrpe3** (le numéro 3 correspond au numéro de version)  
