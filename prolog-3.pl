
% Question 28: Student-Teacher-Sub-Code Database

student_teacher_sub_code('Arun', 'Ravi', 'CS101').
student_teacher_sub_code('Priya', 'Meena', 'CS102').
student_teacher_sub_code('Kumar', 'Ravi', 'CS103').
student_teacher_sub_code('Divya', 'Meena', 'CS104').
student_teacher_sub_code('Rahul', 'Karthik', 'CS105').

% Find teacher of a student
teacher_of(Student, Teacher) :-
    student_teacher_sub_code(Student, Teacher, _).

% Find subject code of a student
subject_code_of(Student, Code) :-
    student_teacher_sub_code(Student, _, Code).

% Find students handled by a teacher
students_of_teacher(Teacher, Student) :-
    student_teacher_sub_code(Student, Teacher, _).

% Display complete student details
student_details(Student, Teacher, Code) :-
    student_teacher_sub_code(Student, Teacher, Code).
