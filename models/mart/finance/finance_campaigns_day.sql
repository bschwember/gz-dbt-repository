SELECT
    f.date_date
    ,ROUND(f.operational_margin - c.ads_cost,2) AS ads_margin
    ,f.average_basket
    ,f.operational_margin
    ,c.ads_cost
    ,c.impression
    ,c.click
    ,f.total_qty_products_sold
    ,f.total_revenue
    ,f.total_purchase_cost
    ,ROUND(f.total_revenue - f.total_purchase_cost,2) AS margin
    ,f.total_shipping_fees AS shipping_fee
    ,f.total_logcost AS log_cost
    ,f.ship_cost AS ship_cost
FROM {{ ref('finance_days') }} f
LEFT JOIN {{ ref('int_campaigns_day') }} c
USING (date_date)
ORDER BY date_date ASC