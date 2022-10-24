import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:shara/controllers/login_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/navigation.dart';
import 'package:shara/helpers/utils/widgets/sending_loading_widget.dart';
import 'package:shara/helpers/utils/widgets/snack_bars.dart';
import 'package:shara/views/screens/account/signin_pages/phone_page.dart';
import 'package:shara/views/screens/account/signin_pages/sign_up.dart';
import 'package:shara/views/screens/home/main_home_screen.dart';
import 'package:shara/views/widgets/custom_text_form_field.dart';
import 'package:shara/views/widgets/login_header.dart';
import 'package:shara/views/widgets/main_button.dart';

import 'forget_password.dart';

class LoginPage extends StatefulWidget {

  LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final loginController = Get.put(LoginController());

  // Animation<Offset> logoOffset;
  // AnimationController logoController;
  //
  // Animation<Offset> emailOffset;
  // AnimationController emailController;
  //
  // Animation<Offset> passwordOffset;
  // AnimationController passwordController;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   logoController = AnimationController(
  //     duration: const Duration(milliseconds: 1000),
  //     vsync: this,
  //   );
  //
  //   logoController.addListener(() {
  //     setState(() {});
  //   });
  //
  //   emailController = AnimationController(
  //     duration: const Duration(milliseconds: 400),
  //     vsync: this,
  //   );
  //   passwordController = AnimationController(
  //     duration: const Duration(milliseconds: 400),
  //     vsync: this,
  //   );
  //   emailController.addListener(() {
  //     setState(() {});
  //   });
  //   passwordController.addListener(() {
  //     setState(() {});
  //   });
  //   logoController.addStatusListener((status) {
  //     if (status == AnimationStatus.completed) {
  //       // controller.reverse();
  //       emailController.forward();
  //     }
  //   });
  //   emailController.addStatusListener((status) {
  //     if (status == AnimationStatus.completed) {
  //       // controller.reverse();
  //       passwordController.forward();
  //     }
  //   });
  //   logoOffset = Tween<Offset>(begin: Offset(Get.size.width, 200.0), end: Offset.zero)
  //       .animate(logoController);
  //   emailOffset = Tween<Offset>(begin: Offset(-Get.size.width, 0.0), end: Offset.zero)
  //       .animate(emailController);
  //   passwordOffset = Tween<Offset>(begin: Offset(-Get.size.width, 0.0), end: Offset.zero)
  //       .animate(passwordController);
  //   logoController.forward();
  // }


  @override
  Widget build(BuildContext context) {
    return Obx(()=>SendingLoadingDataWidget(
      isLoading: loginController.loading.value,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: AppColors.mainLightColor,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              HeaderLoginWidget(
                height: 150,
                isLogin: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text(
                      'welcome_to_shara'.tr,
                      style: TextStyle(
                          color: AppColors.mainDarkGreyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'sign_in'.tr,
                      style: TextStyle(
                          color: AppColors.mainLightGreyColor, fontSize: 18),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Obx(() => Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            CustomTextFormField(
                              controller: _emailController,
                              isValideField: loginController.isValidEmail.value,
                              errorMessage:
                              loginController.emailErrorMessage.value,
                              hintText: 'enter_login_email'.tr,
                              labelText: 'login_email'.tr,
                              icon: 'assets/images/icons/login/email.png',
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            CustomTextFormField(
                              isValideField:
                              loginController.isValidPassword.value,
                              errorMessage:
                              loginController.passwordErrorMessage.value,
                              controller: _passwordController,
                              hintText: '*******',
                              labelText: 'password'.tr,
                              icon: 'assets/images/icons/login/pass.png',
                              secureText: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OpenContainer(
                                    closedBuilder: (context,action){
                                      return Text(
                                        'forget_password'.tr,
                                        style: TextStyle(
                                            color: AppColors.mainLightGreyColor),
                                      );
                                    },
                                    openBuilder: (context,action){
                                      return ForgetPasswordWidget();
                                    }
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            MainButtonWidget(
                              btnTitle: 'sign_in'.tr,
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                loginController.password = _passwordController.text;
                                loginController.email = _emailController.text;

                                loginController.loginAction((message){
                                   if(message == null){
                                     Go.toAndOff(context, MainHomeScreen());
                                   } else{
                                     showErrorSnackbar('Error'.tr, message);
                                   }
                                });
                              },
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'dont_have_account'.tr,
                                  style: TextStyle(
                                      color: AppColors.mainLightGreyColor),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  // onTap: (){
                                  //   Get.to(SignUpPage());
                                  // },
                                  child: OpenContainer(
                                    closedBuilder: (context, action) {
                                      return Text(
                                        'join_now'.tr,
                                        style: TextStyle(
                                            color: AppColors.mainGoldenDarkColor),
                                      );
                                    },
                                    openBuilder: (context, action) {

                                      return PhoneNumberPage();
                                    },
                                    closedElevation: 0,
                                    transitionDuration:
                                    Duration(milliseconds: 300),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordController.dispose();
    _emailController.dispose();
    // logoController.dispose();
    super.dispose();
  }
}
