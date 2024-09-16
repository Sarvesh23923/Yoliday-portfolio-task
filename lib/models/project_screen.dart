import 'package:flutter/material.dart';
import 'package:portfolio/models/constants.dart';

class ProjectScreen extends StatefulWidget {
  final String searchQuery;

  const ProjectScreen({super.key, required this.searchQuery});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final List<Map<String, String>> _allProjects = [
    {
      'image': 'assets/images/1.jpg',
      'title': 'Kemampuan Merangkum Tulisan',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan'
    },
    {
      'image': 'assets/images/2.jpg',
      'title': 'Mengembangkan Keterampilan Menulis',
      'subtitle': 'BAHASA INDONESIA',
      'author': 'Oleh Arief Budiman'
    },
    {
      'image': 'assets/images/3.jpg',
      'title': 'Kemampuan Menerjemahkan Teks',
      'subtitle': 'BAHASA INGGRIS',
      'author': 'Oleh James Collins'
    },
    {
      'image': 'assets/images/4.jpg',
      'title': 'Membaca Pemahaman Teks',
      'subtitle': 'BAHASA JEPANG',
      'author': 'Oleh Rina Sato'
    },
    {
      'image': 'assets/images/5.jpg',
      'title': 'Keterampilan Berbicara yang Efektif',
      'subtitle': 'BAHASA ARAB',
      'author': 'Oleh Khalid Mohammed'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProjects = _allProjects.where((project) {
      final query = widget.searchQuery.toLowerCase();
      return project['title']!.toLowerCase().contains(query) ||
          project['subtitle']!.toLowerCase().contains(query) ||
          project['author']!.toLowerCase().contains(query);
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredProjects.length,
      itemBuilder: (context, index) {
        final project = filteredProjects[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ProjectCard(
            photo: project['image']!,
            title: project['title']!,
            subtitle: project['subtitle']!,
            author: project['author']!,
          ),
        );
      },
    );
  }
}
