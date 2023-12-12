
{% macro get_key_for_amazon_product_master() %}


{% set amazonads_product_identifier_query %}


    SELECT distinct 
    (case when identifier_type = 'Amazon Child ASIN' then 'asin' else 'sku' end) as identifier_type 
    FROM {{ ref('Map_Product_Mapping') }} 
    where channel = 'Amazon' 
    limit 1 
    

{% endset %}

{% set amazonads_product_identifier = dbt_utils.get_single_value(amazonads_product_identifier_query, default="sku") %} 
        

{{ return(amazonads_product_identifier) }} 

{% endmacro %}
