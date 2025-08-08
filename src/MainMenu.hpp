#pragma once
#include "../Engine/SpriteBuffer.hpp"
#include "GameConfig.hpp"
#include <stdint.h>

enum class LEVELS { DEBUG = 0, FIRST, SECOND, THIRD, END_GAME };

class MainMenu {
public:
  MainMenu() = delete;
  GameConfig static show(SpriteBuffer &screen);
};
