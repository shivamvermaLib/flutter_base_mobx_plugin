# flutter_base_mobx_plugin

A new flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


App Architecture: we are using flutter mobx architecture
we use store and model class for managing state and api handling with the view

JSON serialize- for serializing of json data
NOTE: FOr Model class make sure to update == operator and hashCode


Build Runner- use for auto building the generated file for json and mobx.

BaseApp - extends the App compone tof the flutter sdk
it has all pedefined data like themedata, localization, navigation ,they are will be using mobx update for udpating values


BaseScreeen - base file for screens having 5 methods 
//mandatory
init
builder(build)
dispose
change dependencies
title

//optional
appbar -> add custom appbar else default appbar
navigationbar-> add bottom navigation
addreaction(for mobxx)
floating actionbutton -> add floating action button
drawer-> to add drawer functionality
showmessage-> show snack bar
willPopScope -> to handle back press stuffs


