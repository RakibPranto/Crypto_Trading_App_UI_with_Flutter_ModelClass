import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twentyone/model/user_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, this.model}) : super(key: key);
  final UserModel? model;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.sell,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(widget.model!.img!),
            ),
            Text("\$${widget.model!.price!}"),
            Text(widget.model!.name!),
            Text(widget.model!.sub!),
            const SizedBox(
              height: 10,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
      ),
    );
  }
}
