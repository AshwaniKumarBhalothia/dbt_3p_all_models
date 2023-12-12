
{% macro case_marketplace_from_marketplace_code(region_code) -%}

(case 
when {{ region_code }} = 'CA' then 'Canada'
when {{ region_code }} = 'US' then 'United States'
when {{ region_code }} = 'MX' then 'Mexico'
when {{ region_code }} = 'BR' then 'Brazil'
when {{ region_code }} = 'ES' then 'Spain'
when {{ region_code }} = 'UK' then 'UK'
when {{ region_code }} = 'FR' then 'France'
when {{ region_code }} = 'NL' then 'Netherlands'
when {{ region_code }} = 'DE' then 'Germany'
when {{ region_code }} = 'IT' then 'Italy'
when {{ region_code }} = 'SE' then 'Sweden'
when {{ region_code }} = 'PL' then 'Poland'
when {{ region_code }} = 'EG' then 'Egypt'
when {{ region_code }} = 'TR' then 'Turkey'
when {{ region_code }} = 'SA' then 'Saudi Arabia'
when {{ region_code }} = 'AE' then 'U.A.E.'
when {{ region_code }} = 'IN' then 'India'
when {{ region_code }} = 'BE' then 'Belgium'
when {{ region_code }} = 'SG' then 'Singapore'
when {{ region_code }} = 'AU' then 'Australia'
when {{ region_code }} = 'JP' then 'Japan' 

else 'Unmapped' 

end)

{%- endmacro %}
