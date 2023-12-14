# Les Stratégies de Groupe

## Le fonctionnement des GPO

<u>Descriptif</u>  

Les **GPO** (Group Policy Objetc) ou **stratégies de groupe** sont utilisés dans un domaine AD pour paramétrer les **ordinateurs** et les **utilisateurs**  

<figure markdown=1>
![image](./img_ad/gpo.png)
</figure>

### Les types de stratégie

Les conditons d'utilisation et d'application varient selon le type de stratégie.  

- La stratégie de groupe : 
  - Nécessite un contexte de domaine.
  - <span style="color:red">S'applique sur un ou des ensembles d'éléments</span>
  - En cas de conflits, elle l'emporte sur la stratégie locale
- La stratégie locale
  - Est utilisable dans et hors contexte de domaine.
  - **Se configure poste par poste**

### Du registre aux stratégies

Pour configurer des GPO il existe 2 manière de faire :  

Via le registre, manière plus complexe, il oblige de passer systématiquement poste par poste pour les mettres en place.  
Cependant il n'impactera qu'un poste configuré et non un ensemble de poste.  

Via la console mmc des stratégies de groupe, celle-ci permet d'appliquer des regles sur un ensemble de poste, cela amene un gain de temps.

### Application des stratégies

<figure markdown=1>
![image](./img_ad/application_gpo.png)
</figure>

Côté client on parlera d'extensions, de CSE, il s'agit de composants permettant :  

- Récuperer les stratégies mises à disposition par le contrôleur de domaine.
- Intègrer et appliquer les paramétrages s'y trouvant

### Stratégies par défaut

Après l'installation d'un domaine, 2 stratégies sont configurées par défaut :  

<figure markdown=1>
![image](./img_ad/gpo_domaine.png)
</figure>

## Le Ciblage des stratégies

!!! inline end danger ""
    Les GPO ne s'appliquent pas aux membres des groupes présents sur un conteneur auquel elles sont liées.  
    Une GPO ne peut pas être appliquée à un groupe.  

<figure markdown=1>
![image](./img_ad/ciblage_gpo.png)
</figure>

### La console de gestion

<figure markdown=1>
![image](./img_ad/mmc_gpo.png)
</figure>

Il s'agit d'une console mmc, ressemblant à la console mmc de l'active directory.  

Celle-ci comporte : 

- <span style="color:blue">des **Conteneurs de liaison</span> 
- <span style="color:red">des **Liaisons de stratégies**</span> : Répertorie les stratégies et ou elles sont mises en place
- <span style="color:green">**Conteneur des stratégies du domaine**</span> : Répertorie l'ensemble des stratégies de groupe, permettant une visualisation simplifié.

### Application et ordre de traitement

=== "Priorités et Héritage"
    <figure markdown=1>
    ![image](./img_ad/priorite_heritage.png)
    </figure>
=== "Valeurs Conflictuelles"
    <figure markdown=1>
    ![image](./img_ad/conflit_complement.png)
    </figure>

### Les possibilités de restrictions

<figure markdown=1>
![image](./img_ad/restrictions.png)
</figure>

## La mise en oeuvre des stratégies

### Les domaines impactés

Les domaines impactés sont représentés ci-dessous :  

<figure markdown=1>
![image](./img_ad/domaine_impacte.png)
</figure>

### Les modèles d'administration

Il s'agit de fichier .admx, la plupart des logiciels propriétaire microsoft dispose de ce type de fichier.  

Il permettent de configurer :  

!!! inline end tip ""
    ![mmc_gpo](./img_ad/administration_gpo.png)

- <span style="color:gray">Le système d'exploitation</span>
- <span style="color:blue">Des composants système</span>
- <span style="color:green">Des outils Microsoft</span>

A noter que les fichiers .admx sont stockées dans le partage **"SYSVOL"**

## Redirection des dossiers

### Principe de redirection
Les dossiers du profil utilisateur sont stockés sur un emplacement réseau.  

<figure markdown=1>
![image](./img_ad/redirection_dossier.png)
</figure>

!!! inline end tip "Paramètres du dossier partagé:"
    - <u>Partage</u>: Contrôle total pour les utilisateurs redirigés.  
    - <u>Permissions NTFS</u>: Liste du dossier et création de dossiers dans ce dossier seulement

### Stratégie de redirection des dossiers

Les redirections s'appliquent aux objets utilisateurs.  

<figure markdown=1>
![image](./img_ad/redirection_dossier_1.png)
</figure>
