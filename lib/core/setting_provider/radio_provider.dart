import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/api/api_manger.dart';
import 'package:islami/core/model/quran_radio.dart';

class RadioProvider extends ChangeNotifier{

  List<QuranRadio>radiosList=[];
  String? errorMessage;
  bool isLoading =false;
  int _currentIndex=0;
  bool isPlaying=false;
  QuranRadio? get radio {
    if (radiosList.isNotEmpty && _currentIndex < radiosList.length) {
      return radiosList[_currentIndex];
    }
    return null; // Return null if the list is empty or index is invalid
  }
  final player=AudioPlayer();

  getRadio()async{
    radiosList=[];
    isLoading=true;
    errorMessage=null;
    notifyListeners();
    try{
       radiosList=await ApiManger.getRadiosList();
    }catch(e){
      errorMessage=e.toString();

    }finally{
      isLoading=false;
      notifyListeners();
    }
  }

  void play()async{
    if(player.state==PlayerState.playing ){
      player.pause();
      isPlaying=false;
    }else if(player.state==PlayerState.paused){
      player.resume();
      isPlaying=true;
    }else{
     await player.play(UrlSource(radio?.url??""));
      isPlaying=true;
    }

    notifyListeners();

  }
  void next(){
    if(_currentIndex==radiosList.length-1){
      return;
    }

    _currentIndex++;
    player.stop();

    notifyListeners();

  }
  void previous(){
    if(_currentIndex==0){
      return;
    }

    _currentIndex--;
    player.stop();

    notifyListeners();


  }
}