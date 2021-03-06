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
      'Settings': 'C??i ?????t',
      'AppLanguage': '?????i ng??n ng??? ???ng d???ng',     // Change language option
      'SelectLanguage': 'Ch???n Ng??n Ng???',
      'English': 'Ti???ng Anh',
      'Vietnamese': 'Ti???ng Vi???t',
      'ChangeLanguage': '?????i Ng??n Ng???',
      'ChangeLanguageMessage': 'B???n x??c nh???n mu???n thay ?????i ng??n ng??? ???ng d???ng?',
      'SuccessfullyChangedLanguage': 'Thay ?????i ng??n ng??? th??nh c??ng',
      'CancelAllFlightNotifications': 'Hu??? th??ng b??o chuy???n bay s???p t???i',     // Cancel notifications option
      'CancelNotification': 'Hu??? Th??ng B??o',
      'CancelNotificationMessage1': 'B???n c?? x??c nh???n mu???n hu??? t???t c??? ',
      'CancelNotificationMessage2': ' th??ng b??o nh???c l???ch c??c chuy???n bay s???p t???i?',
      'NoNotification': 'Kh??ng C?? Th??ng B??o!',
      'NoNotificationMessage': 'B???n kh??ng c?? th??ng b??o n??o ??ang b???t ????? nh???c l???ch chuy???n bay s???p t???i',
      'SuccessfullyCanceledNotification': '???? hu??? t???t c??? th??ng b??o nh???c l???ch chuy???n bay',
      'ChangeAccountPassword': '?????i m???t kh???u t??i kho???n',      // Change password option
      'SignOut': '????ng xu???t',     // Sign out option
      'SignOutTitle': '????ng Xu???t',
      'SignOutMessage': 'B???n x??c nh???n mu???n ????ng xu???t t??i kho???n?',
      'SuccessfullySignedOut': '????ng xu???t t??i kho???n th??nh c??ng',

      // Home Screen
      'HomeScreen': 'Trang ch???',
      'BookingNow': '?????t v?? ngay h??m nay!',
      'SignificantDestinations': '??i???m ?????n n???i b???t',
      'Promotion': 'Khuy???n m??i d??nh cho b???n',

      // Booking Screen
      'BookingTicket': '?????t v??',
      'RoundTrip': 'Kh??? h???i',
      'OneWay': 'M???t chi???u',
      'EmptyLocationList': 'Hi???n t???i danh s??ch s??n bay ??ang tr???ng!',
      'ReturnDate': 'Ng??y v???',
      'DepartureDateFieldHint': 'Nh???p ng??y bay ??i',
      'ReturnDateFieldHint': 'Nh???p ng??y bay v???',
      'DateFieldValidate': 'Vui l??ng nh???p ng??y h???p l???',
      'Passenger': 'Kh??ch h??ng',
      'Adult': 'Ng?????i l???n',
      'AdultAge': 'T??? 12 tu???i',
      'Child': 'Tr??? em',
      'ChildAge': 'T??? 2 ?????n 11 tu???i',
      'Infant': 'Em b??',
      'InfantAge': 'D?????i 2 tu???i',
      'PromotionCode': 'M?? gi???m gi??',
      'SearchFlight': 'T??m chuy???n bay',

      // Select Flight Time Screen
      'DepartureFlight': 'Chuy???n ??i',
      'ReturnFlight': 'Chuy???n v???',
      'Date': 'Ng??y',
      'TicketPriceNote': 'Gi?? tr??n m???t h??nh kh??ch v?? ch??a bao g???m thu???, ph??',
      'PriceFrom': 'Gi?? t???',
      'EmptyFlightList': 'Chuy???n bay c???n t??m hi???n kh??ng t???n t???i.\nVui l??ng t??m ki???m chuy???n bay kh??c!',
      'SoldOut': 'H???t v??',
      'RemainSeats': 'C??n @seatAmount gh???',
      'NotEnoughSeats': 'Kh??ng ????? Gh???!',
      'NotEnoughSeatsMessage': 'Chuy???n bay v???a ch???n kh??ng c??n ????? gh??? cho s??? l?????ng h??nh kh??ch b???n nh???p',

      // Payment Screen
      'Payment': 'Thanh to??n',
      'FlightInformation': 'Th??ng tin chuy???n bay',
      'DepartureFlightInformation': 'Th??ng tin chuy???n bay ??i',
      'ReturnFlightInformation': 'Th??ng tin chuy???n bay v???',
      'PassengerInformation': 'Th??ng tin h??nh kh??ch',
      'PriceDetails': 'Chi ti???t gi??',
      'PassengerAmount': 'S??? h??nh kh??ch',
      'DepartureFlight2': 'Chuy???n bay ??i',
      'ReturnFlight2': 'Chuy???n bay v???',
      'TicketClass': 'V?? @seatClass',
      'AdultTicketPrice': 'Gi?? v?? Ng?????i l???n',
      'ChildTicketPrice': 'Gi?? v?? Tr??? em',
      'InfantTicketPrice': 'Gi?? v?? Em b??',
      'TotalPrice': 'T???ng chi ph??',
      'TermsConditionsBooking': 'T??i ?????ng ?? v???i ??i???u kho???n v?? ??i???u ki???n ?????t v??',
      'PaymentTitle': 'Thanh To??n',
      'PaymentMessage': 'B???n x??c nh???n Th??ng tin v?? v?? Th??ng tin h??nh kh??ch ???? ch??nh x??c?\nTi???n h??nh thanh to??n ngay.',
      'SuccessfullyPayment': 'Thanh to??n th??nh c??ng!',

      // Account Screen
      'Account': 'T??i kho???n',
      'ProfileInformation': 'Th??ng tin c?? nh??n',
      'BookingHistory': 'L???ch s??? ?????t v??',
      // Profile
      'FullName': 'H??? t??n',     // Name field
      'FullNameFieldHint': 'Nh???p ?????y ????? h??? t??n',
      'EmptyFieldValidate': 'Vui l??ng nh???p ?????y ????? th??ng tin',
      'Birthdate': 'Ng??y sinh',     // Birthdate field
      'BirthdateFieldHint': 'Nh???p ng??y sinh',
      'BirthdateFieldValidate': 'Vui l??ng nh???p ng??y sinh h???p l???',
      'Gender': 'Gi???i t??nh',      // Gender field
      'GenderFieldHint': 'Ch???n gi???i t??nh',
      'Male': 'Nam',
      'Female': 'N???',
      'EmailFieldHint': 'Nh???p email',     // Email field
      'PhoneNumber': 'S??? ??i???n tho???i',     // Phone number field
      'PhoneNumberFieldHint': 'Nh???p s??? ??i???n tho???i',
      'Edit': 'Ch???nh s???a',
      'AccuracyAgreement': 'T??i x??c nh???n c??c th??ng tin b???n th??n cung c???p l?? ch??nh x??c v?? ho??n to??n ch???u tr??ch nu cung c???p th??ng tin sai l???ch',
      'Cancel': 'Hu???',
      'Confirm': 'X??c nh???n',
      'Save': 'L??u',
      'EditInformation': 'Ch???nh S???a Th??ng Tin',
      'EditInformationMessage': 'B???n x??c nh???n mu???n ch???nh s???a th??ng tin t??i kho???n?',
      'SuccessfullyEditedInformation': 'C???p nh???t th??ng tin t??i kho???n th??nh c??ng',
      // Booking History
      'Loading': '??ang t???i...',
      'EmptyHistory': 'B???n ch??a ?????t v?? m??y bay n??o!',
      'DepartureDate': 'Ng??y ??i',
      'DepartureTime': 'V??o l??c',
      'SeatClass': 'H???ng gh???',

      // Ticket Detail Screen
      'TicketDetails': 'Th??ng tin chi ti???t v??',
      'TicketID': 'M?? s??? v??',
      'DepartureLocation': '??i???m ??i',
      'ArrivalLocation': '??i???m ?????n',
      'FlightID': 'M?? s??? chuy???n bay',
      'TicketType': 'Lo???i v??',
      'TicketPrice': 'Gi?? v??',
      'Amount': 'S??? l?????ng',
      'Ticket': ' v??',

      // Change Password Screen
      'ChangePassword': '?????i m???t kh???u',
      'ShowPassword': 'Hi???n m???t kh???u',
      'CurrentPassword': 'M???t kh???u hi???n t???i',
      'CurrentPasswordFieldHint': 'Nh???p m???t kh???u hi???n t???i',
      'CurrentPasswordFieldValidate': 'Nh???p sai m???t kh???u hi???n t???i!',
      'NewPassword': 'M???t kh???u m???i',
      'NewPasswordFieldHint': 'Nh???p m???t kh???u m???i',
      'ConfirmNewPassword': 'X??c nh???n m???t kh???u m???i',
      'ConfirmNewPasswordFieldHint': 'Nh???p l???i m???t kh???u m???i',
      'ConfirmPasswordCannotEmpty': 'X??c nh???n m???t kh???u kh??ng th??? b??? tr???ng!',
      'ConfirmPasswordDidntMatch': 'Kh??ng kh???p v???i m???t kh???u m???i ??? tr??n. Vui l??ng ki???m tra l???i!',
      'WrongPassword': 'Sai M???t Kh???u',
      'WrongPasswordMessage': 'Nh???p sai m???t kh???u hi???n t???i. Vui l??ng ki???m tra l???i!',
      'ChangePasswordTitle': '?????i M???t Kh???u',
      'ChangePasswordMessage': 'B???n x??c nh???n mu???n ?????i m???t kh???u t??i kho???n?',
      'SuccessfullyChangedPassword': 'Thay ?????i m???t kh???u th??nh c??ng. Vui l??ng ????ng nh???p l???i!',

      // Notification
      'SuccessfullyBookedTicket': '?????t V?? Th??nh C??ng!',
      'SuccessfullyBookedTicketMessage': 'V?? ???? ???????c th??m v??o t??i kho???n, h??y ki???m tra v?? ??? m???c \'L???ch s??? ?????t v??\'.',
      'RemindFlight': '?????ng Qu??n Chuy???n Bay V??o Ng??y Mai C???a B???n!',
      'RemindFlightMessage1': 'Chuy???n bay ',
      'RemindFlightMessage2': ' c???a b???n s??? kh???i h??nh v??o ng??y mai ',
      'RemindFlightMessage3': ' l??c ',

    },

  };

}