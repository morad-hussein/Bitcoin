/*
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:screens/view_model/provider/coin/details_provider.dart';

import '../../../core/themes.dart';
import '../../../view_model/provider/coin/search_provider.dart';


class SearchScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchProvider>(context);
    var detailsProvider = Provider.of<DetailsProvider>(context);
    return Scaffold(

    );
  }
}
*/
import 'package:end/view_model/provider/coin/details_provider.dart';
import 'package:end/view_model/provider/coin/search_ptovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchProvider>(context);
    var detailsProvider = Provider.of<DetailsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white10,
          ),
          child: TextFormField(
            onChanged: (value) {
              Provider.of<SearchProvider>(context, listen: false)
                  .getSearchCoin(value);
            },
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                color: Colors.white10,
                fontSize: 25,
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 25,
                color: Colors.white10,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: Consumer<SearchProvider>(builder: (context, provider, child) {
        return provider.searchCoins.isNotEmpty
            ?
        SizedBox(
          height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: provider.searchCoins.length,
                  itemBuilder: (context, index) {
                    var coin = provider.searchCoins[index];
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          ListTile(
                            leading: SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.network(coin.imageUrl)),
                            title: Text('${coin.name}\n ${coin.symbol}'),
                            trailing: Text('${coin.rank}\n ${coin.id}'),
                          ),
                        )
                      ),
                    );
                  },
                ),
            )
            : Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.4,
                    child: SvgPicture.asset('assets/search.svg')),
              );
      }),
    );
  }
}
