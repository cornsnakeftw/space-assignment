import "dart:math";

abstract class SpaceShip{
  int health = 100;
  int firePower = 10;
  
  void hit();
  void isDestroyed();
}

class ArmoredSpaceShip extends SpaceShip {
  
  
  final rndmArmorPower = Random().nextInt(40);

  @override
  void hit(){
    
    int damage;
    damage = firePower - rndmArmorPower;
    health = health - damage.toInt();
    
  }
  @override
  void isDestroyed(){
    print('Spaceship 1 is down! ');
  }
  
}

// HighSpeed SpaceShip Class
class HighSpeedSpaceShip extends SpaceShip {
  @override
  void hit() {
    bool dodging = Random().nextBool();

    if (dodging == true){
      health = health - 0;
    }
    else{
      health = health - firePower;
    }
  }

  @override 
  void isDestroyed(){
    print("Spaceship 2 is down!");
  }
}


class Battlefield{
  void startBattle(SpaceShip sp1, SpaceShip sp2){
   

    do {
      sp1.hit();
      print("SP1 is hit \n  health: ${sp1.health} ");
      sp2.hit();     
      print("SP2 is hit \n  health: ${sp1.health} ");      
    }while (sp1.health > 0 && sp2.health >0);

  if (sp1.health <= 0){
  ArmoredSpaceShip().isDestroyed();
  }
  else if (sp2.health <=0){
  HighSpeedSpaceShip().isDestroyed();
  }
  }
}

void main(){
  ArmoredSpaceShip sp1 = ArmoredSpaceShip();
  HighSpeedSpaceShip sp2 = HighSpeedSpaceShip();
  Battlefield().startBattle(sp1, sp2);
}