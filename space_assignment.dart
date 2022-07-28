import "dart:math";

abstract class SpaceShip{
  int health;
  int firePower;
  
  void hit(int atk);
  void isDestroyed();

  SpaceShip(this.health, this.firePower);
}

class ArmoredSpaceShip extends SpaceShip {
  
  
  final rndmArmorPower = Random().nextInt(40);

  @override
  void hit(int atk){
    
    int damage;
    damage = atk - rndmArmorPower;
    health = health - damage.toInt();
    
  }
  @override
  void isDestroyed(){
    print('Spaceship 1 is down! ');
  }
  
  ArmoredSpaceShip(health,firePower): super(health,firePower);
}

// HighSpeed SpaceShip Class
class HighSpeedSpaceShip extends SpaceShip {
  @override
  void hit(int atk) {
    bool dodging = Random().nextBool();

    if (dodging == true){
      health = health + 0;
    }
    else{
      health = health - atk;
    }
  }

  @override 
  void isDestroyed(){
    print("Spaceship 2 is down!");
  }

  HighSpeedSpaceShip(health,firePower): super(health,firePower);
}


class Battlefield{
  void startBattle(SpaceShip sp1, SpaceShip sp2){
  bool whoStart = Random().nextBool();
  if (whoStart){
    do {
      sp1.hit(sp2.firePower);
      print("SP1 is hit \n  health: ${sp1.health} ");
      sp2.hit(sp1.firePower);     
      print("SP2 is hit \n  health: ${sp2.health} ");      
    }while (sp1.health > 0 && sp2.health >0);

  if (sp1.health <= 0){
  sp1.isDestroyed();
  }
  else if (sp2.health <=0){
  sp2.isDestroyed();
  }
  }else{
    do {
      sp2.hit(sp1.firePower);
      print("SP2 is hit \n  health: ${sp2.health} ");
      sp1.hit(sp2.firePower);     
      print("SP1 is hit \n  health: ${sp1.health} ");      
    }while (sp1.health > 0 && sp2.health >0);

  if (sp1.health <= 0){
  sp1.isDestroyed();
  }
  else if (sp2.health <=0){
  sp2.isDestroyed();
  }
  }

    
  }
}

void main(){
  SpaceShip sp1 = ArmoredSpaceShip(1000, 100);
  SpaceShip sp2 = HighSpeedSpaceShip(1000, 100);
  Battlefield().startBattle(sp1, sp2);
}