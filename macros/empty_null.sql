{% macro empty_null(data_type = text) -%}

NULL::{{ data_type }}

{%- endmacro %}