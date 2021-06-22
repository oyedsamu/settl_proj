import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
        ),
      );
}
