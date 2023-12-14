# Formatage Powershell

Par défaut powershell "formate" les resultats des cmdlets avant de les afficher à l'ecran.

>le "Formatage" ici fait reference à de la *mise en page* ou de la *mise en forme*

La mise en page par défaut peut-etre modifier via les cmdlets suivante :

- `Format-List` : Permet l'affichage des résultats sous forme de liste
- `Format-Table`: permet l'affichage sous forme de tableau (comportant des lignes et des colonnes)
- `Format-Wide`: permet de mettre en forme les valeurs d'une propriété spécifique selectionné.

>Les cmdlets `Format-*` denature les objets elle doivent donc etre utilisé a la fin, une fois le travail terminer et enchainer les `|` (pipeline)

## Format-List

Permet de mettre les resultats sous forme de liste

! La cmdlet `format-list` peut également etre ecrite `FL` !

exemple avec la cmdlet `Get-service`

```Powershell
PS D:\Informatique\Mkdocs\cours-eni> get-service

Status   Name               DisplayName
------   ----               -----------
Stopped  AarSvc_33fca3      Agent Activation Runtime_33fca3
Running  AdobeARMservice    Adobe Acrobat Update Service
Stopped  AfVpnService       AfVpnService
Running  agent_ovpnconnect  OpenVPN Agent agent_ovpnconnect
```

`Get-service | format-list`

```Powershell
PS D:\Informatique\Mkdocs\cours-eni> get-service | format-list

Name                : AarSvc_33fca3
DisplayName         : Agent Activation Runtime_33fca3
Status              : Stopped
DependentServices   : {}
ServicesDependedOn  : {}
CanPauseAndContinue : False
CanShutdown         : False
CanStop             : False
ServiceType         : 224

Name                : AdobeARMservice
DisplayName         : Adobe Acrobat Update Service
Status              : Running
DependentServices   : {}
ServicesDependedOn  : {}
CanPauseAndContinue : False
CanShutdown         : False
CanStop             : True
ServiceType         : Win32OwnProcess

Name                : AfVpnService
DisplayName         : AfVpnService
Status              : Stopped
DependentServices   : {}
ServicesDependedOn  : {}
CanPauseAndContinue : False
CanShutdown         : False
CanStop             : False
ServiceType         : Win32OwnProcess

Name                : agent_ovpnconnect
DisplayName         : OpenVPN Agent agent_ovpnconnect
Status              : Running
DependentServices   : {}
ServicesDependedOn  : {}
CanPauseAndContinue : False
CanShutdown         : False
CanStop             : True
ServiceType         : Win32OwnProcess
```

`Get-service | Format-wide -property name`

```Powershell
PS D:\Informatique\Mkdocs\cours-eni> get-service | format-wide -property name  

AarSvc_33fca3                                                                      AdobeARMservice
AfVpnService                                                                       agent_ovpnconnect
AJRouter                                                                           ALG
AORUS LCD Panel Service                                                            AppIDSvc
Appinfo                                                                            AppMgmt
AppReadiness                                                                       AppVClient
AppXSvc                                                                            AssignedAccessManagerSvc
AudioEndpointBuilder                                                               Audiosrv
autotimesvc                                                                        AxInstSV
BcastDVRUserService_33fca3                                                         BDAppSrv
BDAuxSrv                                                                           BDESVC
BDProtSrv                                                                          bdredline
bdredline_agent                                                                    BDSafepaySrv
BdVpnService                                                                       BFE
BITS                                                                               BluetoothUserService_33fca3
```

>Via `-property` on specifie la caracteristique a sortir
ex:

- `-Property *` spécifie que l'on veut tous les champs,
- `-Property Name,status,displayname` spécifie que l'on veut les noms, statut et le nom d'affichage (équivalent à `select`)

## Format-Table

Permet de mettre les resultats sous forme de Tableau

! La cmdlet `format-table` peut également etre ecrite `FT` !

exemple avec la cmdlet `Get-Timezone`

```Powershell
PS D:\Informatique\Mkdocs\cours-eni> get-timezone

Id                         : Romance Standard Time
HasIanaId                  : False
DisplayName                : (UTC+01:00) Bruxelles, Copenhague, Madrid, Paris
StandardName               : Paris, Madrid
DaylightName               : Paris, Madrid (heure d’été)
BaseUtcOffset              : 01:00:00
SupportsDaylightSavingTime : True
```

`Get-Timezone | Format-Table`

```Powershell
PS D:\Informatique\Mkdocs\cours-eni> get-timezone | Format-Table

Id                    HasIanaId DisplayName                                      StandardName  DaylightName                BaseUtcOffset SupportsDaylightSavingTime   
--                    --------- -----------                                      ------------  ------------                ------------- --------------------------   
Romance Standard Time     False (UTC+01:00) Bruxelles, Copenhague, Madrid, Paris Paris, Madrid Paris, Madrid (heure d’été) 01:00:00                            True   
```

`Get-Timezone | Format-table -property *`

Affichera la meme reponse que celle du dessus car `-property *`selectionne tout les élement de la réponse.

`Get-Timezone | FT -property standarname,baseutcoffset -autosize`*

```Powershell
PS D:\Informatique\Mkdocs\cours-eni> get-timezone | Format-Table -property StandardName,baseUtcoffset -autosize

StandardName  BaseUtcOffset
------------  -------------
Paris, Madrid 01:00:00
```

> `-autosize` permet de dimensionner la largeur des colonnes automatiquement en fonction des valeurs contenu et de la largeur de la console Powershell

