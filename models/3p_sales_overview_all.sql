{{config(
    materialized='table', 
    schema='id_analytics'
)}}

---get all active customers data from the all_clients table
{% set dbs_query %}
	SELECT DISTINCT
	database_name as db_name
	FROM id_iderive.dc_raw.all_client_database_tables_columns
	WHERE database_name like 'id_%'
	AND database_name not like 'id_iderive%'
	AND schema_name ='id_analytics'
	AND table_name = 't_amazon_3p_sales_overview'
	AND database_name NOT IN ('id_maxmuscle','id_vitacup')
{% endset %}

---convert result to dictionary
{%- set dbs_dict = dbt_utils.get_query_results_as_dict(dbs_query) -%}

---iterate over the dictionary
{% for client_db in dbs_dict['db_name'] %}

SELECT  
	date,
	account_name,
	channel,
	region,
	country_code,
	brand,
	reporting_category,
	reporting_subcategory,
	SUM(spend_budget_daily) AS spend_budget_daily_sum,
	SUM(revenue_budget_daily) AS revenue_budget_daily_sum,
	SUM(impressions_ppc) AS immersions_ppc_sum,
	SUM(clicks_ppc) AS clicks_ppc_sum,
	SUM(spend_ppc) AS spend_ppc_sum,
	SUM(sales_ppc) AS sales_ppc_sum,
	SUM(sales_ppc_7d) AS sales_ppc_7d_sum,
	SUM(impressions_dsp) AS impressions_dsp_sum,
	SUM(clicks_dsp) AS clicks_dsp_sum,
	SUM(spend_dsp) AS spend_dsp_sum,
	SUM(sales_dsp) AS sales_dsp_sum,
	SUM(impressions_ott) AS impressions_ott_sum,
	SUM(clicks_ott) AS clicks_ott_sum,
	SUM(spend_ott) AS spend_ott_sum,
	SUM(sales_ott) AS sales_ott_sum,
	SUM(ordered_revenue) AS ordered_revenue_sum,
	SUM(ordered_units) AS ordered_units_sum,
	SUM(page_views) AS page_views_sum,
	SUM(page_views_with_bb) AS page_views_with_bb_sum,
	SUM(pos_sales) AS pos_sales_sum,
	SUM(pos_units) AS pos_units_sum,
	SUM(amc_ntb_users) AS amc_ntb_users,
	SUM(amc_ntb_total_purchases) AS amc_ntb_total_purchases_sum,
	SUM(amc_ntb_total_quantity) AS amc_ntb_total_quantity_sum,
	SUM(amc_ntb_total_revenue) AS amc_ntb_total_revenue_sum,
	SUM(platform_ntb_total_orders) AS platform_ntb_total_orders_sum,
	SUM(platform_ntb_total_revenue) AS platform_ntb_total_revenue_sum,
	SUM(fba_ntb_customers) AS fba_ntb_customers_sum,
	SUM(fba_ntb_orders) AS fba_ntb_orders_sum,
	SUM(fba_ntb_qty) AS fba_ntb_qty_sum,
	SUM(fba_ntb_revenue) AS fba_ntb_revenue_sum,
	SUM(amc_total_eligible_impressions) AS amc_total_eligible_impressions_sum,
	SUM(sns_orders) AS sns_orders_sum,
	SUM(sns_revenue) AS sns_revenue_sum,
	SUM(promo_orders) AS promo_orders_sum,
	SUM(promo_revenue) AS promo_revenue_sum
FROM  {{ client_db }}.id_analytics.t_amazon_3p_sales_overview
{{dbt_utils.group_by(8)}}

{{"UNION ALL" if not loop.last}}

{% endfor %}