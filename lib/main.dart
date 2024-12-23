import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Recipe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class UserProfile {
  String email;
  String birthDate;

  UserProfile({required this.email, required this.birthDate});
}

class Interaction {
  String recipeTitle;
  String type;
  String content;

  Interaction({
    required this.recipeTitle,
    required this.type,
    this.content = '',
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _categories = ['Desayuno', 'Almuerzo', 'Cena', 'Postres'];
  String _selectedCategory = '';

  final List<Map<String, String>> _recipes = [
    {
      'title': 'Pancakes',
      'category': 'Desayuno',
      'image': 'assets/images/pancakes.jpg'
    },
    {
      'title': 'Ensalada César',
      'category': 'Almuerzo',
      'image': 'assets/images/cesar_salad.jpg'
    },
    {
      'title': 'Espaguetis',
      'category': 'Cena',
      'image': 'assets/images/spaghetti.jpg'
    },
    {
      'title': 'Tarta de Manzana',
      'category': 'Postres',
      'image': 'assets/images/apple_pie.jpg'
    },
    {
      'title': 'Huevos Revueltos',
      'category': 'Desayuno',
      'image': 'assets/images/scrambled_eggs.jpg'
    },
    {
      'title': 'Sopa de Tomate',
      'category': 'Almuerzo',
      'image': 'assets/images/tomato_soup.jpg'
    },
    {'title': 'Pizza', 'category': 'Cena', 'image': 'assets/images/pizza.jpg'},
    {
      'title': 'Brownies',
      'category': 'Postres',
      'image': 'assets/images/brownies.jpg'
    },
    {'title': 'Waffles', 'category': 'Desayuno', 'image': 'assets/images/waffles.jpg'},
    {'title': 'Tacos', 'category': 'Almuerzo', 'image': 'assets/images/tacos.jpg'},
    {'title': 'Paella', 'category': 'Cena', 'image': 'assets/images/paella.jpg'},
    {
      'title': 'Helado de Chocolate',
      'category': 'Postres',
      'image': 'assets/images/chocolate_ice_cream.jpg'
    },
    {
      'title': 'Omelette',
      'category': 'Desayuno',
      'image': 'assets/images/omelette.jpg'
    },
    {'title': 'Sushi', 'category': 'Almuerzo', 'image': 'assets/images/sushi.jpg'},
    {
      'title': 'Hamburguesas',
      'category': 'Cena',
      'image': 'assets/images/hamburgers.jpg'
    },
    {
      'title': 'Pastel de Limón',
      'category': 'Postres',
      'image': 'assets/images/lemon_cake.jpg'
    },
    {
      'title': 'Tostadas Francesas',
      'category': 'Desayuno',
      'image': 'assets/images/french_toast.jpg'
    },
    {
      'title': 'Chili con Carne',
      'category': 'Almuerzo',
      'image': 'assets/images/chili_con_carne.jpg'
    },
    {'title': 'Lasagna', 'category': 'Cena', 'image': 'assets/images/lasagna.jpg'},
    {
      'title': 'Galletas de Avena',
      'category': 'Postres',
      'image': 'assets/images/oatmeal_cookies.jpg'
    },
    {
      'title': 'Smoothie de Fresas',
      'category': 'Desayuno',
      'image': 'assets/images/strawberry_smoothie.jpg'
    },
    {
      'title': 'Enchiladas',
      'category': 'Almuerzo',
      'image': 'assets/images/enchiladas.jpg'
    },
    {
      'title': 'Curry de Pollo',
      'category': 'Cena',
      'image': 'assets/images/chicken_curry.jpg'
    },
    {
      'title': 'Mousse de Chocolate',
      'category': 'Postres',
      'image': 'assets/images/chocolate_mousse.jpg'
    },
  ];

  String _searchQuery = '';
  int _selectedIndex = 0;
  bool _isRegistered = false;
  UserProfile? _userProfile;
  final List<Interaction> _interactions = [];

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = _recipes.where((recipe) {
      final matchesCategory =
          _selectedCategory.isEmpty || recipe['category'] == _selectedCategory;
      final matchesSearch =
          recipe['title']!.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocina Creativa'),
        backgroundColor: Colors.orange,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Row(
            children: [
              Container(
                width: screenWidth * 0.3,
                color: Colors.orange.shade100,
                child: ListView(
                  children: [
                    ..._categories.map((category) => ListTile(
                          title: Text(
                            category,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          selected: _selectedCategory == category,
                          onTap: () {
                            setState(() {
                              _selectedCategory =
                                  _selectedCategory == category ? '' : category;
                            });
                          },
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Buscar recetas...',
                          labelStyle: TextStyle(fontSize: screenWidth * 0.05),
                          border: OutlineInputBorder(),
                          prefixIcon:
                              Icon(Icons.search, size: screenWidth * 0.07),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredRecipes.length,
                        itemBuilder: (context, index) {
                          final recipe = filteredRecipes[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    recipe['image']!,
                                    width: screenWidth * 0.8,
                                    height: screenHeight * 0.2,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    recipe['title']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.05,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    recipe['category']!,
                                    style:
                                        TextStyle(fontSize: screenWidth * 0.04),
                                  ),
                                  const SizedBox(height: 8),
                                  _isRegistered
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.thumb_up),
                                              onPressed: () {
                                                _addInteraction(
                                                  recipe['title']!,
                                                  'like',
                                                  '',
                                                );
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.comment),
                                              onPressed: () {
                                                _showCommentDialog(recipe);
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.bookmark),
                                              onPressed: () {
                                                _addInteraction(
                                                  recipe['title']!,
                                                  'save',
                                                  '',
                                                );
                                              },
                                            ),
                                          ],
                                        )
                                      : Text(
                                          'Inicia sesión para interactuar',
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle,
                    size: screenWidth * 0.2,
                    color: _isRegistered ? Colors.orange : Colors.grey),
                const SizedBox(height: 20),
                _isRegistered && _userProfile != null
                    ? Column(
                        children: [
                          Text('Correo: ${_userProfile!.email}',
                              style: TextStyle(fontSize: screenWidth * 0.05)),
                          const SizedBox(height: 10),
                          Text(
                              'Fecha de Nacimiento: ${_userProfile!.birthDate}',
                              style: TextStyle(fontSize: screenWidth * 0.05)),
                          const SizedBox(height: 20),
                          Text('Historial de Interacciones:',
                              style: TextStyle(fontSize: screenWidth * 0.05)),
                          const SizedBox(height: 10),
                          _interactions.isEmpty
                              ? Text('No has interactuado aún.',
                                  style:
                                      TextStyle(fontSize: screenWidth * 0.04))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _interactions.length,
                                  itemBuilder: (context, index) {
                                    final interaction = _interactions[index];
                                    return ListTile(
                                      title: Text(
                                          '${interaction.type} en "${interaction.recipeTitle}"'),
                                      subtitle: interaction.type == 'comment'
                                          ? Text(
                                              'Comentario: ${interaction.content}')
                                          : null,
                                    );
                                  },
                                ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _logout,
                            child: Text('Cerrar sesión'),
                          ),
                        ],
                      )
                    : Text(
                        'Regístrate para acceder al perfil',
                        style: TextStyle(fontSize: screenWidth * 0.07),
                        textAlign: TextAlign.center,
                      ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            if (index == 1 && !_isRegistered) {
              _showRegisterDialog(context);
            } else {
              _selectedIndex = index;
            }
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: _isRegistered ? 'Perfil' : 'Regístrate',
          ),
        ],
      ),
    );
  }

  void _addInteraction(String recipeTitle, String type, String content) {
    setState(() {
      _interactions.add(Interaction(
        recipeTitle: recipeTitle,
        type: type,
        content: content,
      ));
    });
  }

  void _showCommentDialog(Map<String, String> recipe) {
    final commentController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Comentar en ${recipe['title']}'),
          content: TextField(
            controller: commentController,
            decoration: const InputDecoration(labelText: 'Tu comentario'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _addInteraction(
                  recipe['title']!,
                  'comment',
                  commentController.text,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Comentar'),
            ),
          ],
        );
      },
    );
  }

  void _showRegisterDialog(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final birthDateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Formulario de Registro'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration:
                      const InputDecoration(labelText: 'Correo electrónico'),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                ),
                TextField(
                  controller: birthDateController,
                  decoration: InputDecoration(
                    labelText: 'Fecha de nacimiento',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () async {
                        final DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );

                        if (selectedDate != null) {
                          birthDateController.text =
                              '${selectedDate.toLocal()}'.split(' ')[0];
                        }
                      },
                    ),
                  ),
                  readOnly: true,
                  keyboardType: TextInputType.none,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isRegistered = true;
                  _userProfile = UserProfile(
                    email: emailController.text,
                    birthDate: birthDateController.text,
                  );
                  _selectedIndex = 0;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Registrar'),
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    setState(() {
      _isRegistered = false;
      _userProfile = null;
      _interactions.clear();
    });
  }
}
