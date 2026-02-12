WITH subquery1 AS(
SELECT
    EXTRACT(MONTH FROM date_date) datemonth
    ,* EXCEPT (date_date)
FROM  {{ ref('finance_campaigns_day') }}
)    
    
SELECT
    datemonth
    ,ROUND(SUM(ads_margin),2) AS ads_margin
    ,ROUND(SUM(average_basket),2) AS average_basket
    ,ROUND(SUM(operational_margin),2) AS operational_margin
    ,ROUND(SUM(ads_cost),2) AS ads_cost
    ,SUM(impression) AS ads_impression
    ,SUM(click) AS ads_clicks
    ,SUM(total_qty_products_sold) AS quantity
    ,ROUND(SUM(total_revenue),2) AS revenue
    ,ROUND(SUM(total_purchase_cost),2) AS purchase_cost
    ,ROUND(SUM(margin),2) AS margin
    ,ROUND(SUM(shipping_fee),2) AS shipping_fee
    ,ROUND(SUM(log_cost),2) AS log_cost
    ,ROUND(SUM(ship_cost),2) AS ship_cost
FROM subquery1
GROUP BY datemonth
