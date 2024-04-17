function [gravity_constants, averages, corrected_averages] = get_gravity_chart_data(people)
    gravity_constants_raw = unique([people.planet_gravity]);
    gravity_constants = gravity_constants_raw(~eq(gravity_constants_raw, -1));
    averages = [];
    corrected_averages = [];

    for i = 1:length(gravity_constants)
        filtered_people = people([people.planet_gravity] == gravity_constants(i));
        filtered_people_corrected = filtered_people(~strcmp([filtered_people.name], "Jabba Desilijic Tiure"));
        averages(i) = mean([filtered_people.bmi]);
        corrected_averages(i) = mean([filtered_people_corrected.bmi]);
    end
end