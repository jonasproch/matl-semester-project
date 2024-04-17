clc
clear
close all

% Fetch people and planets data %
all_people = get_people();
all_planets = get_planets();

% Filter planets and people data %
filtered_people = all_people(~strcmp({all_people.height}, 'unknown') & ~strcmp({all_people.mass}, 'unknown'));
filtered_planets = all_planets(~strcmp({all_planets.gravity}, 'unknown') & ~strcmp({all_planets.gravity}, 'N/A'));

% Transform planets and people data and add BMI %
transformed_planets = transform_planets(filtered_planets);
transformed_people = transform_people(filtered_people, transformed_planets);

% Show BMI bar chart %
[categories, occurrences] = get_bmi_chart_data(transformed_people);

figure
bar(categories, occurrences)
xlabel("Categories")
ylabel("Occurrences")
title("BMI category counts")

% Show average BMI per gravity constant %
[constants, gravity_averages, gravity_averages_corrected] = get_gravity_chart_data(transformed_people);

figure
bar(constants, gravity_averages)
xlabel("Gravity")
ylabel("Average BMI")
title("BMI means across different homeworld gravity strengths")

% Show average BMI per planet with standard gravity %
[standard_planets, planet_averages, planet_counts] = get_planet_chart_data(transformed_people, transformed_planets);
data_matrix = [planet_averages' planet_counts'];

figure
hold on
bar(data_matrix)
xticks(1:length(standard_planets))
xticklabels(standard_planets)
title("BMI means across different planets")
legend({'Averages', 'Counts'})

% Show average BMI in standard gravity with and without Jabba %
[average_bmi, corrected_bmi] = get_corrected_gravity_data(transformed_people);

figure
bar(["With Jabba", "Without Jabba"], [average_bmi, corrected_bmi])
title("Average BMI in standard gravity with and without Jabba")
ylabel("Average BMI")

% Show avearage BMI per planet with and without Jabba %
figure
hold on
bar(constants, gravity_averages)
bar(constants, gravity_averages_corrected)
xlabel("Gravity")
ylabel("Average BMI")
title("Comparason BMI means across different homeworld gravity strengths with and without Jabba")
legend({'With Jabba', 'Without Jabba'})

