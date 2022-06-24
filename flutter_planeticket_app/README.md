# Flutter Planeticket App



### Mô Tả Project:

- Mobile app mua vé Máy bay, xây dựng bằng Flutter và Firebase.
- **Đăng nhập, đăng ký account bằng Firebase Authentication.**
- **Lưu lịch sử đặt vé với Cloud Firestore.**
- **Thay đổi ngôn ngữ app (Anh - Việt).**
- **Tự động Push Notification nhắc chuyến bay đã đặt trước 1 ngày.**

* Danh sách sân bay đã tạo:

	- [x] TP. Hồ Chí Minh (Tan Son Nhat International Airport)
	- [x] Hà Nội (Noi Bai International Airport)
	- [x] Đà Nẵng (Da Nang International Airport)
	- [x] Nha Trang (Nha Trang International Airport)
	- [x] Buôn Mê Thuột (Buon Me Thuot Airport)
	- [x] Cà Mau (Ca Mau Airport)
	- [x] Điện Biên Phủ (Dien Bien Phu Airport)
	- [x] Đà Lạt (Lien Khuong International Airport)
	- [x] Hải Phòng (Cat Bi International Airport)
	- [x] Huế (Phu Bai Airport)
	- [x] Phú Quốc (Phu Quoc Airport)
	- [x] Pleiku (Pleiku Airport)
	- [x] Tuy Hòa (Tuy Hoa Airport)
	- [x] Thanh Hóa (Tho Xuan Airport)
	- [x] Quy Nhơn (Phu Cat International Airport)
	- [x] Cần Thơ (Can Tho International Airport)
	- [x] Chu Lai (Chu Lai Airport)
	- [x] Côn Đảo (Con Dao Airport)
	- [x] Đồng Hới (Dong Hoi Airport)
	- [x] Vân Đồn (Van Don International Airport)
	- [x] Vinh (Vinh International Airport)
	- [x] Rạch Giá (Rach Gia Airport)

* Danh sách chuyến bay đã tạo:

	- [x] Ngày 01.07.2022:
		+ TP. HCM -> Hà Nội
		+ Hà Nội -> TP.HCM
		+ TP.HCM -> Đà Nẵng
		+ Đà Nẵng -> TP.HCM
		+ Hà Nội -> Đà Nẵng
		+ Đà Nẵng -> Hà Nội

	- [x] Ngày 02.07.2022:
		+ TP. HCM -> Hà Nội
		+ Hà Nội -> TP.HCM
		+ TP.HCM -> Đà Nẵng
		+ Đà Nẵng -> TP.HCM
		+ Hà Nội -> Đà Nẵng
		+ Đà Nẵng -> Hà Nội

	- [x] Ngày 03.07.2022:
		+ TP. HCM -> Hà Nội
		+ Hà Nội -> TP.HCM
		+ TP.HCM -> Đà Nẵng
		+ Đà Nẵng -> TP.HCM
		+ Hà Nội -> Đà Nẵng
		+ Đà Nẵng -> Hà Nội

	- [x] Ngày 04.07.2022:
		+ TP. HCM -> Hà Nội
		+ Hà Nội -> TP.HCM
		+ TP.HCM -> Đà Nẵng
		+ Đà Nẵng -> TP.HCM
		+ Hà Nội -> Đà Nẵng
		+ Đà Nẵng -> Hà Nội

	- [x] Ngày 05.07.2022:
		+ TP. HCM -> Hà Nội
		+ Hà Nội -> TP.HCM
		+ TP.HCM -> Đà Nẵng
		+ Đà Nẵng -> TP.HCM
		+ Hà Nội -> Đà Nẵng
		+ Đà Nẵng -> Hà Nội



### Hướng Dẫn Chạy Project:

- Clone Project từ Git về máy.

- Nếu muốn chạy Project sử dụng Firebase riêng của bạn:
    + Đối với Android app:
        Đổi file `google-services.json` trong thư mục `/android/app` thành file config tương ứng từ Firebase của bạn.
    + Đối với iOS app:
        Đổi file `GoogleService-Info.plist` trong thư mục `/ios/Runner` thành file config tương ứng từ Firebase của bạn.

- Khởi chạy Project bằng cách mở Project trên Android Studio và nhấn nút Run, hoặc từ thư mục Project (flutter_planeticket_app) gõ lệnh:
    > flutter run

- Đăng ký tài khoản mới bằng Email và mật khẩu, hoặc đăng nhập trực tiếp bằng tài khoản Google để sử dụng app.