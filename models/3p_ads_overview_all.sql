{{config(
    materialized='table', 
    schema='id_analytics'
)}}

---get  active customers database
{% set dbs_query %}
	SELECT DISTINCT
	database_name as db_name
	FROM id_iderive.dc_raw.all_client_database_tables_columns
	WHERE database_name like 'id_%'
	AND database_name not like 'id_iderive%'
	AND schema_name ='id_analytics'
	AND table_name = 't_amazon_3p_ads_overview'
	AND database_name NOT IN ('id_maxmuscle','id_vitacup')
{% endset %}

---convert result to dictionary
{%- set dbs_dict = dbt_utils.get_query_results_as_dict(dbs_query) -%}

---iterate over the dictionary
{% for client_db in dbs_dict['db_name'] %}

SELECT 
		date,
		CAST(account_name AS VARCHAR(30)) AS account_name,
		channel,
		region,
		country_code,
		brand,
		reporting_category,
		reporting_subcategory,
		SUM(total_fees_per_unit) AS total_fees_per_unit_sum,
		SUM(amazon_fee_per_unit) AS amazon_fee_per_unit_sum,
		SUM(shipping_fee_per_unit) AS shipping_fee_per_unit_sum,
		SUM(amazon_fee) AS amazon_fee_sum,
		SUM(ship_prep_fee) AS ship_prep_fee_sum,
		SUM(discount_per_unit) AS discount_per_unit_sum, 
		SUM(cogs) AS cogs_sum,
		SUM(dist_camp_revenue) AS dist_camp_revenue,
		SUM(dist_camp_orders) AS dist_camp_orders,
		SUM(dist_camp_qty) AS dist_camp_qty, 
		---REMOVED BLOCK WITH LTV BECAUSE IT IS NON-ADDITIVE
		---SUM(ltv_365) AS ltv_365_sum, --non-additive
		---SUM(ltv_365_excluding_first_order) AS ltv_365_excluding_first_order_sum,
		---SUM(ltv_730) AS ltv_730_sum,--non-additive
		---SUM(ltv_730_excluding_first_order) AS ltv_730_excluding_first_order_sum,
		SUM(account_cm_pct) AS account_cm_pct_sum,
		SUM(account_ntb_pct) AS account_ntb_pct_sum,
		SUM(account_media_ntb_pct) AS account_media_ntb_pct_sum,
		SUM(total_customers) AS total_customers_sum,
		SUM(total_revenue_excluding_first_order) AS total_revenue_excluding_first_order_sum,
		SUM(total_customers_excluding_first_order) AS total_customers_excluding_first_order_sum,
		SUM(spend) AS spend_sum,
		SUM(impressions) AS impressions_sum,
		SUM(clicks) AS clicks_sum,
		SUM(attributedconversions14d) AS attributedconversions14d_sum,
		SUM(attributedsales7d) AS attributedsales7d_sum,
		SUM(attributedsales14d) AS attributedsales14d_sum,
		SUM(attributedunitsordered14d) AS attributedunitsordered14d_sum,
		SUM(units_ordered) AS units_ordered_sum,
		SUM(conversions) AS conversions_sum,
		SUM(revenue) AS revenue_sum,
		SUM(sales_dsp) AS sales_dsp_sum,
		SUM(calc_ntb_orders) AS calc_ntb_orders_sum,
		SUM(calc_ntb_units_orders) AS calc_ntb_units_orders_sum,
		SUM(total_purchases) AS total_purchases_sum,
		SUM(dist_camp_item_promotion_discount) AS dist_camp_item_promotion_discount_sum
FROM  {{ client_db }}.id_analytics.t_amazon_3p_ads_overview
{{dbt_utils.group_by(8)}}

{{"UNION ALL" if not loop.last}}

{% endfor %}