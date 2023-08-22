import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Flutter app',
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/wallpaper.jfif'),
              fit: BoxFit.cover,
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Lottie.asset('assets/coffeelogo.json', height: 250, width: 250),
              Text(
                'Please Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter password',
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter username',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown),
                        child: const Text("Submit"),

                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> pages = [
    HomeTab(),
    ProfileTab(),
    MenuTab(),
  ];


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('welcome',

            ), backgroundColor: Colors.black,
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white70
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
              backgroundColor: Colors.white70
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
              backgroundColor: Colors.white70
          ),
        ],
      ),
    );
}
}

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/coffee.jfif'),
          fit: BoxFit.cover,
        ),
      ),

      child: Center(
        child: Text(
          'Welcome to Nanos coffeeshop!',
          style: TextStyle(fontSize: 24),
        ),
      )


    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Tab',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class MenuTab extends StatelessWidget {
  const MenuTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Menu Tab',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}