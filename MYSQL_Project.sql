create database project_stock_market;
select * from stk_market;
################### KPI_1 Average Daily Trading Volume #################
create table kpi_1(ticker varchar(20), volume int);
select * from kpi_1;
insert into kpi_1 select Ticker, Volume from stk_market;
select ticker, round(avg(volume),2) as Volume_Avg from kpi_1 group by ticker order by avg(volume) desc;
select ticker, concat(format(avg(volume)/1000000,3), " M") as Volume_Avg from kpi_1 
group by ticker order by avg(volume) desc;

###################### KPI 2  Most Volatile Stocks ###############################################
create table kpi_2 (Ticker varchar(22), Beta float);
select * from kpi_2;
insert into kpi_2 select Ticker, Beta from stk_market;
select Ticker , max(beta), count(Beta)  from kpi_2 where beta = 1.5  group by  ticker order by count(beta) desc;

#################### KPI 3 Stocks with Highest Dividend and Lowest Dividend ######################
create table kpi_3 (Ticker varchar(22), `Dividend Amount` float);
select * from kpi_3;
insert into kpi_3 select Ticker, `Dividend Amount` from stk_market;
select Ticker , count(`Dividend Amount`) from kpi_3  where `Dividend Amount` = 1 group by ticker 
order by count(`Dividend Amount`) desc;

####################  KPI 4 Highest and Lowest P/E Ratios #######################
create table kpi_4 (Ticker varchar(22), `PE Ratio` float);
select * from kpi_4;
insert into kpi_4 select Ticker, `PE Ratio` from stk_market;
Select ticker , max(`PE Ratio`) , min(`PE Ratio`) from kpi_4 group by ticker;

##################### KPI 5 Stocks with Highest Market Cap #####################
create table kpi_5 (Ticker varchar(22), `Market Cap` float);
select * from kpi_5;
insert into kpi_5 select Ticker, `Market Cap` from stk_market;
Select ticker, sum(`Market Cap`) from kpi_5 group by ticker;
Select ticker, concat(format(sum(`Market Cap`)/1000000,2), " M") as Market_Cap from kpi_5 
group by ticker order by sum(`Market Cap`) desc; 

######## KPI 6 Stocks with Strong Buy Signals and stocks with Strong Selling Signal #######
create table kpi_6 (Ticker varchar(22), `RSI (14 days)` float, MACD float);
select * from kpi_6;
insert into kpi_6 select Ticker, `RSI (14 days)`, MACD from stk_market;
Select ticker , round(avg(`MACD`),2) as MACD_avg , round(avg(`RSI (14 days)`),2) as RSI_avg 
from kpi_6 group by ticker;
select ticker ,`RSI (14 days)`,MACD, CASE When MACD > 0 and `RSI (14 days)` < 40 Then "Buy" else "Sell"
end as Buy_OR_Sell from kpi_6;

