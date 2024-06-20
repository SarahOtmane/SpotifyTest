import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  SearchInput({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0), // Ajoute un margin left à l'icône
            child: Icon(
              Icons.search,
              color: Color(0xFFD9D9D9), // Couleur de l'icône
              size: 30.0, // Taille de l'icône
            ),
          ),
          hintText: 'Chercher un artiste',
          hintStyle: TextStyle(color: Color(0xFFD9D9D9)), // Couleur du texte du placeholder
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0xFF606060), // Couleur de la bordure
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0xFF606060), // Couleur de la bordure quand le champ est non-focusé
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0xFF606060), // Couleur de la bordure quand le champ est focusé
            ),
          ),
          filled: true,
          fillColor: Color(0xFF202020),
        ),
        style: TextStyle(color: Color(0xFFD9D9D9)), // Couleur du texte saisi
        onChanged: onChanged,
      ),
    );
  }
}
