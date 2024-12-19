import 'package:flutter/material.dart';

class MicDialog extends StatefulWidget {
  @override
  _MicDialogState createState() => _MicDialogState();
}

class _MicDialogState extends State<MicDialog> {
  bool isMicPaused = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.6,
      width: MediaQuery.of(context).size.width * 0.6,
      child: AlertDialog(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        title: const Center(child: Text('Search your product')),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.225,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Tap to speak'),
              const SizedBox(height: 30),
              GestureDetector(
                child: Column(
                  children: [
                    IconButton(
                      color: isMicPaused ? Colors.green : Colors.red,
                      onPressed: () {
                        setState(() {
                          isMicPaused = !isMicPaused;
                        });
                      },
                      icon: Icon(size: 100,
                        isMicPaused ? Icons.mic : Icons.pause,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}