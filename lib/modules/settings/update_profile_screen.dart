import 'package:flutter/material.dart';
import 'package:shop_app_final/models/login_model.dart';
import 'package:shop_app_final/shared/componants/componants.dart';

class UpdateProfileScreen extends StatefulWidget {

  UpdateProfileScreen({
    required this.modal,
    required this.updateProfile,
  });
  final LoginModel modal;
  final Function updateProfile;

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController nameController = new TextEditingController();

  final TextEditingController phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.modal.data!.name;
    phoneController.text = widget.modal.data!.phone;
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          widget.updateProfile(
            name: nameController.text,
            phoneNumber: phoneController.text,
          );
        },
        tooltip: 'Update',
        label:  Text(
          'Update',
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text(
              'Email',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.modal.data!.email,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 20),
            defaultFormField(
              labelText: 'Name',
              controller: nameController,
              validation: (s){},
              prefix: Icon(
                Icons.person
              ),
              type: TextInputType.name,
              enableBorders: true,
            ),
            SizedBox(height: 20),
            defaultFormField(
              labelText: 'Phone Number',
              controller: phoneController,
              validation: (s){},
              prefix: Icon(
                Icons.phone
              ),
              type: TextInputType.phone,
              enableBorders: true,
            ),
          ],
        ),
      ),
    );
  }

  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
