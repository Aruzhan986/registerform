import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_register_form/auth_repository.dart';
import 'package:flutter_register_form/bloc/auth_bloc.dart';
import 'package:flutter_register_form/mod/thirdpage.dart';
import 'package:flutter_register_form/translations/locale_keys.g.dart';

void main() {
  runApp(Secp());
}

class Secp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _hidePass = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _NameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _lifeHistoryController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  final List<String> _countries = ['Russia', 'Ukraine', 'Germany', 'France'];
  String _selectedCountry = 'Russia';

  late AuthBloc _authBloc;
  final AuthRepository _authRepository = AuthRepository();

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  @override
  void dispose() {
    _NameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _lifeHistoryController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    _authBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(authRepository: _authRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => _authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Registered) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(
                  Name: _NameController.text,
                  phoneNumber: _phoneNumberController.text,
                  email: _emailController.text,
                  country: _selectedCountry,
                  lifeHistory: _lifeHistoryController.text,
                ),
              ),
            );
          } else if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: _buildBody(context),
      ),
    );
  }

  @override
  Widget _buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Form'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10.0),
                TextFormField(
                  focusNode: _nameFocus,
                  autofocus: true,
                  controller: _NameController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.username.tr(),
                    hintText: LocaleKeys.inputusername.tr(),
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Full Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.userphone.tr(),
                    hintText: LocaleKeys.phonenumber.tr(),
                    helperText: LocaleKeys.inputphone.tr(),
                    prefixIcon: Icon(Icons.call),
                    suffixIcon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone Number is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: LocaleKeys.inputemail.tr(),
                    icon: Icon(Icons.mail),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!_emailController.text.contains('@')) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.map),
                    labelText: LocaleKeys.inputcountry.tr(),
                  ),
                  items: _countries.map((country) {
                    return DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
                  onChanged: (country) {
                    setState(() {
                      _selectedCountry = country as String;
                    });
                  },
                  value: _selectedCountry,
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a country';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _lifeHistoryController,
                  decoration: const InputDecoration(
                      labelText: 'Life Story',
                      hintText: 'Tell us about your self',
                      helperText: 'Keep it short, this is just a demo',
                      border: OutlineInputBorder()),
                  maxLines: 3,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Tell us about your self';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _hidePass = !_hidePass;
                        });
                      },
                    ),
                    icon: const Icon(Icons.security),
                  ),
                  obscureText: _hidePass,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm your password',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _hidePass = !_hidePass;
                        });
                      },
                    ),
                    icon: const Icon(Icons.border_color),
                  ),
                  obscureText: _hidePass,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _authBloc.add(UserRegisterEvent(
                        name: _NameController.text,
                        phoneNumber: _phoneNumberController.text,
                        email: _emailController.text,
                        country: _selectedCountry,
                        lifeHistory: _lifeHistoryController.text,
                        password: _passwordController.text,
                      ));
                    }
                  },
                  child: Text(LocaleKeys.Hello.tr()),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale('en'));
                  },
                  child: const Text('English'),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale('kk'));
                  },
                  child: const Text('Казахский'),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale('ru'));
                  },
                  child: const Text('Русский'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
