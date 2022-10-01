select
    --from raw orders
    O.orderid,
    O.orderdate,
    O.shipdate,
    O.shipmode,
    O.ordersellingprice - O.ordercostprice as orderprofit,
    O.ordercostprice,
    O.ordersellingprice,
    --from raw customer
    C.customerid,
    C.customername,
    C.segment,
    C.country,
    --from raw produc
    P.productid,
    P.category,
    P.productname,
    P.subcategory
from {{ ref('raw_orders') }} as O
left join {{ ref('raw_customer') }} as C on C.customerid=O.customerid
left join {{ ref('raw_product') }} as P on P.productid=O.productid