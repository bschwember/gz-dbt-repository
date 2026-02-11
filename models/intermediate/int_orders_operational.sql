SELECT
    m.orders_id
    ,m.date_date
    ,ROUND(m.margin+s.shipping_fee-s.logcost-s.ship_cost,2) AS operational_margin
    ,m.quantity
FROM {{ ref('int_orders_margin')}} m
LEFT JOIN {{ ref('stg_raw__ship')}} s
USING (orders_id)