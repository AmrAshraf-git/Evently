import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/utils/email_validation.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../../onboarding/widgets/language_switcher.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController? name;
  late final TextEditingController? emailController;
  late final TextEditingController? passwordController;
  late final TextEditingController? rePasswordController;
  final GlobalKey<FormState> formKey = GlobalKey();
  bool _isObscureText = true;
  bool isScreenSizeLoaded=false;
  late final double width;
  late final double height;

  @override
  void initState() {
    name= TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
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
                          return "Name can't be empty";
                        }
                        return null;
                      },
                      textEditingController: emailController,
                      hint: "Name",
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.gray,
                      ),
                      textInputType: TextInputType.emailAddress,
                    )),

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

                Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: MyTextFormField(
                      validator: (input){
                        if(input==null || input.trim().isEmpty) {
                          return "Re Password can't be empty";
                        }
                        else if (input!=passwordController?.text){
                          return "Passwords do not match";
                        }
                        else if(Validation.isValidPassword(input).isNotEmpty) {
                          return Validation.isValidPassword(input);
                        }
                        return null;
                      },
                      textEditingController: passwordController,
                      hint: "Re Password",
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

                const SizedBox(height: 24),
                SizedBox(
                  width: width,
                  child: ElevatedButton(
                      onPressed: () {
                        createAccount();
                      },
                      child: Text("Create Account",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ))),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account?",
                      style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    TextButton(
                    style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    ),
                  ),
                  ]
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
    name?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    rePasswordController?.dispose();
    super.dispose();
  }


  void createAccount() {
    if(formKey.currentState?.validate()==false){
      return;
    }
  }
}
