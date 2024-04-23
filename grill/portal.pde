

Game_Object createPortal(float x, float y) {
  Game_Object portal = new Game_Object(x, y, L_MID, new Animated_Sprite("portal", 64, 64, 1, 7),
                                                    new Portal_Physics(CT_STATIC, CS_AABB, 55,55)
                                                    );
  
  return portal;
}
