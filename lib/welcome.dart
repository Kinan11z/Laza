import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}

Widget test = SizedBox(
  width: 1,
  height: 1,
);
bool button_switch = false;
bool check = false;
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
              child: Text(
            'welcome',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          )),
          Text(
            'Please enter your data to continue',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 164, left: 20, right: 20),
                    child: SizedBox(width: 335, height: 61, child: Username()),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: SizedBox(
                      width: 335,
                      height: 61,
                      child: Password(),
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 200),
            child: Text(
              'Forgot password?',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(234, 67, 53, 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  'Remember me',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 170),
                  child: SwitchButtom(button_switch: button_switch),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90, bottom: 15),
            child: SizedBox(
              width: 326,
              height: 36,
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'By connecting your account confirm that you agree          ',
                    style: TextStyle(
                        color: Color.fromRGBO(143, 149, 158, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'with our ',
                          style: TextStyle(
                              color: Color.fromRGBO(143, 149, 158, 1))),
                      TextSpan(
                          text: 'Term and Condition',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // GoRouter.of(context).go('/Products');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Products(),
                  ));
            },
            child: InkWell(
              onTap: () {
                if (check == true && password.text.length > 7) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavBar(),
                      ));
                }
              },
              child: Container(
                width: double.maxFinite,
                height: 68.8,
                color: Color.fromRGBO(151, 117, 250, 1),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
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

class Username extends StatefulWidget {
  const Username({
    super.key,
  });

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setState(() {
          if (username.text.length > 4) {
            check = true;
          } else
            check = false;
        });
      },
      controller: username,
      decoration: InputDecoration(
          hintText: 'ex: Kinan Almahainy',
          labelText: 'Username',
          floatingLabelAlignment: FloatingLabelAlignment.start,
          suffixIcon:
              check ? Icon(Icons.check, color: Colors.green) : SizedBox()),
    );
  }
}

class Password extends StatefulWidget {
  const Password({
    super.key,
  });

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setState(() {
          test = StrongPassword(strong_password: value);
        });
      },
      controller: password,
      obscureText: true,
      decoration: InputDecoration(
        suffix: test,
        hintText: '**********',
        labelText: 'Password',
        floatingLabelAlignment: FloatingLabelAlignment.start,
      ),
    );
  }
}

class SwitchButtom extends StatefulWidget {
  const SwitchButtom({
    super.key,
    required this.button_switch,
  });

  final bool button_switch;

  @override
  State<SwitchButtom> createState() => _SwitchButtomState();
}

class _SwitchButtomState extends State<SwitchButtom> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: button_switch,
      onChanged: (value) {
        setState(
          () {
            button_switch = value;
          },
        );
      },
    );
  }
}

class StrongPassword extends StatefulWidget {
  const StrongPassword({super.key, required this.strong_password});
  final String strong_password;
  @override
  State<StrongPassword> createState() => _StrongPasswordState();
}

class _StrongPasswordState extends State<StrongPassword> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
            .hasMatch(widget.strong_password)) {
          return Text(
            'Weak',
            style: TextStyle(color: Colors.red),
          );
        } else if (RegExp(
                r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
            .hasMatch(widget.strong_password)) {
          return Text(
            'Medium',
            style: TextStyle(color: Colors.amber),
          );
        } else if (RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$")
            .hasMatch(widget.strong_password)) {
          return Text(
            'Strong',
            style: TextStyle(color: Colors.green),
          );
        } else {
          return Text(
            'Weak',
            style: TextStyle(color: Colors.red),
          );
        }
      },
    );
  }
}
