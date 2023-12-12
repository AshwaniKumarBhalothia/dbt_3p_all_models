
{% macro current_date_at_timezone(timezone) -%}

(current_timestamp::timestamp at time zone {{ timezone }})::date

{%- endmacro %}
