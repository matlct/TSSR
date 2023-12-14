Faiblesse des serveurs DNS par transfert de zone.    Tip A Friend
Enregistrer au format PDF
mardi 17 janvier 2006
par g0uZ

Le DNS est un maillon essentiel au monde Internet puisqu’il permet de retrouver les serveurs attachés à un site WEB ou à un service FTP par exemple. Ainsi, lorsqu’un utilisateur demande une connexion HTTP, sa requête passe obligatoirement par une multitude de serveur DNS chacun délivrant une information à chaque fois plus précise jusqu’à retrouver la source. C’est littéralement le principe de la toile d’araignée : on part d’un bout pour arriver à l’autre en passant par un nombre conséquent de nœuds. Le DNS, c’est à peu près cela.

BIND est l’implémentation la plus répandue du protocole DNS permettant d’assurer la résolution des noms de domaines Internet et la correspondance adresse IP et nom de domaine. De nombreuses vulnérabilités ont été publiées durant les dernières années affectant le code propre à l’application BIND. Ainsi, sur les serveurs vulnérables, ces failles sont susceptibles de provoquer un DOS (déni de service) du service DNS ou l’exécution de commandes arbitraires avec des privilèges autres que simple utilisateur, notamment grâce à l’exploitation d’un débordement de tampon.

Néanmoins (et bien trop souvent d’ailleurs), on retrouve une faille rudimentaire sur les serveurs DNS qui accorde en lecture un florilège d’informations sensibles. Effectivement, les commandes de transfert afin de mettre à jour les serveurs DNS secondaires ne rencontrent pas toujours de restrictions selon les clients. En d’autres termes, chacun à la possibilité d’accéder à ces données sensibles qui sont retransmises. Il s’agit véritablement d’une mauvaise configuration des serveurs DNS. A cet effet, l’option permettant les appels récursifs est activée par défaut avec la version 8 de BIND. Par ailleurs, les administrateurs n’ont pas toujours le réflexe de modifier cette implémentation d’origine et dangereuse.

Un des moyens de résoudre le problème en attendant les correctifs de sécurité est de désactiver les appels récursifs sur le serveur DNS. Or, dans certains cas, ce n’est évidemment pas toujours possible, et pour cause : un serveur DNS doit fournir des indications à ses sous domaines.
Néanmoins, il faut ajouter que dans les cas ou la suppression de la récursivité n’est pas possible, un contrôle strict des domaines autorisés à utiliser un serveur DNS principal de façon récursive peut permettre de limiter les risques d’attaque insidieuse. Il faut alors utiliser l’option [allow-recursion]. Ainsi, il n’est nullement obligatoire de servir les requêtes de transfert de n’importe qui.

Pour illustrer notre explication, nous allons justement examiner cette faiblesse au travers d’un exemple réel. Nous allons voir qu’un DNS mal configuré peut livrer trop d’informations et compromettre ainsi la confidentialité de certains fichiers (dans notre cas clients). Notre exemple se porte sur le portail spécialisé dans le jeu Formule FPS NoFrag.com (super site d’ailleurs !) A l’origine, je souhaitais louer les services de leur hébergement afin d’héberger un serveur Counter Strike ou Day Of Defeat. Avant cela, je voulais d’abord m’assurer du sérieux de leur administration et vérifier par moi-même l’intégrité de leurs produits. C’est peut être discutable comme initiative mais on n’achète pas toujours un produit tant que l’on a pas encore ouvert la boîte 

Pour débuter, effectuons un simple Whois pour informations de base sur le site suivant : www.whois.net | Mais qu’est-ce donc au juste ?
Le Whois (de l’anglais « qui est-ce ? ») permet d’obtenir des informations légales et administratives des hébergements ainsi que des sites selon.

Note : En vert figure les commentaires. En bleu les requêtes du client.
[www.whois.net]
Whois de DodFrance

domain:                dodfrance.com
owner-address:        DoD France
owner-address:        99 Chemin Vert
owner-address:        59300
owner-address:        Aulnoy
owner-address:        France
admin-c:              DS479-GANDI
tech-c:                DS479-GANDI
bill-c:                DS479-GANDI
nserver:              NS.BELOGIC.NET 81.91.66.208 <<< Serveur DNS
nserver:              NS.ST-AISE.COM 81.91.66.208 <<< Serveur DNS
reg_created:        2001-06-11 12:45:31
expires:        2004-06-11 12:45:31
created:        2001-06-11 18:45:31
changed:        2003-05-24 21:54:21

person:        Dubois Samuel
nic-hdl:        DS479-GANDI
address:        99 Chemin Vert
address:        59300
address:        Aulnoy
address:        France
phone:        06 16 44 47 00
e-mail:        alternativ_fr@hotmail.com

Notre Whois nous donne deux adresses IP concernant les serveurs DNS du domaine Dodfrance.com, soit NS.BELOGIC.NET et NS.ST-AISE.COM (même IP). Pour tenter une migration des données relatives à ces DNS, nous utiliserons le programme nslookup (présent sur les distributions Unix et 2000NT) et qui sert justement à cet effet. C’est grâce à cette application que nous allons établir un contact client avec les serveurs DNS. Ajoutons brièvement qu’un serveur DNS utilise le protocole UDP (User Datagram Protocol) pour le passage des données.

