// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:shrine/colors.dart';

class LoginPage extends StatefulWidget {//LoginPage class represente la page login entiere qui doit s'afficher
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {//la fonction build() de _LoginPageState controle la façon dont tous les widgets de notre interface utilisateur sont créés.
  // TODO: Add text editing controllers (101)
  final _userNameController = TextEditingController();//definir un controleur de texte pour le champs username
  final _userPasswordController = TextEditingController();//definir un controleur de texte pour le champs password
  final _unFocusedColor = Colors.grey[600];
  final _userNameFocusNode = FocusNode();
  final _userPasswordFocusNode = FocusNode();

  @override
  void  initState() {
    super.initState();
    _userNameFocusNode.addListener(() {//ajout d'un ecouteur au FocusNodes
      setState(()  {
        //Redraw so that the username label reflects the focus state
      });
    });
    _userPasswordFocusNode.addListener(() {//ajout d'un ecouteur au FocusNodes
      setState(()  {
        //Redraw so that the password label reflects the focus state
      });
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                Text(
                  'SHRINE',
                  style: Theme.of(context).textTheme.headline5,//personnalise le style du titre
                ),
              ],
            ),
            const SizedBox(height: 120.0),

            // TODO: Add TextField widgets (101)
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                // TODO: Remove filled: true values (103)
                //filled: true,
                // TODO: Wrap Username with AccentColorOverride (103)
                labelText: 'Username',//indiquer le titre du champs
                labelStyle: TextStyle(
                  color: _userNameFocusNode.hasFocus
                      ? Theme.of(context).colorScheme.secondary
                      : _unFocusedColor
                ),
                helperText: 'Insert your user name is required.',
                prefixIcon: const Icon(
                    Icons.person ,
                ),
              ),
              focusNode: _userNameFocusNode,//defini le focus du clavier
            ),
            const SizedBox(height: 25.0),//insertion d'espace entre les champs de texte


            // TODO: Add TextField widgets (101)
            TextField(
              controller: _userPasswordController,
              // TODO: Decorate the inputs (103)
              decoration: InputDecoration(
                // TODO: Remove filled: true values (103)
                //filled: true,
                // TODO: Wrap Password with AccentColorOverride (103)
                labelText: 'Password',
                labelStyle: TextStyle(
                  //ajout d'un style de texte lorsque le champ est selectionne ou non
                    color: _userPasswordFocusNode.hasFocus
                        ? Theme.of(context).colorScheme.secondary
                        : _unFocusedColor
                ),
                helperText: 'Insert your user password is required.',
                prefixIcon: const Icon(
                    Icons.password ,
                ),
              ),
              focusNode: _userPasswordFocusNode,//defini le focus du clavier
              obscureText: true,//remplace automatiquement l'entrée saisie par l'utilisateur par des puces,
            ),
            // TODO: Add button bar (101)
            ButtonBar(
              children: [
                TextButton(
                    onPressed: (){
                      _userNameController.clear();//appel de la fonction clear() sur le champs username qui permet d'effacer lorsqu'on appuie le button
                      _userPasswordController.clear();//appel de la fonction clear() sur le champs password qui permet d'effacer lorsqu'on appuie le button
                    },// L'utilisation de blocs vides empêche la desactivation du button.
                    child: const Text(
                      'Cancel',
                    ),
                    style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary,
                    ),
                    shape: MaterialStateProperty.all(
                      const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7.0),
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context)  ;//affiche l'itineraire le plus recent depuis le navigateur. Montre la page suivante
                    },// L'utilisation de blocs vides empêche la desactivation du button.
                    child: const Text(
                      'Suivant',
                    ),
                  //attribuer un style au button
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary,
                    ),
                    shape: MaterialStateProperty.all(
                      const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),




          ],
        ),
      ),
    );
  }
}

// TODO: Add AccentColorOverride (103)
