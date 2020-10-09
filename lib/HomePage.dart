import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isCross = true;
  String message;
  List<String> gameState;

  AssetImage cross = AssetImage('images/cross.png');
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage edit = AssetImage('images/edit.png');

  @override
  void initState(){
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty"
      ];

      this.message = "";
    });
  }

  resetGame(){
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty"
      ];

      this.message = "";
    });
  }

  AssetImage getImage(String value){
    switch(value){
      case('empty'):
        return edit;
        break;
      case('cross'):
        return cross;
        break;
      case('circle'):
        return circle;
        break;
    }
  }

  playGame(int index){
    if(this.gameState[index] == 'empty'){
      setState(() {
        if(this.isCross){
          this.gameState[index] = 'cross';
        }else{
          this.gameState[index] = 'circle';
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  checkWin(){
  if((this.gameState[0] != 'empty') && (this.gameState[0] == this.gameState[1]) &&
    (this.gameState[1] == this.gameState[2])){
    setState(() {
      this.message = '${this.gameState[0]} Wins!';
      Future.delayed(const Duration(milliseconds: 1000), () {
        this.resetGame();
      });
    });
  }else if((this.gameState[3] != 'empty') && (this.gameState[3] == this.gameState[4]) &&
      (this.gameState[4] == this.gameState[5])) {
    setState(() {
      this.message = '${this.gameState[3]} Wins!';
      Future.delayed(const Duration(milliseconds: 1000), () {
        this.resetGame();
      });
    });
  }else if((this.gameState[6] != 'empty') && (this.gameState[6] == this.gameState[7]) &&
      (this.gameState[7] == this.gameState[8])) {
    setState(() {
      this.message = '${this.gameState[6]} Wins!';
      Future.delayed(const Duration(milliseconds: 1000), () {
        this.resetGame();
      });
    });
  }else if((this.gameState[0] != 'empty') && (this.gameState[0] == this.gameState[3]) &&
      (this.gameState[3] == this.gameState[6])) {
    setState(() {
      this.message = '${this.gameState[0]} Wins!';
      Future.delayed(const Duration(milliseconds: 1000), () {
        this.resetGame();
      });
    });
  }else if((this.gameState[1] != 'empty') && (this.gameState[1] == this.gameState[4]) &&
      (this.gameState[4] == this.gameState[7])) {
    setState(() {
      this.message = '${this.gameState[1]} Wins!';
      Future.delayed(const Duration(milliseconds: 1000), () {
        this.resetGame();
      });
    });
  }else if((this.gameState[2] != 'empty') && (this.gameState[2] == this.gameState[5]) &&
      (this.gameState[5] == this.gameState[8])) {
    setState(() {
      this.message = '${this.gameState[2]} Wins!';
      Future.delayed(const Duration(milliseconds: 1000), () {
        this.resetGame();
      });
    });
  }else if((this.gameState[0] != 'empty') && (this.gameState[0] == this.gameState[4]) &&
      (this.gameState[4] == this.gameState[8])) {
    setState(() {
      this.message = '${this.gameState[0]} Wins!';
      Future.delayed(const Duration(milliseconds: 1000), () {
        this.resetGame();
      });
    });
  }else if((this.gameState[2] != 'empty') && (this.gameState[2] == this.gameState[4]) &&
      (this.gameState[4] == this.gameState[6])) {
    setState(() {
      this.message = '${this.gameState[2]} Wins!';
      Future.delayed(const Duration(milliseconds: 1000), () {
        this.resetGame();
      });
    });
  }else if(!this.gameState.contains('empty')){
    setState(() {
      this.message = 'Game Draw';
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('TicTacToe'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
            childAspectRatio: 1.0,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 35.0),
            itemBuilder: (context,i) => SizedBox(
              width: 100.0,
              height: 100.0,
              child: MaterialButton(
                onPressed: (){
                  this.playGame(i);
                },
                child: Image(
                  image: this.getImage(this.gameState[i]),
                ),
              ),
            ),
          itemCount: this.gameState.length,
          padding: EdgeInsets.all(20.0),)
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(this.message,style:
              TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),),
          ),
          MaterialButton(onPressed: ()=> this.resetGame(),child: Text('Reset Game',style:
            TextStyle(color: Colors.white,fontSize: 20.0),),color: Colors.green
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text('MasudRasa.dev',style: TextStyle(
              color: Colors.black,
              fontSize: 15.0
            ),),
          )
        ],
      ),
    );
  }
}
