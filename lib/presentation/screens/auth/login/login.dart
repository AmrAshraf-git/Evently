import 'package:evently_app/core/utils/email_validation.dart';
import 'package:evently_app/core/widgets/my_text_form_field.dart';
import 'package:evently_app/presentation/screens/onboarding/widgets/language_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/assets_manager.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController? emailController;
  late final TextEditingController? passwordController;
  final GlobalKey<FormState> formKey = GlobalKey();
  bool _isObscureText = true;
  bool isScreenSizeLoaded=false;
  late final  double width;
  late final  double height;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   width=MediaQuery.sizeOf(context).width;
    //   height=MediaQuery.sizeOf(context).height;
    // });


    // Future.delayed(Duration.zero,() {
    //     width=MediaQuery.sizeOf(context).width;
    //     height=MediaQuery.sizeOf(context).height;
    // });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!isScreenSizeLoaded){
      width=MediaQuery.sizeOf(context).width;
      height=MediaQuery.sizeOf(context).height;
      isScreenSizeLoaded=true;
    }

    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: formKey,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AssetsManager.logo,
                  height: height * 0.16,
                ),
                const SizedBox(height: 24),
                Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: MyTextFormField(
                      validator: (input){
                        if(input==null || input.trim().isEmpty) {
                          return "Email can't be empty";
                        }
                        else if(!Validation.isValidEmail(input)) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      textEditingController: emailController,
                      hint: "Email",
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: AppColors.gray,
                      ),
                      textInputType: TextInputType.emailAddress,
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: MyTextFormField(
                      validator: (input){
                        if(input==null || input.trim().isEmpty) {
                          return "Password can't be empty";
                        }
                        else if(Validation.isValidPassword(input).isNotEmpty) {
                          return Validation.isValidPassword(input);
                        }
                        return null;
                      },
                      textEditingController: passwordController,
                      hint: "Password",
                      prefixIcon: Icon(Icons.lock_rounded, color: AppColors.gray),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscureText = !_isObscureText;
                            });
                          },
                          icon: Icon(
                            color: AppColors.gray,
                            _isObscureText
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          )),
                      textInputType: TextInputType.visiblePassword,
                      isObscure: _isObscureText,
                    )),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                    onPressed: () {},
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: width,
                  child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      child: Text("Login",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ))),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Don't Have Account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Create Account",
                      style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: AppColors.primary)),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Google.svg",
                        semanticsLabel: 'Google Logo',
                      ),
                      Text("\t  Login With Google",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: LanguageSwitcher(),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }


  void login() {
    if(formKey.currentState?.validate()==false){
        return;
    }
  }
}
