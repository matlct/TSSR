# Conversion Décimale/Binaire

>Rappel sur les adresses IP
>Une adresse IP est une suite de :
>- 4 groupes de chifres
>  - 1 groupe = 1 octet
>    - 1 octet = 8 bits

Ce qui nous interesse est le `bits` (acronyme de : **BI**nary digi**T**)

1 `bits` ne peut avoir que 2 valeurs possible : {1 ou 2}

>Si un bit = 1 on dit qu'il est allumé, sinon c'est qu'il est...éteint!

Comme nous avons 8 `bits` par octet et qu'une adresse comporte 4 octet nous aurons donc une adresse IPv4 représenté sur 32 bits (32 chiffres)

- 1x8=8 bits
    - 8x4=32 bits

Dans un nombre binaire, chaque `bit`, s'il vaut 1, correspond à un certain nombre en décimal.

Ainsi de la droite vers la gauche on a:

* chiffre 8 = 128
* chiffre 7 = 64
* chiffre 6 = 32
* chiffre 5 = 16
* chiffre 4 = 8
* chiffre 3 = 4
* chiffre 2 = 2
* chiffre 1 = 1

Nous allons donc convertir une adresse IPv4 en binaire.
Prenons l'addresse 12.3.2.1
Decomposons octet par octet ce que cela représente en bit (en reprenant la liste de correspondance du dessus) : 

12 = 8+4
3 = 2+1
2 = 2
1 = 1

Puis reportons les resultat des additions dans le tableau du dessous en mettant un `1` dans les colonnes correspondante.

Une fois fait complet chaque colonne vide par des `0`

| valeur décimale | 128 | 64  | 32  | 16  |  8  |  4  |  2  |  1  |
| :-------------: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|    12 = 8+4     |  0  |  0  |  0  |  0  |  1  |  1  |  0  |  0  |
|     3 = 2+1     |  0  |  0  |  0  |  0  |  0  |  0  |  1  |  1  |
|      2 = 2      |  0  |  0  |  0  |  0  |  0  |  0  |  1  |  0  |
|      1 = 1      |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  1  |

>2 & 1 étant naturellement dans le tableau nous n'avons pas d'addition à faire

Maintenant nous avons notre adresse IPv4 décimal en binaire

Valeur décimal :    12    .     3    .    2     .    1
Valeur binaire : 00001100 . 00000011 . 00000010 . 00000001



Pour cela il suffit de regarder quelle `bits` sont allumés et de les additionner.

>Avec le tableau du dessus nous pouvons representer des nombres de 0 à 255.
Pour representer un chiffre plus grand il suffit d'etendre le tableau :

| valeur décimale |   1024   |   512   |   256   |   128   |   64    |   32    |   16    |    8    |    4    |    2    |    1    |
| :-------------: | :------: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: |
|     **x²**      | **2^10** | **2^9** | **2^8** | **2^7** | **2^6** | **2^5** | **2^4** | **2^3** | **2^2** | **2^1** | **2^0** |
|      2023       |    1     |    1    |    1    |    1    |    1    |    1    |    0    |    0    |    1    |    1    |    1    |

ce qui donnera :
2023 : 1024 + 512 + 256 + 128 + 64  + 32  + 4   + 2   + 1
2023 : 2^10 + 2^9 + 2^8 + 2^7 + 2^6 + 2^5 + 2^2 + 2^1 + 2^0
2023 : 11111100111

# Hexadecimale

Maintenant que le binaire est ok pour le calcul d'IPv4 passons à l'hexadeciaml pour le calcul d'aresse IPv6.

L'hexadecimal, contrairement au binaire, n'est plus une base 2 mais une base 16.

En décimal, on écrit plusieurs chiffre pour représenter un nombre plus grand que 9.
En binaire, ne disposant que de 2 chiffres (0 & 1) on ajoutes un ou plusieurs chiffre(s) pour representer un nombre plus grand que 1.
En héxadecimal le principe est le même mais pour représenter un nombre plus grand que 15.

Voici la correspondance entre nombre décimaux, binaire et héxadécimaux :

| Décimal | Binaire | héxadécimal |
| :-----: | :-----: | :---------: |
|    0    |    0    |      0      |
|    1    |  0001   |      1      |
|    2    |  0010   |      2      |
|    3    |  0011   |      3      |
|    4    |  0100   |      4      |
|    5    |  0101   |      5      |
|    6    |  0110   |      6      |
|    7    |  0111   |      7      |
|    8    |  1000   |      8      |
|    9    |  1001   |      9      |
|   10    |  1010   |      A      |
|   11    |  1011   |      B      |
|   12    |  1100   |      C      |
|   13    |  1101   |      D      |
|   14    |  1110   |      E      |
|   15    |  1111   |      F      |
|   16    |  10000  |     10      |
|   17    |  10001  |     11      |
|   ...   |   ...   |     ...     |

Pour convertir FE80 (que nous retrouvons régulièrement sur les add. IPv6) il suffit de convertir chaque éléments.
F = 15 = 1111
E = 15 = 1110
8 = 8 = 1000
0 = 0 = 0000

FE80 = 1111 1110 1000 0000
Comme un chiffre héxadécimal correspond à 4 chiffres binaires, la séparation en blocs de 4 `bits` rend la lecture plus facile.

<span style="color : #FF0000">! Un ordinateur ne peut traiter des valeurs numérique que sous forme d'octets, le nb 98 peut ainsi être stocker sur 1 octet car il faut 7 `bits` pour le représenter.
Par contre le nb 256 nécessite 9 `bits` on doit donc mobiliser 2 octets.</span>
