# Investment for Cryptocurrency ETFs and Price Prediction

> ### *Hello Guys! My name is Wallkool, and this is one of my cherished personal projects in the Data World.*
>
> *A little bit about myself: I graduated with highest distinction in Financial Technology (Fintech) from the National Economics University (NEU). This project marks one of my first steps into the Data World. I hope you enjoy exploring it!*
---
## 
<div style="border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
  <span style="color: red; font-size: 24px; font-weight: bold; font-family: Arial, sans-serif;">General Context</span>
</div>
<br>



In the context of the approval of the Bitcoin ETF Fund in January 2024, both funds and Bitcoin have seen a 130% increase in value. Recently, in May 2024, the Ethereum ETF has also been approved. The cryptocurrency landscape has never been more dynamic, with traditional funds and capital flows rushing to fill the market. Understanding this, my personal project aims to help individuals assess the health of these assets, measure and visualize the results, and thus assist you in making the most suitable choices for yourselves.

Given the landmark approval of the Bitcoin ETF Fund in January 2024, we've witnessed an astonishing 100% surge in the value of both Bitcoin and related investment funds. This milestone was followed by another significant event in May 2024, with the approval of the Ethereum ETF. The cryptocurrency market has never been more vibrant and bustling, as traditional funds and capital are eagerly pouring into the space, seeking opportunities and growth.'

---

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image.png" alt="ETF Project" width="800"/>

---

Recognizing the unprecedented activity and the growing interest in the crypto market, I have embarked on a personal project designed to aid individuals in navigating this complex landscape. The project's core objective is to provide a comprehensive assessment of the health of major cryptocurrency assets, specifically focusing on Bitcoin and Ethereum, which are currently the most influential and widely discussed.

Through meticulous data collection and analysis, this project aims to measure key indicators that reflect the performance and stability of these assets. By utilizing advanced data visualization techniques, we will present the findings in a clear and accessible manner, allowing users to gain insightful and actionable information. This approach will empower individuals to make informed decisions based on the latest market trends and data-driven insights.

In essence, my project will serve as a valuable tool for anyone looking to understand the current state of the cryptocurrency market. Whether you are a seasoned investor or a newcomer to the crypto world, having access to reliable and up-to-date information is crucial. By assessing the health of Bitcoin and Ethereum, measuring their performance, and visualizing the results, we aim to provide a robust foundation for making the most suitable investment choices tailored to your personal needs and goals.

Stay tuned for detailed analyses, visual reports, and ongoing updates as we delve into the exciting and ever-evolving world of cryptocurrencies. Together, we can navigate this vibrant market and uncover the opportunities it holds.

---

# 1. Data Sources and Collection

---

For our project, we source our data from  Investing.com is a comprehensive financial platform that provides a wide range of market data, including real-time quotes, charts, financial news, technical analysis, and tools for various financial instruments across global markets. This platform is well-regarded for its accuracy and breadth of data, making it an ideal source for our analysis.

## Data Details

We collect price data for the following assets:

- **ARKB, BRRR, BITB, FBTC, and HODL:**
  - **Date Range:** 12/01/2024 to 23/05/2024
  - These are newly launched funds that have shown significant growth and interest in the market.
  
- **GBTC:**
  - **Date Range:** 28/05/2015 to 23/05/2024
  - Grayscale Bitcoin Trust (GBTC) is one of the oldest and most established Bitcoin investment funds. Its long history provides valuable insights into Bitcoin's performance over time.
  
- **IBIT:**
  - **Date Range:** 16/01/2024 to 24/05/2024
  - This fund is another recent addition to the market, reflecting the growing institutional interest in Bitcoin.
  
- **ETH:**
  - **Date Range:** 31/12/2017 to 24/05/2024
  - Ethereum data captures the performance of the second-largest cryptocurrency by market capitalization, providing crucial insights post-approval of the Ethereum ETF.
  
- **BTC:**
  - **Date Range:** 24/05/2015 to 24/05/2024
  - Bitcoin's price data over an extensive period helps analyze long-term trends and market behavior.

## Data Type

The data is available in CSV and XLSX formats, which are suitable for in-depth analysis and visualization.

[Raw Data](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Price%20Data)

---
# 2. Data Cleaning and Basic Analysis
---
## Data Cleaning:
To ensure the integrity and usability of our dataset, we undertake a comprehensive data cleaning process. This involves several steps, leveraging SQL for its efficiency and precision in handling large datasets. Here's a detailed outline of our data cleaning approach:

1. **Setting Data Types:**
   - **Volume:** Converted to BIGINT to handle large numerical values representing the trading volume.
   - **Date:** Formatted as DATE to facilitate chronological analysis and accurate time series operations.
   - **Other Numerical Columns:** Converted to FLOAT or DOUBLE for precise calculation of prices, returns, and other financial metrics.

2. **Handling Missing Values:**
   - Identify and address any missing or null values to ensure the dataset is complete.
   - Depending on the context, we may fill missing values using methods such as forward fill, backward fill, or interpolation.

3. **Data Consistency:**
   - Ensure that all columns follow a consistent format, particularly dates and numerical values.
   - Remove any duplicate rows that may skew analysis results.

4. **Validation:**
   - Validate the data to confirm that there are no anomalies or outliers that could impact the analysis.
   - Perform checks to ensure the data matches expected ranges and patterns.

Because the data from Investing is of high quality and requires minimal cleaning, you can proceed to exploratory analysis to prepare for hypotheses and deeper analysis later on.

