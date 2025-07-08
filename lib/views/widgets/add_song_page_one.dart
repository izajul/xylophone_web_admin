
import 'package:flutter/material.dart';

class AddSongPageOne extends StatelessWidget {
  const AddSongPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Upload Song+Singing ( .MP3 ) *",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12),

          // Song + Music upload button
          Row(
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Upload audio"),
                    SizedBox(width: 12),
                    Icon(Icons.upload_file),
                  ],
                ),
              ),
              SizedBox(width: 12),

              Text(
                "File: filename.mp3",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),

          SizedBox(height: 24),

          Text(
            "Upload piano audio ( .MP3 )",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12),

          // Piano audio upload button
          Row(
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Upload audio"),
                    SizedBox(width: 12),
                    Icon(Icons.upload_file),
                  ],
                ),
              ),
              SizedBox(width: 12),

              Text(
                "File: filename.mp3",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),

          SizedBox(height: 24),

          Text(
            "Upload xylophone audio ( .MP3 )",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12),

          // Song + Music upload button
          Row(
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Upload Song"),
                    SizedBox(width: 12),
                    Icon(Icons.upload_file),
                  ],
                ),
              ),
              SizedBox(width: 12),

              Text(
                "File: filename.mp3",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


