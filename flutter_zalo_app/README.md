# Flutter Zalo App



### Mô Tả Project:

- Giao diện được thiết kế dựa theo ứng dụng Zalo, sử dụng giao diện tối (Dark Mode), ngôn ngữ tiếng Anh.

- Danh sách trang màn hình (Screens List):
    + **Đăng nhập (Sign in)**
    + **Đăng ký (Sign up)**
    + **Danh sách Tin nhắn (Messages)**
    + **Chat Online**
    + **Danh bạ / Bạn bè (Contacts)**
    + **Group Chat**
    + **Khám phá (Discovery)**
    + **Nhật ký (Timeline)**
    + **Profile Cá nhân (Me)**
    + **Cài đặt (Settings)**

- Màn hình Đăng nhập, Đăng ký: sử dụng Firebase Authentication, người dùng có thể Đăng nhập, Đăng ký tài khoản bằng Email/Password hoặc Google Account.

- Màn hình Chat online: sử dụng Firebase Firestore để lưu lịch sử tin nhắn đã gửi theo đúng thứ tự thời gian.



### Hướng Dẫn Chạy Project:

- Clone Project từ Git về máy.

- Nếu muốn chạy Project sử dụng Firebase riêng của bạn:
    + Đối với Android app:
        Đổi file `google-services.json` trong thư mục `/android/app` thành file config tương ứng từ Firebase của bạn.
    + Đối với iOS app:
        Đổi file `GoogleService-Info.plist` trong thư mục `/ios/Runner` thành file config tương ứng từ Firebase của bạn.

- Từ thư mục Project (flutter_zalo_app) khởi chạy Project bằng cách mở Project trên Android Studio và nhấn nút Run, hoặc khởi chạy bằng cách gõ lệnh:
    > flutter run

- Đăng ký tài khoản mới bằng Email và mật khẩu, hoặc đăng nhập trực tiếp bằng tài khoản Google để sử dụng app.