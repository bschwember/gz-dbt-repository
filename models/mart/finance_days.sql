SELECT
    date_date
    ,COUNT(orders_id) AS total_number_of_transactions
    ,ROUND(SUM(revenue),2) AS total_revenue
    ,ROUND(SUM(revenue)/COUNT(orders_id),2) AS average_basket
    ,ROUND(SUM(margin),2) AS operational_margin
    ,ROUND(SUM(purchase_cost),2) AS total_purchase_cost
    ,ROUND(SUM(shipping_fee),2) AS total_shipping_fees
    ,ROUND(SUM(logcost),2) AS total_logcost
    ,SUM(quantity) AS total_qty_products_sold
FROM {{ ref('int_orders_operational')}}
GROUP BY
    date_date
