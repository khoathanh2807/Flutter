import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../controllers/flight_controller.dart';
import '../../models/flight.dart';

class FlightScreen extends StatefulWidget {

  @override
  State<FlightScreen> createState() => FlightScreenState();

}

class FlightScreenState extends State<FlightScreen> {

  final _formKey = GlobalKey<FormState>();

  final flightIdController = TextEditingController();
  final departureLocationNameController = TextEditingController();
  final departureLocationSymbolController = TextEditingController();
  final arrivalLocationNameController = TextEditingController();
  final arrivalLocationSymbolController = TextEditingController();
  final departureDateController = TextEditingController();
  final departureTimeController = TextEditingController();
  final arrivalDateController = TextEditingController();
  final arrivalTimeController = TextEditingController();
  final flightTimeDurationController = TextEditingController();
  final economyRemainingSeatsController = TextEditingController();
  final economyTicketPriceController = TextEditingController();
  final businessRemainingSeatsController = TextEditingController();
  final businessTicketPriceController = TextEditingController();

  var flightIdClearButtonVisible = false;
  var departureLocationNameClearButtonVisible = false;
  var departureLocationSymbolClearButtonVisible = false;
  var arrivalLocationNameClearButtonVisible = false;
  var arrivalLocationSymbolClearButtonVisible = false;
  var departureDateClearButtonVisible = false;
  var departureTimeClearButtonVisible = false;
  var arrivalDateClearButtonVisible = false;
  var arrivalTimeClearButtonVisible = false;
  var flightTimeDurationClearButtonVisible = false;
  var economyRemainingSeatsClearButtonVisible = false;
  var economyTicketPriceClearButtonVisible = false;
  var businessRemainingSeatsClearButtonVisible = false;
  var businessTicketPriceClearButtonVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add New Flight', style: TextStyle(fontWeight: FontWeight.w600,),),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(17),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 35,),

                flightIdField(),

