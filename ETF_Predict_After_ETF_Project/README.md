# Investment for Cryptocurrency ETFs and Price Prediction

> ### *Hello Guys! My name is Wallkool, and this is one of my cherished personal projects in the Data World.*
>
> *A little bit about myself: I graduated with highest distinction in Financial Technology (Fintech) from the National Economics University (NEU). This project marks one of my first steps into the Data World. I hope you enjoy exploring it!*

## 
<div style="border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
  <span style="color: red; font-size: 24px; font-weight: bold; font-family: Arial, sans-serif;">General Context</span>
</div>
<br>

In the context of the approval of the Bitcoin ETF Fund in January 2024, both funds and Bitcoin have seen a 130% increase in value. Recently, in May 2024, the Ethereum ETF has also been approved. The cryptocurrency landscape has never been more dynamic, with traditional funds and capital flows rushing to fill the market. Understanding this, my personal project aims to help individuals assess the health of these assets, measure and visualize the results, and thus assist you in making the most suitable choices for yourselves.

Given the landmark approval of the Bitcoin ETF Fund in January 2024, we've witnessed an astonishing 100% surge in the value of both Bitcoin and related investment funds. This milestone was followed by another significant event in May 2024, with the approval of the Ethereum ETF. The cryptocurrency market has never been more vibrant and bustling, as traditional funds and capital are eagerly pouring into the space, seeking opportunities and growth.'

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\image.png" alt="ETF Project" width="800"/>


Recognizing the unprecedented activity and the growing interest in the crypto market, I have embarked on a personal project designed to aid individuals in navigating this complex landscape. The project's core objective is to provide a comprehensive assessment of the health of major cryptocurrency assets, specifically focusing on Bitcoin and Ethereum, which are currently the most influential and widely discussed.

Through meticulous data collection and analysis, this project aims to measure key indicators that reflect the performance and stability of these assets. By utilizing advanced data visualization techniques, we will present the findings in a clear and accessible manner, allowing users to gain insightful and actionable information. This approach will empower individuals to make informed decisions based on the latest market trends and data-driven insights.

In essence, my project will serve as a valuable tool for anyone looking to understand the current state of the cryptocurrency market. Whether you are a seasoned investor or a newcomer to the crypto world, having access to reliable and up-to-date information is crucial. By assessing the health of Bitcoin and Ethereum, measuring their performance, and visualizing the results, we aim to provide a robust foundation for making the most suitable investment choices tailored to your personal needs and goals.

Stay tuned for detailed analyses, visual reports, and ongoing updates as we delve into the exciting and ever-evolving world of cryptocurrencies. Together, we can navigate this vibrant market and uncover the opportunities it holds.

## 1. Data Sources and Collection

For our project, we source our data from  Investing.com is a comprehensive financial platform that provides a wide range of market data, including real-time quotes, charts, financial news, technical analysis, and tools for various financial instruments across global markets. This platform is well-regarded for its accuracy and breadth of data, making it an ideal source for our analysis.

### Data Details

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

### Data Type

The data is available in CSV and XLSX formats, which are suitable for in-depth analysis and visualization.

[Link for the data is all in this link](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Price%20Data)

# 2. Data Cleaning and Basic Analysis

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

Vì là khả năng cáo Dùng SQL thì real time data của investing ít lỗi nên không phải clean nhiều mà tiến vào phân tích sơ để chuẩn bị cho những giả thiết và phân tích sâu sau này.

