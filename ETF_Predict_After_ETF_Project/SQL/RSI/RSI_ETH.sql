# ETH
-- Thêm cột RSI vào bảng ETH nếu chưa tồn tại
ALTER TABLE ETH ADD COLUMN RSI DECIMAL(10, 4);

-- Tạo bảng tạm thời để lưu kết quả RSI tính toán
CREATE TEMPORARY TABLE temp_rsi1 AS
SELECT 
    `date`,
    `Close`,
    `Open`,
    (`Close` - `Open`) AS Price_Change,
    CASE 
        WHEN `Close` > `Open` THEN `Close` - `Open` 
        ELSE 0 
    END AS Gain,
    CASE 
        WHEN `Close` < `Open` THEN `Open` - `Close` 
        ELSE 0 
    END AS Loss,
    AVG(CASE WHEN `Close` > `Open` THEN `Close` - `Open` ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) AS Average_Gain,
    AVG(CASE WHEN `Close` < `Open` THEN `Open` - `Close` ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) AS Average_Loss,
    CASE 
        WHEN AVG(CASE WHEN `Close` < `Open` THEN `Open` - `Close` ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) = 0 THEN NULL
        ELSE AVG(CASE WHEN `Close` > `Open` THEN `Close` - `Open` ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) / AVG(CASE WHEN `Close` < `Open` THEN `Open` - `Close` ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW)
    END AS RS,
    CASE 
        WHEN AVG(CASE WHEN `Close` < `Open` THEN `Open` - `Close` ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) = 0 THEN 100
        ELSE 100 - (100 / (1 + (AVG(CASE WHEN `Close` > `Open` THEN `Close` - `Open` ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) / AVG(CASE WHEN `Close` < `Open` THEN `Open` - `Close` ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW))))
    END AS RSI
FROM 
(   
    SELECT 
        *,
        ROW_NUMBER() OVER (ORDER BY `date`) AS number
    FROM ETH
) AS numbered;

-- Cập nhật bảng ETH với giá trị RSI từ bảng tạm thời
UPDATE ETH AS a
JOIN temp_rsi1 AS t ON a.`date` = t.`date`
SET a.RSI = t.RSI;

-- Check những thời điểm quá mua (RSI > 70)
SELECT 
    `date`,
    `Adj close`,
    RSI
FROM ETH
WHERE RSI > 70
ORDER BY RSI DESC;

# 


-- Check những thời điểm quá bán (RSI < 30)
SELECT 
    `date`,
    `Adj close`,
    RSI
FROM ETH
WHERE RSI < 30
ORDER BY RSI ASC;

select * 
from ETH;