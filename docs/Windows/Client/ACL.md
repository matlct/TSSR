# Découvrir les ACL

## NTFS & les ACL

[inserer image issu support de cours]
l'onglet sécurité :
Accessible via les propriété d'un objet (dossier, doc...) herbergé sur le volume D:\

- DACL (liste de controle d'acces discrétionnaire) filtre :
  - les utilisateurs
  - les groupes
    - locaux (creer au préalable)
    - prédefinis (ex: administrateur)
  - entité de sécurité intégré (ex ici systemes)

  - ne contient pas d'utilisateur, c'est une bonne pratique a appliqué sur le terrain, on evite au max. d'intégré des util. dans les DACL (plus facile et productif de gerer 10 groupes que 100 utilisateurs)

- ACE (Access Control Entry):
definissent les actions possible sur l'objet pour le groupe en question.
- Ecriture
- lecture
- modification

(ex: sur l'image le groupe voisin peut lire/executer le contenu du dossier, le modifier)

pour les besoins courant et dans la majorité des cas les **ACE de base** sont utilisées et cumulatives.
elles sont configurable depuis le bouton modifiable de l'onglet sécurité.

Les niveaux d'acces ACE

1. Lecture : avec ce niveau l'utilisateur pourra lire des fichiers, exe des programmes et afficher le contenu d'un dossier
2. Modification : niveau lecture toujours présent mais il pourra modifier les fichiers, creer et supprimer des objets dans ce repertoire
3. Contrôle total: meme droit que les niveau 1 & 2 mais la possibilité de gerer soit meme les ACL de l'objet en question.

Il est conseillé d'utiliser au max. ces 3 nivx d'acces !

Dans certain cas des authorisations spécial peuvent etre configurés (disponible depuis l'onglet avance de l'onglet securité),
permet d'affiner les acces. (ex: creation de fichiers, supp de sous-dossier, creer un fichier sans pouvoir l'imprimer etc).

## définir les ACL (Acces Control List)

sur un volume en NTFS (New Technology File system) :

- tous les répertoires et tous les fichiers sont soumis a la securité NTFS
- des autorisations définissent des privileges d'acces (les droits d'acces a ces objets)
- l'utilisateur presente son jeton d'acces, qui est filtré par la ressource, donnant l'acces ou bloquant l'acces
- les authorisat° sont stockées dans l'index du systemes de fichier NTFS
- elles sont consultables et modifiable dasn l'onglet sécurité de chaque objet.

## les permission les regles

Elles sont basée sur des regles explicite
ils faut explicitement des groupes dans les DACL et des acces dans les ACE
1 groupe absent de la DACL sera refuser = refus implicite
chaque regle peut accorder des privileges (**autoriser**) ou les oter (**refuser**)
Plusieurs regles d'acces peuvent s'appliquer a un meme utilisateur
    la regle la plus permissive l'emporte (plus haut niveau d'acces l'emporte)
le refus explicite l'emporte sur l'authorisation
    ex: un groupe me donne l'acces en lecture et un autre qui refuse explicitement la lecture

### Mecanisme d'héritage

Par défaut, un répertoire propage ses autorisations a ses objets enfants
les autorisations héritées apparaissent grisées et ne sont pas modifiable (ces le mecanisme d'heritage)
une autorisation d'acces l'emporte sur un refus explicite hérité

Pour les modifier, il faut :
Modifier les autorisations sur le dossier parent (voir remonter jusqu'a la racine du lecteur)
si les modif du dossier parent on un impact sur d'autre dossier enfant il faudra (pour transformer les autorisation `grisées` en autorisation `noire` et modifiable):
"casser" l'heritage (a effectuer avec precaution)
    Gestion de l'heritage depuis le menu **avancé**

l'heritge NTFS fait partit intégrante de la secu NTFS, la copie et le déplacement de fichier ou d'arborescence on un impact sur les autorisations d'acces.
elles sont conservé si on coupe/colle, on deplace un objet au sein d'un meme volume car il s'agit du meme index de systeme de fichier qui est solicité
par contre si on deplace vers un autre volume (ou si on copie un fichier vers un autre systeme de fichier) l'objet sera considéré comme de nx objets et ce sont les autorisation d'acces herité qui l'emporte.

## verif des ACL

une fois les ACL configuré il faut :

- Testez les acces avec les utilisateurs !
  - si possible dirrectement avec eux (appel pour verif en temps réel) cela permet a l'equipe tech d'echanger avec les utilisateurs !
- ou/et verifiez les accès depuis l'onglet **acces effectif** du menu **avancé**
! toujours test les acces avant d'annonce que des partages sont en production !

Resumer:

ACL a manipuler avec précaution !

Bonnes pratiques pour eviter les effets de bord et les mauvaises surprises :

- Privilégier au max. l'insertion des groupes dans les DACL
- Utiliser au maximum ACE de base (lecture/modification/controle total/refus)
- Garder en tete les mécanismes d'héritage (attention aux copies, aux déplacements)
- Privilégier l'utilisation des droits heriter (héritage)
- Privilégier le refus implicite (plutot que de cocher des cases refus)
- Toujours tester/verifier les actions sur les ACL.
- ! Attention a l'UAC pour les administrateurs, il peut avoir un effet non voulu suite a des manipulations avec les ACL, en effet UAC (User Account Control) fait en sorte que meme en étant membre du gorupe admin. le systeme le considere avant tous comme un utilisateur, et ceux pour des questions de sécurité, il est possible de desactiver ce comportement via les stratégie de sécurité !  
- 