## Format-Wide

Permet de renvoyer le résultat sous forme de Tableau
>Elle ne travail qu'avec une seule propriété.

Possibilité de mettre en forme selon les besoins en selectionnant la propriété souhaité puis choisir le nombre de colonne que l'on souhaite

Exemple avec la cmdlet `Get-Process`

```Powershell
PS D:\Informatique\Mkdocs\cours-eni> get-process     

 NPM(K)    PM(M)      WS(M)     CPU(s)      Id  SI ProcessName
 ------    -----      -----     ------      --  -- -----------
     54    51,43      87,71       6,23   25540   1 Acrobat
     15     2,83      10,16       0,02   22972   1 acrotray
     10     2,01      10,91       0,11    6708   0 agent_ovpnconnect_1675786017207
     11     2,85      11,27       0,00    9308   0 AggregatorHost
     25    14,48      35,52       0,02    6132   1 ApplicationFrameHost
      9     1,62       6,75       0,00    6672   0 armsvc
     17    11,16      21,32       8,55   21712   0 audiodg
     56    52,91      43,79       4,09   15996   1 bdagent
     20    11,06      22,36       0,00   11752   0 bdntwrk
     13     3,46      13,92       0,00   13340   0 bdredline
............................................
```

`Get-process | Format-Wide`
Avec cette cmdlet on laisse `Format-Wide` choisir le format de sortie

```Powershell
PS D:\Informatique\Mkdocs\cours-eni> get-process | FW

Acrobat                                                                                                              acrotray
agent_ovpnconnect_1675786017207                                                                                      AggregatorHost
ApplicationFrameHost                                                                                                 armsvc
audiodg                                                                                                              bdagent
bdntwrk                                                                                                              bdredline
bdredline                                                                                                            bdservicehost
bdservicehost                                                                                                        bdservicehost
bdservicehost                                                                                                        bdservicehost
bduserhost                                                                                                           bduserhost
............................................................
```

>La cmdlet `Format-Wide` choisis de nous l'afficher sur 2 colonnes

`Get-Process | Format-Wide -property ID -column 5`
Cette fois on *spécifie* la propriété 'ID' et on demande de l'afficher sur 5 colonnes

```Powershell
PS D:\Informatique\Mkdocs\cours-eni> get-process | FW -property ID -column 5

25540                                          22972                                          6708                                           9308                                          6132
6672                                           21712                                          15996                                          11752                                         13340
13408                                          2848                                           2856                                           3704                                          3728
6820                                           4456                                           8388                                           19920                                         3720
17904                                          2400                                           5344                                           5972                                          10908
15036                                          15104                                          18244                                          20728                                         21728
22080                                          23116                                          23300                                          23828                                         5900
6368                                           10004                                          13844                                          19008                                         19224
1684                                           1788                                           18564                                          6016                                          9580
3316                                           9956                                           17444                                          18736                                         26208
.................................
```

`Get-Process | FW -property ID -autosize`
Cette fois en spécifiant `-autosize` on laisse le parametre definir la largeur en fonction de la taille de votre console PowerShell

```Powershell
PS D:\Informatique\Mkdocs\cours-eni> get-process | FW -property ID -autosize

25540  22972  6708   9308   6132   6672  21712 15996 11752 13340 13408 2848  2856  3704  3728  6820  4456  8388  19920 3720  17904 2400  5344  5972  10908 15036 15104 18244 20728 21728 22080 23116 23300 23828 5900  6368  10004 13844 
19008  19224  1684   1788   18564  6016  9580  3316  9956  17444 18736 26208 26268 13840 14096 15816 25824 6732  13356 11224 2268  6780  3452  3468  13060 19912 18752 20904 2728  4872  5996  9944  10796 13496 14300 15896 19284 20224 
20356  20460  20780  20948  21652  24152 24340 25888 25912 27600 29756 2024  2072  6748  7628  9136  9144  1692  9876  21452 4000  5812  0     3428  13868 8180  16464 27468 14332 12152 6860  1868  1876  4356  5836  4876  8816  11104 
13320  17640  18744  19124  19184  19188 24596 24612 24656 24784 27312 6996  4308  7024  7184  12340 3588  5484  14536 15160 15464 10128 15356 6772  19684 25220 21992 22132 22472 22512 6788  20228 6812  15908 22348 236   20140 6836  
18908  9844   14208  16396  16800  16868 22752 24080 30440 16564 4892  204   19052 19036 1848  1800  20636 11736 1244  6724  6056  6852  6984  16600 6844  1280  1580  1712  1996  2056  2164  2180  2276  2284  2292  2408  2412  2460  
2468   2576   2600   2604   2632   2648  2672  2808  2816  2912  2952  3040  3224  3324  3388  3396  3476  3556  3600  3712  4244  4252  4260  4340  4424  4484  4496  4780  4880  5424  5452  5716  5724  5860  5884  6168  6236  6632  
6716   6740   6764   6796   6804   6896  6920  6960  6976  7548  7708  9068  9632  9968  10324 10576 10732 11240 12992 13052 13240 13352 13624 13776 13888 13896 14840 14860 15596 15852 15928 16648 17096 21032 22248 22800 23112 23152 
23448  26088  27572  29788  4      24280 27380 3744  15968 6908  16820 6872  6880  6936  22584 6944  20340 22632 16480 2560  17268 19904 1780  1932  6360  5300  6536  6924  9260  3920  6888
```
