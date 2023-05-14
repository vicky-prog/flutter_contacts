import 'package:contacts/sticky.dart';
import 'package:flutter/material.dart';

const double _itemHeight = 60;
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

   int _firstVisibleIndex = 0;
  int _lastVisibleIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
   // replace with your item height
    final offset = _scrollController.offset;
    final height = _scrollController.position.viewportDimension;
    final int firstVisibleIndex = (offset / _itemHeight).floor();
    final int lastVisibleIndex = ((offset + height) / _itemHeight).ceil() - 1;

    setState(() {
      _firstVisibleIndex = firstVisibleIndex;
      _lastVisibleIndex = lastVisibleIndex;
      _selectedLetter = _contacts[_firstVisibleIndex].name[0];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Stack(
        children: [

          CustomScrollView(
          controller : _scrollController,
          slivers: [
            const SliverAppBar(
              title: Text('Contacts'),
              pinned: true,
            ),
             SliverPersistentHeader(
            delegate: MySliverPersistentHeaderDelegate(
              minHeight: 50,
              maxHeight: 50,
              child: Container(
                color: Colors.black,
                child: Row(
                  children: [
                    SizedBox(width: 16,),
                    Text(_contacts[_firstVisibleIndex].name[0],style: TextStyle(color: Colors.white),),
                   // Text(_firstVisibleIndex.toString(),style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ),
            pinned: true,
          ),
          SliverList(
            
  delegate: SliverChildBuilderDelegate(
    
    (BuildContext context, int index) {
        final contact = _contacts[index];
      //  if (_selectedLetter.isNotEmpty &&
      //             !_contacts[index].name.startsWith(_selectedLetter)) {
      //           return const SizedBox.shrink();
      //         }
     return Container(
      height: _itemHeight,
       child: ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.phoneNumber),
                ),
     );
    },
    childCount: _contacts.length, // Replace with your actual item count
  ),
)
          ],
        ),
          // Container(
          //    alignment: Alignment.topRight,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right:28.0),
          //     child: Text(_selectedLetter,style: TextStyle(fontSize: 20),),
          //   ),
          // ),
        _te()

          
        
        ],
      ),
    );
  }

  _te(){
    return   Positioned(
      right: 0,
      top: 150,

      child: Container(
              
              alignment: Alignment.centerRight,
             
              child: GestureDetector(
                  onVerticalDragDown: (DragDownDetails details) {
                     // _scrollTo(details.localPosition.dy);
                    },
                    onVerticalDragUpdate: (DragUpdateDetails details) {
                      final RenderBox box = context.findRenderObject() as RenderBox;
                      final offsetY = box.globalToLocal(details.globalPosition).dy;
                      final index = (offsetY ~/ _itemHeight).clamp(0, _alphabetMap.length - 1);
                      final selectedLetter = _alphabetMap.keys.elementAt(index);
                      if (selectedLetter != _selectedLetter) {
                        setState(() {
                          _selectedLetter = selectedLetter;
                        });
                        _scrollTo(_alphabetMap[selectedLetter]! * _itemHeight);
                      }
                    },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                  
                    children: _alphabetMap.keys.map((String letter) {
                      return GestureDetector(
                        onTap: () {
                          print(_alphabetMap[letter]!);
                          setState(() {
                            _selectedLetter = letter;
                          });
                          _scrollTo(_alphabetMap[letter]! * _itemHeight);
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
    );
  }

  void _scrollTo(double position) {
    final index = position ~/ _itemHeight;
    print(index);
    _scrollController.animateTo(index * _itemHeight,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}



