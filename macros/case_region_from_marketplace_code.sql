
{% macro case_region_from_marketplace_code(marketplace_code) -%}

(case 
when {{ marketplace_code }} = 'CA' then 'North America'
when {{ marketplace_code }} = 'US' then 'North America'
when {{ marketplace_code }} = 'MX' then 'North America'
when {{ marketplace_code }} = 'BR' then 'North America'
when {{ marketplace_code }} = 'ES' then 'Europe'
when {{ marketplace_code }} = 'UK' then 'Europe'
when {{ marketplace_code }} = 'FR' then 'Europe'
when {{ marketplace_code }} = 'NL' then 'Europe'
when {{ marketplace_code }} = 'DE' then 'Europe'
when {{ marketplace_code }} = 'IT' then 'Europe'
when {{ marketplace_code }} = 'SE' then 'Europe'
when {{ marketplace_code }} = 'PL' then 'Europe'
when {{ marketplace_code }} = 'EG' then 'Europe'
when {{ marketplace_code }} = 'TR' then 'Europe'
when {{ marketplace_code }} = 'SA' then 'Europe'
when {{ marketplace_code }} = 'AE' then 'Europe'
when {{ marketplace_code }} = 'IN' then 'Europe'
when {{ marketplace_code }} = 'BE' then 'Europe'
when {{ marketplace_code }} = 'SG' then 'Far East'
when {{ marketplace_code }} = 'AU' then 'Far East'
when {{ marketplace_code }} = 'JP' then 'Far East'
else 'Unmapped' 

end)

{%- endmacro %}