Maintenant, passons aux choses sérieuses en demandant à notre IP 81.91.66.208 la version de BIND. Jusqu’à présent rien ne nous garanti qu’il se produira quelque chose de positif puisque normalement, nous devrions rencontrer une certaine restriction (si le serveur DNS est bien configuré). Et pourtant . . .
Version DNS (81.91.66.208) nonerd.net

C:\>nslookup
Serveur par défaut : dnscache-1.proxad.net
address: 212.27.39.1 Mon serveur DNS (@free)

> server 81.91.66.208
Serveur par défaut : nonerd.net
Address: 81.91.66.208
Aliases: 208.66.91.81.in-addr.arpa

> set class=chaos
> set q=txt
> version.bind
Serveur: nonerd.net
Address: 81.91.66.208
Aliases: 208.66.91.81.in-addr.arpa

VERSION.BIND   text =

       "8.3.6-REL" Voici la version!

  Nous voici donc avec une version 8.3.6 de BIND. Vous remarquerez que nous obtenons aussi un nom de domaine autre sous l'éponyme nonerd.net
C'est maintenant que nous allons tenter (avec succès d'ailleurs) un transfert de zone DNS toujours avec nslookup. Voyons le résultat.

> ls -d nonerd.net
[nonerd.net]
nonerd.net.                    SOA    nonerd.net root.nonerd.net. (3003103102 3600 900 604800 3600)
nonerd.net.                    NS     nonerd.net                    
nonerd.net.                    NS     ns6.gandi.net                
nonerd.net.                    A      81.91.66.208
sql                            A      81.91.66.208
yooz                           A      81.91.66.208
*.yooz                         CNAME  yooz.nonerd.net
timoti                         A      81.91.66.208
*.timoti                       CNAME  timoti.nonerd.net
gallery                        A      81.91.66.208
*.gallery                      CNAME  gallery.nonerd.net
home                           A      62.4.20.82
comics                         A      62.4.20.82
mail                           A      81.91.66.208
www                            A      81.91.66.208
arabd                          A      81.91.66.208
*.arabd                        CNAME  arabd.nonerd.net
ftp                            A      81.91.66.208
nonerd.net.                    SOA    nonerd.net root.nonerd.net. (3003103102 3600 900 604800 3600)

Il y a certains aspects intéressants à cette petite impression sur écran, mais manifestement, les abréviations ne nous semble pas coutumières. A cet effet, prenons le temps de donner une claire explications des différentes abréviations rencontrées :

SOA - [Start Of Authority] décrit le DNS faisant référence ainsi que différentes valeurs indiquant la durée de validité des informations et l’adresse @mail du responsable de la zone.

NS - [Name Server] désigne les serveurs de noms pour la zone interrogée.

A - [Address] fait correspondre un nom (ou service) à une adresse IP. Dans notre log, nous trouvons notamment un serveur FTP (pure ftpd, vulnérable BOF), un service de messagerie, etc.

CNAME - [Alias Name] Cette possibilité est particulièrement utilisée pour l’hébergement mutualisé lorsque plusieurs sites WEB sont hébergés sur le même serveur.

D’autres abréviations existent mais ne sont pas inscrites dans notre log d’exemple sur nonerd. Néanmoins, expliquons notamment MX qui correspond à un service de messagerie, PTR pour une correspondance entre une IP et une adresse, etc.

Il est intéressant de considérer la réponse via une requête de transfert sur le DNS ns6.gandi.net (d’ailleurs, la réponse correspond à une bonne configuration). Après, nous demanderons la version BIND du DNS secondaire.

Request query sur ns6.gandi.net

> ls -d 80.67.173.196
[ns6.gandi.net]
*** Impossible de fournir la liste du domaine 80.67.173.196ÿ : Query refused

C :>nslookup
Serveur par défaut : dnscache-1.proxad.net
address : 212.27.39.1

> server 80.67.173.196
Serveur par défaut : nonerd.net
Address : 80.67.173.196

> set class=chaos
> set q=txt
> version.bind
Serveur : ns6.gandi.net
Address : 80.67.173.196

VERSION.BIND text =

"8.3.1-REL-NOESW"

En finalité, nous avons donc plusieurs sites à visités (CNAME soit les aliases) sur notre IP [81.91.66.208]. Nous sommes en présence de 3 sites valides en partage sur le même serveur selon expression ’mutualisé’ :

1° http://gallery.nonerd.net [NoNerd Family Gallery]
2° http://timoti.nonerd.net [Etrange site sur l’art contemporain]
3° http://yooz.nonerd.net [Idem mais orienté Art plastique]

Bien que le transfert de zone ne soit pas explicitement responsable des différentes faiblesses de ce domaine, il accorde néanmoins une certaine transparence et donne une image plus précise de la cible. Le plus intéressant aurait été de placer une restriction afin de garantir l’opacité des susdites informations sensibles. Présentement, il y a là un moyen très simple de discerner si un site ou un serveur héberge éventuellement un script PHP vulnérable, un service ayant une faiblesse particulière ou d’autres choses encore.

Terminons cet examen en affirmant qu’après avoir été prévenu, l’administrateur consciencieux a prit les dispositions adéquats. Ainsi, les services de nonerd.net sont selon une attente légitime.

l33t sk1llz ++
