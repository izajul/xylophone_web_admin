import 'package:flutter/material.dart';

class AddSongPageThree extends StatelessWidget {
  AddSongPageThree({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FormField(
      key: _formKey,
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children: [
            Row(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.language_outlined),
                SizedBox(width: 12),
                Text(
                  "Choose Language *",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 12),

            /// language selection
            PopupMenuTheme(
              data: PopupMenuThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: PopupMenuButton(
                padding: EdgeInsetsGeometry.all(10),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Language"),
                      SizedBox(width: 56),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(child: Text("English")),
                    PopupMenuItem(child: Text("Bangla")),
                    PopupMenuItem(child: Text("Hindi")),
                    PopupMenuItem(child: Text("Arabic")),
                    PopupMenuItem(child: Text("Urdu")),
                    PopupMenuItem(child: Text("Tamil")),
                    PopupMenuItem(child: Text("Telugu")),
                  ];
                },
              ),
            ),

            SizedBox(height: 24),

            ///Set allowed mistake count
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.numbers_sharp),
                SizedBox(width: 12),
                Text(
                  "Set allowed mistake count (5-20)  *",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),

            SizedBox(height: 12),

            /// number input form field
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter mistake count number',
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a value';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                if (int.parse(value) < 5 || int.parse(value) > 20) {
                  return 'Please enter a number between 5 and 20';
                }
                return null;
              },
            ),

            SizedBox(height: 24),

            /// input song name
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.music_note_outlined),
                SizedBox(width: 12),
                Text(
                  "Song Name (language-specific)  *",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),

            SizedBox(height: 12),

            /// song name input form field
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter song name",
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a value';
                }

                return null;
              },
            ),

            SizedBox(height: 24),

            /// Upload thumbnail for song
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.image),
                SizedBox(width: 12),
                Text(
                  "Upload thumbnail (1:1) *",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),

            SizedBox(height: 12),

            /// thumbnail upload button
            Align(
              alignment: Alignment.centerLeft,
              child: UnconstrainedBox(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: (){},
                    child: Stack(
                      children: [
                        Image.network("https://plus.unsplash.com/premium_photo-1666901328734-3c6eb9b6b979?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwaW1hZ2VzfGVufDB8fDB8fHww"),

                        Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            backgroundColor: Colors.black26,
                            radius: 36,
                            child: Icon(Icons.add_a_photo_outlined, size: 36,color: Colors.white,),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        );
      },
    );
  }
}