> **Link:** [Investing.com](https://www.investing.com/)
---
## Basic Analysis:
---
Once the data is cleaned and validated, we move on to performing basic analyses to gain initial insights and prepare for more detailed studies.

### Performance Analysis by Time Periods:
> **Link to:** [Performance Analysis](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/SQL/T%E1%BB%B7%20su%E1%BA%A5t%20l%E1%BB%A3i%20nhu%E1%BA%ADn%20trung%20b%C3%ACnh%20theo%20th%C3%A1ng%20t%E1%BB%ABng%20qu%E1%BB%B9%20ETF.sql)

1. **Monthly Analysis:** 
   - Calculate and compare the performance of each asset group on a month-to-month basis. This helps identify short-term trends and anomalies.
  
2. **Quarterly Analysis:** 
   - Aggregates data to assess the performance over each quarter. This smooths out short-term volatility and provides a clearer picture of medium-term trends.

<details><summary>Click here for the solution</summary>

**SQL**:

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">

```sql
# Tháng nào trong từng quỹ có lợi nhuận tốt nhất

# ARKB
SELECT *
FROM arkb;

SELECT 
    Open, 
    Close, 
    (Close - Open) / Open AS Daily_Change,
    SUBSTRING(date, 4, 7) AS Month_Year
FROM arkb
HAVING Daily_Change
ORDER BY Daily_Change DESC;

# Tháng 3/2024

```

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-1.png" alt="ETF Project" width="800"/>

```sql

# BITB
SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        Open, 
        Close, 
        (Close - Open) / Open AS Daily_Change,
        SUBSTRING(date, 4, 7) AS Month_Year
    FROM bitb
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change DESC;
# BITB: 2/2024 > 05/2024 > 03/2024 > 04/2024 > 01/2024
```
<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-2.png" alt="ETF Project" width="800"/>

```sql
# ETH
SELECT 
    Month_Year,
    AVG(Daily_Change) AS Average_Daily_Change
FROM (
    SELECT 
        Open, 
        Close, 
        (Close - Open) / Open AS Daily_Change,
        SUBSTRING(date, 4, 7) AS Month_Year
    FROM eth
) AS Subquery
GROUP BY Month_Year
ORDER BY Average_Daily_Change DESC
LIMIT 5;
# 12/2017 > 1/2021 > 4/2018 > 5/2019 > 7/2022

```
<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-3.png" width="800"/>

</pre>
</div>

</details>

---
### Calculation of Key Indicators
---

[RSI Analysis](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/SQL/RSI)
Relative Strength Index (RSI): Measures the speed and change of price movements to identify overbought or oversold conditions.


<details><summary>Click here for the solution</summary>

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">

**SQL**:

```sql

# Phân tích RSI
# RSI = 100 - [100/(1+RS)]
-- RS (Sức mạnh tương đối - Relative Strength) = trung bình tăng / trung bình giảm. 
-- Thông số cài đặt mặc định của RSI là 14 kỳ.

# Giải thích: 
# ROWS BETWEEN 13 PRECEDING AND CURRENT ROW: Đây là một phần của cú pháp window framing, quy định phạm vi của cửa sổ dữ liệu.
# Trong trường hợp này, 13 PRECEDING chỉ định rằng cửa sổ bao gồm 13 dòng trước dòng hiện tại, còn CURRENT ROW chỉ định rằng cửa sổ cũng bao gồm dòng hiện tại. 
# Do đó, tổng cộng, cửa sổ bao gồm 14 dòng (tính cả dòng hiện tại).

# RS
# RS được tính bằng cách lấy trung bình gia tăng (Average Gain) trong khoảng thời gian xác định và chia cho trung bình giảm giá (Average Loss) trong cùng khoảng thời gian.
# Kết quả là một số không âm, và nó thể hiện tỷ lệ của lợi nhuận so với tỷ lệ của lỗ nhuận trong khoảng thời gian đó.
# RS = Avg Gain/avg loss
# RS cung cấp một cách để đo lường sức mạnh tương đối của một tài sản. Khi RS cao, nó cho thấy các phiên tăng giá thường mạnh hơn so với các phiên giảm giá, và ngược lại. 
# RS được sử dụng làm một phần trong công thức tính toán chỉ báo RSI, một công cụ quan trọng trong phân tích kỹ thuật.
# GBTC

-- Thêm cột RSI vào bảng GBTC nếu chưa tồn tại
ALTER TABLE GBTC ADD COLUMN RSI DECIMAL(10, 4);

-- Tạo bảng tạm thời để lưu kết quả RSI tính toán
CREATE TEMPORARY TABLE temp_rsi1 AS
SELECT 
    date,
    Close,
    Open,
    (Close - Open) AS Price_Change,
    CASE 
        WHEN Close > Open THEN Close - Open 
        ELSE 0 
    END AS Gain,
    CASE 
        WHEN Close < Open THEN Open - Close 
        ELSE 0 
    END AS Loss,
    AVG(CASE WHEN Close > Open THEN Close - Open ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) AS Average_Gain,
    AVG(CASE WHEN Close < Open THEN Open - Close ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) AS Average_Loss,
    CASE 
        WHEN AVG(CASE WHEN Close < Open THEN Open - Close ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) = 0 THEN NULL
        ELSE AVG(CASE WHEN Close > Open THEN Close - Open ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) / AVG(CASE WHEN Close < Open THEN Open - Close ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW)
    END AS RS,
    CASE 
        WHEN AVG(CASE WHEN Close < Open THEN Open - Close ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) = 0 THEN 100
        ELSE 100 - (100 / (1 + (AVG(CASE WHEN Close > Open THEN Close - Open ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) / AVG(CASE WHEN Close < Open THEN Open - Close ELSE 0 END) OVER (ORDER BY number ROWS BETWEEN 13 PRECEDING AND CURRENT ROW))))
    END AS RSI
FROM 
(   
    SELECT 
        *,
        ROW_NUMBER() OVER (ORDER BY date) AS number
    FROM GBTC
) AS numbered;

-- Cập nhật bảng GBTC với giá trị RSI từ bảng tạm thời
UPDATE GBTC AS a
JOIN temp_rsi1 AS t ON a.date = t.date
SET a.RSI = t.RSI;
```

```sql
-- Check những thời điểm quá mua (RSI > 70)
SELECT 
    date,
    Adj close,
    RSI
FROM GBTC
WHERE RSI > 70
ORDER BY RSI DESC;
```
<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-4.png" alt="ETF Project" width="500"/>

```sql
-- Check những thời điểm quá bán (RSI < 30)
SELECT 
    date,
    Adj close,
    RSI
FROM GBTC
WHERE RSI < 30
ORDER BY RSI ASC;

SELECT * 
FROM GBTC;
```
<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-5.png" alt="ETF Project" width="800"/>

</pre>
</div>
<be>

</details>

**Moving Average Convergence Divergence (MACD)**
Utilizes the difference between two moving averages to identify potential buy or sell signals.

Signal Line: Derived from the MACD, it helps confirm buy or sell signals and identify market trends.

Grouping and Conditional Analysis:
Use SQL queries to group data by specific indicators (e.g., RSI, MACD) to identify patterns and validate data integrity. This helps in spotting periods of potential trend reversals and validating the robustness of our dataset.

Link to [ MACD Analysis](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/SQL/MACD)


<details><summary>Click here for the solution</summary>

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">

**SQL**:
```sql
-- Bước 1: Tạo bảng tạm thời để lưu giá trị EMA 12 và EMA 26
CREATE TEMPORARY TABLE temp_ema AS
SELECT 
    date,
    Close,
    Open,
    -- Tính EMA 12 ngày
    AVG(Close) OVER (ORDER BY date ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) AS ema_12,
    -- Tính EMA 26 ngày
    AVG(Close) OVER (ORDER BY date ROWS BETWEEN 25 PRECEDING AND CURRENT ROW) AS ema_26
FROM BTC;

-- Bước 2: Tạo bảng tạm thời để lưu giá trị MACD Line
CREATE TEMPORARY TABLE temp_macd AS
SELECT 
    date,
    ema_12,
    ema_26,
    -- Tính MACD Line
    ema_12 - ema_26 AS macd_line
FROM temp_ema;

-- Bước 3: Tạo bảng tạm thời để lưu giá trị Signal Line
CREATE TEMPORARY TABLE temp_signal AS
SELECT
    date,
    macd_line,
    -- Tính Signal Line
    AVG(macd_line) OVER (ORDER BY date ROWS BETWEEN 8 PRECEDING AND CURRENT ROW) AS signal_line-- Bước 1: Tạo bảng tạm thời để lưu giá trị EMA 12 và EMA 26
CREATE TEMPORARY TABLE temp_ema AS
SELECT 
    `date`,
    `Close`,
    `Open`,
    -- Tính EMA 12 ngày
    AVG(`Close`) OVER (ORDER BY `date` ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) AS ema_12,
    -- Tính EMA 26 ngày
    AVG(`Close`) OVER (ORDER BY `date` ROWS BETWEEN 25 PRECEDING AND CURRENT ROW) AS ema_26
FROM IBIT;

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

-- Bước 5: Thêm các cột MACD Line, Signal Line và Histogram_MACD vào bảng IBIT
ALTER TABLE IBIT ADD COLUMN MACD_Line DECIMAL(10, 4);
ALTER TABLE IBIT ADD COLUMN Signal_Line DECIMAL(10, 4);
ALTER TABLE IBIT ADD COLUMN Histogram_MACD DECIMAL(10, 4);

-- Bước 6: Cập nhật bảng IBIT với các giá trị MACD Line, Signal Line và Histogram_MACD từ bảng tạm thời
UPDATE IBIT AS a
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
FROM IBIT
ORDER BY `date`;
```

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-6.png" alt="ETF Project" width="800"/>

</pre>
</div>

</details>

---
##  Pre-Analysis Validity Checks:
---
Before delving into deeper analysis using Python, we conduct several validity checks to ensure the reliability of our data and preliminary indicators:

### 1.  Data Range Checks:
Verify that the date ranges for each asset match the expected periods.
Confirm that the numerical values are within realistic bounds and there are no outliers
due to data entry errors.
### 2.  Indicator Validation:
Check the calculated RSI, MACD, and Signal values for logical consistency.
Ensure that the indicators align with known market conditions during the corresponding
periods.

---
# 3. Data Analysis
---
## Modeling Price Charts and Indicators

To effectively analyze and visualize the data, we use Python to model price charts and key indicators. The code for this analysis is contained in a Jupyter Notebook titled [Code Test Variable.ipynb - Variable for modeling](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/Code%20Test%20Variable.ipynb). This notebook includes:

**Price:** Historical prices of each asset. (Note: To visualize the price or volume of all assets in a single chart, we use a logarithmic scale. This is essential due to the significant discrepancies in prices and volumes among different assets.)

**<details><summary>Click here for details</summary>**

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>

```python
import numpy as np

# Đường dẫn thư mục để lưu biểu đồ
save_directory = r'C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\Python\Code and Chart\Price'
os.makedirs(save_directory, exist_ok=True)

# Danh sách tên các sheet
sheet_names = ['ARKB', 'BRRR', 'IBIT', 'BTCO', 'BTC', 'ETH', 'FBTC', 'HODL', 'GBTC']

# Tạo một hình vẽ tổng hợp
plt.figure(figsize=(15, 10))  # Thiết lập chiều dài và chiều rộng của biểu đồ

# Màu sắc khác nhau cho từng sheet
colors = ['b', 'g', 'r', 'c', 'm', 'y', 'k', 'orange', 'purple']

# Đọc dữ liệu từ mỗi sheet và thêm vào biểu đồ
for i, sheet_name in enumerate(sheet_names):
    # Đọc dữ liệu từ mỗi sheet vào DataFrame
    df = pd.read_excel(excel_file, sheet_name=sheet_name)
    
    # Kiểm tra cột đầu tiên và cột thứ hai (giả sử là cột ngày và giá)
    date_column = df.columns[0]
    price_column = df.columns[1]
    
    # Chuyển đổi cột ngày sang kiểu datetime
    df[date_column] = pd.to_datetime(df[date_column])
    
    # Lấy log của cột giá
    df['LogPrice'] = np.log(df[price_column])
    
    # Thêm dữ liệu vào biểu đồ
    plt.plot(df[date_column], df['LogPrice'], label=sheet_name, color=colors[i % len(colors)])

# Thiết lập tiêu đề và nhãn cho trục
plt.title('Biểu đồ tổng hợp log của giá cho tất cả các sheet')
plt.xlabel('Ngày')
plt.ylabel('Log của Giá')
plt.legend()
plt.grid(True)

# Lưu biểu đồ dưới dạng hình ảnh
save_path = os.path.join(save_directory, "combined_log_price_chart.png")
plt.savefig(save_path)

# Hiển thị biểu đồ
plt.show()
```

</pre>
</div>
<br>

</details>

**For Example:**
<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>



<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/combined_chart.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/combined_log_price_chart.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/GBTC_chart.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/HODL_chart.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/ETH_chart.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/FBTC_chart.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/BTC_chart.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/BTCO_chart.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/ARKB_chart.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/BRRR_chart.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/IBIT_chart.png" alt="ETF Project" width="800"/>



</pre>
</div>
<br>


**RSI (Relative Strength Index):** 

A momentum oscillator that measures the speed and change of price movements.


**<details><summary>Click here for details</summary>**

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>

```python
# Tạo RSI (Chart Tuần) cho GBTC, BTC, ETH
Đường dẫn thư mục để lưu biểu đồ
save_directory = r'C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\Python\Code and Chart\Price'
os.makedirs(save_directory, exist_ok=True)

Danh sách tên các sheet
selected_sheets = ['BTC', 'ETH', 'GBTC']

Đọc dữ liệu từ mỗi sheet và tạo biểu đồ
for sheet_name in selected_sheets:
# Đọc dữ liệu từ mỗi sheet vào DataFrame
df = pd.read_excel(excel_file, sheet_name=sheet_name)
# Chuyển đổi cột ngày sang dạng datetime
df['Date'] = pd.to_datetime(df['Date'])

# Lọc dữ liệu từ ngày 24/5/2015
df_filtered = df[df['Date'] >= '2015-05-24']

# Chia dữ liệu thành các tuần và tính RSI cho mỗi tuần
weekly_df = df_filtered.resample('W-Mon', on='Date').agg({'Close': 'last'}).dropna()
delta = weekly_df['Close'].diff()
gain = delta.mask(delta < 0, 0)
loss = -delta.mask(delta > 0, 0)
avg_gain = gain.rolling(window=14).mean()
avg_loss = loss.rolling(window=14).mean()
rs = avg_gain / avg_loss
rsi = 100 - (100 / (1 + rs))

# Tạo biểu đồ RSI
fig = go.Figure()
fig.add_trace(go.Scatter(x=weekly_df.index, y=rsi, mode='lines', name='RSI', line=dict(color='royalblue', width=2)))
fig.add_shape(type="line", x0=weekly_df.index[0], y0=30, x1=weekly_df.index[-1], y1=30, line=dict(color="red", width=1, dash="dash"), name="RSI 30")
fig.add_shape(type="line", x0=weekly_df.index[0], y0=50, x1=weekly_df.index[-1], y1=50, line=dict(color="green", width=1, dash="dash"), name="RSI 50")
fig.add_shape(type="line", x0=weekly_df.index[0], y0=70, x1=weekly_df.index[-1], y1=70, line=dict(color="red", width=1, dash="dash"), name="RSI 70")
fig.update_layout(title=f'Biểu đồ RSI hàng tuần cho {sheet_name}',
                  xaxis_title='Tuần',
                  yaxis_title='RSI',
                  hovermode='x unified',
                  height=600)

# Lưu biểu đồ dưới dạng tệp HTML
save_path = os.path.join(save_directory, f"{sheet_name}_weekly_RSI_chart.html")
fig.write_html(save_path)

# Hiển thị biểu đồ
fig.show()
```

</pre>
</div>
<be>

</details>

**For Example:**

[Interactive Weekly RSI Result](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/Price)

**MACD (Moving Average Convergence Divergence):**

A trend-following momentum indicator that shows the relationship between two moving averages of an asset's price.

**<details><summary>Click here for details </summary>**

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>

```python
import os
import pandas as pd
import plotly.graph_objects as go

# Directory to save the chart
save_directory = r'C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\Python\Code and Chart\MACD'
os.makedirs(save_directory, exist_ok=True)

# List of selected sheets
selected_sheets = ['ARKB', 'BRRR', 'IBIT', 'BITB', 'BTCO', 'FBTC', 'HODL', 'GBTC']

# Read data from each sheet and create the chart
for sheet_name in selected_sheets:
    # Read data from each sheet into a DataFrame
    df = pd.read_excel(excel_file, sheet_name=sheet_name)
    
    # Convert the date column to datetime
    df['Date'] = pd.to_datetime(df['Date'])
    
    # Calculate MACD components
    df['EMA12'] = df['Close'].ewm(span=12, adjust=False).mean()
    df['EMA26'] = df['Close'].ewm(span=26, adjust=False).mean()
    df['MACD'] = df['EMA12'] - df['EMA26']
    df['Signal'] = df['MACD'].ewm(span=9, adjust=False).mean()
    df['Histogram'] = df['MACD'] - df['Signal']
    
    # Filter data from January 10, 2024, to May 27, 2024
    df_filtered = df[(df['Date'] >= '2024-01-10') & (df['Date'] <= '2024-05-27')]
    
    # Create MACD chart and components
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=df_filtered['Date'], y=df_filtered['MACD'], mode='lines', name='MACD', line=dict(color='blue')))
    fig.add_trace(go.Scatter(x=df_filtered['Date'], y=df_filtered['Signal'], mode='lines', name='Signal', line=dict(color='red')))
    fig.add_trace(go.Bar(x=df_filtered['Date'], y=df_filtered['Histogram'], name='Histogram', marker_color='grey'))
    fig.add_shape(type="line", x0=df_filtered['Date'].iloc[0], y0=0, x1=df_filtered['Date'].iloc[-1], y1=0,
                  line=dict(color="black", width=1, dash="dash"), name="Zero Line")
    
    # Set chart layout
    fig.update_layout(title=f"MACD Chart for {sheet_name}",
                      xaxis_title='Date',
                      yaxis_title='Value',
                      height=800)
    
    # Save the chart as an HTML file
    save_path = os.path.join(save_directory, f"{sheet_name}_MACD_chart.html")
    fig.write_html(save_path)
    
    # Show the chart
    fig.show()
```

</pre>
</div>
<be>

</details>

**For Example:**

[Interactive Weekly MACD Result 1](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/MACD)

[Interactive Weekly MACD & Volume Result 2](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/MACD%20And%20Volume)

**Stock RSI:** 

An oscillator that measures the level of the RSI relative to its range over a set period.

**<details><summary>Click here for details </summary>**

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>

```python

# Danh sách khoảng thời gian tương ứng với mỗi quỹ
start_dates = ['2015-05-20', '2015-05-20', '2017-12-31', '2024-01-01', '2024-01-01', '2024-01-01', '2024-01-01', '2024-01-01', '2024-01-01', '2024-01-01']
end_dates = ['2024-05-24', '2024-05-24', '2024-05-24', '2024-05-24', '2024-05-24', '2024-05-24', '2024-05-24', '2024-05-24', '2024-05-24', '2024-05-24']

# Tạo biểu đồ cho mỗi quỹ
for selected_sheets, start_date, end_date in zip(selected_sheets, start_dates, end_dates):
    # Giả sử df là DataFrame chứa dữ liệu của quỹ
    # Chỉ sử dụng dữ liệu từ start_date đến end_date
    df = df[(df['Date'] >= start_date) & (df['Date'] <= end_date)]

    # Chuyển đổi 'Date' thành dạng datetime
    df['Date'] = pd.to_datetime(df['Date'])

    # Chia dữ liệu thành tuần cho BTC, ETH, GBTC và ngày cho các quỹ còn lại
    if selected_sheets in ['BTC', 'GBTC', 'ETH']:
        df_resampled = df.resample('W-Mon', on='Date').mean()
    else:
        df_resampled = df

    # Tính chỉ số Stochastic
    n = 14  # Khoảng thời gian mặc định
    l14 = df_resampled['Low'].rolling(window=n).min()
    h14 = df_resampled['High'].rolling(window=n).max()
    df_resampled['%K'] = ((df_resampled['Close'] - l14) / (h14 - l14)) * 100

    # Tính %D (đường trung bình động)
    n_d = 3  # Số kỳ trước
    df_resampled['%D'] = df_resampled['%K'].rolling(window=n_d).mean()

    # Biểu đồ
    plt.figure(figsize=(10, 5))
    plt.plot(df_resampled.index, df_resampled['%K'], label='%K (Stochastic)', color='blue')
    plt.plot(df_resampled.index, df_resampled['%D'], label='%D (Stochastic)', color='orange')
    plt.title(f'Stochastic Indicator for {selected_sheets}')
    plt.xlabel('Date')
    plt.ylabel('Value')
    plt.legend()
    plt.grid(True)

    # Lưu biểu đồ
    save_path = os.path.join(save_directory, f"{selected_sheets}_Stochastic.png")
    plt.savefig(save_path)

    # Hiển thị biểu đồ
    plt.show()
```

</pre>
</div>
<br>

</details>

**For Example:**
<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/ARKB_Stochastic.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/BITB_Stochastic.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/BRRR_Stochastic.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/BTC_Stochastic.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/BTCO_Stochastic.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/ETH_Stochastic.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/FBTC_Stochastic.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/GBTC_Stochastic.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/HODL_Stochastic.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/IBIT_Stochastic.png" alt="ETF Project" width="800"/>



</pre>
</div>

## Exploratory Data Analysis (EDA):

Here is all of the code in EDA.

But i will summarize some bullet point down here

### 1.Trimming the Timeline:

Reduce the dataset to only include data from the year 2024.

Because the MACD and Signal import indicators caused an error when outputting to the table, we will take the 3 indicators MA, RSI, and Stock RSI.

Remove NaN values to ensure the accuracy of our analysis

Here is previous dataset. [here](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Price%20Data)

Save the new dataset to work [here](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/New%20Table).

### 2.Visualization :

**Boxplot:**

Boxplots are used to represent the distribution of data points, helping us understand the spread, symmetry, range, and presence of outliers in the dataset.

**<details><summary>Click here for details </summary>**

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>

``` python

# Đường dẫn thư mục chứa các biểu đồ boxplot đầu ra
output_folder = r'C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\Python\Code and Chart\EDA\Bloxplot'

# Lặp qua từng tên file trong thư mục đầu vào
for file_name in os.listdir(input_folder):
    if file_name.endswith(".xlsx"):  # Chỉ xử lý các file Excel
        # Đường dẫn đầy đủ đến file Excel
        file_path = os.path.join(input_folder, file_name)
        
        # Đọc dữ liệu từ file Excel vào DataFrame
        df = pd.read_excel(file_path)
        
        # Tạo biểu đồ boxplot cho cột RSI
        plt.figure(figsize=(8, 6))
        sns.boxplot(data=df['RSI'])
        plt.title(f'RSI Boxplot for {file_name[:-5]}')  # Loại bỏ phần '.xlsx' ra khỏi tên file
        plt.xlabel('RSI')
        plt.ylabel('Frequency')
        plt.tight_layout()
        # Lưu biểu đồ vào thư mục đầu ra với tên tương ứng của file
        plt.savefig(os.path.join(output_folder, f'{file_name[:-5]}_RSI_Boxplot.png'))
        plt.close()
        
        # Tạo biểu đồ boxplot cho cột Stock RSI
        plt.figure(figsize=(8, 6))
        sns.boxplot(data=df['Stock RSI'])
        plt.title(f'Stock RSI Boxplot for {file_name[:-5]}')
        plt.xlabel('Stock RSI')
        plt.ylabel('Frequency')
        plt.tight_layout()
        # Lưu biểu đồ vào thư mục đầu ra với tên tương ứng của file
        plt.savefig(os.path.join(output_folder, f'{file_name[:-5]}_Stock_RSI_Boxplot.png'))
        plt.close()
        
        # Tạo biểu đồ boxplot cho cột Volume
        plt.figure(figsize=(8, 6))
        sns.boxplot(data=df['Volume'])
        plt.title(f'Volume Boxplot for {file_name[:-5]}')
        plt.xlabel('Volume')
        plt.ylabel('Frequency')
        plt.tight_layout()
        # Lưu biểu đồ vào thư mục đầu ra với tên tương ứng của file
        plt.savefig(os.path.join(output_folder, f'{file_name[:-5]}_Volume_Boxplot.png'))
        plt.close()

# In và lưu kết quả BloxPlot

from IPython.display import Image, display

# Lặp qua từng file trong thư mục đầu ra và hiển thị các biểu đồ boxplot
for file_name in os.listdir(output_folder):
    if file_name.endswith(".png"):  # Chỉ xử lý các file hình ảnh PNG
        # Đường dẫn đầy đủ đến file hình ảnh
        image_path = os.path.join(output_folder, file_name)
        # Hiển thị hình ảnh
        display(Image(filename=image_path))



```


</pre>
</div>
<br>

</details>

All the boxplot results for each fund based on Volume, Stock RSI, and RSI are presented [here](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Bloxplot).

**Here are some examples:**

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>

**ARKB**

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Bloxplot/ARKB_processed_RSI_Boxplot.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Bloxplot/ARKB_processed_Stock_RSI_Boxplot.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Bloxplot/ARKB_processed_Volume_Boxplot.png" alt="ETF Project" width="800"/>

---

**BTC**

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Bloxplot/BTC_processed_RSI_Boxplot.png" alt="BTC RSI Boxplot" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Bloxplot/BTC_processed_Stock_RSI_Boxplot.png" alt="BTC Stock RSI Boxplot" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Bloxplot/BTC_processed_Volume_Boxplot.png" alt="BTC Volume Boxplot" width="800"/>

---

</pre>
</div>
<br>

**Correlation Heatmap:**

Correlation heatmaps help identify the relationships between different variables. For instance, we might observe that Stock RSI and RSI have a strong correlation with price, while MA (Moving Average) might not be as strongly related to price but more so with Stock RSI and volume.

**<details><summary>Click here for details </summary>**

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>

``` python

# Đường dẫn thư mục chứa biểu đồ heatmap đầu ra
heatmap_output_folder = r'C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\Python\Code and Chart\EDA\Relation Heatmap'

# Lặp qua từng tên file trong thư mục đầu vào
for file_name in os.listdir(input_folder):
    if file_name.endswith(".xlsx"):  # Chỉ xử lý các file Excel
        # Đường dẫn đầy đủ đến file Excel
        file_path = os.path.join(input_folder, file_name)
        
        # Đọc dữ liệu từ file Excel vào DataFrame
        df = pd.read_excel(file_path)
        
        # Tạo ma trận correlation
        correlation_matrix = df.corr()
        
        # Tạo biểu đồ heatmap từ ma trận correlation
        plt.figure(figsize=(10, 8))
        sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', fmt=".2f")
        plt.title(f'Correlation Heatmap for {file_name[:-5]}')  # Loại bỏ phần '.xlsx' ra khỏi tên file
        plt.tight_layout()
        
        # Lưu biểu đồ vào thư mục đầu ra với tên tương ứng của file
        heatmap_file_path = os.path.join(heatmap_output_folder, f'{file_name[:-5]}_Correlation_Heatmap.png')
        plt.savefig(heatmap_file_path)
        plt.close()

```

</pre>
</div>
<be>

</details>

Because the data from Investing is of high quality and requires minimal cleaning, you can proceed to exploratory analysis to prepare for hypotheses and deeper analysis later on.



All the Correlation Heatmap results for each fund based on all metric are presented [here](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Relation%20Heatmap).

**Here are some examples:**

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>

---

**ARKB**

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Relation%20Heatmap/ARKB_processed_Correlation_Heatmap.png" alt="BTC Volume Boxplot" width="800"/>

---

**BTC**

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Relation%20Heatmap/BTC_processed_Correlation_Heatmap.png" alt="BTC Volume Boxplot" width="800"/>

---

**GBTC**
<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Relation%20Heatmap/GBTC_processed_Correlation_Heatmap.png" alt="BTC Volume Boxplot" width="800"/>

---

</pre>
</div>
<br>


**You can actually see the pattern if you watch all of them at the same picture. Creating obvious pixel by pixel whoose BTC and ETH stand out a little different from others.**

---
<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-7.png" alt="ETF Project" width="800"/>

---

**Histogram:**

Histograms of Stock RSI and RSI show the frequency of overbought and oversold conditions throughout jan 12, 2024 up to May 24, 2024.

**<details><summary>Click here for details </summary>**

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>

``` python

# Đường dẫn thư mục chứa các biểu đồ histogram đầu ra
output_folder = r'C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\Python\Code and Chart\EDA\Histogram'

# Lặp qua từng tên file trong thư mục đầu vào
for file_name in os.listdir(input_folder):
    if file_name.endswith(".xlsx"):  # Chỉ xử lý các file Excel
        # Đường dẫn đầy đủ đến file Excel
        file_path = os.path.join(input_folder, file_name)
        
        # Đọc dữ liệu từ file Excel vào DataFrame
        df = pd.read_excel(file_path)
        
        # Tạo biểu đồ histogram cho cột RSI
        plt.figure(figsize=(8, 6))
        sns.histplot(df['RSI'], bins=20, kde=True)
        plt.title(f'RSI Histogram for {file_name[:-5]}')  # Loại bỏ phần '.xlsx' ra khỏi tên file
        plt.xlabel('RSI')
        plt.ylabel('Frequency')
        plt.tight_layout()
        # Lưu biểu đồ vào thư mục đầu ra với tên tương ứng của file
        plt.savefig(os.path.join(output_folder, f'{file_name[:-5]}_RSI_Histogram.png'))
        plt.close()
        
        # Tạo biểu đồ histogram cho cột Stock RSI
        plt.figure(figsize=(8, 6))
        sns.histplot(df['Stock RSI'], bins=20, kde=True)
        plt.title(f'Stock RSI Histogram for {file_name[:-5]}')
        plt.xlabel('Stock RSI')
        plt.ylabel('Frequency')
        plt.tight_layout()
        # Lưu biểu đồ vào thư mục đầu ra với tên tương ứng của file
        plt.savefig(os.path.join(output_folder, f'{file_name[:-5]}_Stock_RSI_Histogram.png'))
        plt.close()
from IPython.display import Image, display

# Lặp qua từng tên file trong thư mục đầu ra
for file_name in os.listdir(output_folder):
    if file_name.endswith(".png"):  # Chỉ xử lý các file hình ảnh
        # Đường dẫn đầy đủ đến file hình ảnh
        image_path = os.path.join(output_folder, file_name)
        
        # Hiển thị hình ảnh
        display(Image(filename=image_path))

```

</pre>
</div>
<br>

</details>

All the Histogram results for each fund based on RSI and StorckRSI are presented [here](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Histogram).


**Here are some examples:**

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>

---

**BTC**

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Histogram/BTC_processed_RSI_Histogram.png"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Histogram/BTC_processed_Stock_RSI_Histogram.png"/>

---

**GBTC**

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Histogram/GBTC_processed_RSI_Histogram.png" alt="BTC Volume Boxplot" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Histogram/GBTC_processed_Stock_RSI_Histogram.png" alt="BTC Volume Boxplot" width="800"/>

---

</pre>
</div>
<br>



**You can actually see the pattern if you look at all of them in the same picture. It's like playing "Where's Waldo?" but with pixels. BTC and ETH pop out a little differently from the others. At least, that's what Basic RSI would have you believe.**

---
**But wait, did I just mix it up? Turns out StockRSI has been pulling off the same magic trick all along. It's like comparing notes and realizing your friend copied your homework – truly astonishing!**
<br>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-8.png" alt="ETF Project" width="800"/>

---


**Pairplot:**

Pairplots provide a multi-dimensional view of the data, illustrating the relationships between various variables in different formats.

**<details><summary>Click here for details </summary>**

<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>

``` python

# Tạo một danh sách để lưu trữ tất cả các DataFrame từ các file Excel
dfs = []

# Lặp qua từng tên file trong thư mục đầu vào
for file_name in os.listdir(input_folder):
    if file_name.endswith(".xlsx"):  # Chỉ xử lý các file Excel
        # Đường dẫn đầy đủ đến file Excel
        file_path = os.path.join(input_folder, file_name)
        
        # Đọc dữ liệu từ file Excel vào DataFrame
        df = pd.read_excel(file_path)
        
        # Thêm một cột mới để xác định file gốc của mỗi dòng dữ liệu
        df['File'] = file_name
        
        # Thêm DataFrame này vào danh sách
        dfs.append(df)

# Gộp tất cả các DataFrame trong danh sách thành một DataFrame lớn
merged_df = pd.concat(dfs, ignore_index=True)

# Chọn chỉ các cột quan tâm
selected_columns = ["Adj Close", "Volume", "MA", "RSI", "Stock RSI"]

# Sử dụng seaborn để vẽ ma trận pairplot với mỗi file có một màu sắc khác nhau
g = sns.pairplot(merged_df, diag_kind='kde', corner=True, height=3.5, aspect=1, vars=selected_columns, hue='File')

# Đảm bảo tiêu đề ở trên cùng và ở giữa
plt.suptitle('Super Pairplot Matrix', y=1.02, fontsize=16)

# Điều chỉnh khoảng cách giữa các subplot
plt.subplots_adjust(top=0.9, hspace=0.4)

# Lưu ma trận pairplot vào thư mục đầu ra
output_folder = r'C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\Python\Code and Chart\EDA\Pairplot Matrix'
output_file_path = os.path.join(output_folder, 'Super_Pairplot_Matrix.png')
plt.savefig(output_file_path)

# Hiển thị ma trận pairplot
plt.show()

```

</pre>
</div>
<br>

</details>

---

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Pairplot%20Matrix/Super_Pairplot_Matrix.png" alt="ETF Project" width="800"/>

---




**A little bit irrelevant, so I chose to divide it based on the time of existence. The first group is BTC, ETH, GBTC; the second group is the remaining ones (FACT: GBTC has been around since ETH was born).**

BTW, All the Pairplot results for each fund based on all variables are presented [here](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Pairplot%20Matrix).

**Just BTC ETH GBTC:**
**<details><summary>Click here for details </summary>**

```python
# Tạo một danh sách để lưu trữ tất cả các DataFrame từ các file Excel
dfs = []

# Danh sách các file Excel tương tác được
interactive_files = ["BTC_processed.xlsx", "ETH_processed.xlsx", "GBTC_processed.xlsx"]

# Lặp qua từng tên file trong thư mục đầu vào
for file_name in os.listdir(input_folder):
    if file_name in interactive_files:  # Chỉ xử lý các file Excel trong danh sách tương tác được
        # Đường dẫn đầy đủ đến file Excel
        file_path = os.path.join(input_folder, file_name)
        
        # Đọc dữ liệu từ file Excel vào DataFrame
        df = pd.read_excel(file_path)
        
        # Thêm một cột mới để xác định file gốc của mỗi dòng dữ liệu
        df['File'] = file_name
        
        # Thêm DataFrame này vào danh sách
        dfs.append(df)

# Kiểm tra xem có DataFrame nào trong danh sách không
if dfs:
    # Gộp tất cả các DataFrame trong danh sách thành một DataFrame lớn
    merged_df = pd.concat(dfs, ignore_index=True)

    # Chọn chỉ các cột quan tâm
    selected_columns = ["Adj Close", "Volume", "MA", "RSI", "Stock RSI"]

    # Sử dụng seaborn để vẽ ma trận pairplot với mỗi file có một màu sắc khác nhau
    g = sns.pairplot(merged_df, diag_kind='kde', corner=True, height=3.5, aspect=1, vars=selected_columns, hue='File')

    # Đảm bảo tiêu đề ở trên cùng và ở giữa
    plt.suptitle('Super Pairplot Matrix', y=1.02, fontsize=16)

    # Điều chỉnh khoảng cách giữa các subplot
    plt.subplots_adjust(top=0.9, hspace=0.4)


```

</details>

---

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Pairplot%20Matrix/Super_Pairplot_Matrix_Just_BTC_ETH_GBTC.png" width="800"/>

---

**Not much to say here, except for the pair of RSI and Stock RSI, which are kind of positively related to each other. Most other pairs show BTC standing out as the dominant player. However, when it comes to Stock RSI and RSI, ETH seems to have a bit more bounce in its range, so it might just steal the spotlight!**

**Others:**

**<details><summary>Click here for details </summary>**

```python

# Tạo một danh sách để lưu trữ tất cả các DataFrame từ các file Excel
dfs = []

# Danh sách các file Excel tương tác được
interactive_files = ["ARKB_processed.xlsx", "BRRR_processed.xlsx", "BTCO_processed.xlsx",
                     "FBTC_processed.xlsx", "HODL_processed.xlsx", "IBIT_processed.xlsx"]

# Lặp qua từng tên file trong thư mục đầu vào
for file_name in os.listdir(input_folder):
    if file_name in interactive_files:  # Chỉ xử lý các file Excel trong danh sách tương tác được
        # Đường dẫn đầy đủ đến file Excel
        file_path = os.path.join(input_folder, file_name)
        
        # Đọc dữ liệu từ file Excel vào DataFrame
        df = pd.read_excel(file_path)
        
        # Thêm một cột mới để xác định file gốc của mỗi dòng dữ liệu
        df['File'] = file_name
        
        # Thêm DataFrame này vào danh sách
        dfs.append(df)

# Kiểm tra xem có DataFrame nào trong danh sách không
if dfs:
    # Gộp tất cả các DataFrame trong danh sách thành một DataFrame lớn
    merged_df = pd.concat(dfs, ignore_index=True)

    # Chọn chỉ các cột quan tâm
    selected_columns = ["Adj Close", "Volume", "MA", "RSI", "Stock RSI"]

    # Sử dụng seaborn để vẽ ma trận pairplot với mỗi file có một màu sắc khác nhau
    g = sns.pairplot(merged_df, diag_kind='kde', corner=True, height=3.5, aspect=1, vars=selected_columns, hue='File')

    # Đảm bảo tiêu đề ở trên cùng và ở giữa
    plt.suptitle('Super Pairplot Matrix Small ETFBTC', y=1.02, fontsize=16)

    # Điều chỉnh khoảng cách giữa các subplot
    plt.subplots_adjust(top=0.9, hspace=0.4)

```

</details>



---

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/EDA/Pairplot%20Matrix/Super_Pairplot_Matrix_Small_ETFBTC.png" width="800"/>

---

**The interesting part here is that when it comes to Stock RSI and RSI for the others, they’re practically indistinguishable! It’s like they all just walked into a party and forgot who they were!**

**As for the other pairs, they seem to have their ranks, but it’s all good! Volume might be the popular kid, while Price variables are in the back row, and then it’s like a complete role reversal! What a twist!*

**Linear Regression:**

Linear regression is used to evaluate the Adjusted P-value, which helps understand the relationship between the Moving Average (MA) and future analysis. 

Ihave to say. There are nothing much to say: Here the [result]().

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-9.png" alt="ETF Project" width="800"/>

# 4. Direction:

## What will we do with all we the data we have have: 3 directions ? 

### Direction 1: Create Efficient Frontier: 

I will create an Efficient Frontier to assist investors in estimating their risk-return preferences while considering their available capital and market position. This framework will provide a visual representation of the optimal portfolio combinations that maximize expected returns for a given level of risk or minimize risk for a desired level of return. By utilizing this model, investors can make informed, rational, and optimal investment decisions tailored to their unique circumstances.

After reviewing the information below, you will have the opportunity to adjust your risk and return parameters in accordance with your investment strategy. This flexibility will empower you to allocate your capital wisely across a diversified range of cryptocurrency ETFs, ultimately enhancing your potential for achieving your financial goals. The Efficient Frontier serves not only as a guide but also as a strategic tool that enables you to navigate the complexities of the investment landscape with confidence.

The Efficient Frontier theory, introduced by Nobel Laureate Harry Markowitz in 1952, is a key concept in modern portfolio theory (MPT). It rates portfolios based on their returns (y-axis) versus risk (x-axis).

**Theory Overview:**

- The Compound Annual Growth Rate (CAGR) is commonly used as the return component.
- Standard deviation (annualized) represents the risk metric.

The efficient frontier graphically represents portfolios that maximize returns for a given level of risk. Ideally, investors seek portfolios with high returns and low standard deviation. The key to achieving this is diversification, as less synchronized securities (lower covariance) reduce the overall portfolio risk.

**<details><summary>Click here for details </summary>**

---

```python

# Tính toán tỷ suất lợi nhuận kỳ vọng và ma trận hiệp phương sai
expected_returns = efficient_frontier_data.pct_change().mean()
cov_matrix = efficient_frontier_data.pct_change().cov()

# In ra mean và covariance matrix
print("Expected Returns:")
print(expected_returns)
print("\nCovariance Matrix:")
print(cov_matrix)

# Số lượng danh mục cần mô phỏng
num_portfolios = 1000
results = np.zeros((4, num_portfolios))
weights_record = []

np.random.seed(42)

for i in range(num_portfolios):
    # Gán ngẫu nhiên trọng số cho các tài sản
    weights = np.random.random(len(efficient_frontier_data.columns))
    weights /= np.sum(weights)
    weights_record.append(weights)
    
    # Tính toán tỷ suất lợi nhuận kỳ vọng và độ biến động của danh mục
    portfolio_return = np.dot(weights, expected_returns)
    portfolio_volatility = np.sqrt(np.dot(weights.T, np.dot(cov_matrix, weights)))
    
    # Lưu trữ kết quả
    results[0, i] = portfolio_return
    results[1, i] = portfolio_volatility
    results[2, i] = portfolio_return / portfolio_volatility  # Sharpe Ratio
    results[3, i] = i  # Portfolio index for reference

# Chuyển đổi kết quả thành DataFrame
results_df = pd.DataFrame(results.T, columns=['Return', 'Volatility', 'Sharpe Ratio', 'Portfolio'])

# Tìm điểm optimal (Ideal Market Portfolio)
optimal_point_index = results_df['Sharpe Ratio'].idxmax()
optimal_point = results_df.loc[optimal_point_index]

# Lấy trọng số tối ưu
optimal_weights = weights_record[optimal_point_index]

# Tính toán Risk-free rate
risk_free_rate = 4 / 365 / 100  # Lãi suất hàng ngày

# Tạo dữ liệu cho đường Capital Market Line
min_volatility = results_df['Volatility'].min()
max_volatility = results_df['Volatility'].max()
volatility_range = np.linspace(min_volatility, max_volatility, num=100)
cml_returns = risk_free_rate + ((optimal_point['Return'] - risk_free_rate) / optimal_point['Volatility']) * volatility_range

# Tìm điểm có lowest risk và lowest return
lowest_risk_point = results_df.loc[results_df['Volatility'].idxmin()]
lowest_return_point = results_df.loc[results_df['Return'].idxmin()]

# Tạo chú thích hover text cho mỗi danh mục
hover_text = []
for i, weights in enumerate(weights_record):
    text = f"Portfolio {i}<br>"
    for asset, weight in zip(efficient_frontier_data.columns, weights):
        text += f"{asset}: {weight:.2f}<br>"
    text += f"Return: {results_df.at[i, 'Return']:.2%}<br>"
    text += f"Volatility: {results_df.at[i, 'Volatility']:.2%}"
    hover_text.append(text)

results_df['hover_text'] = hover_text

# Vẽ đồ thị efficient frontier với Plotly
fig = go.Figure()

# Thêm các danh mục vào đồ thị
fig.add_trace(go.Scatter(
    x=results_df['Volatility'], y=results_df['Return'],
    mode='markers',
    marker=dict(color=results_df['Sharpe Ratio'], colorscale='Viridis', size=5, colorbar=dict(title='Sharpe Ratio')),
    text=results_df['hover_text'],
    hoverinfo='text',
    showlegend=False
))

# Đánh dấu điểm optimal
fig.add_trace(go.Scatter(
    x=[optimal_point['Volatility']], y=[optimal_point['Return']],
    mode='markers', marker=dict(color='green', size=15),
    name='Optimal (Ideal Market Portfolio)',
    text=[f"Optimal Portfolio<br>Return: {optimal_point['Return']:.2%}<br>Volatility: {optimal_point['Volatility']:.2%}"],
    hoverinfo='text'
))

# Vẽ đường Capital Market Line
fig.add_trace(go.Scatter(
    x=volatility_range, y=cml_returns, mode='lines',
    line=dict(color='blue', dash='dash'),
    name='Capital Market Line (Risk-free Rate = 4% annually)'
))

# Đánh dấu điểm có lowest risk và lowest return
fig.add_trace(go.Scatter(
    x=[lowest_risk_point['Volatility']], y=[lowest_risk_point['Return']],
    mode='markers', marker=dict(color='red', size=15),
    name='Lowest Risk',
    text=[f"Lowest Risk Portfolio<br>Return: {lowest_risk_point['Return']:.2%}<br>Volatility: {lowest_risk_point['Volatility']:.2%}"],
    hoverinfo='text'
))
fig.add_trace(go.Scatter(
    x=[lowest_return_point['Volatility']], y=[lowest_return_point['Return']],
    mode='markers', marker=dict(color='orange', size=15),
    name='Lowest Return',
    text=[f"Lowest Return Portfolio<br>Return: {lowest_return_point['Return']:.2%}<br>Volatility: {lowest_return_point['Volatility']:.2%}"],
    hoverinfo='text'
))

# Định dạng và hiển thị đồ thị
fig.update_layout(
    title='Efficient Frontier',
    xaxis_title='Volatility (Risk)',
    yaxis_title='Return',
    template='plotly_white'
)

# Lưu đồ thị vào file HTML
fig.write_html(r'C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\Python\Code and Chart\Efficient Frontier\Result\Efficient_Frontier.html')

# Tạo bảng thống kê
statistics_optimal = pd.DataFrame(optimal_point).rename(columns={optimal_point_index: 'Optimal Point (Ideal Market Portfolio)'})
statistics_risk_free = pd.DataFrame([risk_free_rate], columns=['Risk-free Rate (daily)'])
statistics_lowest_risk = pd.DataFrame(lowest_risk_point).rename(columns={lowest_risk_point.name: 'Lowest Risk Point'})
statistics_lowest_return = pd.DataFrame(lowest_return_point).rename(columns={lowest_return_point.name: 'Lowest Return Point'})

statistics_df = pd.concat([statistics_optimal, statistics_risk_free, statistics_lowest_risk, statistics_lowest_return], axis=1)

# Lưu bảng thống kê vào file Excel
statistics_df.to_excel(r'C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\Python\Code and Chart\Efficient Frontier\Result\Efficient_Frontier_Statistics.xlsx')

# Lưu các trọng số của danh mục vào file Excel
weights_df = pd.DataFrame(weights_record, columns=efficient_frontier_data.columns)
weights_df.to_excel(r'C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\Python\Code and Chart\Efficient Frontier\Result\Portfolio_Weights.xlsx', index=False)

# In bảng thống kê
print(statistics_df)

# In các trọng số tối ưu
optimal_weights_df = pd.DataFrame(optimal_weights, index=efficient_frontier_data.columns, columns=['Optimal Weights'])
print(optimal_weights_df)

```

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-11.png" alt="ETF Project" width="800"/>

---

</details>

**Result: [here](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/Efficient%20Frontier/Result)**

**Optimal Portfolio Determination:**
- Randomly assign weights to the assets.
- Identify the optimal portfolio, as well as portfolios with the highest and lowest risk based on the investor's risk appetite.

*Results are stored in the "Efficient Frontier" folder. For example, Portfolio #322 has the highest asset allocation in BTC at 32% and the lowest in BITB at 1%. It has an average daily return of 0.55%, which translates to an approximate annual return of 200.75%, with a volatility of 3.57%. This relatively stable outcome will be used to test investment strategies through machine learning and AI models.*

---

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-10.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-12.png" alt="ETF Project" width="800"/>

---

### Direction 2: Machine Learning to predict price action:

*While attempting to apply machine learning for model training, we stumbled upon a delightful buffet of challenges and errors, making it clear that our models are still in their toddler phase—wobbling around and not quite ready for the big leagues. But don’t worry! These pesky issues will be tackled head-on in future iterations of the project, like brave knights charging into battle. So, stay tuned for the epic sequel where our models grow up and learn to walk without tripping over their own feet! : ))*

