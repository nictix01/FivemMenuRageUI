# Menu RageUI pour FiveM

Ce projet propose un menu **RageUI** pour FiveM, permettant d'afficher les informations des joueurs connectés telles que leur ID, nom, prénom, argent liquide et en banque. Le menu s’ouvre via la touche **I** du clavier.

Pour le bon fonctionnement, ce menu utilise une base de données MySQL et nécessite certaines ressources déjà configurées sur le serveur.

---

## Installation

1. **Prérequis** :
   - Un serveur FiveM fonctionnel.
   - MySQL-async installé et configuré.
   - Une base de données opérationnelle avec une table `users` contenant les colonnes nécessaires.
   - RageUI installé. Vous pouvez télécharger RageUI depuis [ce lien officiel](https://github.com/iTexZoz/RageUI).
   - ESX ou une autre ressource compatible pour gérer les données des joueurs.

2. **Ajout des fichiers** :
   - Téléchargez ce projet et placez-le dans le dossier `resources` de votre serveur sous le nom `my_rp_menu`.
     Exemple :
     ```plaintext
     resources/
     └── my_rp_menu/
     ```

3. **Configurer la base de données** :
   - Ouvrez le fichier `config/config.lua` et configurez vos informations MySQL comme suit :
     ```lua
     Config.Database = {
         host = '127.0.0.1',     -- Adresse IP de la base de données
         user = 'root',          -- Nom d'utilisateur
         password = '',          -- Mot de passe
         database = 'frensh_paris_rp' -- Nom de la base de données
     }
     ```
   - Exécutez cette commande SQL pour créer la table `users` si elle n'existe pas encore :
     ```sql
     CREATE TABLE users (
         identifier VARCHAR(50) PRIMARY KEY,
         firstname VARCHAR(50),
         lastname VARCHAR(50),
         cash INT DEFAULT 0,
         bank INT DEFAULT 0
     );
     ```

4. **Activer la ressource dans le serveur** :
   - Ajoutez cette ligne dans le fichier `server.cfg` de votre serveur FiveM :
     ```plaintext
     ensure my_rp_menu
     ```

5. **Lancer le serveur et tester** :
   - Redémarrez votre serveur FiveM.
   - Connectez-vous au serveur.
   - Appuyez sur la touche **I** pour ouvrir le menu.

---

## Structure du projet

Voici l’organisation des fichiers inclus dans ce projet :
```plaintext
my_rp_menu/
├── client/
│   ├── client.lua          # Script côté client
│   └── fxmanifest.lua      # Déclaration des ressources client
├── config/
│   └── config.lua          # Configuration MySQL
├── server/
│   ├── server.lua          # Script côté serveur
│   └── fxmanifest.lua      # Déclaration des ressources serveur