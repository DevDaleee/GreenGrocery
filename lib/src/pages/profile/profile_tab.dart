import 'package:hortifruit/src/config/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:hortifruit/src/pages/widget/custom_text_field.dart';
import 'package:hortifruit/src/config/app_data.dart' as appdata;

class PreofilePage extends StatefulWidget {
  const PreofilePage({super.key});

  @override
  State<PreofilePage> createState() => _PreofilePageState();
}

class _PreofilePageState extends State<PreofilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.customSwatchColor,
        centerTitle: false,
        title: Text(
          'Perfil do Usuário',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            isReadOnly: true,
            icon: Icons.email,
            label: ' Email',
            initialValue: appdata.user.email,
          ),
          CustomTextField(
            isReadOnly: true,
            icon: Icons.person,
            label: ' Nome',
            initialValue: appdata.user.name,
          ),
          CustomTextField(
            isReadOnly: true,
            icon: Icons.phone,
            label: 'Telefone',
            initialValue: appdata.user.phone,
          ),
          CustomTextField(
            isReadOnly: true,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
            initialValue: appdata.user.cpf,
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: ButtonStyle(
                side: WidgetStatePropertyAll(
                  BorderSide(color: Colors.green),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              onPressed: () => updatePasswordDialog(),
              child: Text('Atualizar Senha'),
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> updatePasswordDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Atualização de senha',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextField(
                        isSecret: true, icon: Icons.lock, label: 'Senha Atual'),
                    CustomTextField(
                        isSecret: true, icon: Icons.lock, label: 'Nova Senha'),
                    CustomTextField(
                        isSecret: true,
                        icon: Icons.lock,
                        label: 'Confirme nova senha'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.green),
                        ),
                        child: Text(
                          'Atualizar Senha',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
