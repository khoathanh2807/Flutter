import 'dart:async';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../inherited_widget.dart';
import '../../models/significant_destination.dart';
import '../../models/event.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }

}

class HomeScreenState extends State<StatefulWidget> {

  final currentUser = FirebaseAuth.instance.currentUser;
  String photoURL = '';

  List significantDestinations = [
    SignificantDestination(
        name: 'Phú Quốc',
        photoURL: 'https://vcdn1-dulich.vnecdn.net/2020/07/13/shutterstock-1189128544-baisao-1594632095.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=A49Bc0GGy2i-jyVqv7nq9w',
    ),
    SignificantDestination(
      name: 'Đà Nẵng',
      photoURL: 'https://datphongmuongthanh.com/wp-content/uploads/2021/10/danang3.jpg',
    ),
    SignificantDestination(
      name: 'Vân Đồn',
      photoURL: 'https://nld.mediacdn.vn/2020/2/19/vandon2-158207774954339849749.jpg',
    ),
    SignificantDestination(
      name: 'Hà Nội',
      photoURL: 'https://owa.bestprice.vn/images/destinations/uploads/trung-tam-thanh-pho-ha-noi-603da1f235b38.jpg',
    ),
    SignificantDestination(
      name: 'TP. Hồ Chí Minh',
      photoURL: 'https://www.traveldailymedia.com/assets/2020/10/shutterstock_175128359.jpg',
    ),
    SignificantDestination(
      name: 'Nha Trang',
      photoURL: 'https://baokhanhhoa.vn/dataimages/202202/original/images5492543_NR1.jpg',
    ),
    SignificantDestination(
      name: 'Buôn Ma Thuộc',
      photoURL: 'https://havicotour.com.vn/wp-content/uploads/2020/06/buonmethuot.jpg',
    ),
    SignificantDestination(
      name: 'Vinh',
      photoURL: 'https://titangroup.vn/wp-content/uploads/dau-tu-thi-truong-vinh-nghe-an.jpg',
    ),
  ];

  final PageController promotionPagecontroller = PageController();
  int _currentPromotionPage = 0;

  final List<Event> promotionList = [
    Event(
      image: 'assets/images/bamboairways1.png',
    ),
    Event(
      image: 'assets/images/bamboairways2.png' ,
    ),
    Event(
      image: 'assets/images/bamboairways3.png',
    ),
  ];

  @override
  void initState() {

    Timer.periodic(const Duration(seconds: 15), (Timer timer) {

      if(_currentPromotionPage > 3) {
        _currentPromotionPage = promotionPagecontroller.initialPage;
      }
      else {
        _currentPromotionPage++;
      }

      if(promotionPagecontroller.hasClients) {
        promotionPagecontroller.animateToPage(_currentPromotionPage, duration: const Duration(seconds: 1), curve: Curves.ease,);
      }

    });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    if (currentUser!.photoURL != null) {
      photoURL = currentUser!.photoURL!;
    }

    var bottomNavBar = InheritedBottomNavBar.of(context)!.bottomNavBar;

    return Scaffold(

        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[200],

        appBar: AppBar(
          // elevation: 0,
          toolbarHeight: 65,
          title: Row(
            children: const [
              SizedBox(width: 10,),
              Icon(LineIcons.planeDeparture, size: 45,),
              SizedBox(width: 15,),
              Text('5 Stars Airline', style: TextStyle(fontWeight: FontWeight.w600,),),
            ],
          ),
          actions: [
            GestureDetector(
                child: CircleAvatar(
                  radius: 13,
                  // backgroundColor: Colors.white38,
                  // child: Padding(
                  //   padding: const EdgeInsets.all(0.5), // Border radius
                  child: ClipOval(
                    child: Image.network(photoURL != '' ? photoURL : 'http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png',),
                  ),
                  // ),
                ),
                // child: Container(
                //   width: 26,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     image: DecorationImage(
                //       image: NetworkImage(photoURL != '' ? photoURL : 'http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
                //       fit: BoxFit.contain,
                //     ),
                //   ),
                // ),
                onTap: (){
                  bottomNavBar.onTap!(2);
                },
            ),
            // IconButton(
            //   tooltip: 'Notifications',
            //   icon: const Icon(Icons.notifications_none_rounded, size: 26,),
            //   onPressed: () {
            //   },
            // ),
            SizedBox(width: 20,),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Image.network('https://www.moneysavingexpert.com/content/dam/mse/editorial-image-library/guide-images/hero-images/hero-travel-cheap-flights.jpg.rendition.992.992.jpg',),
              SizedBox(height: 22,),

              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 18, horizontal: 45,),),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.airplane_ticket_rounded),
                    SizedBox(width: 10,),
                    Text('Đặt vé ngay hôm nay!', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17,),),
                    SizedBox(width: 10,),
                    Icon(Icons.double_arrow_rounded),
                  ],
                ),
                onPressed: () {
                  bottomNavBar.onTap!(1);
                },
              ),
              SizedBox(height: 25,),

              Row(
                children: [
                  SizedBox(width: 25),
                  Text("Điểm đến nổi bật", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Theme.of(context).primaryColor,),),
                ],
              ),
              SizedBox(height: 15,),

              SizedBox(
                height: 275,
                child: ListView.builder(

                  padding: EdgeInsets.symmetric(horizontal: 12,),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,   // make ListView to use a little space as possible

                  itemCount: significantDestinations.length,
                  itemBuilder: (BuildContext context, int index) {

                    String sdName = significantDestinations[index].name;
                    String sdPhotoURL = significantDestinations[index].photoURL;

                    return Container(

                      margin: const EdgeInsets.symmetric(horizontal: 8,),
                      width: 160,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        image: DecorationImage(
                          image: NetworkImage(sdPhotoURL),
                          fit: BoxFit.cover,
                        ),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          Padding(
                            padding: EdgeInsets.only(bottom: 75, right: 12,),
                            child: Text(sdName, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Colors.white, backgroundColor: Colors.grey.withOpacity(0.3),),),
                          ),

                        ],
                      ),

                    );

                  },

                ),
              ),
              SizedBox(height: 25,),

              Row(
                children: [
                  SizedBox(width: 25),
                  Text("Khuyến mãi dành cho bạn", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Theme.of(context).primaryColor,),),
                ],
              ),
              SizedBox(height: 15,),

              SizedBox(
                  height: 125,
                  child: PageView.builder(
                      controller: promotionPagecontroller,
                      scrollDirection: Axis.horizontal,
                      itemCount: promotionList.length,
                      itemBuilder: (context, index){
                        return Image.asset(promotionList[index].image, width: MediaQuery.of(context).size.width*0.9,);
                      },
                      onPageChanged: (index){
                        _currentPromotionPage = index;
                      },
                  ),
              ),

              SmoothPageIndicator(
                controller: promotionPagecontroller,
                count: promotionList.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 5,
                  dotWidth: 5,
                  activeDotColor: Theme.of(context).primaryColor,
                  dotColor: Colors.grey.withOpacity(0.5),
                ),
                onDotClicked: (index) => promotionPagecontroller.animateToPage(index, duration: const Duration(seconds: 1), curve: Curves.ease,),
              ),
              SizedBox(height: 25,),

            ],
          ),
        ),

    );

  }

  @override
  void dispose() {
    promotionPagecontroller.dispose();
    super.dispose();
  }

}