
% PROLOG-18: BACKWARD CHAINING

% Patient symptoms (known facts)
symptom(patient1, fever).
symptom(patient1, headache).
symptom(patient1, joint_pain).
symptom(patient1, pain_behind_eyes).

% Rule R1: First condition for Dengue Fever
rule1(Patient) :-
    symptom(Patient, fever),
    symptom(Patient, rash),
    symptom(Patient, vomiting).

% Rule R2: Second condition for Dengue Fever
rule2(Patient) :-
    symptom(Patient, fever),
    symptom(Patient, headache),
    symptom(Patient, joint_pain).

% Goal: Is the patient suffering from Dengue Fever?
dengue_fever(Patient) :-

    write('Goal: Is the patient suffering from Dengue Fever?'),
    nl,

    write('Trying Rule R1...'),
    nl,

    (
        rule1(Patient)
        ->
        write('Rule R1 satisfied.'),
        nl
        ;
        write('Rule R1 failed.'),
        nl,

        write('Trying Rule R2...'),
        nl,

        rule2(Patient),

        write('All conditions of Rule R2 satisfied.'),
        nl
    ),

    write('Goal proved TRUE.'),
    nl,

    write('Patient has Dengue Fever.'),
    nl.
