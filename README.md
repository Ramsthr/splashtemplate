# SplashTemplate

splash app for multiple screens.


# Requirements
- Any Operating System (ie. MacOS X, Linux, Windows)
- Any IDE with Flutter SDK installed (ie. IntelliJ, Android Studio, VSCode etc)
- And Knowledge of Flutter

# Getting Started
- Clone the project
-  If you want to add more screen or update any text then you can follow below instructions:- 
   - Add Images in [assets](./assets/) folder.
   - Now add image path and text by using [data](./lib/resources/getdata.dart) class in [dataList](./lib/resources/inputimageandtext.dart) (It is a List of data objects).
   - Example:-
   ```
   List<Data> dataList = [
       Data(
            bigText: 'Hii',
            smallText: 'You are Welcome',
            imageUrl: "assets/katie-moum-7XGtYefMXiQ-unsplash.jpg",
           ),
      Data(
         bigText: 'Hey',
         smallText: 'How are you doing',
         imageUrl: "assets/morvanic-lee-GiUJ02Yj_io-unsplash.jpg",
         ),
     Data(
        bigText: 'Nice',
        smallText: 'Hope app is useful for you',
        imageUrl: "assets/wilhelm-gunkel-h4KYT7X1HM4-unsplash.jpg",
       ),
    ];
   ```
- Before runnning the application, run the following command:
  ```
  flutter pub get
  ```
- Then run the project with the following command:
  ```
  flutter run
  ```

 # ScreenShot of App Screeen
![WhatsApp Image 2023-10-13 at 7 45 42 PM](https://github.com/Ramsthr/splashtemplate/assets/42464973/973e992d-50bd-468e-bfe7-f0248a891489 )
![WhatsApp Image 2023-10-13 at 7 46 25 PM](https://github.com/Ramsthr/splashtemplate/assets/42464973/856be725-45c1-4646-a3e2-1dc9093292c4)
![WhatsApp Image 2023-10-13 at 7 46 53 PM](https://github.com/Ramsthr/splashtemplate/assets/42464973/53884603-3596-4b5b-936f-0faecabb1f46)

 
