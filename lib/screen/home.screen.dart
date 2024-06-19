import 'package:flutter/material.dart';
import 'package:taller_final/core/classes/category.class.dart';
import 'package:taller_final/core/services/category.service.dart';
import 'package:taller_final/screen/attachment.screen.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({Key? key}) : super(key: key);

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  final CategoryService _categoryService = CategoryService();
  late Future<List<Category>> _futureCategories;

  @override
  void initState() {
    super.initState();
    _futureCategories = _categoryService.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category List'),
      ),
      body: Center(
        child: FutureBuilder<List<Category>>(
          future: _futureCategories,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No categories found');
            } else {
              List<Category> categories = snapshot.data!;
              return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      // Navegar a la pantalla de adjuntos con el ID de la categoría seleccionada
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AttachmentListPage(categoryId: categories[index].id),
                        ),
                      );
                    },
                    child: Text(categories[index].name),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
