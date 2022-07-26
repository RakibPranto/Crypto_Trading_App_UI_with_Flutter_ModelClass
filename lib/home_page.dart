import 'package:flutter/material.dart';
import 'package:twentyone/details.dart';
import 'package:twentyone/model/user_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: Center(
          child: Text(
            "CryptoMania",
            style: GoogleFonts.pacifico(
              color: Colors.black,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                  itemCount: crypto_info.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                              radius: 80,
                              backgroundImage: AssetImage(
                                crypto_info[index].img!,
                              )),
                          Text(
                            crypto_info[index].name!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Popular Cryptos",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: crypto_info.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      borderOnForeground: true,
                      child: ListTile(
                        style: ListTileStyle.list,
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return DetailsPage(
                              model: crypto_info[index],
                            );
                          }));
                        },
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                            crypto_info[index].img!,
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  crypto_info[index].name!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(crypto_info[index].sub!),
                              ],
                            ),
                            Text("\$${crypto_info[index].price!}"),
                          ],
                        ),
                        trailing: Text(
                          crypto_info[index].isPump == true
                              ? "+${crypto_info[index].change}"
                              : crypto_info[index].isPump == false
                                  ? "-${crypto_info[index].change}"
                                  : "Invalid Coin",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: (crypto_info[index].isPump == true
                                ? Colors.green
                                : crypto_info[index].isPump == false
                                    ? Colors.red
                                    : Colors.transparent),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
