#pragma once
#include "MainMenu.hpp"
#include "../Engine/SpriteBuffer.hpp"
// #include "../engine/SpriteAnimado.hpp"
// #include "../engine/Cores.hpp"

class Game {
public:
  Game() {}
  ~Game() {}

  static void run() {
    // tela com a resolução inspirada no NES, convenção: largura x altura
    SpriteBuffer screenBuffer(256, 240);

    const auto gameConfig = MainMenu::show(screenBuffer);

    while(true) {

      if(gameConfig.lvlIndex == LEVELS::END_GAME) break;
      
      levels[lvlIndex].run(screenBuffer);

      lvlIndex++;
    }


    /*
    FaseStart
    start("FaseStart",SpriteAnimado("rsc/castleMedieval.anm",3,COR::VERMELHA));
    FaseLevel1 fase1("Fase1",Sprite("rsc/fase2.img",COR::VERMELHA));
    FaseFinal faseFinal("Fase1",Sprite("rsc/title1Gothic.img"));

    start.init();
    start.run(screenBuffer);

    screenBuffer.clear();
    fase1.init();
    int ret1 = fase1.run(screenBuffer);
    if ( ret1 != Fase::GAME_OVER && ret1 != Fase::END_GAME){

            screenBuffer.clear();
            faseFinal.init();
            faseFinal.run(screenBuffer);
    }
    else
            std::cout << "GAME OVER" << std::endl;

    std::cout << "Saindo..." << std::endl;
    */
  }
};
