import 'package:flutter/material.dart';


import 'components/body.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }



  @override
  bool isSearching = false;
  Color primaryColor = Colors.blueAccent;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('$size');
    return Scaffold(
      drawer: MenuLateral(),
      appBar: buildAppBar(),

      body: Body(),
      // bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primaryColor,
      actions: <Widget>[
        isSearching == false
            ?
            //CODIGO FUNCIONANADO PRUEBA
            Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.78,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: TextField(
                    enabled: !isSearching,
                    onTap: () {
                      setState(() {
                        isSearching = true;
                      });
                    },
                    
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Buscar producto',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
/*                 suffixIcon: Icon(
                  Icons.cancel,
                  size: 20,
                  color: Colors.blueAccent,
                ), */
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ))
            :

//CODIGO FUNCIONANDO PRUEBA

            Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.78,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: TextFormField(
                    
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Escribe el producto',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
/*                 suffixIcon: Icon(
                  Icons.cancel,
                  size: 20,
                  color: Colors.blueAccent,
                ), */
                      prefixIcon: IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 20,
                        color: Colors.blueAccent,
                        onPressed: () {
                          setState(() {
                            isSearching = false;
                          });
                        },
                      ),
                    ),
                  ),
                ))
      ],
      bottom: TabBar(
        controller: TabController(length: 4, vsync: this ),
        isScrollable: true,
        indicatorColor: Colors.black,
        indicatorWeight: 2.0,
        
        unselectedLabelStyle:TextStyle(color: Colors.black, fontSize: 15),
        labelStyle: TextStyle(color: Colors.white, fontSize: 18),
        onTap: (index){
        
        },
      tabs: <Widget>[
        Tab(child: Container(child: Text('Calzado'))),
        Tab(child: Container(child: Text('Accesorios'))),
        Tab(child: Container(child: Text('Ropa'))),
        Tab(child: Container(child: Text('Tecnologia')))
      ],
      ),
    );

    /* actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Container(
            width: 350,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                
                hintText: 'Buscar producto',
                labelStyle: TextStyle(
                  fontSize: 20,
                ),
                

                suffixIcon: Icon(
                  Icons.cancel,
                  size: 20,
                  color: Colors.blueAccent,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.blueAccent,
                ),

                
              ),
            ),
          ),
        ),
      ], */
  }
}

/* appBar: AppBar(
        backgroundColor: Colors.pink,
        title: !isSearching
            ? Text('All Countries')
            : TextField(
                onChanged: (value) {
                  _filterCountries(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Search Country Here",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                      filteredCountries = countries;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],
      ), */

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            currentAccountPicture: GestureDetector(
                child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/614157741179936768/YUgj9vgF_400x400.png'),
            )),
            accountName: Text("HOLA RAUL JESUS"),
            accountEmail: Text("raulhenaor@gmail.com"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://ichef.bbci.co.uk/news/660/cpsprodpb/6AFE/production/_102809372_machu.jpg"),
                    fit: BoxFit.cover)),
          ),
          Ink(
            color: Colors.indigo,
            child: new ListTile(
              title: Text(
                "Inicio",
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen()));
              },
            ),
          ),
          new ListTile(
            title: Text("Mi cuenta"),
            leading: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Productos()));
            },
          ),
          new ListTile(
            title: Text("Mis comisiones"),
            leading: Icon(
              Icons.attach_money,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Galeria()));
            },
          ),
          new ListTile(
            title: Text("Categorías"),
            leading: Icon(
              Icons.view_list,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Contacto()));
            },
          ),
          ListTile(
            title: Text("Mega Promociones"),
            leading: Icon(
              Icons.shopping_basket,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Contacto()));
            },
          )
        ],
      ),
    );
  }
}

class Empresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("EMPRESA"),
      ),
      body: Center(
        child: Text("ESTAS EN EMPRESA"),
      ),
    );
  }
}

class Productos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("PRODUCTOS"),
      ),
      body: Center(
        child: Text("ESTAS EN PRODUCTOS"),
      ),
    );
  }
}

class Galeria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("GALERIA"),
      ),
      body: Center(
        child: Text("ESTAS EN GALERIA"),
      ),
    );
  }
}

class Contacto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("CONTACTO"),
      ),
      body: Center(
        child: Text("ESTAS EN CONTACTO"),
      ),
    );
  }
}
