import 'package:flutter/material.dart';
import 'package:crud_user/views/home.dart';
import 'package:crud_user/models/model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../view_models/user_vm.dart';

// ignore: must_be_immutable
class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key, required this.user});
  final User user;
  @override
// ignore: no_logic_in_create_state
  State<EditUserScreen> createState() => _EditUserScreenState(user);
}

class _EditUserScreenState extends State<EditUserScreen> {
  User? user;
  _EditUserScreenState(this.user);
  late final TextEditingController _textIDController = TextEditingController();
  late final TextEditingController _textNameController =
      TextEditingController();
  late final TextEditingController _textEmailController =
      TextEditingController();
  late final TextEditingController _textPassController =
      TextEditingController();
  late final TextEditingController _textRePassController =
      TextEditingController();
  late String email = "", password = "", name = "", reTypePassword = "";
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _textIDController.text = user!.id;
    _textNameController.text = user!.name;
    _textEmailController.text = user!.email;
    _textPassController.text = user!.password;
    _textRePassController.text = user!.password;
    name = user!.name;
    email = user!.email;

    password = user!.password;
    reTypePassword = user!.password;
  }

  updateUser() async {
    if ((email == "") || (password == "") || (name == "")) {
      Fluttertoast.showToast(
          msg: "Semua Field harus diisi dengan data yang benar!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.yellow[300],
          textColor: Colors.red);
    } else {
      if (password != reTypePassword) {
        Fluttertoast.showToast(
            msg: "Password yang anda masukkan tidak sama!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.yellow[300],
            textColor: Colors.red);
      } else {
        showLoaderDialog(context);
        UserViewModel().editUser(user!.id, name, email, password).then((value) {
          Navigator.pop(context);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        });
      }
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit User")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("ID"),
            SizedBox(
              height: 25,
              child: TextField(
                controller: _textIDController,
                enabled: false,
                keyboardType: TextInputType.emailAddress,
                onChanged: (e) => name = e,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Nama Lengkap"),
            SizedBox(
              height: 25,
              child: TextField(
                controller: _textNameController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (e) => name = e,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Email Address"),
            SizedBox(
              height: 25,
              child: TextField(
                controller: _textEmailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (e) => email = e,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Password"),
            SizedBox(
              height: 25,
              child: TextField(
                controller: _textPassController,
                obscureText: true,
                onChanged: (e) => password = e,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Retype Password"),
            SizedBox(
              height: 25,
              child: TextField(
                controller: _textRePassController,
                obscureText: true,
                onChanged: (e) => reTypePassword = e,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      updateUser();
                    },
                    child: const Text("Update")))
          ],
        ),
      ),
    );
  }
}
