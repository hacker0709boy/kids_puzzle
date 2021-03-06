import 'package:flutter/material.dart';
import 'package:kids_puzzle/controller.dart';
import 'package:kids_puzzle/homepage.dart';
import 'package:provider/provider.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({required this.sessionCompleted, Key? key})
      : super(key: key);
  final bool sessionCompleted;
  @override
  Widget build(BuildContext context) {
    String title = "Well Done!";
    String buttonText = "New Word";
    if (sessionCompleted) {
      title = "All words completed";
      buttonText = "Replay";
    }
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      backgroundColor: Colors.amber,
      actionsAlignment: MainAxisAlignment.center,
      title: Text(title,
          style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 30)),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
            ),
            onPressed: () {
              if (sessionCompleted) {
                Provider.of<Controller>(context, listen: false).reset();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
              Provider.of<Controller>(context, listen: false)
                  .requestWord(request: true);
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(buttonText,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 30)),
            ))
      ],
    );
  }
}
