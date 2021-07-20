import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black,
      child: Center(
          child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 370),
        child: Form(
          child: Column(
            children: [
              //Email
              TextFormField(
                //validator: ,
                style: TextStyle(color: Colors.white),
                decoration: CustomInputs.customInputDecoration(
                    hint: 'Ingrese su email',
                    label: 'Email',
                    icon: Icons.email),
              ),
              SizedBox(
                height: 20,
              ),
              //Password
              TextFormField(
                //validator: ,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: CustomInputs.customInputDecoration(
                    hint: 'Ingrese su constraseña',
                    label: 'Contraseña',
                    icon: Icons.lock_outline_rounded),
              ),
              SizedBox(
                height: 20,
              ),
              CustomOutlinedButton(
                onPressed: () {},
                text: 'Ingresar',
                isFilled: true,
              ),
              LinkText(
                text: 'Nueva Cuenta',
                onPressed: () {
                  Navigator.pushNamed(context, Flurorouter.registerRoute);
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
