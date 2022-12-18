/*
   child: Column(
                              children: [
                                Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.blueGrey,
                                  ),
                                  child: ListTile(
                                    leading: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.20,
                                      height: MediaQuery.of(context).size.height *
                                          0.25,
                                      child: Row(
                                        children: [
                                          Text(
                                            '${provider.coins[index].rank}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          SizedBox(width: 4,),
                                       Container(

                                         child: Image.network(provider.coins[index].imgURL,
                                         height:MediaQuery.of(context).size.height*0.20,),
                                       )
                                          /* Image.network(
                                              provider.coins[index].imgURL),*/
                                        ],
                                      ),
                                    ),
                                    title: Text(
                                      '${provider.coins[index].name}\n ${provider.coins[index].symbol}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    trailing: Column(
                                      children: [
                                        Text(
                                            '${provider.coins[index].priceChange}'),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("${provider.coins[index].id}"),
                                      ],
                                    ),
                                    /*     Row(
                                    children: [
                                      Text(
                                        '${provider.coins[index].rank}',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.blueGrey,
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            provider.coins[index].imgURL),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '${provider.coins[index].name}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                              ),
                                              Text(
                                                '102113.265656',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Bit',
                                                style: TextStyle(
                                                  color: Colors.white54,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.25,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    '102113.265656',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w900,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    '102113.265656',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w900,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),*/
                                  ),
                                ),
                              ],
                            ),
 */

import 'package:end/screens/coin/details_screen.dart';
import 'package:end/view_model/provider/coin/details_provider.dart';
import 'package:end/view_model/provider/coin/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    var detailsProvider = Provider.of<DetailsProvider>(context);

    return Scaffold(

        appBar: AppBar(
          title: Text('Crypto Currency'),
        ),
        body: provider.coins.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                    padding: EdgeInsets.only(
                      right: 12,
                      left: 13,
                    ),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    physics: BouncingScrollPhysics(),
                    itemCount: provider.coins.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>  DetailsScreen(id:provider.coins[index].id ),
                            ),
                          );

                         /*   detailsProvider
                                .getCoinDetails(provider.coins[index].name
                            );*/
                        },
                        // design
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xff151f2b)),
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                  '${provider.coins[index].rank}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Image.network(
                                  provider.coins[index].imgURL,
                                  scale: 4.9,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                       provider.coins[index].name.length > 8 ? provider.coins[index].name.substring(0, 8)+'' : provider.coins[index].name,
                                    //  provider.coins[index].name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      provider.coins[index].symbol,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(


                                        "${provider.coins[index].currentPrice}\$\ ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        "${provider.coins[index].priceChange}\%\ ",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "${provider.coins[index].priceChangePercentage}\%\ ",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ));
  }
}
/*
 Card(
                          elevation: 15,
                          child: Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4,
                                            right: 4,
                                          ),
                                          child: Text('${provider.coins[index].rank}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                        ),
                                        Image.network(provider.coins[index].imgURL,
                                          height: 40,),
                                      ],

                                    ),
                                   Column(
                                     children: [
                                       Text("${provider.coins[index].name}",
                                         style: TextStyle(
                                           color: Colors.white,
                                           fontSize: 18,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                       Text("${provider.coins[index].symbol}",
                                         style: TextStyle(
                                           color: Colors.white,
                                           fontSize: 15,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ],
                                   ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("${provider.coins[index].currentPrice}\$\ ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("${provider.coins[index].priceChange}\$\ ",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("${provider.coins[index].priceChange}\$\ ",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )

                                  ],
                                ),


                              ],
                            ),
                          ),
                        ),
 */
/*
     Padding(
                          padding: const EdgeInsets.all(15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.black,
                            child: Container(
                              height: 70,
                              child: ListTile(
                                leading: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Row(
                                    children: [
                                      Text(
                                        '${provider.coins[index].rank}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Image.network(
                                          provider.coins[index].imgURL,
                                      height: 40z,



                                      ),
                                    ],
                                  ),
                                ),
                                title: Text(
                                    '${provider.coins[index].name}\n ${provider.coins[index].symbol}'),
                                trailing: Text(
                                    '${provider.coins[index].rank}\n ${provider.coins[index].id}'),
                              ),
                            ),
                          ),
                        ),
 */
