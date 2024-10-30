import 'package:alison_ecommerce/view/authentication/sign_in/service/model/model.dart';

isSignInValid({required SignInModel signInModel}){
  return signInModel.email==""||signInModel.password=="";
}