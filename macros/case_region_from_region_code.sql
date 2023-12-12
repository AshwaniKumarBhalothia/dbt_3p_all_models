
{% macro case_region_from_region_code(region_code) -%}

(case 
when {{ region_code }} = 'NA' then 'North America'
when {{ region_code }} = 'Eu' then 'Europe'
when {{ region_code }} = 'FE' then 'Far East'

else 'Unmapped' 

end)

{%- endmacro %}
