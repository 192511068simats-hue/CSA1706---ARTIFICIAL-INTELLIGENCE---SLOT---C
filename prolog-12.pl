
% Question 37: Medical Diagnosis System

% Patient symptoms
symptom(patient1, fever).
symptom(patient1, cough).
symptom(patient1, body_pain).
symptom(patient1, fatigue).

symptom(patient2, sneezing).
symptom(patient2, runny_nose).
symptom(patient2, sore_throat).

symptom(patient3, sneezing).
symptom(patient3, itchy_eyes).
symptom(patient3, runny_nose).

% Disease diagnosis rules
diagnosis(Patient, influenza) :-
    symptom(Patient, fever),
    symptom(Patient, cough),
    symptom(Patient, body_pain).

diagnosis(Patient, common_cold) :-
    symptom(Patient, sneezing),
    symptom(Patient, runny_nose),
    symptom(Patient, sore_throat).

diagnosis(Patient, allergy) :-
    symptom(Patient, sneezing),
    symptom(Patient, itchy_eyes),
    symptom(Patient, runny_nose),
    \+ symptom(Patient, fever).

% Display diagnosis
medical_diagnosis(Patient, Disease) :-
    diagnosis(Patient, Disease).
