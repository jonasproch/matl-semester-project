% Returns the correct class based on input bmi %
function category = get_bmi_category(bmi)
    if bmi < 18.5
        category = "Underweight";
    elseif bmi < 25
        category = "Healthy";
    elseif bmi < 30
        category = "Overweight";
    else
        category = "Obese";
    end
end