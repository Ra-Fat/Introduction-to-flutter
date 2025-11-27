import 'package:flutter/material.dart';

import '../model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
  name: "Ronan",
  position: "Flutter Developer",
  avatarUrl: 'assets/w5-s2/profile.webp',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
    TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
    TileData(icon: Icons.web, title: "Website", value: "www.ronanportfolio.com"),
    TileData(icon: Icons.work, title: "Company", value: "CADT Researcher"),
    TileData(icon: Icons.school, title: "Education", value: "Bachelor in Computer Science"),
    TileData(icon: Icons.language, title: "Languages", value: "English, French"),
  ],
);
