ALTER TABLE arkb
DROP COLUMN RSI;

SELECT *
FROM ARKB;


CREATE TEMPORARY TABLE temp_rsi_arkb AS
SELECT 
    `date`,
    `Close`,
    `Open`,
    (`Close` - `Open`) AS Price_Change_arkb,
    CASE 
        WHEN `Close` > `Open` THEN `Close` - `Open` 
        ELSE 0 
    END AS Gain_arkb,
    CASE 
        WHEN `Close` < `Open` THEN `Open` - `Close` 
        ELSE 0 
    END AS Loss_arkb,
    AVG(CASE WHEN `Close` > `Open` THEN `Close` - `Open` ELSE 0 END) OVER (ORDER BY number_arkb ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) AS Average_Gain_arkb,
    AVG(CASE WHEN `Close` < `Open` THEN `Open` - `Close` ELSE 0 END) OVER (ORDER BY number_arkb ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) AS Average_Loss_arkb,
    CASE 
        WHEN AVG(CASE WHEN `Close` < `Open` THEN `Open` - `Close` ELSE 0 END) OVER (ORDER BY number_arkb ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) = 0 THEN NULL
        ELSE AVG(CASE WHEN `Close` > `Open` THEN `Close` - `Open` ELSE 0 END) OVER (ORDER BY number_arkb ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) / AVG(CASE WHEN `Close` < `Open` THEN `Open` - `Close` ELSE 0 END) OVER (ORDER BY number_arkb ROWS BETWEEN 13 PRECEDING AND CURRENT ROW)
    END AS RS_arkb,
    CASE 
        WHEN AVG(CASE WHEN `Close` < `Open` THEN `Open` - `Close` ELSE 0 END) OVER (ORDER BY number_arkb ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) = 0 THEN 100
        ELSE 100 - (100 / (1 + (AVG(CASE WHEN `Close` > `Open` THEN `Close` - `Open` ELSE 0 END) OVER (ORDER BY number_arkb ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) / AVG(CASE WHEN `Close` < `Open` THEN `Open` - `Close` ELSE 0 END) OVER (ORDER BY number_arkb ROWS BETWEEN 13 PRECEDING AND CURRENT ROW))))
    END AS RSI_arkb
FROM 
(   
    SELECT 
        *,
        ROW_NUMBER() OVER (ORDER BY `date`) AS number_arkb
    FROM arkb
) AS numbered_arkb;


UPDATE arkb AS a
JOIN temp_rsi_arkb AS t ON a.`date` = t.`date`
SET a.RSI = t.RSI_arkb;

SELECT `Date`,
       `Adj close`,
       RSI
FROM arkb
WHERE RSI > 70
ORDER BY RSI DESC;

SELECT `Date`,
       `Adj close`,
       RSI
FROM arkb
WHERE RSI < 30
ORDER BY RSI ASC;
