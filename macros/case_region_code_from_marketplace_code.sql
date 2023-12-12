
{% macro case_region_code_from_marketplace_code(region_code) -%}

(case 
when {{ region_code }} = 'CA' then 'NA'
when {{ region_code }} = 'US' then 'NA'
when {{ region_code }} = 'MX' then 'NA'
when {{ region_code }} = 'BR' then 'NA'
when {{ region_code }} = 'ES' then 'EU'
when {{ region_code }} = 'UK' then 'EU'
when {{ region_code }} = 'FR' then 'EU'
when {{ region_code }} = 'NL' then 'EU'
when {{ region_code }} = 'DE' then 'EU'
when {{ region_code }} = 'IT' then 'EU'
when {{ region_code }} = 'SE' then 'EU'
when {{ region_code }} = 'PL' then 'EU'
when {{ region_code }} = 'EG' then 'EU'
when {{ region_code }} = 'TR' then 'EU'
when {{ region_code }} = 'SA' then 'EU'
when {{ region_code }} = 'AE' then 'EU'
when {{ region_code }} = 'IN' then 'EU'
when {{ region_code }} = 'BE' then 'EU'
when {{ region_code }} = 'SG' then 'FE'
when {{ region_code }} = 'AU' then 'FE'
when {{ region_code }} = 'JP' then 'FE'

else 'Unmapped' 

end)

{%- endmacro %}
