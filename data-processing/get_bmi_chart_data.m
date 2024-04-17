function [categories, occurrences] = get_bmi_chart_data(people)
    categories = ["Underweight" "Healthy" "Overweight" "Obese"];
    
    bmi_categories = [people.bmi_category];
    bmi_categories_categorical = categorical(bmi_categories, categories);
    occurrences = histcounts(bmi_categories_categorical);
end