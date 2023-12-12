{% macro data_type_cast(field, data_type) -%}

CAST({{ field }} as {{ data_type }})

{%- endmacro %}