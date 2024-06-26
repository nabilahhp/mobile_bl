import 'package:flutter/material.dart';
import 'package:mobile_bl/main.dart';
import 'resetpass.dart';
import '../constans.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/data/latar.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password?',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                    color: Color(0xffffffff),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  "Don’t worry! Please enter the email associated with your account.",
                  style: Interstyle.copyWith(fontSize: 15),
                  // textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 34,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Email Address",
                      style: Interstyle.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Your Email Address",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 16)),
                      ),
                    ),
                    SizedBox(
                  height: 40,
                ),
                Container(
                    width: double.infinity,
                    // margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPass()),
                          );
                      },
                      child: Text(
                        "Send Link",
                        style: Interstyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor),
                    )),
                SizedBox(
                  height: 45,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color:
                            Colors.white, // Atur warna garis sesuai kebutuhan
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.0),
                      child: Text(
                        "Or with",
                        style: TextStyle(
                            color: Color(0xfffffffff),
                            fontSize:
                                13), // Sesuaikan dengan gaya teks yang diinginkan
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color:
                            Colors.white, // Atur warna garis sesuai kebutuhan
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Remember password? ",
                      style: Interstyle.copyWith(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman pendaftaran
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: Interrrstyle.copyWith(fontSize: 15),
                      ),
                    ),
                     ],
                ),
              ],
            ),
              ],
          ),
        ),
      ),
      ),
    );
  }
}