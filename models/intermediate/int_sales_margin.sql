SELECT
    s.date_date
    ,s.products_id
    ,s.orders_id
    ,s.revenue
    ,s.quantity
    ,p.purchase_price
    -- calculation
    ,ROUND(s.revenue - (s.quantity * p.purchase_price),2) AS margin
    ,ROUND(s.quantity * p.purchase_price,2) AS purchase_cost 
FROM {{ ref('stg_raw__sales')}} s
LEFT JOIN {{ ref('stg_raw__product')}} p
ON p.products_id = s.products_id

