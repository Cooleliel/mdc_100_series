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
import 'package:flutter/services.dart';

////Importations de nouveaux packages

import 'package:intl/intl.dart';
import 'model/products_repository.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  // TODO: Add a variable for Category (104)
  final Category  category;//variable Category

  const HomePage({
    this.category  = Category.all  ,
    Key? key,
  }) : super(key: key);

  // TODO: Make a collection of cards (102)
  List<Card>  _buildGridCard(BuildContext context)  {//cette fonction retourne une liste de widget cards en prenant comme parametre le context
    /**List<Card>  cards = List.generate(
        count ,
        (index) => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(//aligne une liste de widgets de facon verticale
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        AspectRatio(//decide de la frome que prend l'image peu importe le type d'image
        aspectRatio: 18.0/11.0,
        child: Image.asset('assets/diamond.png'),
        ),
        Padding(
        padding: const  EdgeInsets.fromLTRB(16.0 , 12.0 , 16.0 , 8.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
        Text('Tile'),
        SizedBox(height: 10.0),
        Text('Secondary text'),
        ],
        ),
        )
        ],
        ),
        ),
        ) ;**/

    List<Product> products  = ProductsRepository.loadProducts(Category.all) ;//definiton d'une liste products qui recupere tous les articles

    if(products.isEmpty){//si la liste products est vide la fonction retourne des widegts cards vides
      return  const <Card>[]  ;
    }

    final ThemeData theme = Theme.of(context);//recupere le theme du context
    final NumberFormat  formatter = NumberFormat.simpleCurrency(//formatter un mombre d'une maniere specifique aux parametres regionaux
        locale: Localizations.localeOf(context).toString()
    );
    return  products.map((product) {// le 1er return retourne une colection d'articles en recuperant chaque article dans la liste
      return Card(//declaration du widget card
        elevation: 0.0,
        clipBehavior: Clip.antiAlias,
        child: Column( //aligne une liste de widgets de facon verticale
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio( //decide de la forme que prend l'image peu importe le type d'image
              aspectRatio: 18.0 / 11.0,
              child: Image.asset(
                product.assetName,//insertion de l'image a l'aide du model product
                package: product.assetPackage,//on appel le package product
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)
                    Text(
                      product.name,//insertion du titre a l'aide du model product
                      style: theme.textTheme.button,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      formatter.format(product.price),//insertion du prix a l'aide du model product
                      style: theme.textTheme.subtitle2,
                    ),
                    // End new code
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }).toList()  ;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Pass Category variable to AsymmetricView (104)
    // TODO: Return an AsymmetricView (104)
    return  AsymmetricView(//on retourne une vue asymetrique
      products: ProductsRepository.loadProducts(
        Category.all,
      ),
    );
      // TODO: Add app bar (102)
      /**appBar: AppBar(//ajout de la barre d'app
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 20,
        leading: IconButton(//ajout d'icone menu de type button interactive
          onPressed: (){
            print('Menu Button');
          },
          icon: const Icon(//insertion de l'icone menu
            Icons.menu,
            semanticLabel: 'menu',
          ),
        ),
        title:  const Text('SHRINE'),//definition du titre dans la barre d'app
        actions: <Widget>[//Represente une liste de widgets
          //Icone de recherche
          IconButton(
            onPressed: (){
              print('Search Button');
            },
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
          ),
          //Icone de filtre
          IconButton(
            onPressed: (){
              print('Filter Button');
            },
            icon: const Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
          ),
        ],
      ),**/
      // TODO: Add a grid view (102)
      /**GridView.count(
        crossAxisCount: 2,//precise le nombre de colonnes
        padding: const  EdgeInsets.all(16.0),//espacement entre les cartes
        childAspectRatio:  8.0/9.0,//defini la taille des elements en fonction de la largeur sur la hauteur
        children: _buildGridCard(context) ,
      ),**/

      // TODO: Set resizeToAvoidBottomInset (101)
      //resizeToAvoidBottomInset: false,//Cela garantit que l'apparence du clavier ne modifie pas la taille de la page d'accueil ou de ses widgets.
  }
}
