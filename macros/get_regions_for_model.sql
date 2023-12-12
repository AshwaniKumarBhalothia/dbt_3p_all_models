{% macro get_regions_for_model() %}

    {% set regions = [] %}
        
    {% if var('dbt_region_usa') %} 
    {% set _ = regions.append('usa') %}
    {% endif %}

    {% if var('dbt_region_uk') %} 
    {% set _ = regions.append('uk') %}
    {% endif %}

    {% if var('dbt_region_canada') %} 
    {% set _ = regions.append('canada') %}
    {% endif %}

    {% if var('dbt_region_australia') %} 
    {% set _ = regions.append('australia') %}
    {% endif %}


    {% if var('dbt_region_france') %} 
    {% set _ = regions.append('france') %}
    {% endif %}


    {% if var('dbt_region_germany') %} 
    {% set _ = regions.append('germany') %}
    {% endif %}


    {% if var('dbt_region_italy') %} 
    {% set _ = regions.append('italy') %}
    {% endif %}

    {% if var('dbt_region_netherlands') %} 
    {% set _ = regions.append('netherlands') %}
    {% endif %}

    {% if var('dbt_region_poland') %} 
    {% set _ = regions.append('poland') %}
    {% endif %}

    {% if var('dbt_region_spain') %} 
    {% set _ = regions.append('spain') %}
    {% endif %}

    {{ return(regions) }}

{% endmacro %}
