% ============================================================================
% CinemaSIMA - Règles pour Films (rules_films.pl)
% ============================================================================

:- dynamic user_preference/2.
:- dynamic avoid_actor/1.
:- dynamic avoid_director/1.
:- dynamic preferred_actor/1.
:- dynamic preferred_director/1.

% Compter les genres communs
count_common_genres([], _, 0).
count_common_genres([G|Rest], UserGenres, Count) :-
    member(G, UserGenres), !,
    count_common_genres(Rest, UserGenres, RestCount),
    Count is RestCount + 1.
count_common_genres([_|Rest], UserGenres, Count) :-
    count_common_genres(Rest, UserGenres, Count).

% Score de genres (max 60 points)
score_genres(FilmGenres, Score) :-
    user_preference(genres, UserGenres),
    count_common_genres(FilmGenres, UserGenres, CommonCount),
    Score is min(60, CommonCount * 20).

% Score de note (max 50 points)
score_note(FilmNote, Score) :-
    Score is FilmNote * 5.

% Bonus durée (10 points si OK)
bonus_duree(FilmDuree, Bonus) :-
    user_preference(max_duration, MaxDuree),
    FilmDuree =< MaxDuree, !,
    Bonus is 10.
bonus_duree(_, 0).

% Bonus année (10 points si OK)
bonus_annee(FilmAnnee, Bonus) :-
    user_preference(min_year, MinYear),
    FilmAnnee >= MinYear, !,
    Bonus is 10.
bonus_annee(_, 0).

% Vérification acteurs à éviter
has_avoided_actor(Acteurs) :-
    member(Actor, Acteurs),
    avoid_actor(Actor).

% Vérification réalisateurs à éviter
has_avoided_director(Director) :-
    avoid_director(Director).

% Bonus acteur préféré (5 points)
bonus_preferred_actor(Acteurs, Bonus) :-
    member(Actor, Acteurs),
    preferred_actor(Actor), !,
    Bonus is 5.
bonus_preferred_actor(_, 0).

% Bonus réalisateur préféré (5 points)
bonus_preferred_director(Director, Bonus) :-
    preferred_director(Director), !,
    Bonus is 5.
bonus_preferred_director(_, 0).

% Calcul du score total
calculate_film_score(FilmID, FinalScore, Explanation) :-
    film(FilmID, Titre, Genres, Realisateur, Acteurs, Annee, Duree, Note),
    \+ has_avoided_actor(Acteurs),
    \+ has_avoided_director(Realisateur),
    score_genres(Genres, ScoreGenres),
    score_note(Note, ScoreNote),
    bonus_duree(Duree, BonusDuree),
    bonus_annee(Annee, BonusAnnee),
    bonus_preferred_actor(Acteurs, BonusActor),
    bonus_preferred_director(Realisateur, BonusDirector),
    TotalScore is ScoreGenres + ScoreNote + BonusDuree + BonusAnnee + BonusActor + BonusDirector,
    FinalScore is min(100, TotalScore),
    format_explanation(Titre, Genres, ScoreGenres, Note, ScoreNote, 
                       Duree, BonusDuree, Annee, BonusAnnee,
                       Realisateur, BonusDirector, Acteurs, BonusActor, 
                       FinalScore, Explanation).

% Formatage de l'explication
format_explanation(Titre, Genres, ScoreGenres, Note, ScoreNote,
                   Duree, BonusDuree, Annee, BonusAnnee,
                   Realisateur, BonusDirector, Acteurs, BonusActor,
                   FinalScore, Explanation) :-
    user_preference(genres, UserGenres),
    count_common_genres(Genres, UserGenres, CommonCount),
    user_preference(max_duration, MaxDuree),
    user_preference(min_year, MinYear),
    findall(G, (member(G, Genres), member(G, UserGenres)), CommonGenres),
    atomic_list_concat(CommonGenres, ', ', GenresStr),
    format(atom(GenreExp), '~w genres communs : ~w (~w pts)', [CommonCount, GenresStr, ScoreGenres]),
    format(atom(NoteExp), 'Note : ~w/10 (~w pts)', [Note, ScoreNote]),
    (BonusDuree > 0 ->
        format(atom(DureeExp), 'Duree : ~w min OK (+10 pts)', [Duree])
    ;
        format(atom(DureeExp), 'Duree : ~w min > ~w min', [Duree, MaxDuree])
    ),
    (BonusAnnee > 0 ->
        format(atom(AnneeExp), 'Annee : ~w OK (+10 pts)', [Annee])
    ;
        format(atom(AnneeExp), 'Annee : ~w < ~w', [Annee, MinYear])
    ),
    (BonusDirector > 0 ->
        format(atom(DirectorExp), 'Realisateur prefere (+5 pts)')
    ;
        DirectorExp = ''
    ),
    (BonusActor > 0 ->
        format(atom(ActorExp), 'Acteur prefere (+5 pts)')
    ;
        ActorExp = ''
    ),
    findall(E, (member(E, [GenreExp, NoteExp, DureeExp, AnneeExp, DirectorExp, ActorExp]), E \= ''), ExpList),
    atomic_list_concat(ExpList, ' | ', Explanation).

% Recommander les N meilleurs films
recommend_films(N, Recommendations) :-
    findall(score(Score, FilmID, Titre, Genres, Realisateur, Acteurs, Annee, Duree, Note, Exp),
            (calculate_film_score(FilmID, Score, Exp),
             film(FilmID, Titre, Genres, Realisateur, Acteurs, Annee, Duree, Note)),
            AllScores),
    sort(0, @>=, AllScores, SortedScores),
    length(TopN, N),
    append(TopN, _, SortedScores),
    Recommendations = TopN.

% Affichage d'une recommandation
display_film_recommendation(score(Score, _ID, Titre, Genres, Realisateur, Acteurs, Annee, Duree, Note, Explanation)) :-
    format('~n========================================~n', []),
    format('Film: ~w (~w)~n', [Titre, Annee]),
    format('Score: ~w/100~n', [Score]),
    atomic_list_concat(Genres, ', ', GenresStr),
    format('Genres: ~w~n', [GenresStr]),
    format('Realisateur: ~w~n', [Realisateur]),
    format('Duree: ~w min | Note: ~w/10~n', [Duree, Note]),
    format('Explication: ~w~n', [Explanation]),
    format('========================================~n', []).

% Affichage de toutes les recommandations
display_all_film_recommendations([]).
display_all_film_recommendations([H|T]) :-
    display_film_recommendation(H),
    display_all_film_recommendations(T).
