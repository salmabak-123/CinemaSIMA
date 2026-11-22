# 🎬 CinemaSIMA - Version Simple

Système Expert de Recommandation de Films et Séries avec Prolog.

## 📁 Structure du Projet

```
cinemasima_simple/
├── facts.pl           # Base de données (40 films + 40 séries)
├── rules_films.pl     # Règles pour films
├── rules_series.pl    # Règles pour séries
├── main.pl            # Point d'entrée Prolog
├── interface.pl       # Interface Question-Réponse
├── server.py          # Serveur web Flask
├── templates/
│   └── index.html     # Interface web
└── README.md          # Ce fichier
```

## 🚀 Installation

### Prérequis
```bash
# SWI-Prolog
sudo apt-get install swi-prolog

# Python + Flask + PySwip
pip install flask pyswip
```

## 💻 Utilisation

### Mode 1: Interface Web
```bash
python3 server.py
# Ouvrir http://localhost:5000
```

### Mode 2: Interface Prolog Interactive
```bash
swipl
?- ['interface.pl'].
?- interview_utilisateur.
```

### Mode 3: Console Prolog
```bash
swipl
?- ['main.pl'].
?- demo.
```

## 📊 Formule de Scoring

```
Score = min(100, Score_genres + Score_note + Bonus)

- Score_genres = Genres communs × 20 (max 60)
- Score_note = Note × 5 (max 50)
- Bonus = +10 durée OK, +10 année OK, +5 acteur, +5 réalisateur
```

## 🎯 Exemple d'Utilisation

### Prolog Console
```prolog
% Configuration manuelle
?- set_preferences([action, sci_fi, thriller], 180, 2000).
?- add_preferred_actors(['Leonardo DiCaprio']).
?- add_preferred_directors(['Christopher Nolan']).
?- show_recommendations('films', 5).

% Ou utiliser la démo
?- demo.
```

### Interface Web
1. Sélectionner Films ou Séries
2. Cliquer sur 1-3 genres
3. Ajuster durée et année
4. Cliquer sur "Générer"
5. Voir les 5 meilleures recommandations!

## 📝 Base de Données

- **40 Films** : Action, Drama, Comedy, Thriller, Horror, Animation, etc.
- **40 Séries** : Crime, Sci-Fi, Drama, Comedy, etc.

Chaque contenu a : Titre, Genres, Réalisateur, Acteurs, Année, Durée, Note

## ✨ Fonctionnalités

✅ Scoring transparent avec formule explicite  
✅ Explications détaillées pour chaque recommandation  
✅ 3 modes d'utilisation (Web, Interactive, Console)  
✅ Filtrage par genres, durée, année  
✅ Support acteurs/réalisateurs préférés  

## 🎓 Projet Académique

Module: Fondements avancés de l'IA  
Filière: Master IA - S1  
Institution: ENSA Marrakech  
Année: 2025-2026

---

**Simple, Efficace, Transparent** 🎯
