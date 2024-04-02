import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../DoctorsScreens/DoctorBottomNavigationManager/DoctorBottomNavigation.dart';
import '../core/utils/app_url.dart';
import '../patientFlow/registration_screens/sign_up_screen_two_for_patient_screen/sign_up_screen_two_for_patient_screen.dart';

class Api_Services {

  ///Login Api
   Future<bool> login(String email, String password) async {

    String apiUrl = 'https://api-b2c-refactor.doctari.com/login/'; // Replace with your API URL
    // String apiUrl="${AppUrl.LoginApi}";

    var body = {
      'email': email,
      'password': password
    };

    var headers={
      'Content-Type': 'application/json'
    };

    try {
      print("Sending login request to: $apiUrl");
      print("Request body: $body");

      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(body),
        headers: headers,
      );
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Login successful, handle accordingly
        print('Login successful');
        return true;
      } else {
        // Login failed, handle accordingly
        print('Login failed : ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      // Exception occurred, handle accordingly
      print('Exception: $e');
      return false;
    }
  }

  /// Request Reset Password Api
   Future<bool> requestResetPassword(String email) async {
     String apiUrl = 'https://api-b2c-refactor.doctari.com/password-reset/'; // Replace with your API URL
     // String apiUrl="${AppUrl.Request_Reset_Password_Api}";

     var body = {
       'email': email,
     };

     var headers={
       'Content-Type': 'application/json'
     };

     try {
       print("Sending request reset password to: $apiUrl");
       print("Request body: $body");

       final response = await http.post(
         Uri.parse(apiUrl),
         body: jsonEncode(body),
         headers: headers,
       );
       print("Response status code: ${response.statusCode}");
       print("Response body: ${response.body}");

       if (response.statusCode == 200 || response.statusCode == 201) {
         // Password reset request successful
         print('Password reset request successful');
         return true;
       } else {
         // Password reset request failed
         print('Password reset request failed : ${response.reasonPhrase}');
         return false;
       }
     } catch (e) {
       // Exception occurred, handle accordingly
       print('Exception: $e');
       return false;
     }
   }

   /// doctorRegister
   Future<bool> registerDoctor(
       String email,
       String password,
       String firstName,
       String lastName,
       String? identityDoc,
       String Dob,
       String gender,
       String telephone,
       // DropdownItem? country, // Change parameter type to DropdownItem
       String? city,
       String? license,
       String universityName,
       String countryName,
       String specialistName,
       ) async {

     String apiUrl = "https://api-b2c-refactor.doctari.com/doctor/account/signup/";
     // String apiUrl="${AppUrl.DoctorRegisterApi}";

     var headers = {
       'Content-Type': 'application/json',
       // Add any additional headers if required, such as an API key
     };

     try {

       // Fetch university ID
       final int? universityId = await fetchUniversityId(universityName);
       if (universityId == null) {
         print('University ID not found');
         return false;
       }

       // Fetch country ID
       final int? countryId = await fetchUniversityId(countryName);
       if (countryId == null) {
         print('Country ID not found');
         return false;
       }

       // Fetch specialist ID
       final int? specialistId = await fetchUniversityId(specialistName);
       if (specialistId == null) {
         print('Specialist ID not found');
         return false;
       }

       var body = {
         "email": email,
         "password": password,
         "first_name": firstName,
         "last_name": lastName,
         "identity_document": identityDoc,
         "date_of_birth": Dob,
         "gender": gender,
         "telephone": telephone,
         // "country": country?.value,
         // "specialty": specialist,// Access value property
         "city": city,
         "license_number": license,
         "university": universityId,
         "country": countryId,
         "specialty": specialistId,
       };
       print("Sending Doctor registration request to: $apiUrl");
       print("Request body: $body");

       var response = await http.post(Uri.parse(apiUrl),
           headers: headers, body: json.encode(body));

       print("Response status code: ${response.statusCode}");
       print("Response body: ${response.body}");

       if (response.statusCode == 200 || response.statusCode == 201) {
         // Registration successful
         print("Doctor registered successfully!");
         return true;
       } else {
         // Registration failed
         print("Failed to register doctor: ${response.reasonPhrase}");
         return false;
       }
     } catch (e) {
       // Exception occurred, handle accordingly
       print("Error registering doctor: $e");
       return false;
     }
   }

