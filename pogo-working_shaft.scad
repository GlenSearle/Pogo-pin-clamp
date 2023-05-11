//messurments of the metal shaft
shaft=[2.5,7,225];
//The two bolt holes
shaft_hole=4.75;
shaft_hole_ofset=8.9;
// The retaining pin 
shaft_pin=3;
shaft_pin_ofset=16.8;

bolt_head=8;
bolt_shaft=3.8; //maybe don't use this to avoid artifacts
bolt_offset=0.8; //amount of plastic between bolt head and shaft

screw_shaft_dia=6.2;
screw_head_dia=9.6;
screw_shaft_length=2;

module Shaft(){
difference() {
  cube(shaft, center = true); // This is the shaft
    union(){
    translate([0,0,(shaft[2]/2-shaft_hole_ofset)]) rotate ([0,90,0]) cylinder(h = 20, d = shaft_hole, center = true, $fn=20);
    translate([0,0,0-(shaft[2]/2-shaft_hole_ofset)]) rotate ([0,90,0]) cylinder(h = 20, d = shaft_hole, center = true, $fn=20);
    }
}
hull() { // These are the two pins.
    translate([shaft[0]/2-0.1,0,(shaft[2]/2-shaft_pin_ofset)]) rotate ([0,90,0]) cylinder(h = 2.1, d = shaft_pin, center = false, $fn=20);
    translate([shaft[0]/2-0.1,0,0-(shaft[2]/2-shaft_pin_ofset)]) rotate ([0,90,0]) cylinder(h = 2.1, d = shaft_pin, center = false, $fn=20);
}
}


module Bolt(){
// bolt hole
translate([0,0,(shaft_hole_ofset)]) rotate ([0,90,0]) cylinder(h = 20, d = shaft_hole, center = true, $fn=20);
// bolt head
translate([bolt_offset+(shaft[0]/2),0,(shaft_hole_ofset)]) rotate ([0,90,0]) cylinder(h = 20, d = bolt_head, center = false, $fn=6);
}

//Smaller shaft of red screw
translate([0-screw_shaft_length-(shaft[0]/2),0,(shaft_hole_ofset)]) rotate ([0,-90,0]) cylinder(h = 20, d = screw_shaft_dia, center = false, $fn=20);
//larger head of red screw
translate([-2-(shaft[0]/2),0,(shaft_hole_ofset)]) rotate ([0,-90,0]) cylinder(h = 20, d = screw_head_dia, center = false, $fn=20);

translate([0,0,shaft[2]/2]) Shaft();
Bolt();