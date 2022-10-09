# Flutter clean architecture in null safe

This project is create for being a template clean architecture.


## Table of contents
- [Technologies](#technologies)
- [Installation](#installation)
- [Packages for clean architecture](#packages-for-clean-architecture)

## Technologies
Project is created with:

![Logo](https://miro.medium.com/max/556/0*zUtZYiJ1bDTugOYY)
## Installation

- ### Install packages
    ```bash
        flutter pub get
    ``` 

- ### Generate comman
    1. Generate dependencies file, model, third party.
    ```bash
        flutter pub run build_runner build
    ``` 
    if there are some conflict files you can solve by this command:

    ```bash
        flutter pub run build_runner build --delete-conflicting-outputs
    ``` 

## Packages for clean architecture
- ### Injectable
    This package is using for generating the dependencies injection automatically [more info](https://pub.dev/packages/injectable).
- ### flutter_bloc
    In flutter, there are many way to manage the sate but this project we will use flutter_bloc, which easy to learn and more origanize [more info](https://pub.dev/packages/flutter_bloc).
- ### equatable
    Object or Custom model in flutter cannot commpare directly, so this package will help you to compare object and object like nature [more info](https://pub.dev/packages/equatable).
- ### dartz
    To handle the errors is not easy, but if you use dartz handlering errors will be like a baby [more info](https://pub.dev/packages/dartz).
- ### retrofit
    How to handle the api call? So Let's go to retrofit then you will see [more info](https://pub.dev/packages/retrofit).
## Authors

![Logo](https://comet.la/wp-content/uploads/2019/07/comet-digital-company-mobile-application-logo.png)