   /// patientRegister
   Future<bool> registerPatient(
      String email,
      String password,
      String firstName,
      String lastName,
      String? identityDoc,
      String Dob,
      String gender,
      String telephone,
      // DropdownItem? country, // Change parameter type to DropdownItem
      String? city,
      String? license,
       String countryName,
      ) async {

    String apiUrl =
        "https://api-b2c-refactor.doctari.com/patient/account/signup/";
    // String apiUrl="${AppUrl.PatientRegisterApi}";

    var headers = {
      'Content-Type': 'application/json',
      // Add any additional headers if required, such as an API key
    };

    try {

      // Fetch country ID
      final int? countryId = await fetchUniversityId(countryName);
      if (countryId == null) {
        print('Country ID not found');
        return false;
      }
      var body = {
        "email": email,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "identity_document": identityDoc,
        "date_of_birth": Dob,
        "gender": gender,
        "telephone": telephone,
        // "country": country?.value, // Access value property
        "city": city,
        "license_number": license,
        "country": countryId,
        // "weight": 12,
        // "height": 200,
        // "surgeries": ""
      };

      print("Sending registration request to: $apiUrl");
      print("Request body: $body");

      var response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: json.encode(body));

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Registration successful
        print("Patient registered successfully!");
        return true;
      } else {
        // Registration failed
        print("Failed to register patient: ${response.reasonPhrase}");
        return false;
      }
    } catch (e) {
      // Exception occurred, handle accordingly
      print("Error registering patient: $e");
      return false;
    }
  }

  ///Fetch Countries
   Future<List<String>> fetchCountries() async {

     String apiUrl = 'https://api-b2c-refactor.doctari.com/country/'; // Replace with your API URL
     // String apiUrl="${AppUrl.countriesApi}";

     try {

       final response = await http.get(Uri.parse(apiUrl));

       print("Response status code: ${response.statusCode}");
       print("Response body: ${response.body}");

       if (response.statusCode == 200) {
         List<dynamic> data = jsonDecode(response.body);
         List<String> countries = data.map((item) => item['name'].toString()).toList();
         return countries;

       } else {
         throw Exception('Failed to load countries');
       }
     } catch (e) {
       throw Exception('Error fetching countries: $e');
     }
    }

   ///Fetch Universties
   Future<List<String>> fetchUniversties() async {

     String apiUrl = 'https://api-b2c-refactor.doctari.com/university/'; // Replace with your API URL
     // String apiUrl="${AppUrl.universtiesApi}";

     try {

       final response = await http.get(Uri.parse(apiUrl));

       print("Response status code: ${response.statusCode}");
       print("Response body: ${response.body}");

       if (response.statusCode == 200) {
         List<dynamic> data = jsonDecode(response.body);
         List<String> universties = data.map((item) => item['name'].toString()).toList();
         return universties;

       } else {
         throw Exception('Failed to load universties');
       }
     } catch (e) {
       throw Exception('Error fetching universties: $e');
     }
   }

   ///Fetch Specialists
   Future<List<String>> fetchSpecialists() async {

     String apiUrl = 'https://api-b2c-refactor.doctari.com/specility/'; // Replace with your API URL
     // String apiUrl="${AppUrl.specialistsApi}";

     try {

       final response = await http.get(Uri.parse(apiUrl));

       print("Response status code: ${response.statusCode}");
       print("Response body: ${response.body}");

       if (response.statusCode == 200) {
         List<dynamic> data = jsonDecode(response.body);
         List<String> specialist = data.map((item) => item['name'].toString()).toList();
         return specialist;

       } else {
         throw Exception('Failed to load specialist');
       }
     } catch (e) {
       throw Exception('Error fetching specialist: $e');
     }
   }

   ///Fetch UniversityId
   Future<int?> fetchUniversityId(String universityName) async {
     String apiUrl = 'https://api-b2c-refactor.doctari.com/university/?name=$universityName';
     try {
       final response = await http.get(Uri.parse(apiUrl));
       if (response.statusCode == 200) {
         final List<dynamic> universities = jsonDecode(response.body);
         if (universities.isNotEmpty) {
           // Assuming the first university in the list is the correct one
           return universities[0]['id'];
         }
       }
     } catch (e) {
       print('Error fetching university ID: $e');
     }
     return null;
   }

   ///Fetch CountryId
   Future<int?> fetchCountryId(String countryName) async {
     String apiUrl = 'https://api-b2c-refactor.doctari.com/country/?name=$countryName';
     try {
       final response = await http.get(Uri.parse(apiUrl));
       if (response.statusCode == 200) {
         final List<dynamic> countries = jsonDecode(response.body);
         if (countries.isNotEmpty) {
           // Assuming the first country in the list is the correct one
           return countries[0]['id'];
         }
       }
     } catch (e) {
       print('Error fetching country ID: $e');
     }
     return null;
   }

   ///Fetch SpecialistId
   Future<int?> fetchSpecialistId(String specialistName) async {
     String apiUrl = 'https://api-b2c-refactor.doctari.com/specility/?name=$specialistName';
     try {
       final response = await http.get(Uri.parse(apiUrl));
       if (response.statusCode == 200) {
         final List<dynamic> specialists = jsonDecode(response.body);
         if (specialists.isNotEmpty) {
           // Assuming the first specialist in the list is the correct one
           return specialists[0]['id'];
         }
       }
     } catch (e) {
       print('Error fetching specialist ID: $e');
     }
     return null;
   }
}