                IconButton(
                  icon: const Icon(Icons.swap_horiz_outlined, size: 28,),
                  onPressed: () {
                    setState(() {
                      String tempLocationName = departureLocationNameController.text;
                      String tempLocationSymbol = departureLocationSymbolController.text;
                      departureLocationNameController.text = arrivalLocationNameController.text;
                      departureLocationSymbolController.text = arrivalLocationSymbolController.text;
                      arrivalLocationNameController.text = tempLocationName;
                      arrivalLocationSymbolController.text = tempLocationSymbol;
                    });
                  },
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          departureLocationNameField(),
                          const SizedBox(height: 20,),

                          departureLocationSymbolField(),
                          const SizedBox(height: 20,),

                          departureDateField(),
                          const SizedBox(height: 20,),

                          departureTimeField(),

                        ],
                      ),
                    ),
                    const SizedBox(width: 12,),

                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          arrivalLocationNameField(),
                          const SizedBox(height: 20,),

                          arrivalLocationSymbolField(),
                          const SizedBox(height: 20,),

                          arrivalDateField(),
                          const SizedBox(height: 20,),

                          arrivalTimeField(),


                        ],
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 20,),

                flightTimeDurationField(),
                const SizedBox(height: 20,),

                economyRemainingSeatsField(),
                const SizedBox(height: 20,),

                economyTicketPriceField(),
                const SizedBox(height: 20,),

                businessRemainingSeatsField(),
                const SizedBox(height: 20,),

                businessTicketPriceField(),
                const SizedBox(height: 35,),

                confirmButton(),

                const SizedBox(height: 35,),

              ],
            ),
          ),
        ),
      ),

    );
  }

  Widget flightIdField() {

    return TextFormField(

      controller: flightIdController,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: flightIdClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                flightIdController.clear();
                flightIdClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Flight ID',
        hintText: 'Enter Flight ID',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          flightIdController.text.isNotEmpty ? flightIdClearButtonVisible = true : flightIdClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget departureLocationNameField() {

    return TextFormField(

      controller: departureLocationNameController,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: departureLocationNameClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                departureLocationNameController.clear();
                departureLocationNameClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Departure location name',
        hintText: 'Enter Departure location name',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          departureLocationNameController.text.isNotEmpty ? departureLocationNameClearButtonVisible = true : departureLocationNameClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget departureLocationSymbolField() {

    return TextFormField(

      controller: departureLocationSymbolController,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: departureLocationSymbolClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                departureLocationSymbolController.clear();
                departureLocationSymbolClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Departure location symbol',
        hintText: 'Enter Departure location symbol',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          departureLocationSymbolController.text.isNotEmpty ? departureLocationSymbolClearButtonVisible = true : departureLocationSymbolClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget arrivalLocationNameField() {

    return TextFormField(

      controller: arrivalLocationNameController,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: arrivalLocationNameClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                arrivalLocationNameController.clear();
                arrivalLocationNameClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Arrival location name',
        hintText: 'Enter Arrival location name',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          arrivalLocationNameController.text.isNotEmpty ? arrivalLocationNameClearButtonVisible = true : arrivalLocationNameClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget arrivalLocationSymbolField() {

    return TextFormField(

      controller: arrivalLocationSymbolController,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: arrivalLocationSymbolClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                arrivalLocationSymbolController.clear();
                arrivalLocationSymbolClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Arrival location symbol',
        hintText: 'Enter Arrival location symbol',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          arrivalLocationSymbolController.text.isNotEmpty ? arrivalLocationSymbolClearButtonVisible = true : arrivalLocationSymbolClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget departureDateField() {

    return TextFormField(

      controller: departureDateController,
      keyboardType: TextInputType.datetime,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: departureDateClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                departureDateController.clear();
                departureDateClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Departure date',
        hintText: 'Enter Departure date',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          departureDateController.text.isNotEmpty ? departureDateClearButtonVisible = true : departureDateClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget departureTimeField() {

    return TextFormField(

      controller: departureTimeController,
      keyboardType: TextInputType.datetime,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: departureTimeClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                departureTimeController.clear();
                departureTimeClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Departure time',
        hintText: 'Enter Departure time',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          departureTimeController.text.isNotEmpty ? departureTimeClearButtonVisible = true : departureTimeClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget arrivalDateField() {

    return TextFormField(

      controller: arrivalDateController,
      keyboardType: TextInputType.datetime,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: arrivalDateClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                arrivalDateController.clear();
                arrivalDateClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Arrival date',
        hintText: 'Enter Arrival date',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          arrivalDateController.text.isNotEmpty ? arrivalDateClearButtonVisible = true : arrivalDateClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget arrivalTimeField() {

    return TextFormField(

      controller: arrivalTimeController,
      keyboardType: TextInputType.datetime,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: arrivalTimeClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                arrivalTimeController.clear();
                arrivalTimeClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Arrival time',
        hintText: 'Enter Arrival time',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          arrivalTimeController.text.isNotEmpty ? arrivalTimeClearButtonVisible = true : arrivalTimeClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget flightTimeDurationField() {

    return TextFormField(

      controller: flightTimeDurationController,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: flightTimeDurationClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                flightTimeDurationController.clear();
                flightTimeDurationClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Flight time duration',
        hintText: 'Enter Flight time duration',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          flightTimeDurationController.text.isNotEmpty ? flightTimeDurationClearButtonVisible = true : flightTimeDurationClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget economyRemainingSeatsField() {

    return TextFormField(

      controller: economyRemainingSeatsController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: economyRemainingSeatsClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                economyRemainingSeatsController.clear();
                economyRemainingSeatsClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Economy remaining seats',
        hintText: 'Enter Economy remaining seats',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          economyRemainingSeatsController.text.isNotEmpty ? economyRemainingSeatsClearButtonVisible = true : economyRemainingSeatsClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget economyTicketPriceField() {

    return TextFormField(

      controller: economyTicketPriceController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: economyTicketPriceClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                economyTicketPriceController.clear();
                economyTicketPriceClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Economy ticket price',
        hintText: 'Enter Economy ticket price',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          economyTicketPriceController.text.isNotEmpty ? economyTicketPriceClearButtonVisible = true : economyTicketPriceClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget businessRemainingSeatsField() {

    return TextFormField(

      controller: businessRemainingSeatsController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: businessRemainingSeatsClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                businessRemainingSeatsController.clear();
                businessRemainingSeatsClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Business remaining seats',
        hintText: 'Enter Business remaining seats',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          businessRemainingSeatsController.text.isNotEmpty ? businessRemainingSeatsClearButtonVisible = true : businessRemainingSeatsClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget businessTicketPriceField() {

    return TextFormField(

      controller: businessTicketPriceController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: businessTicketPriceClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                businessTicketPriceController.clear();
                businessTicketPriceClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Business ticket price',
        hintText: 'Enter Business ticket price',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          businessTicketPriceController.text.isNotEmpty ? businessTicketPriceClearButtonVisible = true : businessTicketPriceClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget confirmButton() {

    return ElevatedButton(

      child: Text('Confirm', style: TextStyle(fontWeight: FontWeight.bold,),),

      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
      ),

      onPressed: () async {
        FocusScope.of(context).unfocus();
        if(_formKey.currentState!.validate()) {

          final newFlight = Flight(
              id: flightIdController.text,
              departureLocationName: departureLocationNameController.text,
              departureLocationSymbol: departureLocationSymbolController.text,
              arrivalLocationName: arrivalLocationNameController.text,
              arrivalLocationSymbol: arrivalLocationSymbolController.text,
              departureDate: departureDateController.text,
              departureTime: departureTimeController.text,
              arrivalDate: arrivalDateController.text,
              arrivalTime: arrivalTimeController.text,
              flightTimeDuration: flightTimeDurationController.text,
              economyRemainingSeats: int.parse(economyRemainingSeatsController.text),
              economyTicketPrice: int.parse(economyTicketPriceController.text),
              businessRemainingSeats: int.parse(businessRemainingSeatsController.text),
              businessTicketPrice: int.parse(businessTicketPriceController.text),
          );

          await FlightController().createFlight(newFlight).whenComplete(() {
            Fluttertoast.showToast(msg: 'Successfully Created New Flight!', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue, timeInSecForIosWeb: 3,);
          }).catchError((error) {
            Fluttertoast.showToast(msg: 'Error: $error', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red, timeInSecForIosWeb: 5,);
          });

        }
      },

    );

  }

}