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

2. **Construire et démarrer les conteneurs**
   ```bash
   docker-compose up --build
   ```

3. **Créer et initialiser la base de données** (dans un nouveau terminal)
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
