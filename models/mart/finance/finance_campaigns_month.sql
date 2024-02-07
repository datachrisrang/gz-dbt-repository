select
    format_date('%Y - %m', date_date) as meses,
    round(sum(ads_margin),2) as margin,
    round(sum(average_basket),2) as average_basket,
    round(sum(operational_margin),2) as operational_margin
from {{ref('finance_campaigns_day')}}
group by meses

