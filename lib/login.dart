import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(25),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
        children: [
          Column(children: [
            SizedBox(height: 40),
            Icon(Icons.person_outline, color: Colors.grey[300],size: 140,),
            SizedBox(height: 13),
            Text("Selamat Datang",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            ),
            Text("sign in untuk melanjutkan",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),),
            SizedBox(height: 20),
            Container(
              child: TextFormField(
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.supervised_user_circle, size: 30,
                  color: Colors.grey,),
                  labelText: "Username",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w800,
                  )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: TextFormField(
                obscureText: true,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock, size: 30,
                  color: Colors.grey,),
                  labelText: "Password",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w800,
                  )
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {}, 

                  child: Text("Lupa password",style:TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),))
              ],
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Text("Login",style: TextStyle(color: Colors.white),),
                
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tidak punya akun",style: TextStyle(fontSize: 18),),
                GestureDetector(
                  onTap: () {},
                  child: Text("Sign in", 
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    ),),
                ),
              ],
            )
          ],
          ),
        ],
      ),
      )),
      ),
    );
  }
}