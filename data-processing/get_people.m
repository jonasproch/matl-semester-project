function all_people = get_people()
    options = weboptions('Timeout', 30);
    base_url = 'https://swapi.dev/api/people/';
    all_people = [];

    next_url = base_url;

    while ~isempty(next_url)
        try
            response = webread(next_url, options);
            
            all_people = [all_people; response.results];

            next_url = response.next;
        catch ME
            warning(ME.identifier, '%s', ME.message);
            break;
        end
    end
end
