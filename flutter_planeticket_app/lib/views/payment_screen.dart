import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './platform_alert.dart';

class PaymentScreen extends StatefulWidget {

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();

}

class _PaymentScreenState extends State<PaymentScreen> {

  final currentUser = FirebaseAuth.instance.currentUser;
  String displayName = '';
  String email = '';

  String gender = 'Chọn giới tính';
  String phoneNumber =  '(+84) ';

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool termsAgreement = false;

  @override
  void initState() {

    if (currentUser!.displayName != null) {
      displayName = currentUser!.displayName!;
    }

    getName().whenComplete(() {}).then((value) => displayName = value!);

    if (currentUser!.email != null) {
      email = currentUser!.email!;
    }

    getGender().whenComplete(() {}).then((value) => gender = value!);

    getPhoneNumber().whenComplete(() {}).then((value) => phoneNumber = value!);

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        // elevation: 0,
        centerTitle: true,
        title: Text('Thanh toán', style: TextStyle(fontWeight: FontWeight.w600,),),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15,),
        child: Column(
            children: [

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15,),
                  decoration: const BoxDecoration(
                        color: Colors.white,
                        // shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        // border: Border.all(width: 1, color: Theme.of(context).primaryColor, style: BorderStyle.solid,),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 3,
                            offset: Offset(5, 5),
                          )
                        ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('Thông tin chuyến bay', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                      SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text('Điểm đi', style: TextStyle(fontStyle: FontStyle.italic,),),
                              SizedBox(height: 12,),
                              Text('Th 6, 01.07.2022', style: TextStyle(fontWeight: FontWeight.w500,),),
                              SizedBox(height: 5,),
                              Text('05:35', style: TextStyle(fontWeight: FontWeight.bold,),),
                              SizedBox(height: 5,),
                              Text('Ho Chi Minh City', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                            ],
                          ),
                          Column(
                            children: const [
                              Text('2h30p', style: TextStyle(fontSize: 13,),),
                              SizedBox(height: 6,),
                              Icon(FontAwesomeIcons.plane, size: 20,),   // color: Theme.of(context).primaryColor,
                            ],
                          ),
                          Column(
                            children: const [
                              Text('Điểm đến', style: TextStyle(fontStyle: FontStyle.italic,),),
                              SizedBox(height: 12,),
                              Text('Th 6, 01.07.2022', style: TextStyle(fontWeight: FontWeight.w500,),),
                              SizedBox(height: 5,),
                              Text('08:05', style: TextStyle(fontWeight: FontWeight.bold,),),
                              SizedBox(height: 5,),
                              Text('Hanoi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15,),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    // shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    // border: Border.all(width: 1, color: Theme.of(context).primaryColor, style: BorderStyle.solid,),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 3,
                        offset: Offset(5, 5),
                      )
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('Thông tin hành khách', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                        SizedBox(height: 15,),

                        genderField(),
                        SizedBox(height: 20,),

                        nameField(),
                        SizedBox(height: 20,),

                        emailField(),
                        SizedBox(height: 20,),

                        phoneNumberField(),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15,),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    // shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    // border: Border.all(width: 1, color: Theme.of(context).primaryColor, style: BorderStyle.solid,),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 3,
                        offset: Offset(5, 5),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('Chi tiết giá', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                      SizedBox(height: 12,),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: const [
                      //     Text('Ho Chi Minh City',),
                      //     Icon(FontAwesomeIcons.plane, color: Colors.black, size: 16,),
                      //     Text('Hanoi',),
                      //   ],
                      // ),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),
                      SizedBox(height: 13,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Giá vé',),
                          Text('1,990,000 VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                        ],
                      ),
                      SizedBox(height: 12,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('VAT',),
                          Text('199,000 VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                        ],
                      ),
                      SizedBox(height: 12,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),
                      SizedBox(height: 13,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Tổng chi phí', style: TextStyle(fontWeight: FontWeight.bold,),),
                          Text('2,189,000 VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10,),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 3,
                          offset: Offset(5, 5),
                        )
                      ],
                    ),
                    child: CheckboxListTile(

                        title: Text('Tôi đồng ý với Điều khoản và Điều kiện đặt vé', style: TextStyle(fontSize: 14,),),

                        contentPadding: EdgeInsets.zero,
                        activeColor: Theme.of(context).colorScheme.primary,
                        controlAffinity: ListTileControlAffinity.leading,
                        visualDensity: VisualDensity(horizontal: -4,),

                        value: termsAgreement,

                        onChanged: (newValue) {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            termsAgreement = newValue!;
                          });
                        },

                    ),
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                      ElevatedButton(
                          child: Text('Huỷ', style: TextStyle(color: Theme.of(context).primaryColor,),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white,),
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 13, horizontal: MediaQuery.of(context).size.width*0.18,),),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: Theme.of(context).primaryColor, width: 0.5, style: BorderStyle.solid,),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                      ),
                      ElevatedButton(
                        child: Text('Xác nhận', style: TextStyle(fontWeight: FontWeight.bold,),),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 13, horizontal: MediaQuery.of(context).size.width*0.14,),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
                        ),
                        onPressed: !termsAgreement ? null : () {
                          FocusScope.of(context).unfocus();
                          if(_formKey.currentState!.validate()) {
                            const paymentAlert = PlatformAlert(
                              title: 'Thanh Toán',
                              message: 'Bạn xác nhận Thông tin vé và Thông tin hành khách đã chính xác?\nTiến hành thanh toán.',
                            );
                            paymentAlert.showPaymentAlert(context);
                          }
                        },
                      ),
                  ],
                ),
                SizedBox(height: 25,),

            ],
        ),
      ),

    );

  }

  Future<String?> getName() async {
    String? _userName;
    await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).get().then((value) {
      _userName = value.get('username').toString();
    });
    setState(() {
    });
    return _userName;
  }

  Future<String?> getGender() async {
    String? _gender;
    await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).get().then((value) {
      _gender = value.get('gender').toString();
    });
    setState(() {
    });
    return _gender;
  }

  Future<String?> getPhoneNumber() async {
    String? _phoneNumber;
    await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).get().then((value) {
      _phoneNumber = value.get('phoneNumber').toString();
    });
    setState(() {
    });
    return _phoneNumber;
  }

  Widget genderField() {

    var genders = [
      'Chọn giới tính',
      'Nam',
      'Nữ',
    ];

    return  DropdownButtonFormField(

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wc),
        labelText: 'Giới tính',
        hintText: 'Chọn giới tính',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 8,),
      ),
      borderRadius: BorderRadius.circular(12),
      dropdownColor: Colors.grey[200],

      value: gender,

      items: genders.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),

      validator: (value) {
        if (value == '' || value == null || value == 'Chọn giới tính') {
          return 'Vui lòng nhập đầy đủ thông tin';
        }
        return null;
      },

      onChanged: (value) {
        setState(() {
          gender = value as String;
        });
      },

    );

  }

  Widget nameField() {

    nameController.text = displayName;

    return TextFormField(

      controller: nameController,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'Họ tên',
        hintText: 'Nhập đầy đủ họ tên',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 8,),
      ),

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null) {
          return 'Vui lòng nhập đầy đủ thông tin';
        }
        return null;
      },

      onChanged: (value) {
        displayName = value;
      },

    );

  }

  Widget emailField() {

    emailController.text = email;

    return TextFormField(

      readOnly: true,

      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email,),
        labelText: 'Email',
        hintText: 'Nhập email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 8,),
      ),

    );

  }

  Widget phoneNumberField() {

    phoneNumberController.text = phoneNumber;

    return TextFormField(

      controller: phoneNumberController,
      keyboardType: TextInputType.phone,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        labelText: 'Số điện thoại',
        hintText: 'Nhập số điện thoại',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 8,),
      ),

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null ||  value == '(+84) ') {
          return 'Vui lòng nhập đầy đủ thông tin';
        }
        return null;
      },

      onChanged: (value) {
        phoneNumber = value;
      },

    );

  }

}
