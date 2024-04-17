function [with, without] = get_corrected_gravity_data(people)
    filtered_people = people([people.planet_gravity] == 1);
    filtered_people_corrected = filtered_people(~strcmp([filtered_people.name], "Jabba Desilijic Tiure"));
    with = mean([filtered_people.bmi]);
    without = mean([filtered_people_corrected.bmi]);
end