import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


class ScannerScreen extends StatefulWidget {

  const ScannerScreen({super.key});


  @override
  State<ScannerScreen> createState() =>
      _ScannerScreenState();

}



class _ScannerScreenState 
extends State<ScannerScreen> {


  bool encontrado = false;



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Escanear código",
        ),

      ),



      body: MobileScanner(

        onDetect: (capture) {


          if (encontrado) return;



          final List<Barcode> barcodes =
              capture.barcodes;



          for (final barcode in barcodes) {


            final String? codigo =
                barcode.rawValue;



            if (codigo != null) {


              encontrado = true;


              Navigator.pop(
                context,
                codigo,
              );


              break;

            }

          }


        },

      ),

    );

  }

}