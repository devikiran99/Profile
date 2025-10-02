import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

import '../../model/certificate_model.dart';

class ImageViewer {
  ImageViewer(BuildContext context, int index) {
    showGeneralDialog(
      barrierColor: Colors.black,
      transitionDuration: Duration(milliseconds: 500),
      barrierDismissible: true,
      barrierLabel: 'Barrier',
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          maxLines: 1,
                          overflow:  TextOverflow.ellipsis,
                          certificateList[index].name,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded image covering the rest of the screen
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PhotoView(
                      imageProvider: AssetImage(certificateList[index].certificateSrc),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



