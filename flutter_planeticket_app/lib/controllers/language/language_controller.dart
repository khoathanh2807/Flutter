import 'package:get/get.dart';

class LanguageController extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {

    'English': {

      // Settings Screen
      'Settings': 'Settings',
      'AppLanguage': 'Change app language',     // Change language option
      'SelectLanguage': 'Select Language',
      'English': 'English',
      'Vietnamese': 'Vietnamese',
      'ChangeLanguage': 'Change Language',
      'ChangeLanguageMessage': 'Do you confirm that you want to change the application language?',
      'SuccessfullyChangedLanguage': 'Successfully changed language',
      'CancelAllFlightNotifications': 'Cancel all upcoming flight notifications',     // Cancel notifications option
      'CancelNotification': 'Cancel Notification',
      'CancelNotificationMessage1': 'Do you confirm that you want to cancel all ',
      'CancelNotificationMessage2': ' pending notifications to remind of upcoming flights?',
      'NoNotification': 'No Notification!',
      'NoNotificationMessage': 'You don\'t have any pending notification to remind of upcoming flight',
      'SuccessfullyCanceledNotification': 'Successfully canceled all pending notifications for upcoming flights',
      'ChangeAccountPassword': 'Change account password',     // Change password option
      'SignOut': 'Sign out',      // Sign out option
      'SignOutTitle': 'Sign Out',
      'SignOutMessage': 'Do you confirm that you want to sign out of this account?',
      'SuccessfullySignedOut': 'User Successfully Signed Out',

      // Home Screen
      'HomeScreen': 'Home',
      'BookingNow': 'Booking ticket right now!',
      'SignificantDestinations': 'Significant destinations',
      'Promotion': 'Promotions for you',

      // Booking Screen
      'BookingTicket': 'Booking Ticket',
      'RoundTrip': 'Round trip',
      'OneWay': 'One way',
      'EmptyLocationList': 'Airport list is currently empty!',
      'ReturnDate': 'Return date',
      'DepartureDateFieldHint': 'Enter your Departure date',
      'ReturnDateFieldHint': 'Enter your Return date',
      'DateFieldValidate': 'Please enter a valid date',
      'Passenger': 'Passenger',
      'Adult': 'Adult',
      'AdultAge': '12+ years old',
      'Child': 'Child',
      'ChildAge': '2 - 11 years old',
      'Infant': 'Infant',
      'InfantAge': 'Under 2 years old',
      'PromotionCode': 'Promotion Code',
      'SearchFlight': 'Search flight',

      // Select Flight Time Screen
      'DepartureFlight': 'Departure flight',
      'ReturnFlight': 'Return flight',
      'Date': 'Date:',
      'TicketPriceNote': 'This price is per passenger and doesn\'t include taxes and fees',
      'PriceFrom': 'From',
      'EmptyFlightList': 'The flight you are looking for doesn\'t currently exist.\nPlease look for another flight!',
      'SoldOut': 'Sold out',
      'RemainSeats': '@seatAmount seats left',
      'NotEnoughSeats': 'Not Enough Seats!',
      'NotEnoughSeatsMessage': 'The selected flight doesn\'t have enough seats for the amount of passengers you entered',

      // Payment Screen
      'Payment': 'Payment',
      'FlightInformation': 'Flight information',
      'DepartureFlightInformation': 'Departure flight information',
      'ReturnFlightInformation': 'Return flight information',
      'PassengerInformation': 'Passenger information',
      'PriceDetails': 'Price details',
      'PassengerAmount': 'Passenger amount',
      'DepartureFlight2': 'Departure flight',
      'ReturnFlight2': 'Return flight',
      'TicketClass': '@seatClass class',
      'AdultTicketPrice': 'Adult ticket price',
      'ChildTicketPrice': 'Child ticket price',
      'InfantTicketPrice': 'Infant ticket price',
      'TotalPrice': 'Total price',
      'TermsConditionsBooking': 'I agreed with Terms and Conditions of booking',
      'PaymentTitle': 'Payment',
      'PaymentMessage': 'Do you confirm that the Ticket information and Passenger information are all correct?\nProceed to payment now.',
      'SuccessfullyPayment': 'Successfully payment!',

      // Account Screen
      'Account': 'Account',
      'ProfileInformation': 'Profile information',
      'BookingHistory': 'Booking history',
      // Profile
      'FullName': 'Full name',      // Name field
      'FullNameFieldHint': 'Enter your full name',
      'EmptyFieldValidate': 'Please enter valid information in all fields',
      'Birthdate': 'Date of birth',     // Birthdate field
      'BirthdateFieldHint': 'Enter your date of birth',
      'BirthdateFieldValidate': 'Please enter a valid date of birth',
      'Gender': 'Gender',     // Gender field
      'GenderFieldHint': 'Select your gender',
      'Male': 'Male',
      'Female': 'Female',
      'EmailFieldHint': 'Enter your email',     // Email field
      'PhoneNumber': 'Phone number',      // Phone number field
      'PhoneNumberFieldHint': 'Enter your phone number',
      'Edit': 'Edit',
      'AccuracyAgreement': 'I confirm that the information I provide is valid and will take full responsibility if provide fake information',
      'Cancel': 'Cancel',
      'Confirm': 'Confirm',
      'Save': 'Save',
      'EditInformation': 'Edit Information',
      'EditInformationMessage': 'Do you confirm that you want to edit your profile information?',
      'SuccessfullyEditedInformation': 'Successfully updated new profile information',
      // Booking History
      'Loading': 'Loading...',
      'EmptyHistory': 'You haven\'t booked any flight tickets yet!',
      'DepartureDate': 'Departure date',
      'DepartureTime': 'Departure time',
      'SeatClass': 'Seat class',

      // Ticket Detail Screen
      'TicketDetails': 'Ticket details',
      'TicketID': 'Ticket ID',
      'DepartureLocation': 'Departure location',
      'ArrivalLocation': 'Arrival location',
      'FlightID': 'Flight ID',
      'TicketType': 'Ticket type',
      'TicketPrice': 'Ticket price',
      'Amount': 'Amount',
      'Ticket': ' ticket(s)',

      // Change Password Screen
      'ChangePassword': 'Change password',
      'ShowPassword': 'Show password',
      'CurrentPassword': 'Current password',
      'CurrentPasswordFieldHint': 'Enter your current password',
      'CurrentPasswordFieldValidate': 'Invalid current password!',
      'NewPassword': 'New password',
      'NewPasswordFieldHint': 'Enter your new password',
      'ConfirmNewPassword': 'Confirm new password',
      'ConfirmNewPasswordFieldHint': 'Confirm your new password',
      'ConfirmPasswordCannotEmpty': 'Confirm password cannot be empty!',
      'ConfirmPasswordDidntMatch': 'This didn\'t match new password above. Please try again!',
      'WrongPassword': 'Wrong Password',
      'WrongPasswordMessage': 'You have entered the wrong current password. Please try again!',
      'ChangePasswordTitle': 'Change Password',
      'ChangePasswordMessage': 'Do you confirm that you want to change your account password?',
      'SuccessfullyChangedPassword': 'Successfully changed password. Please sign in again!',

      // Notification
      'SuccessfullyBookedTicket': 'Successfully Booked Ticket!',
      'SuccessfullyBookedTicketMessage': 'The ticket has been added to your account, please check it in the \'Booking history\' section.',
      'RemindFlight': 'Don\'t Forget Your Flight Tomorrow!',
      'RemindFlightMessage1': 'Your flight ',
      'RemindFlightMessage2': ' will depart tomorrow ',
      'RemindFlightMessage3': ' at ',

    },

