% Converts all important number fields to number data type and adds BMI field %
function transformed_people = transform_people(people, planets)
    transformed_people = people;

    for i = 1:length(transformed_people)
        height_num = str2double(transformed_people(i).height);
        mass_num = str2double(transformed_people(i).mass);
        bmi = mass_num / ((height_num / 100) ^ 2);
        planet_index = find(strcmp({planets.url}, transformed_people(i).homeworld), 1);
        
        if ~isempty(planet_index)
            planet = planets(planet_index);
            transformed_people(i).planet_gravity = planet.gravity;
            transformed_people(i).planet_name = planet.name;
        else
            transformed_people(i).planet_gravity = -1;
            transformed_people(i).planet_name = 'unknown';
        end

        transformed_people(i).name = string(transformed_people(i).name);
        transformed_people(i).height = height_num;
        transformed_people(i).mass = mass_num;
        transformed_people(i).bmi = bmi;
        transformed_people(i).bmi_category = get_bmi_category(bmi);
    end
end