% ============================================================================
% CinemaSIMA - Fichier Principal (main.pl)
% ============================================================================

% Chargement des modules
:- ['facts.pl'].
:- ['rules_films.pl'].
:- ['rules_series.pl'].

% Initialisation
reset_preferences :-
    retractall(user_preference(_, _)),
    retractall(avoid_actor(_)),
    retractall(avoid_director(_)),
    retractall(preferred_actor(_)),
    retractall(preferred_director(_)).

% Configuration des préférences
set_preferences(Genres, MaxDuration, MinYear) :-
    reset_preferences,
    assert(user_preference(genres, Genres)),
    assert(user_preference(max_duration, MaxDuration)),
    assert(user_preference(min_year, MinYear)).

add_preferred_actors(ActorsList) :-
    retractall(preferred_actor(_)),
    maplist(assert_preferred_actor, ActorsList).

assert_preferred_actor(Actor) :-
    assert(preferred_actor(Actor)).

add_preferred_directors(DirectorsList) :-
    retractall(preferred_director(_)),
    maplist(assert_preferred_director, DirectorsList).

assert_preferred_director(Director) :-
    assert(preferred_director(Director)).

add_avoided_actors(ActorsList) :-
    retractall(avoid_actor(_)),
    maplist(assert_avoid_actor, ActorsList).

assert_avoid_actor(Actor) :-
    assert(avoid_actor(Actor)).

add_avoided_directors(DirectorsList) :-
    retractall(avoid_director(_)),
    maplist(assert_avoid_director, DirectorsList).

assert_avoid_director(Director) :-
    assert(avoid_director(Director)).

% Affichage des recommandations
show_recommendations(ContentType, N) :-
    (ContentType = 'films' ->
        recommend_films(N, Results),
        display_all_film_recommendations(Results)
    ;
        recommend_series(N, Results),
        display_all_serie_recommendations(Results)
    ).

% Exemple d'utilisation
demo :-
    write('=== DEMO CinemaSIMA ==='), nl, nl,
    
    write('Configuration:'), nl,
    write('  Genres: action, sci_fi, thriller'), nl,
    write('  Duree max: 180 min'), nl,
    write('  Annee min: 2000'), nl,
    write('  Acteurs preferes: Leonardo DiCaprio, Tom Hardy'), nl,
    write('  Realisateurs preferes: Christopher Nolan'), nl, nl,
    
    set_preferences([action, sci_fi, thriller], 180, 2000),
    add_preferred_actors(['Leonardo DiCaprio', 'Tom Hardy']),
    add_preferred_directors(['Christopher Nolan']),
    
    write('Top 5 Films:'), nl,
    show_recommendations('films', 5).

% Message de démarrage
:- write('╔════════════════════════════════════════╗'), nl,
   write('║         CINEMASIMA - SIMPLE           ║'), nl,
   write('╚════════════════════════════════════════╝'), nl, nl,
   write('Lancer la demo: ?- demo.'), nl, nl.
