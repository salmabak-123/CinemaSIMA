"""
CinemaSIMA - Serveur Web Simple (server.pl renommé en server.py)
"""

from flask import Flask, render_template, request, jsonify
from pyswip import Prolog
import os

app = Flask(__name__)
prolog = Prolog()

# Charger les fichiers Prolog
prolog.consult('facts.pl')
prolog.consult('rules_films.pl')
prolog.consult('rules_series.pl')
prolog.consult('main.pl')

GENRES_MAP = {
    'Action': 'action', 'Adventure': 'adventure', 'Animation': 'animation',
    'Comedy': 'comedy', 'Crime': 'crime', 'Drama': 'drama',
    'Family': 'family', 'Fantasy': 'fantasy', 'History': 'history',
    'Horror': 'horror', 'Mystery': 'mystery', 'Romance': 'romance',
    'Sci-Fi': 'sci_fi', 'Thriller': 'thriller'
}

@app.route('/')
def index():
    return render_template('index.html', genres=list(GENRES_MAP.keys()))

@app.route('/recommend', methods=['POST'])
def recommend():
    try:
        data = request.json
        content_type = data.get('content_type', 'films')
        genres = [GENRES_MAP.get(g, g.lower()) for g in data.get('genres', [])]
        max_duration = int(data.get('max_duration', 180))
        min_year = int(data.get('min_year', 1990))
        
        # Configuration
        list(prolog.query("reset_preferences"))
        genres_prolog = '[' + ','.join(genres) + ']'
        list(prolog.query(f"set_preferences({genres_prolog}, {max_duration}, {min_year})"))
        
        # Recommandations
        recommendations = []
        if content_type == 'films':
            for result in prolog.query(f"recommend_films(5, Results), member(score(Score, ID, Titre, Genres, Realisateur, Acteurs, Annee, Duree, Note, Exp), Results)"):
                recommendations.append({
                    'title': result['Titre'],
                    'score': result['Score'],
                    'genres': result['Genres'],
                    'director': result['Realisateur'],
                    'year': result['Annee'],
                    'duration': result['Duree'],
                    'rating': result['Note'],
                    'explanation': result['Exp']
                })
        else:
            for result in prolog.query(f"recommend_series(5, Results), member(score(Score, ID, Titre, Genres, Createur, Acteurs, Annee, DureeEpisode, Note, Saisons, Exp), Results)"):
                recommendations.append({
                    'title': result['Titre'],
                    'score': result['Score'],
                    'genres': result['Genres'],
                    'director': result['Createur'],
                    'year': result['Annee'],
                    'duration': result['DureeEpisode'],
                    'rating': result['Note'],
                    'seasons': result['Saisons'],
                    'explanation': result['Exp']
                })
        
        return jsonify({'success': True, 'recommendations': recommendations})
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
