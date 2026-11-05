
% Question 33: Dieting System Based on Disease

% Diet recommendations for diabetes
diet_for(diabetes, balanced_portion_meals).
diet_for(diabetes, high_fiber_foods).
diet_for(diabetes, unsweetened_drinks).

% Diet recommendations for hypertension
diet_for(hypertension, low_sodium_foods).
diet_for(hypertension, fruits_and_vegetables).
diet_for(hypertension, whole_grains).

% Diet recommendations for anemia
diet_for(anemia, iron_rich_foods).
diet_for(anemia, vitamin_c_rich_foods).
diet_for(anemia, iron_fortified_foods).

% Suggest diet based on disease
suggest_diet(Disease, Food) :-
    diet_for(Disease, Food).

% Display complete diet plan
diet_plan(Disease, Foods) :-
    findall(Food, suggest_diet(Disease, Food), Foods),
    Foods \= [].
