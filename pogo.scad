//messurments of the metal shaft
//shaft=[2.5,7,225] //The metal part;
shaft=[3,7.2,225];   //The hole
base_interface=[10,13,20]; //block of plastic to be printed that holds the shaft.
//The two bolt holes
shaft_hole=4.75;
shaft_hole_ofset=9.1;
// The retaining pin 
shaft_pin=3;
shaft_pin_ofset=16.8;

bolt_head=8;
bolt_shaft=3.8; //maybe don't use this to avoid artifacts
bolt_offset=0.8; //amount of plastic between bolt head and shaft

screw_shaft_dia=6.2;
screw_head_dia=10;
screw_shaft_length=2;
screw_wings_dia=17;

logo_height=4;
logo_indent=0.4;

module Shaft(){ //CAD model of the metal black shaft of the clamp. The key pin is given as a block to cut a kay way.
difference() {
  cube([shaft[0],shaft[1],shaft[2]+0.1], center = true); // This is the shaft
    union(){ //These are the two bolt holes.
    translate([0,0,(shaft[2]/2-shaft_hole_ofset)]) rotate ([0,90,0]) cylinder(h = 20, d = shaft_hole, center = true, $fn=20);
    translate([0,0,0-(shaft[2]/2-shaft_hole_ofset)]) rotate ([0,90,0]) cylinder(h = 20, d = shaft_hole, center = true, $fn=20);
    }
}
hull() { // These are the two key pins.
    translate([shaft[0]/2-0.1,0,(shaft[2]/2-shaft_pin_ofset)]) rotate ([0,90,0]) cylinder(h = 2.1, d = shaft_pin, center = false, $fn=20);
    translate([shaft[0]/2-0.1,0,0-(shaft[2]/2-shaft_pin_ofset)]) rotate ([0,90,0]) cylinder(h = 2.1, d = shaft_pin, center = false, $fn=20);
}
}


module Bolt(){
// bolt hole
translate([0,0,(shaft_hole_ofset)]) rotate ([0,90,0]) cylinder(h = 20, d = shaft_hole+0.01, center = true, $fn=20);
// bolt head
translate([bolt_offset+(shaft[0]/2),0,(shaft_hole_ofset)]) rotate ([0,90,0]) cylinder(h = 20, d = bolt_head, center = false, $fn=6);    
}

module Wingnut(){ //CAD model that shows clipping.
//Smaller shaft of red screw
translate([0,0,(shaft_hole_ofset)]) rotate ([0,-90,0]) cylinder(h = 20, d = screw_shaft_dia, center = false, $fn=20);
//larger head of red screw
translate([0-screw_shaft_length-(shaft[0]/2),0,(shaft_hole_ofset)]) rotate ([0,-90,0]) cylinder(h = 20, d = screw_head_dia, center = false, $fn=20);
//red wing nut
translate([-(2*screw_shaft_length)-(shaft[0]/2),0,(shaft_hole_ofset)]) rotate ([0,-90,0]) cylinder(h = 20, d = screw_wings_dia, center = false, $fn=20);
}    

module Logo(){ //of 
 difference(){
  hull() {
    scale([1.1,1.1,1]) linear_extrude(height=logo_height) {
        import("/home/glen/nitrokey/empty_logo.svg"); }}
  translate([4,3,(logo_height- logo_indent)]) union(){       
    #linear_extrude(height=0.6) {
      import("/home/glen/nitrokey/empty_logo.svg"); 
      import("/home/glen/nitrokey/key_logo.svg"); 
  }
  }
 }    
}


difference(){
    union(){
//This is the interface block of plastic
        translate([0,0,(base_interface[2]/2)]) cube(base_interface, center = true );
//This is the base
        translate([-89,-7.2,0]) rotate([0,0,0]) scale([2,2,1]) Logo();
    }
    union(){ // this is the negative for the metal parts.
    translate([0,0,shaft[2]/2]) Shaft();
    Bolt();
    Wingnut();
    }
}

