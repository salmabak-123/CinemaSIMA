% ============================================================================
% CinemaSIMA - Base de Faits (facts.pl)
% 40 Films + 40 Séries
% ============================================================================

% ============================================================================
% FILMS (40)
% Format: film(ID, Titre, Genres, Realisateur, Acteurs, Annee, Duree, Note)
% ============================================================================

% Action & Science-Fiction
film(1, 'Inception', [action, sci_fi, thriller], 'Christopher Nolan', 
     ['Leonardo DiCaprio', 'Tom Hardy', 'Ellen Page'], 2010, 148, 8.8).

film(2, 'The Matrix', [action, sci_fi], 'Wachowski Brothers', 
     ['Keanu Reeves', 'Laurence Fishburne', 'Carrie-Anne Moss'], 1999, 136, 8.7).

film(3, 'Interstellar', [sci_fi, drama, adventure], 'Christopher Nolan', 
     ['Matthew McConaughey', 'Anne Hathaway', 'Jessica Chastain'], 2014, 169, 8.6).

film(4, 'Mad Max: Fury Road', [action, adventure, sci_fi], 'George Miller', 
     ['Tom Hardy', 'Charlize Theron', 'Nicholas Hoult'], 2015, 120, 8.1).

film(5, 'Blade Runner 2049', [sci_fi, thriller, mystery], 'Denis Villeneuve', 
     ['Ryan Gosling', 'Harrison Ford', 'Ana de Armas'], 2017, 164, 8.0).

