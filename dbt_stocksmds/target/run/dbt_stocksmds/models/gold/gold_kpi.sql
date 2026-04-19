
  
    

create or replace transient table STOCKSMDS.COMMON.gold_kpi
    
    
    
    as (
select
    symbol,
    current_price,
    change_amount,
    change_percent
from (
    select *,
           row_number() over (partition by symbol order by fetched_at desc) as rn
    from STOCKSMDS.COMMON.silver_clean_stocks_quotes
) t
where rn = 1
    )
;


  