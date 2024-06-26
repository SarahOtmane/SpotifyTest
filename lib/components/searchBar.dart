import 'package:flutter/material.dart';
import '../components/color.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final String placeholder;

  SearchInput({
    required this.controller, 
    required this.onChanged,
    required this.placeholder
  });

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
              color: AppColors.lightgrey, // Couleur de l'icône
              size: 30.0, // Taille de l'icône
            ),
          ),
          hintText: placeholder,
          hintStyle: TextStyle(color: AppColors.lightgrey), // Couleur du texte du placeholder
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: AppColors.grey, // Couleur de la bordure
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: AppColors.grey, // Couleur de la bordure quand le champ est non-focusé
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: AppColors.grey, // Couleur de la bordure quand le champ est focusé
            ),
          ),
          filled: true,
          fillColor: AppColors.black,
        ),
        style: TextStyle(color: AppColors.lightgrey), // Couleur du texte saisi
        onChanged: onChanged,
      ),
    );
  }
}
