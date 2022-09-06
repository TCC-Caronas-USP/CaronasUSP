// import 'package:caronas_usp/page/Perfil.dart';
import 'package:caronas_usp/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  SignUpWidget({super.key});

  final standardPageColor = Colors.green[700];

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(32),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        const Spacer(),

        // const FlutterLogo(size: 120), //TODO: Alterar o logo do Flutter pelo logo do projeto

        Icon(Icons.directions_car_rounded, size: 120, color: standardPageColor),

        const Spacer(),

        Align(
          alignment: Alignment.center,
          child: Text(
            'CaronasUSP', //TODO: Definir um nome para o aplicativo
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: standardPageColor
            ),
          ),
        ),

        // // Subtítulo para a tela inicial?
        // const SizedBox(height: 8),
        // Align(
        //   alignment: Alignment.center,
        //   child: Text(
        //     'Entre com seu email USP',
        //     style: TextStyle(
        //       fontSize: 16,
        //       color: standardPageColor
        //     ),
        //   )
        // ),

        const Spacer(),

        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: standardPageColor,
            onPrimary: Colors.white,
            minimumSize: const Size(double.infinity, 50)
          ),
          icon: const FaIcon(FontAwesomeIcons.google),
          label: const Text('Entre com sua conta USP'),
          onPressed: () {
            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
        ),

        const SizedBox(height: 40),

        const SizedBox(height: 8),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Sistema de login unificado',
            style: TextStyle(
              fontSize: 16,
              color: standardPageColor
            ),
          )
        ),

        // RichText(
        //   text: TextSpan(
        //     children: [
        //       TextSpan(
        //         text: 'Não possui uma conta? ',
        //         style: TextStyle(
        //           color: standardPageColor,
        //           fontWeight: FontWeight.bold
        //         ),
        //       ),
        //       WidgetSpan(
        //         child: GestureDetector(
        //           child: Text(
        //             'Cadastre-se',
        //             style: TextStyle(
        //               decoration: TextDecoration.underline,
        //               color: standardPageColor,
        //               fontWeight: FontWeight.bold
        //             ),
        //           ),
        //           onTap: (){
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 //TODO: Caminho apenas de exemplo, levar o usuário para uma página de registro
        //                 builder: (context) => const Perfil()),
        //             );
        //           }
        //         )
        //       )
        //     ]
        //   )
        // ),
        
        const Spacer()

      ],
    ),
  );
}