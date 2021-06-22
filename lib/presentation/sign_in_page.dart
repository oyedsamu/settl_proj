import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settl_proj/blocs/loginbloc/login_bloc.dart';
import 'package:settl_proj/data/repository.dart';
import 'package:settl_proj/presentation/utils.dart';

class UserSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (ctx) {
        return LoginBloc(LoginRepository());
      },
      child: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is VerifyOtpLoginErrorState) {
          Utils.showLog("_LoginScreenState", "build: Error  $state");
        } else if (state is VerifyOtpLoginSuccessState) {
          Utils.showLog("LoginState::::", "LOGIN SUCCESSFUL: called");
          Navigator.pushNamed(context, "/homepage");
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return _mainLayout();
        },
      ),
    );
  }

  Widget _mainLayout() {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    fixedSize: Size(25, 25),
                    padding: EdgeInsets.only(left: 15),
                    primary: Colors.white,
                    onPrimary: Colors.deepPurple,
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios),
                  label: Text("")),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Sign in to your Settl Account and enjoy the endless possibilities.",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      _loginEmailAddressField(),
                      SizedBox(
                        height: 24,
                      ),
                      _loginPasswordField(),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _loginButtonClicked();
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(content: Text('Processing Data')));
                            }
                          },
                          child: Text("Sign In"),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      _rowText()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don\'t have a Settle Account? "),
        Text("Create an Account")
      ],
    );
  }

  Widget _loginEmailAddressField() {
    return TextFormField(
      controller: _usernameController,
      style: GoogleFonts.robotoCondensed(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      cursorColor: Colors.deepPurple,
      decoration: InputDecoration(
        labelText: "Email Address",
        contentPadding: EdgeInsets.symmetric(horizontal: 24),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        hintText: 'email@address.com',
        hintStyle: GoogleFonts.robotoCondensed(
          fontSize: 16.0,
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.w300,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty || !emailRegex.hasMatch(value)) {
          return 'Please enter a valid email Address';
        }
        return null;
      },
    );
  }

  Widget _loginPasswordField() {
    return TextFormField(
      controller: _passwordController,
      style: GoogleFonts.robotoCondensed(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      obscureText: true,
      cursorColor: Colors.deepPurple,
      decoration: InputDecoration(
        labelText: "Password",
        contentPadding: EdgeInsets.symmetric(horizontal: 24),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        hintText: 'Password',
        hintStyle: GoogleFonts.robotoCondensed(
          fontSize: 16.0,
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.w300,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 5) {
          return 'Please enter a valid password';
        }
        return null;
      },
    );
  }

  void _loginButtonClicked() {
    String username = _usernameController.text.toString();
    String password = _passwordController.text.toString().trim();
    Utils.showLog("LOGIN SCREEN", "$username :::: $password");
    loginUser(username, password);
  }

  void loginUser(String username, String password) {
    Utils.showLog("_LoginScreenState", "loginUser: called");
    BlocProvider.of<LoginBloc>(context).loginUser(username, password);
  }
}
