import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[200],
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                'Welcome\nAgain 🌱',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/background_clip_art.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              prefixIcon: Icon(Icons.email),
                              labelText: 'Email'),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              prefixIcon: Icon(Icons.phone),
                              labelText: 'Phone number'),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // Process data.
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                              child: Text('login', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                              child: Text('sign up', style: TextStyle(color: Colors.white, fontSize: 18,),),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}