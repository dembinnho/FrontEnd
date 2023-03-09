# location_front

This repo contains a flutter front web app, it has node express backend which is already deployed at this url:
https://secure-web-dev-backend-lwkp.onrender.com/

You can download the backend server and run it locally through this link:
https://github.com/dembinnho/secure-web-dev-backend

## 👷 Prerequisites to run the project locally

1. Install flutter on your machine: https://docs.flutter.dev/get-started/install

2. Install Google Chrome if it's not already in your machine

## Run locally

1. Launch the secure web dev backend viia this url: https://secure-web-dev-backend-lwkp.onrender.com/
2. run "flutter run ." and select chrome as environment to run the app
3. Enjoy it in fullscreen !

## Run without installing

1. Launch the secure web dev backend via this url: https://secure-web-dev-backend-lwkp.onrender.com/
2. Lauch the app via this url: https://front-end-mocha-omega.vercel.app/
3. Enjoy it in fullscreen !

## Quick information
This project is a front application linked to a node/express backend.
It is meant to run on Chrome, however you can launch it on an Android or IOS device (will not run correctly).

I used the MVC pattern, as in flutter everything is a widget and we compose widget with others to build screen.

the Lib directory contains

    --> Models (contains the used models (objects to instanciate) (Location))
    --> Utils (contains the utilitaries (for instance the image handler))
    --> Widgets (contains widgets used heavily in the app)
    --> UI (contains the app pages)
    
We used http protocol to make get and post request