import 'package:flutter/material.dart';


class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

List<Contact> _contacts = [
  Contact(name: 'Alice', phoneNumber: '123-456-7890'),
  Contact(name: 'Bob', phoneNumber: '234-567-8901'),
  Contact(name: 'Charlie', phoneNumber: '345-678-9012'),
  Contact(name: 'Dave', phoneNumber: '456-789-0123'),
  Contact(name: 'Eve', phoneNumber: '567-890-1234'),
  Contact(name: 'Frank', phoneNumber: '678-901-2345'),
  Contact(name: 'Grace', phoneNumber: '789-012-3456'),
  Contact(name: 'Heidi', phoneNumber: '890-123-4567'),
  Contact(name: 'Isaac', phoneNumber: '901-234-5678'),
  Contact(name: 'Jack', phoneNumber: '012-345-6789'),
  Contact(name: 'Kate', phoneNumber: '123-456-7890'),
  Contact(name: 'Lucy', phoneNumber: '234-567-8901'),
  Contact(name: 'Mike', phoneNumber: '345-678-9012'),
   Contact(name: 'Mike', phoneNumber: '345-678-9012'),
    Contact(name: 'Mike', phoneNumber: '345-678-9012'),
     Contact(name: 'Mike', phoneNumber: '345-678-9012'),
      Contact(name: 'Mike', phoneNumber: '345-678-9012'),
       Contact(name: 'Mike', phoneNumber: '345-678-9012'),
  Contact(name: 'Nancy', phoneNumber: '456-789-0123'),
  Contact(name: 'Oliver', phoneNumber: '567-890-1234'),
  Contact(name: 'Paul', phoneNumber: '678-901-2345'),
  Contact(name: 'Queenie', phoneNumber: '789-012-3456'),
  Contact(name: 'Randy', phoneNumber: '890-123-4567'),
  Contact(name: 'Samantha', phoneNumber: '901-234-5678'),
  Contact(name: 'Tom', phoneNumber: '012-345-6789'),
  Contact(name: 'Uma', phoneNumber: '123-456-7890'),
  Contact(name: 'Victor', phoneNumber: '234-567-8901'),
  Contact(name: 'Wendy', phoneNumber: '345-678-9012'),
  Contact(name: 'Xander', phoneNumber: '456-789-0123'),
  Contact(name: 'Yolanda', phoneNumber: '567-890-1234'),
  Contact(name: 'Zach', phoneNumber: '678-901-2345'),
];

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

// class _ContactsScreenState extends State<ContactsScreen> {
//   final ScrollController _scrollController = ScrollController();
 
//   final Map<String, int> _alphabetMap = {
//     'A': 0,
//     'B': 1,
//     'C': 2,
//     'D': 3,
//     'E': 4,
//     'F': 5,
//     'G': 6,
//     'H': 7,
//     'I': 8,
//     'J': 9,
//     'K': 10,
//     'L': 11,
//     'M': 12,
//     'N': 13,
//     'O': 14,
//     'P': 15,
//     'Q': 16,
//     'R': 17,
//     'S': 18,
//     'T': 19,
//     'U': 20,
//     'V': 21,
//     'W': 22,
//     'X': 23,
//     'Y': 24,
//     'Z': 25,
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Contacts')),
//       body: Stack(
//         children: [
//           ListView.builder(
//             controller: _scrollController,
//             itemCount: contacts.length,
//             itemBuilder: (BuildContext context, int index) {
//               final contact = contacts[index];
//               return ListTile(
//                 title: Text(contact.name),
//                 subtitle: Text(contact.phoneNumber),
//               );
//             },
//           ),
//           Container(
//             height: 400,
//             alignment: Alignment.centerRight,
//             //height: 28,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 4.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: _alphabetMap.keys.map((String letter) {
//                   return GestureDetector(
//                      onVerticalDragDown: (DragDownDetails details) {
//                        print(letter);
//               _scrollTo(details.localPosition.dy);
//             },
//             onPanUpdate: (DragUpdateDetails details){
//             print(letter);
//             },
//                     child: Container(
//                       width: 45,
//                       height: 400/26,
//                       child: Text(
//                         letter,
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _scrollTo(double position) {
//     final letterHeight = 45;
//     final targetIndex = (position / letterHeight).floor();
//     final targetLetter = _alphabetMap.keys.toList()[targetIndex];
//     final targetOffset = _scrollController.position.minScrollExtent +
//         (_alphabetMap[targetLetter] ?? 0) * 72;
//     _scrollController.animateTo(targetOffset,
//         duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
//   }
// }

class _ContactsScreenState extends State<ContactsScreen> {
  final ScrollController _scrollController = ScrollController();
 
  final Map<String, int> _alphabetMap = {
    'A': 0,
    'B': 1,
    'C': 2,
    'D': 3,
    'E': 4,
    'F': 5,
    'G': 6,
    'H': 7,
    'I': 8,
    'J': 9,
    'K': 10,
    'L': 11,
    'M': 12,
    'N': 13,
    'O': 14,
    'P': 15,
    'Q': 16,
    'R': 17,
    'S': 18,
    'T': 19,
    'U': 20,
    'V': 21,
    'W': 22,
    'X': 23,
    'Y': 24,
    'Z': 25,
  };
  String _selectedLetter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: _contacts.length,
            itemBuilder: (BuildContext context, int index) {
              final contact = _contacts[index];
              if (_selectedLetter.isNotEmpty &&
                  !_contacts[index].name.startsWith(_selectedLetter)) {
                return const SizedBox.shrink();
              }
              return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.phoneNumber),
              );
            },
          ),

          
          Container(
            
            alignment: Alignment.centerRight,
           
            child: GestureDetector(
                onVerticalDragDown: (DragDownDetails details) {
                    _scrollTo(details.localPosition.dy);
                  },
                  onVerticalDragUpdate: (DragUpdateDetails details) {
                    final RenderBox box = context.findRenderObject() as RenderBox;
                    final offsetY = box.globalToLocal(details.globalPosition).dy;
                    final index = (offsetY ~/ 28).clamp(0, _alphabetMap.length - 1);
                    final selectedLetter = _alphabetMap.keys.elementAt(index);
                    if (selectedLetter != _selectedLetter) {
                      setState(() {
                        _selectedLetter = selectedLetter;
                      });
                      _scrollTo(_alphabetMap[selectedLetter]! * 28.0);
                    }
                  },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _alphabetMap.keys.map((String letter) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedLetter = letter;
                        });
                        _scrollTo(_alphabetMap[letter]! * 28.0);
                      },
                      child: Text(
                        letter,
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              _selectedLetter == letter ? Colors.blue : null,
                          fontWeight: _selectedLetter == letter
                              ? FontWeight.bold
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _scrollTo(double position) {
    final index = position ~/ 28;
    print(index);
    _scrollController.animateTo(index * 28.0,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}



