// Connecter between the Bauhaus 100mm clamp and a pogo-pin cluster.

//Caliper dimentions
//foot=[20.3,13,3];
foot=[20.3,14,3];
ankle=[20,10.5,10];

arm=[55,18,7];
shaft=[7.2,3.5,225]; //black metal bar

pogo_cluster=[11,11,24.5];
pogo_notch=[5,3,0.8]; //height,width,depth

module Shaft(){ //black metal shaft
    translate([-30,0-shaft[1]/2,0-shaft[2]/2])
    cube(shaft); 
    }

module Foot(){ //Injection moulded part that accepts the clamp work protection pad.
    intersection(){
        translate([0,0,foot[2]/2]) cube(foot, center=true);
        cylinder(d=foot[0], h=5);
    }
    translate([-4,0,foot[2]-0.1+ankle[2]/2]) cube(ankle, center=true);
}



module Pogos(){ //This is the CAD model of the pogo-pin cluster.
//The cube the pogo-pins connect to
cube([pogo_cluster[0],pogo_cluster[1],pogo_notch[0]-(pogo_notch[1]/2)]);
//Indent around the sides.
translate([pogo_notch[2],pogo_notch[2],1])
cube([pogo_cluster[0]-(2*pogo_notch[2]),pogo_cluster[1]-(2*pogo_notch[2]),10]);
//The larger, upper, cube 
translate([0,0,pogo_notch[0]+(pogo_notch[1]/2)])
cube([pogo_cluster[0],pogo_cluster[1],pogo_cluster[2]-(pogo_notch[0]+(pogo_notch[1]/2))]);
}

module Grip(){ //This grips the pogo pin cluster.
    difference(){
    translate([1,0-arm[1]/2,0-arm[2]/2])
        cube([arm[0]-11,arm[1],arm[2]]);
    translate([0,0-pogo_cluster[1]/2,pogo_notch[0]])
        Pogos();  
    }
}

difference(){
translate([-29,0-arm[1]/2,0]) cube(arm);
translate([0,0,2]) Foot();
translate([-13,0,2]) Foot();
translate([-26,0,2]) Foot();
    Shaft();
translate([15,0-pogo_cluster[1]/2,0-pogo_notch[0]/1.5])
    #Pogos();

translate([20,0-pogo_cluster[1]/2,0-pogo_notch[0]/1.5]) Pogos();    

}

