# flutter-applications
## Bunch of applications for practicing different technologies(lib) in Flutter/Dart

### Applications that are under this repository:
- flutter_async: GetX, async, http(GET) + deserialization.
- flutter_chess: GetX controllers, tags, (lib)flutter_chess_board, navigation.
- flutter_chess_score: GetView, GetX, controllers, models.
- flatter_random_number: classic Dart code with setState() functions, ListView.
- flutter_reset_number: GetStorage, bindings, GetxController, 
*future project* - flutter_language: Firebase, authorization...

### The description of the project:
- flutter_async: the applicaiton has two containers/windows where each one does the work that is programmed for. Two different containers/windows are working asynchronous on one page at the same time.
   1. First container shows the the length of the site which the name is written in the TextField;
   2. Second container increasing/decreasing the size of the text "Żabka" each 5 second. 
   +bonus: the timer that is summing the increasing and decreasing time.
   
- flutter_chess: the application contains two pages.
   1. First page contains two chessboards, one for each player; the movements on the boards are asynchronous. 
   2. Second page contanes: Actual FEN(chessboard map), TextField that changes the FEN, 3 buttons with pre-scripted FEN

- flutter_chess_score: The application records the chess steps/values, writes it to the List<Model> and displays it in the ListView builder.

- flatter_random_number: random number is generated. A player is trying to guess the number by writing it to the TextField. If the number is bigger than the random one, the ball turns red, otherwise blue; After the player guessed the number, game finishes by throwing a green ball with "WON" sign on it.

- flutter_reset_number: the application shows the count of the presses with limitation of MAX 12 pushes. In the "Settings" page the number can be changed and the updated MAX number will be replaced with the new one. The application represents the GetStorage features, then after the closing app and reopening it, chosen settings will be uploaded in the application from the phone memory.

<!-- ![Simulator Screen Shot - iPhone 14 Pro Max - 2023-05-08 at 15 33 04](https://user-images.githubusercontent.com/67626128/236837768-07caa5e1-2ea5-4005-b457-889eb0f8317f.png)
![Simulator Screen Shot - iPhone 14 Pro Max - 2023-05-08 at 15 13 12](https://user-images.githubusercontent.com/67626128/236833444-3183981f-fddd-41c2-9249-3c4833affc66.png)
![Simulator Screen Shot - iPhone 14 Pro Max - 2023-05-08 at 15 13 17](https://user-images.githubusercontent.com/67626128/236833470-be2503fc-2459-467f-8559-86818976e0c0.png) -->
<!-- ![Simulator Screen Shot - iPhone 14 Pro Max - 2023-05-08 at 20 40 49](https://user-images.githubusercontent.com/67626128/236905418-77b86a4b-0f2a-4080-b821-40f401edbd8f.png) -->
