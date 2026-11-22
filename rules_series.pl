% ============================================================================
% CinemaSIMA - Règles pour Séries (rules_series.pl)
% ============================================================================

% Mêmes règles que films mais pour séries

count_common_genres([], _, 0).
count_common_genres([G|Rest], UserGenres, Count) :-
    member(G, UserGenres), !,
    count_common_genres(Rest, UserGenres, RestCount),
    Count is RestCount + 1.
count_common_genres([_|Rest], UserGenres, Count) :-
    count_common_genres(Rest, UserGenres, Count).

score_genres(SerieGenres, Score) :-
    user_preference(genres, UserGenres),
    count_common_genres(SerieGenres, UserGenres, CommonCount),
    Score is min(60, CommonCount * 20).

score_note(SerieNote, Score) :-
    Score is SerieNote * 5.

bonus_duree(EpisodeDuree, Bonus) :-
    user_preference(max_duration, MaxDuree),
    EpisodeDuree =< MaxDuree, !,
    Bonus is 10.
bonus_duree(_, 0).

bonus_annee(SerieAnnee, Bonus) :-
    user_preference(min_year, MinYear),
    SerieAnnee >= MinYear, !,
    Bonus is 10.
bonus_annee(_, 0).

has_avoided_actor(Acteurs) :-
    member(Actor, Acteurs),
    avoid_actor(Actor).

has_avoided_director(Director) :-
    avoid_director(Director).

bonus_preferred_actor(Acteurs, Bonus) :-
    member(Actor, Acteurs),
    preferred_actor(Actor), !,
    Bonus is 5.
bonus_preferred_actor(_, 0).

bonus_preferred_director(Director, Bonus) :-
    preferred_director(Director), !,
    Bonus is 5.
bonus_preferred_director(_, 0).

calculate_serie_score(SerieID, FinalScore, Explanation) :-
    serie(SerieID, Titre, Genres, Createur, Acteurs, Annee, DureeEpisode, Note, Saisons),
    \+ has_avoided_actor(Acteurs),
    \+ has_avoided_director(Createur),
    score_genres(Genres, ScoreGenres),
    score_note(Note, ScoreNote),
    bonus_duree(DureeEpisode, BonusDuree),
    bonus_annee(Annee, BonusAnnee),
    bonus_preferred_actor(Acteurs, BonusActor),
    bonus_preferred_director(Createur, BonusDirector),
    TotalScore is ScoreGenres + ScoreNote + BonusDuree + BonusAnnee + BonusActor + BonusDirector,
    FinalScore is min(100, TotalScore),
    format_explanation(Titre, Genres, ScoreGenres, Note, ScoreNote,
                       DureeEpisode, BonusDuree, Annee, BonusAnnee,
                       Createur, BonusDirector, Acteurs, BonusActor,
                       Saisons, FinalScore, Explanation).

format_explanation(Titre, Genres, ScoreGenres, Note, ScoreNote,
                   DureeEpisode, BonusDuree, Annee, BonusAnnee,
                   Createur, BonusDirector, Acteurs, BonusActor, Saisons,
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
        format(atom(DureeExp), 'Episode : ~w min OK (+10 pts)', [DureeEpisode])
    ;
        format(atom(DureeExp), 'Episode : ~w min > ~w min', [DureeEpisode, MaxDuree])
    ),
    (BonusAnnee > 0 ->
        format(atom(AnneeExp), 'Annee : ~w OK (+10 pts)', [Annee])
    ;
        format(atom(AnneeExp), 'Annee : ~w < ~w', [Annee, MinYear])
    ),
    (BonusDirector > 0 ->
        format(atom(DirectorExp), 'Createur prefere (+5 pts)')
    ;
        DirectorExp = ''
    ),
    (BonusActor > 0 ->
        format(atom(ActorExp), 'Acteur prefere (+5 pts)')
    ;
        ActorExp = ''
    ),
    format(atom(SaisonsExp), '~w saisons', [Saisons]),
    findall(E, (member(E, [GenreExp, NoteExp, DureeExp, AnneeExp, DirectorExp, ActorExp, SaisonsExp]), E \= ''), ExpList),
    atomic_list_concat(ExpList, ' | ', Explanation).

recommend_series(N, Recommendations) :-
    findall(score(Score, SerieID, Titre, Genres, Createur, Acteurs, Annee, DureeEpisode, Note, Saisons, Exp),
            (calculate_serie_score(SerieID, Score, Exp),
             serie(SerieID, Titre, Genres, Createur, Acteurs, Annee, DureeEpisode, Note, Saisons)),
            AllScores),
    sort(0, @>=, AllScores, SortedScores),
    length(TopN, N),
    append(TopN, _, SortedScores),
    Recommendations = TopN.

display_serie_recommendation(score(Score, _ID, Titre, Genres, Createur, Acteurs, Annee, DureeEpisode, Note, Saisons, Explanation)) :-
    format('~n========================================~n', []),
    format('Serie: ~w (~w)~n', [Titre, Annee]),
    format('Score: ~w/100~n', [Score]),
    atomic_list_concat(Genres, ', ', GenresStr),
    format('Genres: ~w~n', [GenresStr]),
    format('Createur: ~w~n', [Createur]),
    format('Saisons: ~w | Episode: ~w min | Note: ~w/10~n', [Saisons, DureeEpisode, Note]),
    format('Explication: ~w~n', [Explanation]),
    format('========================================~n', []).

display_all_serie_recommendations([]).
display_all_serie_recommendations([H|T]) :-
    display_serie_recommendation(H),
    display_all_serie_recommendations(T).
