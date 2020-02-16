import 'package:flutter/material.dart';
import 'package:login/bloc/bloc.dart';
import 'package:login/bloc/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Bloc bloc = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(left: 80.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('lib/assets/avatar.png'),
                height: 100.0,
              ),
              //Icon(
              //  Icons.person_pin,
              //  color: Color.fromRGBO(108, 99, 255, 1.0),
              //  size: 80.0,
              //),
              //SizedBox(height: 30.0),
              Text(
                'Welcome,',
                style:
                    Theme.of(context).textTheme.title.copyWith(fontSize: 28.0),
              ),
              Text(
                'sign in to continue',
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 28.0,
                      color: Colors.grey,
                    ),
              ),
              SizedBox(height: 40.0),
              //
              //
              //
              //Email
              //
              //
              //
              StreamBuilder(
                stream: bloc.usernameStream,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: UnderlineInputBorder(),
                      errorText: snapshot.error,
                      helperText: '',
                    ),
                    onChanged: bloc.usernameSink,
                  );
                },
              ),
              //SizedBox(height: 40.0),
              //
              //
              //
              //Password
              //
              //
              //
              StreamBuilder(
                stream: bloc.passwordStream,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: UnderlineInputBorder(),
                      errorText: snapshot.error,
                      helperText: '',
                    ),
                    onChanged: bloc.passwordSink,
                  );
                },
              ),
              SizedBox(height: 40.0),
              StreamBuilder(
                stream: bloc.formValidator,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return RaisedButton(
                    color: Color.fromRGBO(108, 99, 255, 1.0),
                    child: FittedBox(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Get Started',
                              style: Theme.of(context).textTheme.title.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            SizedBox(width: 10.0),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0.0,
                    focusElevation: 0.0,
                    highlightElevation: 0.0,
                    hoverElevation: 0.0,
                    onPressed: snapshot.hasData
                        ? () {
                            Navigator.pushReplacementNamed(context, '/');
                          }
                        : null,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
