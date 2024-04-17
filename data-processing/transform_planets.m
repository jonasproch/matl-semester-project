% Transforms gravity field to a simple number data type %
function transformed_planets = transform_planets(planets)
    transformed_planets = planets;

    for i = 1:length(transformed_planets)
        gravity_split = strsplit(transformed_planets(i).gravity, ' ');
        gravity_num = str2double(gravity_split(1));

        transformed_planets(i).gravity = gravity_num;
        transformed_planets(i).name = string(transformed_planets(i).name);
    end
end