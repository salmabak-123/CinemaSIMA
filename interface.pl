% ============================================================================
% CinemaSIMA - Interface Interactive (interface.pl)
% ============================================================================

:- ['main.pl'].
:- dynamic reponse_utilisateur/2.

nettoyer_reponses :-
    retractall(reponse_utilisateur(_, _)).

% Question 1: Type de contenu
poser_question(type_contenu) :-
    nl,
    write('=== QUESTION 1: Type de contenu ==='), nl,
    write('Que souhaitez-vous regarder?'), nl,
    write('  1. Films'), nl,
    write('  2. Series'), nl,
    write('Votre choix (1 ou 2): '),
    read(Choix),
    (Choix = 1 -> 
        assert(reponse_utilisateur(type_contenu, films))
    ; 
        assert(reponse_utilisateur(type_contenu, series))
    ),
    nl.

% Question 2: Genres
poser_question(genres) :-
    write('=== QUESTION 2: Genres preferes ==='), nl,
    write('Genres disponibles:'), nl,
    write('  1. Action      6. Drama       11. Mystery'), nl,
    write('  2. Adventure   7. Family      12. Romance'), nl,
    write('  3. Animation   8. Fantasy     13. Sci-Fi'), nl,
    write('  4. Comedy      9. History     14. Thriller'), nl,
    write('  5. Crime      10. Horror'), nl,
    nl,
    write('Entrez 1-3 numeros (ex: [1,13,14]): '),
    read(Numeros),
    convertir_numeros_en_genres(Numeros, Genres),
    assert(reponse_utilisateur(genres, Genres)),
    nl.

convertir_numeros_en_genres([], []).
convertir_numeros_en_genres([N|Rest], [G|RestG]) :-
    numero_vers_genre(N, G),
    convertir_numeros_en_genres(Rest, RestG).

numero_vers_genre(1, action).
numero_vers_genre(2, adventure).
numero_vers_genre(3, animation).
numero_vers_genre(4, comedy).
numero_vers_genre(5, crime).
numero_vers_genre(6, drama).
numero_vers_genre(7, family).
numero_vers_genre(8, fantasy).
numero_vers_genre(9, history).
numero_vers_genre(10, horror).
numero_vers_genre(11, mystery).
numero_vers_genre(12, romance).
numero_vers_genre(13, sci_fi).
numero_vers_genre(14, thriller).

% Question 3: Durée
poser_question(duree) :-
    write('=== QUESTION 3: Duree maximale ==='), nl,
    write('  1. Court (< 90 min)'), nl,
    write('  2. Standard (< 120 min)'), nl,
    write('  3. Long (< 150 min)'), nl,
    write('  4. Tres long (< 200 min)'), nl,
    write('  5. Pas de limite'), nl,
    write('Votre choix (1-5): '),
    read(Choix),
    choix_vers_duree(Choix, Duree),
    assert(reponse_utilisateur(duree, Duree)),
    nl.

choix_vers_duree(1, 90).
choix_vers_duree(2, 120).
choix_vers_duree(3, 150).
choix_vers_duree(4, 200).
choix_vers_duree(5, 300).
choix_vers_duree(_, 180).

% Question 4: Année
poser_question(annee) :-
    write('=== QUESTION 4: Periode preferee ==='), nl,
    write('  1. Classiques (avant 1990)'), nl,
    write('  2. Annees 90 (1990-1999)'), nl,
    write('  3. Annees 2000 (2000-2009)'), nl,
    write('  4. Annees 2010 (2010-2019)'), nl,
    write('  5. Recents (2020+)'), nl,
    write('  6. Pas de preference'), nl,
    write('Votre choix (1-6): '),
    read(Choix),
    choix_vers_annee(Choix, Annee),
    assert(reponse_utilisateur(annee, Annee)),
    nl.

choix_vers_annee(1, 1950).
choix_vers_annee(2, 1990).
choix_vers_annee(3, 2000).
choix_vers_annee(4, 2010).
choix_vers_annee(5, 2020).
choix_vers_annee(6, 1950).
choix_vers_annee(_, 1990).

% Interview complète
interview_utilisateur :-
    nl,
    write('╔════════════════════════════════════════╗'), nl,
    write('║    CINEMASIMA - INTERVIEW             ║'), nl,
    write('╚════════════════════════════════════════╝'), nl, nl,
    
    nettoyer_reponses,
    
    poser_question(type_contenu),
    poser_question(genres),
    poser_question(duree),
    poser_question(annee),
    
    % Configuration et recommandations
    reponse_utilisateur(genres, Genres),
    reponse_utilisateur(duree, Duree),
    reponse_utilisateur(annee, Annee),
    
    set_preferences(Genres, Duree, Annee),
    
    write('=== VOS RECOMMANDATIONS ==='), nl, nl,
    reponse_utilisateur(type_contenu, Type),
    show_recommendations(Type, 5).

% Instructions
:- write('Lancer l\'interview: ?- interview_utilisateur.'), nl, nl.
