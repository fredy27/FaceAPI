
AvatarFace moni;
int clicks = 0;

void setup() {
   size(400,400,P2D);
   moni = new AvatarFace();
   noCursor();
}

void draw() {
  background(200);
  moni.draw(mouseX,mouseY);
}

void mousePressed()
{
  clicks = (clicks + 1) % 7; // 0...6
  switch (clicks) {
    case 1: // close left eye
      moni.change(FeatureID.LeftEye,Action.closeEye);
      break;
    case 2: // close right eye
      moni.change(FeatureID.RightEye,Action.closeEye);
      break;
    case 3: // close mouth
      moni.change(FeatureID.Mouth,Action.closeMouth);
      break;
    case 4: // open left eye
      moni.change(FeatureID.LeftEye,Action.openEye);
      break;
    case 5: // open right eye
      moni.change(FeatureID.RightEye,Action.openEye);
      break;
    case 6: // open mouth
      moni.change(FeatureID.Mouth,Action.openMouth);
      break;
    case 0: // rotate
     //  monster.rotate(0.1); 
  }
}
