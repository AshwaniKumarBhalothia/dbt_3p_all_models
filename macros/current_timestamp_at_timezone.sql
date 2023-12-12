
{% macro current_timestamp_at_timezone(timezone) -%}

(current_timestamp::timestamp at time zone {{ timezone }})

{%- endmacro %}
