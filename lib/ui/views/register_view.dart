import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RegisterFormProvider(),
        child: Builder(
          builder: (context) {
            final registerFormProvider =
                Provider.of<RegisterFormProvider>(context, listen: false);
            return Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.black,
              child: Center(
                  child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                      //Nombre
                      TextFormField(
                        onChanged: (value) =>
                            registerFormProvider.nombre = value,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Ingrese su nombre';
                          if (value.length < 3)
                            return 'El nombre debe contener 3 caracteres como mínimo';
                          return null; //this means valid formfield
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.customInputDecoration(
                            hint: 'Ingrese su nombre',
                            label: 'Nombre',
                            icon: Icons.supervised_user_circle_sharp),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //Email
                      TextFormField(
                        onChanged: (value) =>
                            registerFormProvider.email = value,
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? ''))
                            return 'Email no válido.';
                          return null;
                        },
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
                        onChanged: (value) =>
                            registerFormProvider.password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Ingrese su contraseña';
                          if (value.length < 6)
                            return 'La contraseña debe contener mínimo de 6 caracteres ';
                          return null; //this means valid formfield
                        },
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
                        onPressed: () {
                          registerFormProvider.validateForm();
                        },
                        text: 'Crear Cuenta',
                        isFilled: true,
                      ),
                      LinkText(
                        text: 'Ir a Login',
                        onPressed: () {
                          Navigator.pushNamed(context, Flurorouter.loginRoute);
                        },
                      )
                    ],
                  ),
                ),
              )),
            );
          },
        ));
  }
}