### Direction 3: Auto Trading Bot:

The content below serves as a foundation for creating an effective trading bot. This mindset can be applied to develop complex indicators on real-time data platforms like TradingView, which can further enhance trading strategies.

**It is important to remember that an auto trading bot does not completely replace human intuition and decision-making. Instead, it serves primarily as a tool for generating signals rather than executing trades directly on trading platforms or exchanges. This functionality can be particularly beneficial for novice traders who may struggle with discipline and emotional decision-making. By utilizing a trading bot, they can streamline their trading process and minimize the impact of emotions during trading hours.**

The auto trading bot can help traders remain consistent in their strategies, allowing them to focus on analyzing market conditions and making informed decisions based on the signals provided. Ultimately, while the bot can assist in creating a more structured trading environment, it should be viewed as a complement to a trader's skills and strategies, rather than a substitute for them.

**For example:**

**<details><summary>Click here for details </summary>**

---

```python

# Định nghĩa điều kiện mua và bán
def loc_tin_hieu_mua(df):
    return df[(df['RSI'] < 40) & (df['Stock RSI'] < 0.35) & (df['Adj Close'] <= 1.15 * df['MA'])]

def loc_tin_hieu_ban(df):
    return df[(df['RSI'] > 70) | (df['Stock RSI'] > 0.75)]

# Áp dụng bộ lọc cho mỗi DataFrame
tin_hieu_mua = {name: loc_tin_hieu_mua(df) for name, df in data_frames.items()}
tin_hieu_ban = {name: loc_tin_hieu_ban(df) for name, df in data_frames.items()}

# Tính phần trăm lợi nhuận
def tinh_loi_nhuan(buy_df, sell_df):
    if buy_df.empty or sell_df.empty:
        return None
    min_buy = buy_df['Adj Close'].min()
    max_sell = sell_df['Adj Close'].max()
    return ((max_sell - min_buy) / min_buy) * 100

loi_nhuan = {name: tinh_loi_nhuan(tin_hieu_mua[name], tin_hieu_ban[name]) for name in data_frames.keys()}
# Vẽ biểu đồ với các tín hiệu mua/bán
fig, axs = plt.subplots(len(data_frames), 1, figsize=(10, 5 * len(data_frames)))
image_save_path = "C:/Users/ADMIN/Project/ETF_Predict_After_ETF_Project/Python/Code and Chart/Conclusion/bieu_do_tin_hieu_mua_ban.png"

for ax, (name, df) in zip(axs, data_frames.items()):
    ax.plot(df['Date'], df['Adj Close'], label='Adj Close')
    buy_dates = tin_hieu_mua[name]['Date']
    sell_dates = tin_hieu_ban[name]['Date']
    ax.scatter(buy_dates, tin_hieu_mua[name]['Adj Close'], marker='^', color='g', label='Mua')
    ax.scatter(sell_dates, tin_hieu_ban[name]['Adj Close'], marker='v', color='r', label='Bán')
    ax.set_title(f"{name} Adj Close với các tín hiệu Mua/Bán")
    ax.set_xlabel("Ngày")
    ax.set_ylabel("Adj Close")
    ax.legend()
    ax.grid(True)

plt.tight_layout()
plt.savefig(image_save_path)
plt.show()

```
</details>

