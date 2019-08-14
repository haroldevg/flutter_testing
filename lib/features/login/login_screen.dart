import 'package:flutter/material.dart';
import 'package:flutter_testing/features/login/success_screen.dart';

class EmptyFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Este campo no puede estar vacio' : null;
  }
}

class LoginScreen extends StatefulWidget {

  ValueChanged<bool> onSignIn;

  LoginScreen({this.onSignIn});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Image.asset("assets/images/logo.png",width: 40,),
              ),
              TextFormField(
                key: Key('email'),
                style: TextStyle(
                    color: Colors.white
                ),
                controller: _emailController,
                validator: EmptyFieldValidator.validate,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none),
                    hoverColor: Colors.white,
                    hintStyle: TextStyle(
                        color: Colors.white
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(79, 79, 79, 1),
                    hintText: "Email"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: Key('password'),
                style: TextStyle(
                  color: Colors.white
                ),
                controller: _passwordController,
                validator: EmptyFieldValidator.validate,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color.fromRGBO(79, 79, 79, 1),
                  filled: true,
                  hintStyle: TextStyle(
                    color: Colors.white
                  ),
                  hintText: "Contrasena",
                ),
                obscureText: true,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(onPressed: () => _signIn(), child: Text("Iniciar Sesion"),color: Colors.red,textColor: Colors.white,key: Key("signin"),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signIn(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessScreen()));
      if(widget.onSignIn != null)
        widget.onSignIn(true);
    }else{
      if(widget.onSignIn != null)
        widget.onSignIn(false);
    }
  }
}
