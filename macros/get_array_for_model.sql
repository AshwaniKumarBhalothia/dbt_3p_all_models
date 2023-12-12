
{% macro get_array_for_model(region_type) %}


{% set account_regions_query %}


    select client, account, lower(regexp_replace(account, ' ', '')) as account_identifier, region 
    from ( 
    select client, account, region, 
    row_number() over (partition by client, account, region) as rnk 
    from {{ source('Model_Inputs', 'account_region') }} 
    where region_type = {{ region_type }} and is_available = 1 
    ) 
    where rnk = 1 

{% endset %}

{% set account_regions_array = run_query(account_regions_query) %} 
        

{{ return(account_regions_array) }} 

{% endmacro %}
