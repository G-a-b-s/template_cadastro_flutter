import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Cadastro'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _obscurePassword = true;
  String _selectGender = "m";
  bool _notifiEmail = true;
  bool _notifiPhone = true;
  double rating = 50;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.9,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                    ),
                    maxLength: 50,
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Data de Nascimento',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                    ),
                    maxLength: 18,
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    maxLength: 50,
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    maxLength: 16,
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Text("Gênero: "),
                      Row(
                        children: [
                          Text("Masculino"),
                          Radio(
                            value: "m",
                            groupValue: _selectGender,
                            onChanged: (context) {
                              setState(() {
                                _selectGender = "m";
                              });
                            },
                          ),
                          Text("Feminino"),
                          Radio(
                            value: "f",
                            groupValue: _selectGender,
                            onChanged: (context) {
                              setState(() {
                                _selectGender = "f";
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: MediaQuery.of(context).size.width < 600 ? Alignment.center : Alignment.centerLeft,
                    child: Text("Notificações:"),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text("Email:"),
                      Switch(
                        value: _notifiEmail,
                        onChanged: (bool valor) {
                          setState(() {
                            _notifiEmail = valor;
                          });
                        },
                      ),
                      SizedBox(width: 16.0),
                      Text("Celular:"),
                      Switch(
                        value: _notifiPhone,
                        onChanged: (bool valor) {
                          setState(() {
                            _notifiPhone = valor;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Avaliação:"),
                  ),
                  SizedBox(height: 10.0),
                  Slider(
                    value: rating,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    onChanged: (valor) {
                      setState(() {
                        rating = valor;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('Cadastrar', style: TextStyle(fontSize:18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                      foregroundColor: Colors.deepPurple,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Login',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurpleAccent[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
