
import 'package:awesome_contact_app/contact_details_view.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'contact_model.dart';

class Homeview extends StatelessWidget {
  Homeview({ Key? key }) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String,String>>data =
  [
	{
		"name": "Zahir Ballard",
		"phone": "1-531-990-0526",
		"email": "ornare.libero@hotmail.com",
		"region": "Valle d'Aosta",
		"country": "India"
	},
	{
		"name": "Yeo Merrill",
		"phone": "1-332-774-4832",
		"email": "lectus.pede@hotmail.ca",
		"region": "Warwickshire",
		"country": "United States"
	},
	{
		"name": "Jeanette Collier",
		"phone": "(322) 372-8789",
		"email": "lacus.ut@protonmail.net",
		"region": "Samsun",
		"country": "Germany"
	},
	{
		"name": "Abraham Carrillo",
		"phone": "(877) 399-1647",
		"email": "urna.nec@icloud.ca",
		"region": "Ivanovo Oblast",
		"country": "China"
	},
	{
		"name": "Kiona Lowery",
		"phone": "1-275-555-4573",
		"email": "magna.duis@icloud.net",
		"region": "Ankara",
		"country": "Pakistan"
	},
	{
		"name": "Thaddeus Curry",
		"phone": "(944) 256-2684",
		"email": "massa.mauris.vestibulum@outlook.org",
		"region": "Henegouwen",
		"country": "Colombia"
	},
	{
		"name": "Lucian Perry",
		"phone": "1-263-978-3556",
		"email": "vitae@aol.com",
		"region": "Tasmania",
		"country": "Brazil"
	},
	{
		"name": "Yuri Gaines",
		"phone": "1-220-445-1914",
		"email": "vitae.diam.proin@outlook.edu",
		"region": "Maine",
		"country": "Peru"
	},
	{
		"name": "Ronan Farmer",
		"phone": "(477) 560-7527",
		"email": "ac@google.net",
		"region": "Galicia",
		"country": "Canada"
	},
	{
		"name": "Tad Potts",
		"phone": "1-881-467-8342",
		"email": "sem@hotmail.edu",
		"region": "Maranhão",
		"country": "Mexico"
	}
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('My Contacts' ,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,
        color: Colors.black),),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(radius: 25,
              backgroundImage: AssetImage('assets/avatar.jpg'),),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)),
                hintText: 'Search by name or number',
                prefixIcon: const Icon(Icons.search)
          ),
        
        ),
        ),
      ),
     ), 
     body: SafeArea(
       child: ListView(
       controller: _scrollController,
       children: [
       const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Recent', 
           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
           ),
        ),
       ListView.separated(
         controller: _scrollController,
         shrinkWrap: true,
         itemBuilder: (context,index){
            return  ListTile(
              onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
  return ContactDetailsView(contact: Contact(country: 'Ghana', email: 'naanaa@gmail.com',
  name: 'Karren Quarcoo',
  phone: '+233 24 60 66 431',
  region: 'Greater Accra'));
}));
              },
           leading: const CircleAvatar(
             radius: 25,
             backgroundImage: AssetImage('assets/person1.jpg'),
           ),
           title: const Text(
             'Karren Quarcoo',
             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
           ),
           subtitle: const Text('+233 27 37 79 125'),
           trailing: const IconButton(onPressed: null, icon: Icon(Icons.more_horiz)),
         );
           },
           separatorBuilder: (context,index){
             return  const Divider(
           indent: 25,
           thickness: 2,
             );
           },
           itemCount: 3),     
           const Padding(
             padding: EdgeInsets.symmetric(horizontal: 16),
             child: Text('Contacts',
             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
           ),
           GroupedListView<Map<String,String>,String>(
             shrinkWrap: true,
             elements:data,
    groupBy: (element) => element['name'].toString().substring(0,1),
    groupSeparatorBuilder: (String groupByValue) => 
    SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          groupByValue.substring(0,1),
          textAlign: TextAlign.right,
          style: 
          const TextStyle(fontWeight: FontWeight.w600, fontSize: 18 ),
          ),
      ),
      ),
    itemBuilder: (context, Map<String,String> element) {
      Contact contact = Contact.fromJson(element);
      return Column(
      children: [
        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
           return ContactDetailsView(contact: contact,);
           },));
          },
               leading: const CircleAvatar(
                 radius: 25,
                 backgroundImage: AssetImage('assets/person1.jpg'),
               ),
               title: Text(
                 '${element['name']}',
                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
               ),
              subtitle: Text('${element['phone']}'),
              trailing:
               const IconButton(onPressed: null, icon: Icon(Icons.more_horiz),),),
              const Divider(
           indent: 25,
           thickness: 2,
              )
      ],
    );
    },
    
    itemComparator: (item1, item2) => 
    item1['name']!.compareTo(item2['name']!), // optional
    useStickyGroupSeparators: true, // optional
    floatingHeader: true, // optional
    order: GroupedListOrder.ASC, // optional
  ),
       ],
     ),
     ),
     floatingActionButton: const FloatingActionButton(
       backgroundColor: Color(0xff1A4ADA),
       onPressed: null,    
       child: Icon(Icons.add),),
        );
  }
}