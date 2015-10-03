
public class MoniFace extends FaceGroup
{
  public MoniFace(String id) {
    super(id);
    PShape s = createShape(ELLIPSE,200,101,100,100);
    s.setFill(color(235,196,77));
    s.setStroke(color(0)); 
    shape.addChild(s);
  }
}


public class MoniEye extends AnimatedFeature
{
   public MoniEye(String id, int x, int y) {
     super(id,x,y);
     open();
   }

   public PShape open() {
    shape = createShape(ELLIPSE,x,y,20,20);
    shape.setFill(color(232,240,238));
    shape.setStroke(color(0));
    return super.open();
  } 
  

  public PShape close() {
    shape = createShape(LINE,x-10,y+2,x+10,y+2);
    shape.setFill(color(15,14,14));
    shape.setStrokeWeight(4);
    shape.setStroke(color(250,0,0));
    return super.close();
  }  
}
public class MoniNina extends AnimatedFeature
{
   public MoniNina(String id, int x, int y) {
     super(id,x,y);
     open();
   }

   public PShape open() {
    shape = createShape(ELLIPSE,x,y,3,8);
    shape.setFill(color(15,14,14));
    shape.setStroke(color(0));
    return super.open();
  } 
  

  public PShape close() {
    shape = createShape(LINE,x-10,y+2,x+10,y+2);
    shape.setFill(color(15,14,14));
    shape.setStrokeWeight(4);
    shape.setStroke(color(250,0,0));
    return super.close();
  }  
}
public class MoniNina2 extends AnimatedFeature
{
   public MoniNina2(String id, int x, int y) {
     super(id,x,y);
     open();
   }

   public PShape open() {
    shape = createShape(ELLIPSE,x,y,3,8);
    shape.setFill(color(15,14,14));
    shape.setStroke(color(0));
    return super.open();
  } 
  

  public PShape close() {
    shape = createShape(LINE,x-10,y+2,x+10,y+2);
    shape.setFill(color(15,14,14));
    shape.setStrokeWeight(4);
    shape.setStroke(color(250,0,0));
    return super.close();
  }  
}

public class MoniMouth extends AnimatedFeature
{  
   public MoniMouth(String id, int x, int y) {
     super(id,x,y);
     open();
   }
  
   public PShape open() {
    shape = createShape(ARC,x,y,30,40,1,180);
    shape.setFill(color(0));
    shape.setStroke(color(0));
    return super.open();
  } 

  public PShape close() {
    shape = createShape(LINE,x+30,y+20,x+10,y+20);
    shape.setFill(color(15,14,14));
    shape.setStrokeWeight(4);
    shape.setStroke(color(250,0,0));
    return super.close();
  } 
}


public class AvatarFace
{
    MoniEye ojoIzq;
    MoniEye ojoDer;
  MoniMouth boca;
   MoniFace cara;
   MoniNina nina;
   MoniNina2 nina2;
  
  public AvatarFace()
  {
    ojoIzq = new MoniEye("ojoIzq",   176, 80);
    ojoDer = new MoniEye("ojoDer", 220, 80);
      boca = new MoniMouth("boca",   199, 120);
      nina = new MoniNina("niña", 175,80);
      nina2 = new MoniNina2("niña2", 220,80);
      cara = new MoniFace("puppet");  
    cara.add(ojoIzq);
    cara.add(ojoDer);
    cara.add(boca);
    cara.add(nina);
    cara.add(nina2);
  }

  public void draw(int x, int y) {
    cara.position(x,y);
    cara.draw();
  }

  public BasicState status(FeatureID id) {
    if (id == FeatureID.LeftEye) {
        return ojoIzq.status();
    } else if (id == FeatureID.RightEye) {
        return ojoDer.status();      
    }
    return BasicState.Undefined;
  }
   
  public void change(FeatureID id, Action action)
  {
    // PS BUG no-enum-switch 
    if (id == FeatureID.LeftEye) { // ojo izq?
      if (action == Action.closeEye) {
          cara.replaceShape(ojoIzq.getID(),ojoIzq.close());
      } else {
          cara.replaceShape(ojoIzq.getID(),ojoIzq.open());
      }
    } else if (id == FeatureID.RightEye) { // ojo der?
      if (action == Action.closeEye) {
          cara.replaceShape(ojoDer.getID(),ojoDer.close());
      } else {
          cara.replaceShape(ojoDer.getID(),ojoDer.open());
      } // if close
    } else if (id == FeatureID.Mouth) { // boca?
      if (action == Action.closeMouth) {
          cara.replaceShape(boca.getID(),boca.close());
      } else {
          cara.replaceShape(boca.getID(),boca.open());
      } // if close
    } // else
  } // change()
} // AvatarFace class