    'Vietnamese': {

      // Settings Screen
      'Settings': 'Cài đặt',
      'AppLanguage': 'Đổi ngôn ngữ ứng dụng',     // Change language option
      'SelectLanguage': 'Chọn Ngôn Ngữ',
      'English': 'Tiếng Anh',
      'Vietnamese': 'Tiếng Việt',
      'ChangeLanguage': 'Đổi Ngôn Ngữ',
      'ChangeLanguageMessage': 'Bạn xác nhận muốn thay đổi ngôn ngữ ứng dụng?',
      'SuccessfullyChangedLanguage': 'Thay đổi ngôn ngữ thành công',
      'CancelAllFlightNotifications': 'Huỷ thông báo chuyến bay sắp tới',     // Cancel notifications option
      'CancelNotification': 'Huỷ Thông Báo',
      'CancelNotificationMessage1': 'Bạn có xác nhận muốn huỷ tất cả ',
      'CancelNotificationMessage2': ' thông báo nhắc lịch các chuyến bay sắp tới?',
      'NoNotification': 'Không Có Thông Báo!',
      'NoNotificationMessage': 'Bạn không có thông báo nào đang bật để nhắc lịch chuyến bay sắp tới',
      'SuccessfullyCanceledNotification': 'Đã huỷ tất cả thông báo nhắc lịch chuyến bay',
      'ChangeAccountPassword': 'Đổi mật khẩu tài khoản',      // Change password option
      'SignOut': 'Đăng xuất',     // Sign out option
      'SignOutTitle': 'Đăng Xuất',
      'SignOutMessage': 'Bạn xác nhận muốn đăng xuất tài khoản?',
      'SuccessfullySignedOut': 'Đăng xuất tài khoản thành công',

      // Home Screen
      'HomeScreen': 'Trang chủ',
      'BookingNow': 'Đặt vé ngay hôm nay!',
      'SignificantDestinations': 'Điểm đến nổi bật',
      'Promotion': 'Khuyến mãi dành cho bạn',

      // Booking Screen
      'BookingTicket': 'Đặt vé',
      'RoundTrip': 'Khứ hồi',
      'OneWay': 'Một chiều',
      'EmptyLocationList': 'Hiện tại danh sách sân bay đang trống!',
      'ReturnDate': 'Ngày về',
      'DepartureDateFieldHint': 'Nhập ngày bay đi',
      'ReturnDateFieldHint': 'Nhập ngày bay về',
      'DateFieldValidate': 'Vui lòng nhập ngày hợp lệ',
      'Passenger': 'Khách hàng',
      'Adult': 'Người lớn',
      'AdultAge': 'Từ 12 tuổi',
      'Child': 'Trẻ em',
      'ChildAge': 'Từ 2 đến 11 tuổi',
      'Infant': 'Em bé',
      'InfantAge': 'Dưới 2 tuổi',
      'PromotionCode': 'Mã giảm giá',
      'SearchFlight': 'Tìm chuyến bay',

      // Select Flight Time Screen
      'DepartureFlight': 'Chuyến đi',
      'ReturnFlight': 'Chuyến về',
      'Date': 'Ngày',
      'TicketPriceNote': 'Giá trên một hành khách và chưa bao gồm thuế, phí',
      'PriceFrom': 'Giá từ',
      'EmptyFlightList': 'Chuyến bay cần tìm hiện không tồn tại.\nVui lòng tìm kiếm chuyến bay khác!',
      'SoldOut': 'Hết vé',
      'RemainSeats': 'Còn @seatAmount ghế',
      'NotEnoughSeats': 'Không Đủ Ghế!',
      'NotEnoughSeatsMessage': 'Chuyến bay vừa chọn không còn đủ ghế cho số lượng hành khách bạn nhập',

      // Payment Screen
      'Payment': 'Thanh toán',
      'FlightInformation': 'Thông tin chuyến bay',
      'DepartureFlightInformation': 'Thông tin chuyến bay đi',
      'ReturnFlightInformation': 'Thông tin chuyến bay về',
      'PassengerInformation': 'Thông tin hành khách',
      'PriceDetails': 'Chi tiết giá',
      'PassengerAmount': 'Số hành khách',
      'DepartureFlight2': 'Chuyến bay đi',
      'ReturnFlight2': 'Chuyến bay về',
      'TicketClass': 'Vé @seatClass',
      'AdultTicketPrice': 'Giá vé Người lớn',
      'ChildTicketPrice': 'Giá vé Trẻ em',
      'InfantTicketPrice': 'Giá vé Em bé',
      'TotalPrice': 'Tổng chi phí',
      'TermsConditionsBooking': 'Tôi đồng ý với Điều khoản và Điều kiện đặt vé',
      'PaymentTitle': 'Thanh Toán',
      'PaymentMessage': 'Bạn xác nhận Thông tin vé và Thông tin hành khách đã chính xác?\nTiến hành thanh toán ngay.',
      'SuccessfullyPayment': 'Thanh toán thành công!',

      // Account Screen
      'Account': 'Tài khoản',
      'ProfileInformation': 'Thông tin cá nhân',
      'BookingHistory': 'Lịch sử đặt vé',
      // Profile
      'FullName': 'Họ tên',     // Name field
      'FullNameFieldHint': 'Nhập đầy đủ họ tên',
      'EmptyFieldValidate': 'Vui lòng nhập đầy đủ thông tin',
      'Birthdate': 'Ngày sinh',     // Birthdate field
      'BirthdateFieldHint': 'Nhập ngày sinh',
      'BirthdateFieldValidate': 'Vui lòng nhập ngày sinh hợp lệ',
      'Gender': 'Giới tính',      // Gender field
      'GenderFieldHint': 'Chọn giới tính',
      'Male': 'Nam',
      'Female': 'Nữ',
      'EmailFieldHint': 'Nhập email',     // Email field
      'PhoneNumber': 'Số điện thoại',     // Phone number field
      'PhoneNumberFieldHint': 'Nhập số điện thoại',
      'Edit': 'Chỉnh sửa',
      'AccuracyAgreement': 'Tôi xác nhận các thông tin bản thân cung cấp là chính xác và hoàn toàn chịu trách nu cung cấp thông tin sai lệch',
      'Cancel': 'Huỷ',
      'Confirm': 'Xác nhận',
      'Save': 'Lưu',
      'EditInformation': 'Chỉnh Sửa Thông Tin',
      'EditInformationMessage': 'Bạn xác nhận muốn chỉnh sửa thông tin tài khoản?',
      'SuccessfullyEditedInformation': 'Cập nhật thông tin tài khoản thành công',
      // Booking History
      'Loading': 'Đang tải...',
      'EmptyHistory': 'Bạn chưa đặt vé máy bay nào!',
      'DepartureDate': 'Ngày đi',
      'DepartureTime': 'Vào lúc',
      'SeatClass': 'Hạng ghế',

      // Ticket Detail Screen
      'TicketDetails': 'Thông tin chi tiết vé',
      'TicketID': 'Mã số vé',
      'DepartureLocation': 'Điểm đi',
      'ArrivalLocation': 'Điểm đến',
      'FlightID': 'Mã số chuyến bay',
      'TicketType': 'Loại vé',
      'TicketPrice': 'Giá vé',
      'Amount': 'Số lượng',
      'Ticket': ' vé',

      // Change Password Screen
      'ChangePassword': 'Đổi mật khẩu',
      'ShowPassword': 'Hiện mật khẩu',
      'CurrentPassword': 'Mật khẩu hiện tại',
      'CurrentPasswordFieldHint': 'Nhập mật khẩu hiện tại',
      'CurrentPasswordFieldValidate': 'Nhập sai mật khẩu hiện tại!',
      'NewPassword': 'Mật khẩu mới',
      'NewPasswordFieldHint': 'Nhập mật khẩu mới',
      'ConfirmNewPassword': 'Xác nhận mật khẩu mới',
      'ConfirmNewPasswordFieldHint': 'Nhập lại mật khẩu mới',
      'ConfirmPasswordCannotEmpty': 'Xác nhận mật khẩu không thể bỏ trống!',
      'ConfirmPasswordDidntMatch': 'Không khớp với mật khẩu mới ở trên. Vui lòng kiểm tra lại!',
      'WrongPassword': 'Sai Mật Khẩu',
      'WrongPasswordMessage': 'Nhập sai mật khẩu hiện tại. Vui lòng kiểm tra lại!',
      'ChangePasswordTitle': 'Đổi Mật Khẩu',
      'ChangePasswordMessage': 'Bạn xác nhận muốn đổi mật khẩu tài khoản?',
      'SuccessfullyChangedPassword': 'Thay đổi mật khẩu thành công. Vui lòng đăng nhập lại!',

      // Notification
      'SuccessfullyBookedTicket': 'Đặt Vé Thành Công!',
      'SuccessfullyBookedTicketMessage': 'Vé đã được thêm vào tài khoản, hãy kiểm tra vé ở mục \'Lịch sử đặt vé\'.',
      'RemindFlight': 'Đừng Quên Chuyến Bay Vào Ngày Mai Của Bạn!',
      'RemindFlightMessage1': 'Chuyến bay ',
      'RemindFlightMessage2': ' của bạn sẽ khởi hành vào ngày mai ',
      'RemindFlightMessage3': ' lúc ',

    },

  };

}