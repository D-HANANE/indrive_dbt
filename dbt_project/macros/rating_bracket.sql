{% macro rating_bracket(column_name) %}
case
    when {{ column_name }} is null then null
    when {{ column_name }} < 4.5 then 'moins de 4.5'
    when {{ column_name }} <= 4.8 then '4.5-4.8'
    else 'plus de 4.8'
end
{% endmacro %}
