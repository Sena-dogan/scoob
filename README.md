# scoob

A Dog Breeds App.

## Getting Started

This project is a case study for AppNation by Zeynep Sena Doğan.

## Getting Started
Get packages
```bash
flutter pub get
```

Run the app
```bash
flutter run
```

## Posible Errors
If you dont have generated files, you can generate them with this command
```bash
flutter pub run build_runner build
```

and of cousres if you have any error, you can clean the project with this command
```bash
flutter clean 
```
best problem solver :)

## App Photos

#### Scoob App Icon

![Scoob App Icon](https://github.com/Sena-dogan/scoob/assets/93337596/8f8e753b-8cc6-46ea-8453-3e0338ac83d5)


## Screenshots

![Screenshots](https://github.com/Sena-dogan/scoob/assets/93337596/da96205c-39da-4b5e-a6ef-7ec3b8f57999)


### Overview

In the process of developing this application, I encountered an issue related to the Dog API images. Despite receiving a "success" status when fetching pictures from the provided Dog API, certain images resulted in a "404 Not Found" error when attempting to access their links. I attribute this discrepancy to outdated images within the Dog API.

To address this issue, I've implemented a specific error-handling mechanism in the "lib/data/repository/dog_repository.dart" file. Below is an explanation of the related code:

```dart
        /// Fetches the dog image from the provided URL in [dogImage.message].
        /// If the image is not available (404 status code), 
        /// it returns a [DogImage] object with null values.
        /// Otherwise, it returns the fetched [DogImage] object.
        /// 
        /// You can remove this block of code if you want to show the breeds
        /// with missing images.
        /// If image is missing ui will show a error icon and a text.
        /// Everything will work fine. :))))
        if (dogImage.message != null) {
          var dogImageResponse = await http.get(Uri.parse(dogImage.message!));
          if (dogImageResponse.statusCode == 404) {
            // Print the request URL
            debugPrint("404 Fetch Image Request: ${dogImage.message}");
            // Skip if image is not available
            return DogImage(
              message: null,
              status: null,
            );
          }
        }
        /// This is the end of the block of code that you can remove!
        return dogImage;
```
In the above code snippet, I've introduced an error check to ensure that the image URL does not return a "404 Not Found" error before processing the data. If an invalid image is detected, the associated dog breed is excluded from the listing to enhance the overall user experience.

Important Note
Removing or altering this error-handling logic will result in displaying all dog breeds, including those with images that lead to a "404 Not Found" error. The current implementation aims to filter out breeds with incorrect images to provide users with a more reliable and visually appealing application.

Feel free to review and modify this error-handling mechanism based on your preferences or specific requirements. If you have any questions or need further clarification, you can contact me :))
