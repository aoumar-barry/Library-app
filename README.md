# LibraryApp - Gestion de Prêt de Livres

Application web de gestion de prêt de livres entre particuliers, développée avec Ruby on Rails 7.

##  Description du Projet

LibraryApp est une application moderne permettant de gérer une bibliothèque personnelle et le prêt de livres. Elle offre les fonctionnalités suivantes :

- **Gestion des livres** : Ajouter, modifier, supprimer et rechercher des livres
- **Gestion des personnes** : Gérer les emprunteurs avec leurs informations de contact
- **Système de prêt** : Prêter et rendre des livres avec suivi en temps réel
- **Interface de recherche** : Recherche interactive avec filtrage en temps réel
- **Design moderne** : Interface utilisateur élégante avec Tailwind CSS

### Technologies Utilisées

- **Backend** : Ruby on Rails 7.2.3
- **Base de données** : PostgreSQL 14
- **Frontend** : Hotwire (Turbo + Stimulus), Tailwind CSS
- **Conteneurisation** : Docker & Docker Compose

## Installation

### Prérequis

- Docker Desktop installé sur votre machine
- Git (pour cloner le projet)

### Étapes d'Installation

1. **Cloner le projet**
   ```bash
   git clone <url-du-repo>
   cd Ruby-project
   ```

2. **Configurer les variables d'environnement**
   
   Créez un fichier `.env` à la racine du projet en copiant le fichier d'exemple :
   ```bash
   cp .env.example .env
   ```
   
   > **Note** : Le fichier `.env.example` contient déjà des valeurs par défaut fonctionnelles pour le développement local. Vous pouvez utiliser ces valeurs telles quelles pour démarrer rapidement.
   
   Si vous souhaitez générer une nouvelle clé secrète (optionnel) :
   ```bash
   # Générer une nouvelle SECRET_KEY_BASE
   docker-compose run --rm web bundle exec rails secret
   # Copiez la clé générée et remplacez la valeur dans le fichier .env
   ```

3. **Construire et démarrer les conteneurs**
   ```bash
   docker-compose up --build
   ```

4. **Créer et initialiser la base de données** (dans un nouveau terminal)
   ```bash
   docker-compose exec web bundle exec rails db:create db:migrate
   ```

4. **Accéder à l'application**
   
   Ouvrez votre navigateur et visitez : [http://localhost:3000](http://localhost:3000)

## Commandes pour Lancer l'Application

### Démarrer l'application

```bash
docker-compose up
```

### Arrêter l'application

```bash
docker-compose down
```

### Redémarrer l'application (après modifications du code)

```bash
docker-compose restart web
```

### Accéder au conteneur Rails (pour exécuter des commandes)

```bash
docker-compose exec web bash
```

### Créer/Migrer la base de données

```bash
docker-compose exec web bundle exec rails db:create
docker-compose exec web bundle exec rails db:migrate
```

### Réinitialiser la base de données

```bash
docker-compose exec web bundle exec rails db:reset
```

## Dépannage

### Erreur lors du build : "SECRET_KEY_BASE" manquant

Si vous rencontrez cette erreur lors de l'exécution de `docker-compose up --build` :

```
failed to solve: process "/bin/sh -c SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile" did not complete successfully: exit code: 127
```

**Solution** : Assurez-vous d'avoir créé le fichier `.env` à partir du fichier `.env.example` :

```bash
cp .env.example .env
```

Le fichier `.env.example` contient déjà des valeurs par défaut qui fonctionnent pour le développement local.

### Les conteneurs ne démarrent pas

Si les conteneurs ne démarrent pas correctement :

1. Arrêtez tous les conteneurs :
   ```bash
   docker-compose down
   ```

2. Supprimez les volumes (attention : cela supprimera toutes les données) :
   ```bash
   docker-compose down -v
   ```

3. Reconstruisez et redémarrez :
   ```bash
   docker-compose up --build
   ```
