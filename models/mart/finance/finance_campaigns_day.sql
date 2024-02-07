select
    *,
    --Ads margin = operational margin - ads cost
    finance_day.operational_margin - campaign_day.ads_cost  as ads_margin,
        
from {{ref('int_campaigns_day')}} as campaign_day 
join {{ref('finance_days')}} as finance_day
using (date_date)