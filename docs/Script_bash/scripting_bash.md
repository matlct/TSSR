# Scripting Bash

## Premiére ligne d'un script
```sh
##################################
##  Auteur: Mathieu
##  Description : Script de test
##  Date : 25092023
##  Version : 1.0
##################################
```

## Initinialisez un script Bash (premiére ligne impératif)  
```#!/bin/bash```

## Déclarer une variable   
``nom_de_la_variable="ce que la variable contiendra" ``

### Type de variable :  
   * int  (entier)
   * float (decimal)
   * string (caractère)

## Afficher un texte ou autre   
Pour afficher quelque chose il faut faire un __echo__
```sh
echo "j'affiche le un message"
```
ou afficher sur plusieurs lignes : 
```sh
echo "je suis
un humain
de 18 ans 
et je suis un grand"
```
afficher une variable
```sh
echo "voici ma variable voiture que j'appel comme cela $voiture"
```

## Opération  
|Opérateur|	Nom	|
|+	|Addition|	
|–	|Soustraction|	
|*	|Multiplication|	
|/	|Division|	
|%	|Modulo|	
|**	|Puissance|	
|//	|Division entière|


## Exemple de script nb de roue pour une voiture  
```sh
var_roue="1"
voiture="$var_roue x 4"
voiture="${voiture/1 x /}" # Supprimer "1 x " de la chaîne
echo "Vous avez $voiture roues sur votre voiture"
```

## Les conditions  

Si/Alors/sinon

!!! abstract "Âge défini dans une variable"
    === "Script"
    ```sh
    #!/bin/bash
    echo "Quel est votre âge defini dans la variable ?"
    age="29"
    # Vérifier si l'âge est supérieur ou égal à 18
    if [ "$age" -ge 18 ]; then
        echo "Vous êtes majeur."
    else
        echo "Vous êtes mineur."
    fi
    ```
    === "Résultat"
    ```sh
    $ ./script_age.sh
    Quel est votre âge defini dans la variable ?
    Vous êtes majeur.
    ```

## Creation d'une entrée utilisateur  

!!! question "Définir une entrée via `read`"
    === "Script"
    ```sh
    #!/bin/bash
    # Demander à l'utilisateur de renseigner son âge
    echo "Quel est votre âge ?"
    read age
    echo "$age"
    ```
    ??? success "Resultat"
        === "Retour du script"
            ```sh
            $ ./script.sh  
            quel est votre âge ?  
            36  
            36  
            ```

### Combinaison des 2 précédents script

Permet de rentrer une donnée et d'inclure des boucles de sélection

!!! question ""
    === "Script"
    ```sh
    #!/bin/bash
    read -p "Quel est votre âge ?" age
    if [ "$age" -ge 18 ]; then
        echo "Vous êtes majeur."
    else
        echo "Vous êtes mineur."
    fi
    ```
    ???+ success ""
        === "Résultat"
            ```sh
            $ ./script_age.sh
            Quel est votre âge ?36
            Vous êtes majeur.
            ```
            === "Résultat 2"
                ```sh
                $ ./script_age.sh
                Quel est votre âge ?16
                Vous êtes mineur.
                ```

## Faire un saut de ligne 

!!! question "```\n```"
    === "Exemple 1"
        ```sh
        echo -e "Ceci est une ligne.\nCeci est une autre ligne."
        ```
        ??? success "Résultat" 
            === "Exemple 1"
                ```sh
                Ceci est une ligne  
                Ceci est une autre ligne  
                ```
    === "Exemple 2"
        ```sh
        echo -e "\n"
        ```
    === "Exemple 3"
        ```sh
        echo ""
        ```
    === "Exemple 4"
        ```sh
        echo
        ```

## Les boucles while 

```sh
#!/bin/bash

compteur=1

while [ $compteur -le 5 ]
do
    echo "Compteur : $compteur"
    compteur=$((compteur + 1))
done

echo "Boucle terminée"
```

## Les cases

```sh
#!/bin/bash

fruit="pomme"

case $fruit in
    "pomme")
        echo "C'est une pomme" ;;
    "banane")
        echo "C'est une banane" ;;
    "orange")
        echo "C'est une orange" ;;
    *)
        echo "Je ne sais pas quel fruit c'est." ;;
esac
```
