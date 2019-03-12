import 'package:flutter/material.dart';
import 'package:curso_flutter/model/ContactModel.dart';
class ContactoLista extends StatelessWidget{
  List<ContactModel> _buildList(){
    return <ContactModel>[
      const ContactModel(name: "sergio", correo: "sergio@flutter.com"),
      const ContactModel(name: "paco", correo: "sergio@flutter.com"),
      const ContactModel(name: "javier", correo: "sergio@flutter.com"),
      const ContactModel(name: "luis", correo: "sergio@flutter.com"),
      const ContactModel(name: "alvaro", correo: "sergio@flutter.com"),
      const ContactModel(name: "paco", correo: "sergio@flutter.com"),
      const ContactModel(name: "manuel", correo: "sergio@flutter.com"),
      const ContactModel(name: "sergio", correo: "sergio@flutter.com"),
      const ContactModel(name: "sergio", correo: "sergio@flutter.com"),
      const ContactModel(name: "sergio", correo: "sergio@flutter.com"),
      const ContactModel(name: "sergio", correo: "sergio@flutter.com"),
      const ContactModel(name: "sergio", correo: "sergio@flutter.com"),
      const ContactModel(name: "sergio", correo: "sergio@flutter.com"),
      const ContactModel(name: "sergio", correo: "sergio@flutter.com"),
      const ContactModel(name: "sergio", correo: "sergio@flutter.com"),
      const ContactModel(name: "ulian", correo: "sergio@flutter.com"),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Lista(_buildList());
  }
}

class Lista extends StatelessWidget{
  final List<ContactModel> _contacts;
  Lista(this._contacts);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildContactList(),
    );
  }

  List<ContactItem>_buildContactList(){
    return _contacts.map((contact) => ContactItem(contact)
    ).toList();
  }
}

class ContactItem extends StatelessWidget{
  final ContactModel _contact;
  ContactItem(this._contact);
  @override
  Widget build(BuildContext context) {
    return  ListTile(
        leading: CircleAvatar(
          child: Text((_contact.name[0].toUpperCase()))
        ),
        title: Text(_contact.name),
        subtitle: Text(_contact.correo),
      );
  }

}