
% Question 29: Planets Database

% Facts: planet(Name, Position, Type)

planet(mercury, 1, terrestrial).
planet(venus, 2, terrestrial).
planet(earth, 3, terrestrial).
planet(mars, 4, terrestrial).
planet(jupiter, 5, gas_giant).
planet(saturn, 6, gas_giant).
planet(uranus, 7, ice_giant).
planet(neptune, 8, ice_giant).

% Find the position of a planet
planet_position(Name, Position) :-
    planet(Name, Position, _).

% Find the type of a planet
planet_type(Name, Type) :-
    planet(Name, _, Type).

% Find planets belonging to a particular type
planets_by_type(Type, Name) :-
    planet(Name, _, Type).

% Display complete planet information
planet_details(Name, Position, Type) :-
    planet(Name, Position, Type).
