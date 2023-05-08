# flutter-applications
Bunch of applications for practicing different technologies(lib) in Flutter/Dart

### Applications that are under this repository:
- **flutter_async**: GetX, async, http(GET) + deserialization.
- **flutter_chess**: GetX controllers, tags, (lib)flutter_chess_board, navigation.
- **flutter_chess_score**: GetView, GetX, controllers, models.
- **flatter_random_number**: classic Dart code with setState() functions, ListView.
- **flutter_reset_number**: GetStorage, bindings, GetxController.
- <sub> future project flutter_language: Firebase, authorization... </sub> 

### The description of the project:
- flutter_async: the applicaiton has two containers/windows where each one does the work that is programmed for. Two different containers/windows are working asynchronous on one page at the same time.
   - First container shows the the length of the site which the name is written in the TextField;
   - Second container increasing/decreasing the size of the text "Żabka" each 5 second. 
   +bonus: the timer that is summing the increasing and decreasing time.
   
- flutter_chess: the application contains two pages.
   - First page contains two chessboards, one for each player; the movements on the boards are asynchronous. 
   - Second page contanes: Actual FEN(chessboard map), TextField that changes the FEN, 3 buttons with pre-scripted FEN

- flutter_chess_score: The application records the chess steps/values, writes it to the List<Model> and displays it in the ListView builder.

- flatter_random_number: random number is generated. A player is trying to guess the number by writing it to the TextField. If the number is bigger than the random one, the ball turns red, otherwise blue; After the player guessed the number, game finishes by throwing a green ball with "WON" sign on it.

- flutter_reset_number: the application shows the count of the presses with limitation of MAX 12 pushes. In the "Settings" page the number can be changed and the updated MAX number will be replaced with the new one. The application represents the GetStorage features, then after the closing app and reopening it, chosen settings will be uploaded in the application from the phone memory.

![first](https://user-images.githubusercontent.com/67626128/236911401-4e4e5551-49be-4d99-a8d7-b5d28a0da0eb.png)
![second](https://user-images.githubusercontent.com/67626128/236911385-d6ce7638-a602-42af-b83a-bb77314d8ce2.png)
