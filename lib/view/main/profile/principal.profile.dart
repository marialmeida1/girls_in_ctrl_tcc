import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tcc_girls_in_ctrl/constants.dart';
import 'package:tcc_girls_in_ctrl/controllers/gets.controllers.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/models/user.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/option.auth.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/appBar.menu.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/botton.widgets.dart';

class PrincipalProfile extends StatefulWidget {
  const PrincipalProfile({super.key});

  @override
  State<PrincipalProfile> createState() => _PrincipalProfileState();
}

class _PrincipalProfileState extends State<PrincipalProfile> {
  // Pega informações sobre o usuário
  User? user;
  bool loading = true;
  File? _imageFile;
  final _picker = ImagePicker();
  TextEditingController txtNameController = TextEditingController();
  TextEditingController txtLastNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Get Image
  Future getImage() async {
    // Abre a galeria do dispositivo e escolhe uma imagem
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    // Verifica se foi pego alguma imagem
    if (pickedFile != null) {
      // Atualiza o estado da _imageFile ( variável )
      setState(() {
        // Retorna o caminho da imagem escolhida
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // Pega informações do usuário
  void getUser() async {
    // Obtem dados do usuário
    ApiResponse response = await getUserDetail();
    // Isso obtem uma resposta que será verificada
    if (response.error == null) {
      setState(() {
        user = response.data as User;
        loading = false;
        txtNameController.text = user!.name ?? '';
        txtLastNameController.text = user!.lastname ?? '';

        // Atualiza as informações de acordo com o que foi recolhido
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const OptionScreem()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  // Update Profile
  void updateProfile() async {
    ApiResponse response = await update(
      txtNameController.text,
      txtLastNameController.text,
      getStringImage(_imageFile),
    );
    setState(() {
      loading = false;
    });
    if (response.error == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.data}')));
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => OptionScreem()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void initState() {
    getUser();
    super.initState();
  }

  void logoutProfile() async {
    ApiResponse response = await logoutUser();
    setState(() {
      loading = false;
    });
    if (response.error == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.data}')));
      logoutPage();
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => OptionScreem()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void logoutPage() {
    logout().then((value) => {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => OptionScreem()),
              (route) => false)
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappBar(
        context,
        Colors.black,
        "Perfil",
        "Informações sobre o usuário!",
        Icons.logout_outlined,
        logoutProfile,
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 40,
                right: 40,
              ),
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: _imageFile == null
                                ? user!.image != null
                                    ? DecorationImage(
                                        image: NetworkImage('${user!.image}'),
                                        fit: BoxFit.cover)
                                    : null
                                : DecorationImage(
                                    image: FileImage(_imageFile ?? File('')),
                                    fit: BoxFit.cover,
                                  ),
                            color: Colors.black12,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              getImage();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: txtNameController,
                          validator: (val) =>
                              val!.isEmpty ? 'Nome Inválido' : null,
                          decoration: const InputDecoration(
                            labelText: "Nome",
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: txtLastNameController,
                          validator: (val) =>
                              val!.isEmpty ? 'Sobrenome inválido' : null,
                          decoration: const InputDecoration(
                            labelText: "Sobrenome",
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        bottonPadrao(
                          40,
                          120,
                          Colors.black,
                          Colors.white,
                          "Salvar",
                          context,
                          () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              updateProfile();
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
