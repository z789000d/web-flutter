
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/CustomBorder.dart';
import 'package:untitled/utils/CustomTextStyle.dart';

class RegisterUser extends StatefulWidget{
  @override
  RegisterUserState createState()=>RegisterUserState();

}


class RegisterUserState extends State<RegisterUser>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 500,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 40,
                  width: 20,
                ),
                Image(
                  image: AssetImage("ic_logo.png"),
                  height: 48,
                ),
                SizedBox(
                  height: 10,
                  width: 20,
                ),
                Text("Grocery Fact",style: CustomTextStyle.regularTextStyle.copyWith(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 60,
                  width: 20,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(48, 8, 48, 8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: CustomBorder.border,
                        labelText: "Name",
                        enabledBorder: CustomBorder.border,
                        focusedBorder: CustomBorder.border.copyWith(
                            borderSide: BorderSide(color: Colors.blue)),
                        errorBorder: CustomBorder.border.copyWith(
                            borderSide: BorderSide(color: Colors.red)),
                        labelStyle: CustomTextStyle.regularTextStyle, floatingLabelBehavior: FloatingLabelBehavior.auto),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(48, 8, 48, 8),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        border: CustomBorder.border,
                        labelText: "Mobile No",
                        enabledBorder: CustomBorder.border,
                        focusedBorder: CustomBorder.border.copyWith(
                            borderSide: BorderSide(color: Colors.blue)),
                        errorBorder: CustomBorder.border.copyWith(
                            borderSide: BorderSide(color: Colors.red)),
                        labelStyle: CustomTextStyle.regularTextStyle, floatingLabelBehavior: FloatingLabelBehavior.auto),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(48, 8, 48, 8),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: CustomBorder.border,
                        labelText: "Email",
                        enabledBorder: CustomBorder.border,
                        focusedBorder: CustomBorder.border.copyWith(
                            borderSide: BorderSide(color: Colors.blue)),
                        errorBorder: CustomBorder.border.copyWith(
                            borderSide: BorderSide(color: Colors.red)),
                        labelStyle: CustomTextStyle.regularTextStyle, floatingLabelBehavior: FloatingLabelBehavior.auto),
                  ),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(48, 8, 48, 8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: CustomBorder.border,
                        enabledBorder: CustomBorder.border,
                        focusedBorder: CustomBorder.border.copyWith(
                            borderSide: BorderSide(color: Colors.blue)),
                        errorBorder: CustomBorder.border.copyWith(
                            borderSide: BorderSide(color: Colors.red)),
                        labelStyle: CustomTextStyle.regularTextStyle),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 24,top: 24),
                  child: RaisedButton(onPressed: (){},child: Text("Register"),padding: EdgeInsets.symmetric(horizontal: 96,vertical: 16),),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}