> **Link:** [Investing.com](https://www.investing.com/)

## Basic Analysis:
Once the data is cleaned and validated, we move on to performing basic analyses to gain initial insights and prepare for more detailed studies.

### Performance Analysis by Time Periods:
> **Link to:** [Performance Analysis](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/SQL/T%E1%BB%B7%20su%E1%BA%A5t%20l%E1%BB%A3i%20nhu%E1%BA%ADn%20trung%20b%C3%ACnh%20theo%20th%C3%A1ng%20t%E1%BB%ABng%20qu%E1%BB%B9%20ETF.sql)

1. **Monthly Analysis:** 
   - Calculate and compare the performance of each asset group on a month-to-month basis. This helps identify short-term trends and anomalies.
  
2. **Quarterly Analysis:** 
   - Aggregates data to assess the performance over each quarter. This smooths out short-term volatility and provides a clearer picture of medium-term trends.

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

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\image-1.png" alt="ETF Project" width="800"/>

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
<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\image-2.png" alt="ETF Project" width="800"/>

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
<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\image-3.png" alt="ETF Project" width="800"/>

</pre>
</div>


### Calculation of Key Indicators
[RSI Analysis](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/SQL/RSI)
Relative Strength Index (RSI): Measures the speed and change of price movements to identify overbought or oversold conditions.

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
<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\image-4.png" alt="ETF Project" width="500"/>

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
<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\image-5.png" alt="ETF Project" width="800"/>

</pre>
</div>

### Moving Average Convergence Divergence (MACD)
Utilizes the difference between two moving averages to identify potential buy or sell signals.

Signal Line: Derived from the MACD, it helps confirm buy or sell signals and identify market trends.

Grouping and Conditional Analysis:
Use SQL queries to group data by specific indicators (e.g., RSI, MACD) to identify patterns and validate data integrity. This helps in spotting periods of potential trend reversals and validating the robustness of our dataset.

Link to [ MACD Analysis](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/SQL/MACD)

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

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\image-6.png" alt="ETF Project" width="800"/>

</pre>
</div>

##  Pre-Analysis Validity Checks:
Before delving into deeper analysis using Python, we conduct several validity checks to ensure
the reliability of our data and preliminary indicators:

### 1.  Data Range Checks:
Verify that the date ranges for each asset match the expected periods.
Confirm that the numerical values are within realistic bounds and there are no outliers
due to data entry errors.
### 2.  Indicator Validation:
Check the calculated RSI, MACD, and Signal values for logical consistency.
Ensure that the indicators align with known market conditions during the corresponding
periods.

# 3. Data Analysis

## a. Modeling Price Charts and Indicators

To effectively analyze and visualize the data, we use Python to model price charts and key indicators. The code for this analysis is contained in a Jupyter Notebook titled [Code Test Variable.ipynb - Variable for modeling](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/blob/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/Code%20Test%20Variable.ipynb). This notebook includes:

**Price:** Historical prices of each asset. (Note: To visualize the price or volume of all assets in a single chart, we use a logarithmic scale. This is essential due to the significant discrepancies in prices and volumes among different assets.)

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

**For Example:**
<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>


<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\combined_log_price_chart.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\GBTC_chart.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\HODL_chart.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\ETH_chart.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\FBTC_chart.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\BTC_chart.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\BTCO_chart.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\ARKB_chart.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\BRRR_chart.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\IBIT_chart.png" alt="ETF Project" width="800"/>


</pre>
</div>
<br>


**RSI (Relative Strength Index):** 

A momentum oscillator that measures the speed and change of price movements.

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
<br>

**For Example:**

[Interactive Weekly RSI Result](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/Price)

**MACD (Moving Average Convergence Divergence):**

A trend-following momentum indicator that shows the relationship between two moving averages of an asset's price.

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
<br>

**For Example:**

[Interactive Weekly MACD Result 1](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/MACD)

[Interactive Weekly MACD & Volume Result 2](https://github.com/wallkool/Cryptocurrency-ETFs---BTC---ETH/tree/master/ETF_Predict_After_ETF_Project/Python/Code%20and%20Chart/MACD%20And%20Volume)

**Stock RSI:** 

An oscillator that measures the level of the RSI relative to its range over a set period.

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

**For Example:**
<div style="max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">
<pre>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\ARKB_Stochastic.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\BITB_Stochastic.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\BRRR_Stochastic.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\BTC_Stochastic.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\BTCO_Stochastic.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\ETH_Stochastic.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\FBTC_Stochastic.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\GBTC_Stochastic.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\HODL_Stochastic.png" alt="ETF Project" width="800"/>

<img src="C:\Users\ADMIN\Project\ETF_Predict_After_ETF_Project\image for README\IBIT_Stochastic.png" alt="ETF Project" width="800"/>


</pre>
</div>

## b. Exploratory Data Analysis (EDA):

Here is all of the code in EDA.

But i will summarize some bullet point down here

### 1.Trimming the Timeline:
Reduce the dataset to only include data from the year 2024.

Because the MACD and Signal import indicators caused an error when outputting to the table, we will take the 3 indicators MA, RSI, and Stock RSI.

Remove NaN values to ensure the accuracy of our analysis

Here is previous dataset. [here]
Save the new dataset to work [here]().



