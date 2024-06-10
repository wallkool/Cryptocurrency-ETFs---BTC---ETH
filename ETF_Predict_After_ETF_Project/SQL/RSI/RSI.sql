#Phân tích RSI
# RSI = 100 - [100/(1+RS)]
-- RS (Sức mạnh tương đối - Relative Strength) = trung bình tăng / trung bình giảm. – Thông số cài đặt mặc định của RSI là 14 kỳ.

# Giải thích: 
# ROWS BETWEEN 13 PRECEDING AND CURRENT ROW: Đây là một phần của cú pháp window framing, quy định phạm vi của cửa sổ dữ liệu.
# Trong trường hợp này, 13 PRECEDING chỉ định rằng cửa sổ bao gồm 13 dòng trước dòng hiện tại, còn CURRENT ROW chỉ định rằng cửa sổ cũng bao gồm dòng hiện tại. Do đó, tổng cộng, cửa sổ bao gồm 14 dòng (tính cả dòng hiện tại).

# RS
# RS được tính bằng cách lấy trung bình gia tăng (Average Gain) trong khoảng thời gian xác định và chia cho trung bình giảm giá (Average Loss) trong cùng khoảng thời gian. Kết quả là một số không âm, và nó thể hiện tỷ lệ của lợi nhuận so với tỷ lệ của lỗ nhuận trong khoảng thời gian đó.
# RS = Avg Gain/avg loss
# RS cung cấp một cách để đo lường sức mạnh tương đối của một tài sản. Khi RS cao, nó cho thấy các phiên tăng giá thường mạnh hơn so với các phiên giảm giá, và ngược lại. RS được sử dụng làm một phần trong công thức tính toán chỉ báo RSI, một công cụ quan trọng trong phân tích kỹ thuật.
