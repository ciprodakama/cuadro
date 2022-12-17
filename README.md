
# Cuadro

A Cross Platform - Web, Android & iOS App multiplayer doodling & guessing game.
# Login Page
<img src="https://github.com/ciprodakama/cuadro/blob/master/screenshots/samples/LoginPage.png" width="200" /> 

I have started from the fork of the original project and tried making some improvements to the UI and UX, whilst reviewing functionalities and performance
Specifically I have enabled User Login, using Firebase. I have also modified the landing page and the aesthetics (App Icon, Fonts, Animations, etc).


## Tech Stack

**Client:** Flutter, socket_io_client, Firebase

**Server:** Node, Express, Socket.io, Mongoose

  
## Features
- Custom Logo and Animations
- Custom Fonts
- Social Login with Google
- Anonymous Login with Firebase
- Creating Room
- Joining Room
- Waiting Lobby
- Doodling Features (Everyone In Room Can see)
    - Changing Width of Pen
    - Changing Colour of Pen
    - Clearing off the Screen
    - Clearing off the Screen with Phone Shake (sensors)
    - Drawing
- Generating Random Words
- Chatting In Room
- Identifying Correct Words
- Switching Turns
- Changing Rounds
- Calculating Score
- LeaderBoard


  
## Screenshots

### Samples
<img src="https://github.com/ciprodakama/cuadro/blob/master/screenshots/samples/MainScreen.png" width="200"/> <img src="https://github.com/ciprodakama/cuadro/blob/master/screenshots/samples/CreateRoomScreen.png" width="200" /> <img src="https://github.com/ciprodakama/cuadro/blob/master/screenshots/samples/WaitingLobbyScreen.png" width="200" />

<img src="https://github.com/ciprodakama/cuadro/blob/master/screenshots/samples/DrawerTurn.png" width="200" /> <img src="https://github.com/ciprodakama/cuadro/blob/master/screenshots/samples/RoundComplete.png" width="200" /> <img src="https://github.com/ciprodakama/cuadro/blob/master/screenshots/samples/ScoreBoard.png" width="200" />

  
## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`MONGODB_URL`: `Your MongoDB URI Generated from MongoDB Atlas`

Make sure to replace <yourip> in `lib/screens/paint_screen.dart` with your IP address.

  
## Run Locally

Clone the project

```bash
  git clone https://github.com/ciprodakama/cuadro
```

Go to the project directory

```bash
  cd cuadro
```

Install dependencies (Client Side)
```bash
flutter pub get
```

Install dependencies (Server Side)

```bash
cd server && npm install
```

Start the server

```bash
npm run dev
```

  
