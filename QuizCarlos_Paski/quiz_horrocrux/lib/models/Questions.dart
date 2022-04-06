// ignore_for_file: constant_identifier_names

class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "¿Cuál de estos tipos de escobas no pertenece al juego?",
    "options": ['Flecha de plata', 'Cometa', 'Asteroide', 'Estrella fugaz'],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question": "¿Quién le regaló a Harry Potter una escoba Saeta de Fuego?",
    "options": ['Sirius Black', 'Minerva McGonagall', 'Albus Dumbledore', 'Rubeus Hagrid'],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question": "Antiguamente, en lugar de con una snitch, se jugaba con un animal. ¿Cómo se llamaba esa criatura?",
    "options": ['Snidget dorado', 'Snidget espacial', 'Snidget precioso', 'Snidget amarillo'],
    "answer_index": 0,
  },
  {
    "id": 4,
    "question": "¿Cuál es la duración del juego?",
    "options": ['50 minutos', 'Indefinida', '90 minutos', '100 minutos'],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "¿Qué falta cometió Draco Malfoy en Harry Potter y el prisionero de Azkaban?",
    "options": ['Usar la varita para hechizar\na un jugador', 'Bajarse de su escoba',
                'Volar demasiado alto', 'Coger la escoba de un oponente'],
    "answer_index": 3,
  },
  {
    "id": 6,
    "question": "What command do you use to output data to the screen?",
    "options": ['Cada ocho años', 'Cada cuatro años', 'Cada seis años', 'Cada cinco años'],
    "answer_index": 1,
  },
];

/*
HERBOLOGÍA
{
  "id": 1,
  "question": "¿A parte de en Hogwarts, en que otra escuela mágica se sabe que imparten esta asignatura?",
  "options": ['Castelobruxo', 'Instituto Durmstrang', 'Colegio Ilvermorny de Magia y Hechicería', 'Mahoutokoro'],
  "answer_index": 0,
},
{
  "id": 2,
  "question": "¿Quien fue profesor de esta materia después de Herbert Beery?",
  "options": ['Sybill Trelawney', 'Neville Longbottom', 'Pomona Sprout', 'Beedle el Bardo'],
  "answer_index": 2,
},
{
  "id": 3,
  "question": "¿Quien de estos no consiguió el TIMO en herbología?",
  "options": ['Barty Crouch Jr', 'Seamus Finnigan', '	Bill Weasley', 'Dean Thomas'],
  "answer_index": 1,
},
{
  "id": 4,
  "question": "¿Como pueden ser destruidos los pinchos de los arbustos puntiagudos?",
  "options": ['Incendio', 'Reducto', 'Lumos', 'Impedimenta'],
  "answer_index": 3,
},
{
  "id": 5,
  "question": "¿Cuando se da la clase en primer curso?",
  "options": ['Lunes', 'Miercoles', 'Jueves', 'Viernes'],
  "answer_index": 1,
},
{
  "id": 6,
  "question": "Libro Obligatorio",
  "options": ['Plantas carnivoras del mundo', 'Arboles carnivoros del mundo', 
              'Plantas y arboles carnivoros del mundo', 'Herbología general'],
  "answer_index": 1,
},
];
*/

/*
CALLEJÓN DIAGON
{
  "id": 1,
  "question": "¿Los magos y las brujas dónde sacan el dinero?",
  "options": ['Gringotts', 'Ollivander’s', 'Flourish & Blotts', 'Gambol y Japes'],
  "answer_index": 0,
},
{
  "id": 2,
  "question": "¿Qué son los “knuts”?",
  "options": ['El nombre del banco de los magos y las brujas', 'Un bar donde Hagrid lleva a Harry',
             'Una moneda mágica de bronce', 'Uno de los libros que Harry necesita para Hogwarts'],
  "answer_index": 2,
},
{
  "id": 3,
  "question": "¿Qué es el “Caldero Chorreante”?",
  "options": ['El banco de los magos y brujas', 'Un bar pequeño pero muy famoso',
              'El lugar en el que duermen los Dursley', 'La bebida favorita de magos y brujas'],
  "answer_index": 1,
},
{
  "id": 4,
  "question": "¿Qué profesor encuentran Hagrid y Harry en su visita al “Caldero Chorreante”?",
  "options": ['Profesor Snape', 'Profesor Dumbledore', 'Profesor Slughorn', 'Profesor Quirrel'],
  "answer_index": 3,
},
{
  "id": 5,
  "question": "Las varitas son...",
  "options": ['las que escogen al mago', 'indestructibles', 'para todos iguales', 'lo único necesario para ir a Hogwarts'],
  "answer_index": 0,
},
{
  "id": 6,
  "question": "Para ir a Hogwarts, Harry tiene que coger el tren en la estación de...",
  "options": ['Ollivanders', 'Gringotts', 'Kings Cross', '9 y 3/4'],
  "answer_index": 2,
},
];
*/