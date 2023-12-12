
{% test col_exists(model, column_name) %}

with validation_errors as (

    select distinct 1 from information_schema.columns where NOT EXISTS (
    
        SELECT 1 FROM information_schema.columns where 
        table_name ='{{ model.name }}' 
        and column_name = '{{ column_name }}' 
    )

)

select *
from validation_errors

{% endtest %}
