import 'package:flutter/material.dart';
import 'package:hortifruit/src/pages/widget/custom_text_field.dart';
import 'package:hortifruit/src/config/custom_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final cpfFromatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final phoneFromatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      appBar: AppBar(
        backgroundColor: CustomColors.customSwatchColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Cadastro",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      45,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    CustomTextField(icon: Icons.email, label: 'Email'),
                    CustomTextField(
                        icon: Icons.lock, label: 'Senha', isSecret: true),
                    CustomTextField(icon: Icons.person, label: 'Nome'),
                    CustomTextField(
                      icon: Icons.phone,
                      label: 'Celular',
                      inputFormatter: [phoneFromatter],
                    ),
                    CustomTextField(
                      icon: Icons.file_copy,
                      label: 'CPF',
                      inputFormatter: [cpfFromatter],
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(Colors.green),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Cadastrar Usuário',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
