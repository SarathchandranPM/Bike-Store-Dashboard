create database if not exists bike_data;
select * from bike_share_yr_0;
select * from bike_share_yr_1;
select * from cost_table;

with bike_share_cte as
(
select * from bike_share_yr_0
union
select * from bike_share_yr_1
)
select 
bs.dteday, 
bs.season, 
bs.yr, 
bs.weekday, 
bs.hr, 
bs.rider_type, 
bs.riders, 
ct.price, 
ct.cogs, 
(bs.riders * ct.price) as revenue,
(bs.riders * ct.price) - cogs as profit
from bike_share_cte bs left join cost_table ct
on bs.yr = ct.yr;