void main() {

  List<String> favoriteHobbies = [];

  
  favoriteHobbies.add("Reading");
  favoriteHobbies.add("Cooking");
  favoriteHobbies.add("Playing Guitar");
  favoriteHobbies.add("Hiking");

  
  print("Favorite Hobbies: $favoriteHobbies");

  
  favoriteHobbies.remove("Playing Guitar");

 
  print("Updated Favorite Hobbies: $favoriteHobbies");

  
  favoriteHobbies.sort();


  print("Sorted Favorite Hobbies: $favoriteHobbies");

  
  if (favoriteHobbies.isEmpty) {
    print("No favorite hobbies.");
  } else {
    print("Number of favorite hobbies: ${favoriteHobbies.length}");
  }
}
