
% Question 27: Database with Name and DOB

person_dob('Arun', date(15, 6, 2005)).
person_dob('Priya', date(20, 8, 2006)).
person_dob('Kumar', date(10, 3, 2004)).
person_dob('Divya', date(25, 12, 2005)).
person_dob('Rahul', date(5, 1, 2007)).

% Rule to retrieve date of birth
find_dob(Name, DOB) :-
    person_dob(Name, DOB).
