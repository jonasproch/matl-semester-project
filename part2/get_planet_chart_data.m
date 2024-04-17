function [standard_planet_names, averages, counts] = get_planet_chart_data(people, planets)
    standard_planets = planets([planets.gravity] == 1);
    standard_planet_names = unique([standard_planets.name]);
    averages = zeros(1, length(standard_planet_names));
    counts = zeros(1, length(standard_planet_names));

    for i = 1:length(standard_planet_names)
        filtered_people = people(strcmp([people.planet_name], standard_planet_names(i)));
        planet_bmis = [filtered_people.bmi];
        averages(i) = mean(planet_bmis);
        counts(i) = length(planet_bmis);
    end
end