
# Tháng nào trong từng quỹ có lợi nhuận tốt nhất


# ARKB
select *
from arkb;

select 
	`Open`, 
    `Close`, 
    (`Close`- `Open`)/`Open` as Daily_Change,
    substring(`date`,4,7) as Month_Year
from arkb
having Daily_Change
order by Daily_Change desc
;
# Tháng 3/2024

SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        `Open`, 
        `Close`, 
        (`Close` - `Open`) / `Open` AS Daily_Change,
        SUBSTRING(`date`, 4, 7) AS Month_Year
    FROM arkb
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change DESC;
# ARKB 2/2024 > 05/2024 > 03/2024 > 04/2024 > 01/2024


# BITB
SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        `Open`, 
        `Close`, 
        (`Close` - `Open`) / `Open` AS Daily_Change,
        SUBSTRING(`date`, 4, 7) AS Month_Year
    FROM bitb
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change DESC;
# BITB: 2/2024 > 05/2024 > 03/2024 > 04/2024 > 01/2024


# BRRR

SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        `Open`, 
        `Close`, 
        (`Close` - `Open`) / `Open` AS Daily_Change,
        SUBSTRING(`date`, 4, 7) AS Month_Year
    FROM brrr
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change DESC;
# BRRR: 2/2024 > 05/2024 > 03/2024 > 04/2024 > 01/2024


# BTC

SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        `Open`, 
        `Close`, 
        (`Close` - `Open`) / `Open` AS Daily_Change,
        SUBSTRING(`date`, 4, 7) AS Month_Year
    FROM btc
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change DESC
LIMIT 5
;
# BTC: 5/2017 > 8/2027 > 11/2017 > 5/2019 > 12/2017


SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        `Open`, 
        `Close`, 
        (`Close` - `Open`) / `Open` AS Daily_Change,
        SUBSTRING(`date`, 4, 7) AS Month_Year
    FROM btc
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change ASC
LIMIT 5
;
# BTC: 6/2022 < 11/2018 < 03/2018 < 05/2021 < 01/2018


# BTCO

SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        `Open`, 
        `Close`, 
        (`Close` - `Open`) / `Open` AS Daily_Change,
        SUBSTRING(`date`, 4, 7) AS Month_Year
    FROM btco
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change DESC;
# BTCO: 2/2024 > 05/2024 > 03/2024 > 04/2024 > 01/2024



#ETH

SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        `Open`, 
        `Close`, 
        (`Close` - `Open`) / `Open` AS Daily_Change,
        SUBSTRING(`date`, 4, 7) AS Month_Year
    FROM eth
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change DESC
LIMIT 5
;
# 12/2017 > 1/2021 > 4/2018 > 5/2019 > 7/2022

SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        `Open`, 
        `Close`, 
        (`Close` - `Open`) / `Open` AS Daily_Change,
        SUBSTRING(`date`, 4, 7) AS Month_Year
    FROM eth
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change ASC
LIMIT 5
;
# 3/2018 > 6/2022 > 11/2018 > 8/2018 > 3/2020


#FBTC
SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        `Open`, 
        `Close`, 
        (`Close` - `Open`) / `Open` AS Daily_Change,
        SUBSTRING(`date`, 4, 7) AS Month_Year
    FROM fbtc
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change
;
# 2/2024 > 5/2024 > 3/2024 > 1/2024 > 4/2024


#GBTC  (Lâu hơn những quỹ ETF Bth )

SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        `Open`, 
        `Close`, 
        (`Close` - `Open`) / `Open` AS Daily_Change,
        SUBSTRING(`date`, 4, 7) AS Month_Year
    FROM gbtc
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change DESC
LIMIT 5
;
# 5/2015 > 5/2017 > 8/2017 > 1/2023 > 6/2023

SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        `Open`, 
        `Close`, 
        (`Close` - `Open`) / `Open` AS Daily_Change,
        SUBSTRING(`date`, 4, 7) AS Month_Year
    FROM gbtc
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change ASC
LIMIT 5
;
# 12/2018 < 8/2015 < 1/2016 < 7/2016 < 3/2018


#HODL

SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        `Open`, 
        `Close`, 
        (`Close` - `Open`) / `Open` AS Daily_Change,
        SUBSTRING(`date`, 4, 7) AS Month_Year
    FROM hodl
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change DESC
;
# Giống các quỹ khác 


#IBIT
SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        `Open`, 
        `Close`, 
        (`Close` - `Open`) / `Open` AS Daily_Change,
        SUBSTRING(`date`, 4, 7) AS Month_Year
    FROM ibit
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change DESC
;