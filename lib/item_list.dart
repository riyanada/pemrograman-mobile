import 'package:listview/user_model.dart';
import 'package:flutter/material.dart';

class ItemUser extends StatelessWidget {
  final int index;
  final UserModel data;
  final void Function(UserModel) onClick;

  const ItemUser(this.index, this.data, this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: InkWell(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.lightGreen,
              child: Text(
                data.codeName,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    child: Text(data.major),
                  ),
                ],
              ),
            )),
          ],
        ),
        onTap: () {
          onClick(data);
        },
      ),
    );
  }
}
