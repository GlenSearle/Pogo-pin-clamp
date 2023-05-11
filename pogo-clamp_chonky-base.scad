//This is the base plate of a pogo-pin cluster clamp made by Glen Searle for Nitrokey.

//This is the thickness of the base plate and how deep the logo is embossed.
logo_height=4;
logo_indent=0.4;

//This is the dimentions of the block used to align the laptop.
slogan_height=4;
slogan_indent=0.4;

//messurments of the metal shaft
shaft_metal=[2.5,7,225]; //The metal part;
shaft_void=[3,7.2,225];   //The hole
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

slogan_height=4;
slogan_indent=0.4;

module Shaft(){ //CAD model of the metal black shaft of the clamp. The key pin is given as a block to cut a kay way.
difference() {
  cube([shaft_void[0],shaft_void[1],shaft_void[2]+0.1], center = true); // This is the shaft
    union(){ //These are the two bolt holes.
    translate([0,0,(shaft_void[2]/2-shaft_hole_ofset)]) rotate ([0,90,0]) cylinder(h = 20, d = shaft_hole, center = true, $fn=20);
    translate([0,0,0-(shaft_void[2]/2-shaft_hole_ofset)]) rotate ([0,90,0]) cylinder(h = 20, d = shaft_hole, center = true, $fn=20);
    }
}
hull() { // These are the two key pins.
    translate([shaft_void[0]/2-0.1,0,(shaft_void[2]/2-shaft_pin_ofset)]) rotate ([0,90,0]) cylinder(h = 2.1, d = shaft_pin, center = false, $fn=20);
    translate([shaft_void[0]/2-0.1,0,0-(shaft_void[2]/2-shaft_pin_ofset)]) rotate ([0,90,0]) cylinder(h = 2.1, d = shaft_pin, center = false, $fn=20);
}
}


module Bolt(){
// bolt hole
translate([0,0,(shaft_hole_ofset)]) rotate ([0,90,0]) cylinder(h = 20, d = shaft_hole+0.01, center = true, $fn=20);
// bolt head
translate([bolt_offset+(shaft_void[0]/2),0,(shaft_hole_ofset)]) rotate ([0,90,0]) cylinder(h = 20, d = bolt_head, center = false, $fn=6);    
}

module Wingnut(){ //CAD model that shows clipping.
//Smaller shaft of red screw
translate([0,0,(shaft_hole_ofset)]) rotate ([0,-90,0]) cylinder(h = 20, d = screw_shaft_dia, center = false, $fn=20);
//larger head of red screw
translate([0-screw_shaft_length-(shaft_void[0]/2),0,(shaft_hole_ofset)]) rotate ([0,-90,0]) cylinder(h = 20, d = screw_head_dia, center = false, $fn=20);
//red wing nut
translate([-(2*screw_shaft_length)-(shaft_void[0]/2),0,(shaft_hole_ofset)]) rotate ([0,-90,0]) cylinder(h = 20, d = screw_wings_dia, center = false, $fn=20);
}    

module Logo(){ //of 
 difference(){
  hull() {
    scale([1.1,1.1,1]) linear_extrude(height=logo_height) {
        import("empty_logo.svg"); }}
  translate([4,3,(logo_height- logo_indent)]) union(){       
    linear_extrude(height=0.6) {
      import("empty_logo.svg"); 
      import("key_logo.svg"); 
  }
  }
 }    
}

module Slogan(){
    difference(){
        cube([200,60,(slogan_height)]);
        translate([0,0,(slogan_height-slogan_indent)])    linear_extrude(height=slogan_height)    import("slogan.svg");
    }
}

difference(){
    union(){
//This is the interface block of plastic
        hull(){
        translate([0,0,(base_interface[2]/2)]) cube(base_interface, center = true );
        //cylinder(h=10, r1=11.5, r2=8);
        }
        cylinder(h=5.5, r1=15, r2=6);
//This scale should be a resize, but that causes the slogan to not render :(
   scale([0.5,1,0.33]) translate([(0-base_interface[1]/1.3),base_interface[0],0]) rotate([90,0,0]) Slogan();
    
//This is the base
      //translate([-89,-7.2,0]) scale([2,2,1])
        translate([-133,-16.8,0]) scale([3,3,1])
        rotate([0,0,0]) Logo();
    }
    union(){ // this is the negative for the metal parts.
    translate([0,0,shaft_void[2]/2]) Shaft();
    Bolt();
    Wingnut();
    }
}
//Logo shield loop
//translate ([-90,40,0]) rotate([0,0,0]) scale([2,2,1]) linear_extrude(height=logo_height) import("empty_logo.svg");
