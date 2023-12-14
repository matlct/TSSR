# Gestion MariaDB & MySQL

!!! tip ""
    Les exemples suivant utilisent :  
        - <u>identifiant</u> indique l'emplacement ou taper l'identifiant de la personne à gérer  
        - <u>serveur</u> correspond au serveur ou à la base de donnée  
    MariaDB et MySQL accepte aussi bien :  
        - Les simples quotes `' '`  
        - Les doubles quotes `" "`  
    Voila pourquoi les 2 types sont représentés dans les blocs de code ci-dessous  

## Entrer dans la base de donnée

Pour cela ouvrir un shell et taper :  

```bash
Mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  
Commands end with ; or \g.  
Your MariadDB connection id is 100  
Server version: 10.11.4-MariaDB-1~deb12u1 Debian 12  

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.  drop

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
```

## visualiser base de donnée

```sql
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| db_glpi            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0,000 sec)

MariaDB [(none)]> exit
Bye
```

## Utilisateur

### Visualisation

```sql
MariaDB [(none)]> select user,host from mysql.user;
+--------------+-----------+
| User         | Host      |
+--------------+-----------+
| admindb_glpi | localhost |
| mariadb.sys  | localhost |
| mysql        | localhost |
| phpmyadmin   | localhost |
| root         | localhost |
+--------------+-----------+
5 rows in set (0,001 sec)
```

### Création

```sql
MariaDB [(none)]> CREATE USER 'identifiant'@'serveur';

MariaDB [(none)]> CREATE USER 'identifiant'@'serveur' IDENTIFIED BY 'mot_de_passe';
```

### Changement mot de passe

```sql
MariaDB [(none)]> SET PASSWORD FOR "identifiant"@"serveur" = PASSWORD("NouveauMotDePasse");
MariaDB [(none)]> quit;
```

### Renommage

```sql
MariaDB [(none)]> RENAME USER 'identifiant'@'serveur' TO 'nouveau_identifant'@'nouveau_serveur';
```
Si le serveur est inchangé il faudra quand mêm retaper le nom du serveur sur lequel l'utilisateur ce trouve.  

### Supression

```sql
MariaDB [(none)]> DROP USER 'identifiant'@'serveur'
```

## Voir les droits d'un utilisateur sur les bases de données

```sql
MariadB [(none)]> show grants for "admindb_glpi"@"localhost";
+---------------------------------------------------------------------------------------------------------------------+
| Grants for admindb_glpi@localhost                                                                                   |
+---------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `admindb_glpi`@`localhost` IDENTIFIED BY PASSWORD '*0F3704CF78312459ABAEBE40557BFF7BFCB0A3EC' |
| GRANT ALL PRIVILEGES ON `db_glpi`.* TO `admindb_glpi`@`localhost`                                                   |
| GRANT ALL PRIVILEGES ON `glpi_db`.* TO `admindb_glpi`@`localhost`                                                   |
+---------------------------------------------------------------------------------------------------------------------+
3 rows in set (0,000 sec)
```

