
{% macro data_update_recency_check(dashboard, datasource, days_lag, metric, date_field, table_name) %}


{% set delete_query %}

delete from id_dbt_audit_logs.t_data_recency_check 
where dashboard = '{{ dashboard }}' and datasource = '{{ datasource }}' 

{% endset %}


{% set insert_query %}

insert into id_dbt_audit_logs.t_data_recency_check (dashboard, datasource, days_lag, max_timestamp) 
select 
'{{ dashboard }}' as  dashboard, 
'{{ datasource }}' as datasource, 
{{ days_lag }} as days_lag, 
max(case when {{ metric }} != 0 then {{ date_field }}::timestamp end) as max_timestamp 
from {{ table_name }} 
group by 1, 2, 3 

{% endset %}

{% do run_query(delete_query) %} 

{% do run_query(insert_query) %} 

{% endmacro %}
