import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/camera_page.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPage();
}

class _InfoPage extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: ListView(
          children: [
            SizedBox(height: 20.0),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/habitacion.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Text(
                  'Habitación de Harry Poter',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 2,
              thickness: 2,
              color: Colors.black,
            ),
            SizedBox(height: 20.0),
            Text(
              "La alacena debajo de las escaleras fue la habitación de Harry Potter en el numero número 4 de Privet Drive. La alacena es descrita como pequeña y polvorienta, con una gran cantidad de arañas.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20.0),
            Text(
              "Cuando los padres de Harry fueron asesinados en 1981, Harry fue llevado a casa de su tía materna, Petunia Dursley. Ella y su marido Vernon a regañadientes lo recogieron, pero lo trataron mal, sobre todo porque sus padres habían sido mágos y se temía que Harry se convertiría en un 'monstruo' también.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Petunia.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Vernon.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              "La primera carta fue dirigida a: Sr. H Potter, en la Alacena debajo de las escaleras. Esto llevó a los Dursley permitir a Harry pasar sus pertenencias al segundo dormitorio de Dudley.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20.0),
            Text(
              "Más tarde la Alacena fue utilizada por los Dursley para almacenar todos los objetos mágicos de Harry, mientras se alojaba en su casa.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () async {
                  await availableCameras().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraPage(
                          cameras: value,
                        ),
                      ),
                    ),
                  );
                },
                child: Text('CAMERA'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
