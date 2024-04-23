class WorldBuilder extends Default_Interface {
  String clss;
  String file_in;
  int plc;
  
  ArrayList<WButton> buttons;
  WorldBuilder() {
    clss = "WorldBuilder";
    buttons = new ArrayList<WButton>();
    file_in = "";
    plc = 0;
    
    this.init();
  }
  void init() {
    buttons.add(new WButton("blue-tile", 0));
    buttons.add(new WButton("bush", 1));
    buttons.add(new WButton("bush2", 2));
    buttons.add(new WButton("orb", 3));
    buttons.add(new WButton("fire", 4));
    buttons.add(new WButton("grass", 5));
    buttons.add(new WButton("ground", 6));
    buttons.add(new WButton("steel-x", 7));
    buttons.add(new WButton("portal", 8));
    buttons.add(new WButton("stone", 9));
    
    
    cp5.addTextfield("file")
     .setPosition(800+8,700)
     .setSize(200-8*2,30)
     .setFont(font)
     .setFocus(false)
     .setColor(color(255,0,0))
     ;
     
     cp5.addTextfield("grid-size")
     .setPosition(800+8,700 - 40)
     .setSize(200/2,30)
     .setFont(font)
     .setFocus(false)
     .setColor(color(255,0,0))
     ;
     
     cp5.addButton("load")
     .setValue(0)
     .setPosition(800+8,700 + 30 + 2)
     .setSize((200-8*2)/2-2,20)
     ;
     
     cp5.addButton("save")
     .setValue(0)
     .setPosition(800+8+(200-8*2)/2,700 + 30 + 2)
     .setSize((200-8*2)/2-2,20)
     ;
  }
  void draw() {
	push();
	
    fill(210, 210, 210, 200);
    translate(800, 0);
    rect(0, 0, 200, 800);
    translate(8, 8);
    
    for (int i = 0; i < this.buttons.size(); i++) {
		push();
		int x = i%3*64;
		int y = floor(i/3)*64;
		WButton b = buttons.get(i);
		
		if (mousePressed) {
			if (mouseX - 800 - 8 > x && mouseX - 800 - 8 < x + 64 && mouseY + 8 > y && mouseY + 8 < y + 64) {
				plc = b.value;
			}
		} 
		
		translate(x, y);
		fill(100);
		square(0,0,64);
		buttons.get(i).draw();
		pop();
	}
    
    pop();
    
    text("x: " + world.mc.x + "y: " + world.mc.y, 10, 10);
    
    file_in = cp5.get(Textfield.class,"file").getText();
    
  }
  void update() {
    
  }
  void input() {
    
  }
}


class WButton extends Default_Interface {
  String texture;
  int value;
  
	WButton(String _texture, int _value) {
		texture = _texture;
		value = _value;
	}
	void draw() {
		image(texlib.get(texture), 0, 0,//Destination x & y
				64, 64);      	//Destination width & height
		
		if (wb.plc == value) {
			fill(255, 255, 255, 256/3);
			square(0,0,64);
		}
	}
	
}


//METHODS TO PLACE AND DESTROY OBJECTS
void placeObject() {
	float x = mx;
	float y = my;
	if (kb.keyDown(SHIFT)) {
		x = gmx;
		y = gmy;
	}
	
	Game_Object obj;
	
	switch (wb.plc) {
		case 0: obj = new Game_Object(x, y, L_MID, new Sprite("blue-tile", 1)); break;
		case 1: obj = new Game_Object(x, y, L_MID, new Sprite("bush", 2), null); break;
		case 2: obj = new Game_Object(x, y, L_MID, new Sprite("bush2", 2), null); break;
		case 3: obj = new Game_Object(x, y, L_MID, new Animated_Sprite("orb", 64, 64, 1, 6)); break;
		case 4: obj = new Game_Object(x, y, L_MID, new Animated_Sprite("fire", 64, 64, 2, 5), null); break;
		case 5: obj = new Game_Object(x, y, L_MID, new Sprite("grass", 1)); break;
		case 6: obj = new Game_Object(x, y, L_MID, new Sprite("ground", 1)); break;
		case 7: obj = new Game_Object(x, y, L_MID, new Sprite("steel-x", 2)); break;
		case 9: obj = new Game_Object(x, y, L_MID, new Sprite("stone", 2)); break;
		case 8: obj = createPortal(x, y); break;
		
		default: obj = new Game_Object(x, y, L_MID, new Sprite("blue-tile", 1));
	}
	world.add(obj);
}

void removeObject() {
    Boolean xLap = false;
    Boolean yLap = false;
    
    for(int i = 0; i<world.obj.size(); i++) {
	Game_Object c = world.obj.get(i);

	if (c.body != null) {
	    xLap = mx >= c.x && c.x + c.body.width >= mx;
	    yLap = my >= c.y && c.y + c.body.height >= my;
	} else if (c.sprite != null) {
	    xLap = mx >= c.x && c.x + c.sprite.tw*c.sprite.scale >= mx;
	    yLap = my >= c.y && c.y + c.sprite.th*c.sprite.scale >= my;
	}
	    
	if (xLap && yLap) {
	    world.pworld.remove(c.body.box);
	    world.obj.remove(i);
	    break;
	}
		    
    }
}

void detailObject() {
    Boolean xLap = false;
    Boolean yLap = false;
    Game_Object c = null;
    
    for(int i = 0; i<world.obj.size(); i++) {
    	c = world.obj.get(i);
    
    	if (c.body != null) {
    	    xLap = mx >= c.x && c.x + c.body.width >= mx;
    	    yLap = my >= c.y && c.y + c.body.height >= my;
    	} else if (c.sprite != null) {
    	    xLap = mx >= c.x && c.x + c.sprite.tw*c.sprite.scale >= mx;
    	    yLap = my >= c.y && c.y + c.sprite.th*c.sprite.scale >= my;
    	}
    	    
    	if (xLap && yLap) {
    	    println("Number: " + i);
    	    break;
    	}
		    
    }
    
    println("obj:", c);
    println("x: ", c.x);
    println("y: ", c.y);
    println("vx: ", c.vx);
    println("vy: ", c.vy);
    println("ax: ", c.ax);
    println("ay: ", c.ay);
    println("");
    println("mass: ", c.mass);
    println("layer: ", c.layer);
    
    
    println("body: ", c.body);
    
    Physics_Body cb = c.body;
    if (cb != null) {
	println("  type: ", cb.type);
	println("  shape: ", cb.shape);
    }
}


public void save() {
  println("Saving to '" + wb.file_in + "'");
  world.saveJSONWorld(wb.file_in);
}

public void load() {
  println("Loading '" + wb.file_in + "'");
  
  File f = dataFile(wb.file_in);
  String filePath = f.getPath();
  boolean exist = f.isFile();
  println(filePath, exist);
  
  if (exist) {
    world.loadJSONWorld(wb.file_in);
  }
}
