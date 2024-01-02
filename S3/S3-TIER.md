# S3 TIER

## S3 Standard

- Storage tier mặc định
- 99.99% Availability (xác suất một yêu cầu lấy dữ liệu của Object được trả về thành công)
- 99.999999999% i.e 11 9's Durability (Xác suất dữ liệu tồn tại, được đảm bảo lưu trữ ở S3)
- Phục vụ các mục đích cơ bản
  - Phù hợp cho các ứng dụng độ trễ thấp cho tác vụ lưu trữ file
  - Các ứng dụng truy cập thường xuyên (Frequently Access) vào S3

## S3 Standard IA (Infrequently Access)

- Dùng để lưu trữ dữ liệu ít thường xuyên truy cập (Infrequently Access) (khoảng 1 tháng 1 lần)
- Chi phí lưu trữ rẻ hơn **S3 Standard Tier**
- Mất phi cho việc lấy Object (Object retrieving - Download file)
- Objects có thể truy cập nhanh (real time)
- Object phải đảm bảo > 128 KB
- Chi phí làm tròn đến 30 ngày (Nếu thời gian lưu trữ < 30 ngày, AWS sẽ làm tròn lên 30 ngày)

## S3 One-Zone IA (Infrequently Access)

- Dùng để lưu trữ dữ liệu ít thường xuyên truy cập (Infrequently Access) 
- Dữ liệu của Object sẽ được lưu trữ trong một **AZ (Availability Zone)**
- Object phải đảm bảo > 128 KB
- Dùng cho dữ liệu có thể khôi phục được nếu như một AZ bị sự cố
- Chi phí làm tròn đến 30 ngày

## S3 Intelligent Tier

- Tự động di chuyển dữ liệu giữa các **Storage Tier** để tối ưu chi phí
- Dựa vào tần suất truy cập dữ liệu để chọn **Storage Tier** phù hợp
- Phù hợp cho các kiểu dữ liệu có tần suất truy cập không đoán trước được

## S3 Glacier

- Dùng để lưu trữ lâu dài 3-10 năm (Long time archive)
- Chi phí rẻ
- Lưu trữ trong tối thiểu 90 ngày
- Thời gian lấy dữ liệu Object từ vài phút tới vài giờ

## S3 Glacier Deep Archive

- Dùng để lưu trữ lâu dài trên 10 năm (Long time archive)
- Chi phí rẻ
- Lưu trữ trong tối thiểu 180 ngày
- Thời gian lấy dữ liệu Object khoảng trên 12 giờ

## Exam tips

- Dữ liệu cần độ trễ thấp, truy cập thường xuyên => **Standard Tier**
- Dữ liệu ít truy cập => **IA**
- Dữ liệu ít truy cập, có thể khôi phục nếu AZ bị sự cố => **One-Zone IA**
- Dữ liệu lưu trữ lâu dài (1~10 năm), thời gian lấy dữ liệu từ vài phút tới 12 giờ => **Glacier**
- Dữ liệu lưu trữ lâu dài (> 10 năm), thời gian lấy dữ liệu > 12 giờ => **Glacier Deep Archived**