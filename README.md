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


#### App Photos

## Scoob App Icon

![Scoob App Icon](https://github.com/Sena-dogan/scoob/assets/93337596/42b91871-0709-456c-a21b-8dad8b033404)


## Screenshots

![Screenshots](https://github.com/Sena-dogan/scoob/assets/93337596/3673885d-00ce-400e-a96c-6ffa3ef5db19)


### Overview

It's important to note that while the status indicates success when retrieving images from the Dog API, attempting to access the URL of certain images results in a "404 Not Found" error. This is likely due to the images being outdated.

To handle this situation, I've implemented a conditional statement in the "lib/data/repository/dog_repository.dart" file. This statement is designed to manage the scenario where the image URL is no longer valid.


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

In the code, I've included a comment explaining this situation. If the specified code block is removed, all dog breeds will be listed, including those whose images are no longer accessible. However, if the code remains unchanged, only the dog breeds with valid images will be displayed.

Please let me know if you need further changes. If you have any questions or need further clarification, you can contact me :))
