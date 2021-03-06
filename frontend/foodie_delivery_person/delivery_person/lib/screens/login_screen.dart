import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:location/location.dart' as loc;

// import '../datamodels/user_location.dart';
import '../providers/auth_provider.dart';
import './homepage_screen.dart';
import 'passwordchangescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isloading = false;
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  String phoneNumber = '';
  final numbercontroller = TextEditingController();
  String password = '';
  final passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // location();
  }

  // Future<void> location() async {
  //   try{
  //   final locationData = await loc.Location().getLocation();
  //   print(locationData.latitude);
  //   print(locationData.longitude);
  //   }catch(e){
  //     print(e);
  //   }
  // }

  Future<void> submit(String phoneNumber, String password) async {
    try {
      setState(() {
        _isloading = true;
      });

      await Provider.of<Auth>(context, listen: false)
          .login(phoneNumber, password);
      if (Provider.of<Auth>(context, listen: false).isAuth) {
        if (Provider.of<Auth>(context, listen: false).isNewuser) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    const PasswordChangeScreen()),
            ModalRoute.withName(PasswordChangeScreen.routeName),
          );
          setState(() {
            _isloading = false;
          });
        } else {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const HomepageScreen()),
            ModalRoute.withName(HomepageScreen.routeName),
          );
          setState(() {
            _isloading = false;
          });
        }
      } else {
        print('me');
        setState(() {
          _isloading = false;
          showDialog(
              context: context,
              builder: (c) {
                return AlertDialog(
                  title: const Text('Invalid OTP'),
                  content: const Text('You enterned an invalid otp.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(c).pop();
                      },
                      child: const Text('OK'),
                    )
                  ],
                );
              });
        });
      }
    } catch (error) {
      print(error);
      setState(() {
        _isloading = false;
      });

      throw error;
    }
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    // var userLocation = Provider.of<UserLocation>(context);
    return _isloading
        ? Scaffold(
            body: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Center(child: CircularProgressIndicator())),
          )
        : Scaffold(
            backgroundColor: const Color(0xFFEEEEEE),
            body: Stack(
              children: <Widget>[
                Positioned(
                  right: -getSmallDiameter(context) / 5,
                  top: -getSmallDiameter(context) / 6,
                  child: Container(
                    width: getSmallDiameter(context),
                    height: getSmallDiameter(context),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(225, 255, 255, 255),
                              Color.fromARGB(255, 248, 208, 208)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ),
                Positioned(
                  left: -getBiglDiameter(context) / 6,
                  top: -getBiglDiameter(context) / 7,
                  child: Container(
                    child: Center(
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    width: getBiglDiameter(context),
                    height: getBiglDiameter(context),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(255, 248, 208, 208)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ),
                Positioned(
                  right: -getBiglDiameter(context) / 2,
                  bottom: -getBiglDiameter(context) / 2,
                  child: Container(
                    width: getBiglDiameter(context),
                    height: getBiglDiameter(context),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 248, 208, 208)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                validator: (value) {
                                  if (!value!.startsWith('9') ||
                                      value.isEmpty ||
                                      value.length != 10) {
                                    return 'Please enter valid phone number';
                                  }
                                  return null;
                                },
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    counterText: '',
                                    icon: const Icon(
                                      Icons.phone_android_sharp,
                                      color: Color(0xFFD42323),
                                    ),
                                    border: UnderlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade500)),
                                    labelText: "Mobile Number",
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade500)),
                                    labelStyle:
                                        const TextStyle(color: Colors.grey)),
                                onChanged: (phone) {
                                  numbercontroller.text = phone;
                                  // ignore: avoid_print
                                  phoneNumber = phone;
                                  print(phone);
                                },
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter valid password';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    icon: const Icon(
                                      Icons.vpn_key,
                                      color: Color(0xFFD42323),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade500)),
                                    labelText: "Password",
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade500)),
                                    labelStyle:
                                        const TextStyle(color: Colors.grey)),
                                onChanged: (pass) {
                                  passwordcontroller.text = pass;
                                  // ignore: avoid_print
                                  password = pass;
                                  print(pass);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFD42323)),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                submit(phoneNumber.toString(),
                                        password.toString())
                                    .catchError((error) {
                                  return showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: const Text('An error occurred!'),
                                      content:
                                          const Text('Something went wrong.'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Okay'),
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                });
                              }
                            },
                            child: const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  'Log In',
                                  style: TextStyle(fontSize: 20),
                                ))),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.all(15),
                      //   width: double.infinity,
                      //   child: ElevatedButton(
                      //       style: ElevatedButton.styleFrom(
                      //           primary: const Color(0xFFD42323)),
                      //       onPressed: () {},
                      //       child: Padding(
                      //           padding: EdgeInsets.all(15),
                      //           child: Text(
                      //             userLocation.latitude.toString() +
                      //                 " " +
                      //                 userLocation.longitude.toString(),
                      //             style: TextStyle(fontSize: 20),
                      //           ))),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
