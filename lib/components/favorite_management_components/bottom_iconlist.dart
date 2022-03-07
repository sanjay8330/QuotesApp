import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/screens/favorite_management/view_favorites.dart';

class BottomIconList extends StatelessWidget {
  final String copyText;

  const BottomIconList({
    Key? key,
    required this.copyText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void copyText() {
      FlutterClipboard.copy(this.copyText).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Quote Copied To Clipboard')
            )
        );
      });
    }

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Quote added to Favorites')
                        )
                    );

                    Navigator.of(context).pushNamed(ViewFavorites.routeName);//Maybe Remove with Integration
                  },
                  icon: const Icon(
                    Icons.favorite_sharp,
                    color: Colors.red,
                  )
              ),
              const Text('Add to Favorites')
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment,
                    color: Colors.blue,
                  )
              ),
              const Text('Add Comments')
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: copyText,
                  icon: const Icon(
                    Icons.copy_outlined,
                    color: Colors.black,
                  )
              ),
              const Text('Copy to Clipboard')
            ],
          ),
        ],
      ),
    );
  }
}