/*   return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Bitcoin',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://thumbs.dreamstime.com/b/image-bitcoin-black-background-bitcoin-107991145.jpg'),

                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Bitcoin',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Text(
                                '102113.265656',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bit',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                              Column(
                                children: [

                                  Text(
                                    '102113.265656',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(height: 4,),
                                  Text(
                                    '102113.265656',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );*/
/*
 Scaffold(
        appBar: AppBar(
          title:
          Text(
          'Crypto Currency ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
        body: Consumer<HomeProvider>(
          builder: (context, provider, child) {
            return provider.coins.length == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: provider.coins.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                url: provider.breakingNewsList[index].url,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 20,
                          color: Color(0xff151f2c),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.width * 0.25,
                                child:
                                Image.network(
                                  provider.breakingNewsList[index].urlToImage ??
                                      "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                        provider.breakingNewsList[index].title,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: 10,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                        provider.breakingNewsList[index]
                                                .description ??
                                            "",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
          },
        ));
 */
/*
Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    var detailsProvider = Provider.of<DetailsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Crypto Currency'),
        ),
        body: provider.coins.length == 0 ? Center(child: CircularProgressIndicator(),): ListView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: provider.coins.length,
            itemBuilder:(context,index){
              return  GestureDetector(
                onTap: (){
                  detailsProvider.getCoinDetails(provider.coins[index].id);
                },
                // design
                child: Container(),
              );
            }
    ));
  }
 */
/*
return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Bitcoin',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://thumbs.dreamstime.com/b/image-bitcoin-black-background-bitcoin-107991145.jpg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Bitcoin',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Text(
                                '102113.265656',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bit',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                              Column(
                                children: [

                                  Text(
                                    '102113.265656',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(height: 4,),
                                  Text(
                                    '102113.265656',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
 */
/*
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Bitcoin',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://thumbs.dreamstime.com/b/image-bitcoin-black-background-bitcoin-107991145.jpg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Bitcoin',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Text(
                                '102113.265656',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bit',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                              Column(
                                children: [

                                  Text(
                                    '102113.265656',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(height: 4,),
                                  Text(
                                    '102113.265656',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
/*
Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    var detailsProvider = Provider.of<DetailsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Crypto Currency'),
        ),
        body: provider.coins.length == 0 ? Center(child: CircularProgressIndicator(),): ListView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: provider.coins.length,
            itemBuilder:(context,index){
              return  GestureDetector(
                onTap: (){
                  detailsProvider.getCoinDetails(provider.coins[index].id);
                },
                // design
                child: Container(),
              );
            }
    ));
  }
 */
/*
return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Bitcoin',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://thumbs.dreamstime.com/b/image-bitcoin-black-background-bitcoin-107991145.jpg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Bitcoin',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Text(
                                '102113.265656',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bit',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                              Column(
                                children: [

                                  Text(
                                    '102113.265656',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(height: 4,),
                                  Text(
                                    '102113.265656',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
 */
 */
/*
 Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return provider.coins.length == 0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: provider.coins.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blueGrey,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '1',
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.blueGrey,
                                      radius: 30,

                                      child: Image.network(
                                        provider.coins[index].imgURL ??
                                        " https://thumbs.dreamstime.com/b/image-bitcoin-black-background-bitcoin-107991145.jpg " ,
                                        fit: BoxFit.cover,
                                      ),

                                      /*  Image.network(
                                  provider.coins[index].imgURL ??
                                    'https://thumbs.dreamstime.com/b/image-bitcoin-black-background-bitcoin-107991145.jpg',

                                 ),*/
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Bitcoin',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15,
                                            ),
                                            Text(
                                              '102113.265656',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Bit',
                                              style: TextStyle(
                                                color: Colors.white54,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  '102113.265656',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  '102113.265656',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
        },
      ),
 */
