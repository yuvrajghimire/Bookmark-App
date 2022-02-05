import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Favorites',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Row(
                      children: [
                        Icon(LineariconsFree.bookmark,
                            size: 14, color: Theme.of(context).primaryColor),
                        const Text(
                          '124',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              RotatedBox(
                quarterTurns: 1,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.compare_arrows,
                        size: 25, color: Theme.of(context).primaryColor)),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(bottom: 80),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 80,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Youtube',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 19,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          SizedBox(height: 5),
                          Opacity(
                            opacity: 0.6,
                            child: Text(
                              'https://www.youtube.com/watch?v=LKAt56zW0-g',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: 'Nunito',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        tooltip: 'Favorite',
                        onPressed: () {},
                        icon: Icon(LineariconsFree.star_1,
                            size: 19, color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        tooltip: 'Copy to clipboard',
                        onPressed: () {},
                        icon: Icon(Icons.copy_outlined,
                            size: 19, color: Theme.of(context).primaryColor),
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
