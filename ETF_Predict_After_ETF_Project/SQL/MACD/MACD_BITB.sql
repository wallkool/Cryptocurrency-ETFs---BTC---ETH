-- Bước 1: Tạo bảng tạm thời để lưu giá trị EMA 12 và EMA 26
CREATE TEMPORARY TABLE temp_ema AS
SELECT 
    `date`,
    `Close`,
    `Open`,
    -- Tính EMA 12 ngày
    AVG(`Close`) OVER (ORDER BY `date` ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) AS ema_12,
    -- Tính EMA 26 ngày
    AVG(`Close`) OVER (ORDER BY `date` ROWS BETWEEN 25 PRECEDING AND CURRENT ROW) AS ema_26
FROM BITB;

-- Bước 2: Tạo bảng tạm thời để lưu giá trị MACD Line
CREATE TEMPORARY TABLE temp_macd AS
SELECT 
    `date`,
    ema_12,
    ema_26,
    -- Tính MACD Line
    ema_12 - ema_26 AS macd_line
FROM temp_ema;

-- Bước 3: Tạo bảng tạm thời để lưu giá trị Signal Line
CREATE TEMPORARY TABLE temp_signal AS
SELECT
    `date`,
    macd_line,
    -- Tính Signal Line
    AVG(macd_line) OVER (ORDER BY `date` ROWS BETWEEN 8 PRECEDING AND CURRENT ROW) AS signal_line
FROM temp_macd;

-- Bước 4: Tạo bảng tạm thời để lưu giá trị Histogram_MACD
CREATE TEMPORARY TABLE temp_histogram AS
SELECT
    `date`,
    macd_line,
    signal_line,
    -- Tính Histogram_MACD
    macd_line - signal_line AS histogram_macd
FROM temp_signal;

-- Bước 5: Thêm các cột MACD Line, Signal Line và Histogram_MACD vào bảng BITB
ALTER TABLE BITB ADD COLUMN MACD_Line DECIMAL(10, 4);
ALTER TABLE BITB ADD COLUMN Signal_Line DECIMAL(10, 4);
ALTER TABLE BITB ADD COLUMN Histogram_MACD DECIMAL(10, 4);

-- Bước 6: Cập nhật bảng BITB với các giá trị MACD Line, Signal Line và Histogram_MACD từ bảng tạm thời
UPDATE BITB AS a
JOIN temp_histogram AS t ON a.`date` = t.`date`
SET a.MACD_Line = t.macd_line,
    a.Signal_Line = t.signal_line,
    a.Histogram_MACD = t.histogram_macd;

-- Kiểm tra kết quả
SELECT 
    `date`,
    `Close`,
    MACD_Line,
    Signal_Line,
    Histogram_MACD
FROM BITB
ORDER BY `date`;

select *
from BITB