film(6, 'The Dark Knight', [action, crime, drama], 'Christopher Nolan',
     ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart'], 2008, 152, 9.0).

film(7, 'Avengers: Endgame', [action, adventure, sci_fi], 'Russo Brothers',
     ['Robert Downey Jr.', 'Chris Evans', 'Scarlett Johansson'], 2019, 181, 8.4).

film(8, 'Dune', [sci_fi, adventure, drama], 'Denis Villeneuve',
     ['Timothee Chalamet', 'Zendaya', 'Oscar Isaac'], 2021, 155, 8.0).

film(9, 'The Terminator', [action, sci_fi, thriller], 'James Cameron',
     ['Arnold Schwarzenegger', 'Linda Hamilton', 'Michael Biehn'], 1984, 107, 8.1).

film(10, 'John Wick', [action, thriller, crime], 'Chad Stahelski',
     ['Keanu Reeves', 'Michael Nyqvist', 'Alfie Allen'], 2014, 101, 7.4).

% Drame
film(11, 'The Shawshank Redemption', [drama], 'Frank Darabont', 
     ['Tim Robbins', 'Morgan Freeman'], 1994, 142, 9.3).

film(12, 'Forrest Gump', [drama, romance], 'Robert Zemeckis', 
     ['Tom Hanks', 'Robin Wright', 'Gary Sinise'], 1994, 142, 8.8).

film(13, 'Parasite', [thriller, drama, comedy], 'Bong Joon-ho', 
     ['Song Kang-ho', 'Lee Sun-kyun', 'Cho Yeo-jeong'], 2019, 132, 8.6).

film(14, 'The Godfather', [crime, drama], 'Francis Ford Coppola',
     ['Marlon Brando', 'Al Pacino', 'James Caan'], 1972, 175, 9.2).

film(15, '12 Years a Slave', [drama, history], 'Steve McQueen',
     ['Chiwetel Ejiofor', 'Michael Fassbender', 'Lupita Nyongo'], 2013, 134, 8.1).

film(16, 'Schindlers List', [drama, history], 'Steven Spielberg',
     ['Liam Neeson', 'Ben Kingsley', 'Ralph Fiennes'], 1993, 195, 9.0).

film(17, 'The Green Mile', [drama, crime, fantasy], 'Frank Darabont',
     ['Tom Hanks', 'Michael Clarke Duncan', 'David Morse'], 1999, 189, 8.6).

film(18, 'Good Will Hunting', [drama, romance], 'Gus Van Sant',
     ['Matt Damon', 'Robin Williams', 'Ben Affleck'], 1997, 126, 8.3).

% Comedie
film(19, 'The Grand Budapest Hotel', [comedy, drama, adventure], 'Wes Anderson', 
     ['Ralph Fiennes', 'Tony Revolori', 'Saoirse Ronan'], 2014, 99, 8.1).

film(20, 'Superbad', [comedy], 'Greg Mottola', 
     ['Jonah Hill', 'Michael Cera', 'Christopher Mintz-Plasse'], 2007, 113, 7.6).

film(21, 'The Big Lebowski', [comedy, crime], 'Joel Coen', 
     ['Jeff Bridges', 'John Goodman', 'Julianne Moore'], 1998, 117, 8.1).

film(22, 'Groundhog Day', [comedy, romance, fantasy], 'Harold Ramis',
     ['Bill Murray', 'Andie MacDowell', 'Chris Elliott'], 1993, 101, 8.0).

film(23, 'The Hangover', [comedy], 'Todd Phillips',
     ['Bradley Cooper', 'Zach Galifianakis', 'Ed Helms'], 2009, 100, 7.7).

film(24, 'Step Brothers', [comedy], 'Adam McKay',
     ['Will Ferrell', 'John C. Reilly', 'Mary Steenburgen'], 2008, 98, 6.9).

% Thriller & Mystere
film(25, 'Knives Out', [mystery, comedy, crime], 'Rian Johnson', 
     ['Daniel Craig', 'Ana de Armas', 'Chris Evans'], 2019, 130, 7.9).

film(26, 'The Silence of the Lambs', [thriller, crime, horror], 'Jonathan Demme', 
     ['Jodie Foster', 'Anthony Hopkins', 'Scott Glenn'], 1991, 118, 8.6).

film(27, 'Se7en', [crime, thriller, mystery], 'David Fincher',
     ['Morgan Freeman', 'Brad Pitt', 'Kevin Spacey'], 1995, 127, 8.6).

film(28, 'Shutter Island', [thriller, mystery], 'Martin Scorsese',
     ['Leonardo DiCaprio', 'Mark Ruffalo', 'Ben Kingsley'], 2010, 138, 8.2).

film(29, 'Gone Girl', [thriller, mystery, drama], 'David Fincher',
     ['Ben Affleck', 'Rosamund Pike', 'Neil Patrick Harris'], 2014, 149, 8.1).

film(30, 'Prisoners', [thriller, crime, drama], 'Denis Villeneuve',
     ['Hugh Jackman', 'Jake Gyllenhaal', 'Viola Davis'], 2013, 153, 8.1).

% Horreur
film(31, 'Get Out', [horror, thriller, mystery], 'Jordan Peele', 
     ['Daniel Kaluuya', 'Allison Williams', 'Bradley Whitford'], 2017, 104, 7.7).

film(32, 'Hereditary', [horror, drama, mystery], 'Ari Aster', 
     ['Toni Collette', 'Alex Wolff', 'Milly Shapiro'], 2018, 127, 7.3).

film(33, 'A Quiet Place', [horror, sci_fi, thriller], 'John Krasinski', 
     ['Emily Blunt', 'John Krasinski', 'Millicent Simmonds'], 2018, 90, 7.5).

film(34, 'The Conjuring', [horror, mystery, thriller], 'James Wan',
     ['Patrick Wilson', 'Vera Farmiga', 'Ron Livingston'], 2013, 112, 7.5).

film(35, 'It', [horror, thriller], 'Andy Muschietti',
     ['Bill Skarsgard', 'Jaeden Martell', 'Finn Wolfhard'], 2017, 135, 7.3).

% Animation & Famille
film(36, 'Spider-Man: Into the Spider-Verse', [animation, action, adventure], 'Bob Persichetti', 
     ['Shameik Moore', 'Jake Johnson', 'Hailee Steinfeld'], 2018, 117, 8.4).

film(37, 'Coco', [animation, family, fantasy], 'Lee Unkrich', 
     ['Anthony Gonzalez', 'Gael Garcia Bernal', 'Benjamin Bratt'], 2017, 105, 8.4).

film(38, 'Your Name', [animation, romance, fantasy], 'Makoto Shinkai', 
     ['Ryunosuke Kamiki', 'Mone Kamishiraishi'], 2016, 106, 8.4).

film(39, 'Toy Story 3', [animation, family, comedy], 'Lee Unkrich',
     ['Tom Hanks', 'Tim Allen', 'Joan Cusack'], 2010, 103, 8.3).

film(40, 'Inside Out', [animation, family, comedy], 'Pete Docter',
     ['Amy Poehler', 'Phyllis Smith', 'Richard Kind'], 2015, 95, 8.1).

% ============================================================================
% SERIES (40)
% Format: serie(ID, Titre, Genres, Createur, Acteurs, Annee, Duree_episode, Note, Saisons)
% ============================================================================

% Crime & Thriller
serie(1, 'Breaking Bad', [crime, drama, thriller], 'Vince Gilligan', 
      ['Bryan Cranston', 'Aaron Paul', 'Anna Gunn'], 2008, 47, 9.5, 5).

serie(2, 'True Detective', [crime, drama, mystery], 'Nic Pizzolatto', 
      ['Matthew McConaughey', 'Woody Harrelson', 'Colin Farrell'], 2014, 55, 8.9, 3).

serie(3, 'Mindhunter', [crime, drama, thriller], 'Joe Penhall',
      ['Jonathan Groff', 'Holt McCallany', 'Anna Torv'], 2017, 54, 8.6, 2).

serie(4, 'Ozark', [crime, drama, thriller], 'Bill Dubuque',
      ['Jason Bateman', 'Laura Linney', 'Sofia Hublitz'], 2017, 60, 8.5, 4).

serie(5, 'Narcos', [crime, drama, thriller], 'Chris Brancato',
      ['Pedro Pascal', 'Wagner Moura', 'Boyd Holbrook'], 2015, 49, 8.8, 3).

serie(6, 'Peaky Blinders', [crime, drama], 'Steven Knight',
      ['Cillian Murphy', 'Paul Anderson', 'Helen McCrory'], 2013, 58, 8.8, 6).

serie(7, 'Better Call Saul', [crime, drama], 'Vince Gilligan',
      ['Bob Odenkirk', 'Rhea Seehorn', 'Jonathan Banks'], 2015, 46, 9.0, 6).

serie(8, 'The Wire', [crime, drama, thriller], 'David Simon',
      ['Dominic West', 'Lance Reddick', 'Sonja Sohn'], 2002, 59, 9.3, 5).

% Science-Fiction & Fantastique
serie(9, 'Stranger Things', [sci_fi, horror, drama], 'Duffer Brothers', 
      ['Millie Bobby Brown', 'Finn Wolfhard', 'Winona Ryder'], 2016, 51, 8.7, 4).

serie(10, 'Black Mirror', [sci_fi, thriller, drama], 'Charlie Brooker', 
      ['Various'], 2011, 60, 8.7, 5).

serie(11, 'The Mandalorian', [sci_fi, action, adventure], 'Jon Favreau', 
      ['Pedro Pascal', 'Carl Weathers', 'Gina Carano'], 2019, 40, 8.7, 3).

serie(12, 'Westworld', [sci_fi, drama, mystery], 'Jonathan Nolan',
      ['Evan Rachel Wood', 'Jeffrey Wright', 'Thandiwe Newton'], 2016, 62, 8.5, 4).

serie(13, 'Dark', [sci_fi, thriller, mystery], 'Baran bo Odar',
      ['Louis Hofmann', 'Karoline Eichhorn', 'Lisa Vicari'], 2017, 60, 8.8, 3).

serie(14, 'The Expanse', [sci_fi, drama, mystery], 'Mark Fergus',
      ['Steven Strait', 'Cas Anvar', 'Dominique Tipper'], 2015, 43, 8.5, 6).

serie(15, 'Game of Thrones', [fantasy, drama, adventure], 'David Benioff', 
      ['Emilia Clarke', 'Kit Harington', 'Peter Dinklage'], 2011, 57, 9.2, 8).

serie(16, 'The Witcher', [fantasy, action, adventure], 'Lauren Schmidt',
      ['Henry Cavill', 'Anya Chalotra', 'Freya Allan'], 2019, 60, 8.0, 3).

serie(17, 'House of the Dragon', [fantasy, drama, adventure], 'Ryan Condal',
      ['Matt Smith', 'Emma DArcy', 'Olivia Cooke'], 2022, 63, 8.4, 2).

% Drame
serie(18, 'The Crown', [drama, history], 'Peter Morgan', 
      ['Claire Foy', 'Olivia Colman', 'Imelda Staunton'], 2016, 58, 8.6, 6).

serie(19, 'Succession', [drama], 'Jesse Armstrong', 
       ['Brian Cox', 'Jeremy Strong', 'Sarah Snook'], 2018, 60, 8.9, 4).

serie(20, 'Mad Men', [drama], 'Matthew Weiner',
       ['Jon Hamm', 'Elisabeth Moss', 'Vincent Kartheiser'], 2007, 47, 8.7, 7).

serie(21, 'The Handmaids Tale', [drama, sci_fi, thriller], 'Bruce Miller',
       ['Elisabeth Moss', 'Yvonne Strahovski', 'Joseph Fiennes'], 2017, 52, 8.4, 5).

serie(22, 'The Sopranos', [crime, drama], 'David Chase',
       ['James Gandolfini', 'Lorraine Bracco', 'Edie Falco'], 1999, 55, 9.2, 6).

serie(23, 'Chernobyl', [drama, history, thriller], 'Craig Mazin',
       ['Jared Harris', 'Stellan Skarsgard', 'Emily Watson'], 2019, 70, 9.3, 1).

serie(24, 'The Last of Us', [drama, action, adventure], 'Craig Mazin',
       ['Pedro Pascal', 'Bella Ramsey', 'Anna Torv'], 2023, 53, 8.7, 1).

% Comedie
serie(25, 'The Office', [comedy], 'Greg Daniels', 
      ['Steve Carell', 'Rainn Wilson', 'John Krasinski'], 2005, 22, 9.0, 9).

serie(26, 'Fleabag', [comedy, drama], 'Phoebe Waller-Bridge', 
      ['Phoebe Waller-Bridge', 'Sian Clifford', 'Olivia Colman'], 2016, 27, 8.7, 2).

serie(27, 'Brooklyn Nine-Nine', [comedy, crime], 'Dan Goor',
      ['Andy Samberg', 'Stephanie Beatriz', 'Terry Crews'], 2013, 22, 8.4, 8).

serie(28, 'Parks and Recreation', [comedy], 'Greg Daniels',
      ['Amy Poehler', 'Nick Offerman', 'Aubrey Plaza'], 2009, 22, 8.6, 7).

serie(29, 'Arrested Development', [comedy], 'Mitchell Hurwitz',
      ['Jason Bateman', 'Michael Cera', 'Portia de Rossi'], 2003, 22, 8.7, 5).

serie(30, 'The Good Place', [comedy, fantasy], 'Michael Schur',
      ['Kristen Bell', 'William Jackson Harper', 'Jameela Jamil'], 2016, 22, 8.2, 4).

serie(31, 'Ted Lasso', [comedy, drama], 'Bill Lawrence',
      ['Jason Sudeikis', 'Hannah Waddingham', 'Brett Goldstein'], 2020, 30, 8.8, 3).

serie(32, 'Community', [comedy], 'Dan Harmon',
      ['Joel McHale', 'Gillian Jacobs', 'Danny Pudi'], 2009, 25, 8.5, 6).

% Action & Aventure
serie(33, 'The Boys', [action, comedy, crime], 'Eric Kripke',
      ['Karl Urban', 'Jack Quaid', 'Antony Starr'], 2019, 60, 8.7, 4).

serie(34, 'Vikings', [action, adventure, drama], 'Michael Hirst',
      ['Katheryn Winnick', 'Gustaf Skarsgard', 'Alexander Ludwig'], 2013, 44, 8.5, 6).

serie(35, 'The Last Kingdom', [action, drama, history], 'Stephen Butchard',
      ['Alexander Dreymon', 'Emily Cox', 'David Dawson'], 2015, 60, 8.5, 5).

% Mystery & Thriller
serie(36, 'Sherlock', [crime, mystery, drama], 'Mark Gatiss',
      ['Benedict Cumberbatch', 'Martin Freeman', 'Una Stubbs'], 2010, 88, 9.1, 4).

serie(37, 'Money Heist', [crime, drama, mystery], 'Alex Pina',
      ['Alvaro Morte', 'Ursula Corbero', 'Itziar Ituno'], 2017, 70, 8.2, 5).

serie(38, 'The Sinner', [crime, drama, mystery], 'Derek Simonds',
      ['Bill Pullman', 'Jessica Biel', 'Dohn Norwood'], 2017, 45, 7.9, 4).

% Horreur
serie(39, 'The Haunting of Hill House', [horror, mystery, drama], 'Mike Flanagan',
      ['Michiel Huisman', 'Carla Gugino', 'Henry Thomas'], 2018, 56, 8.6, 1).

serie(40, 'The Walking Dead', [horror, drama, thriller], 'Frank Darabont',
      ['Andrew Lincoln', 'Norman Reedus', 'Melissa McBride'], 2010, 44, 8.1, 11).