The results are stored in the "Conclusion" folder. The returns for each asset are as follows:

**[Result of the example](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/Conclusion).**

---

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-13.png" alt="ETF Project" width="800"/>

---

- **ARKB: 26.24%**  
- **BRRR: 26.22%**  
- **BTC: 23.61%**  
- **BTCO: 26.16%**  
- **ETH: 39.75%**  
- **FBTC: 26.37%**  
- **GBTC: 26.30%**  
- **HODL: 26.12%**  
- **IBIT: 26.43%**  

These results demonstrate the effectiveness of traditional methods combined with indicators for achieving significant returns in the cryptocurrency market.

# 5, Visualization with Tableau/PowerBI: (Bonus)

We will use Tableau to create two interactive dashboards that provide comprehensive insights into the performance of ETFs and cryptocurrencies.

**The result of visualization: [here](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Tableau/DB) (Enjoy!)**

In terms of visualization, I utilized Tableau in conjunction with the processed data available at this [link](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/New%20Table).

Since this data has been thoroughly cleaned, we can proceed directly to the joining process. This allows us to seamlessly integrate the relevant datasets for our analysis.

Given that we are working with real-time data, we will join the datasets based on time, which is crucial for maintaining the integrity of our analysis. Additionally, I will create several new measures to facilitate the construction of an interactive box within the funds. This interactivity will enhance user engagement and provide deeper insights into the data.

You can view the two report tables through the following two images, which will illustrate the results of our analysis and the effectiveness of our visualization strategy. These visuals will help in understanding the relationships within the data and guide informed decision-making.

---

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-14.png" alt="ETF Project" width="800"/>

<img src="https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/image%20for%20README/image-15.png" alt="ETF Project" width="800"/>

---


# END:

>   
> ## Thank You!
>
> **Thank you for taking the time to explore my GitHub project! This marks the end of this particular project, but of course, you are warmly invited to check out my other projects at this [link](https://github.com/wallkool).**
>
> **I sincerely hope that my work has provided you with valuable insights and resources from an investor's perspective. My aim has always been to create meaningful contributions that can enhance your investment journey, equipping you with the tools and knowledge needed to navigate the complexities of the financial landscape.**
>
> **As we come to the conclusion of this project, I want to express my heartfelt gratitude for your interest and engagement. Your support means a lot to me, and it inspires me to continue developing projects that offer real value to the investment community.**
>
> **As we part ways, I wish you all the best in your endeavors. May your future investments yield great success, and may you find joy and fulfillment in your financial pursuits. Thank you once again for your time, and goodbye! I look forward to our paths crossing again in the future. ❤️**













