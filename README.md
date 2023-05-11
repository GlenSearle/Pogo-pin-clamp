# Pogo pin cluster clamp

The objective of this project is to make a device that can make an electrical connection to the eprom chip of a laptop so that it's BIOS software may be flashed. The reason for this project is that before such a device, a human is required to hold a connector against the laptop's motherboard for nearly twenty minutes.


## File types

This repository consists of two types of CAD file that describe the parts of the device.
**OpenSCAD** file names end in a scad and can be opened with  free editor available at https://www.openscad.org/
**STL** files are the output of compiling an scad file. They are intended to me machine readable descriptions of polygons and can be opened in many graphics viewing or 3D printing applications.
**SVG** files describe 2D vector images and were obtained from the logo of the Nitrokey website. They are used by two of the OpenSCAD files to describe company livery.

## Folders contents
There are three printable parts:
* a base that sites under the laptop
* an adaptor that holds onto the pogo pin cluster **pogo-clamp_chonky-base**
* an optional cap that sits at the top of the metal rod to protect the users thumb. **pogo-thumb-pad.scad**

The base plate has three forms:
* a minimalistic design used for the first two designs. **pogo_base_light.scad**
* a modified version with a wall to align the laptop more precisely **pogo_base.scad**
* an over sized version **pogo-clamp_chonky-base**

It's my opinion that the chonky base is over specified.
If I were to continue working on the base, I would add a null USB device that slots into the laptop to provide more precise alignment.
# Pogo pin cluster clamp

The objective of this project is to make a device that can make an electrical connection to the eprom chip of a laptop so that it's BIOS software may be flashed. The reason for this project is that before such a device, a human is required to hold a connector against the laptop's motherboard for nearly twenty minutes.


# Files

## File types

This repository consists of two types of CAD file that describe the parts of the device.
**OpenSCAD** file names end in a scad and can be opened with  free editor available at https://www.openscad.org/
**STL** files are the output of compiling an scad file. They are intended to me machine readable descriptions of polygons and can be opened in many graphics viewing or 3D printing applications.
**SVG** files describe 2D vector images and were obtained from the logo of the Nitrokey website. They are used by two of the OpenSCAD files to describe company livery.

## Folders contents
There are three printable parts:
* a base that sites under the laptop
* an adaptor that holds onto the pogo pin cluster **pogo-arm.scad**
* an optional cap that sits at the top of the metal rod to protect the users thumb. **pogo-thumb-pad.scad**

The base plate has three forms:
* a minimalistic design used for the first two designs. **pogo_base_light.scad**
* a modified version with a wall to align the laptop more precisely **pogo_base.scad**
* an over sized version **pogo-clamp_chonky-base**

It's my opinion that the chonky base is over specified.
If I were to continue working on the base, I would add a null USB device that slots into the laptop to provide more precise alignment.

## How to compile
1) open the scad fill in the openscad program.
2) Press F5 to view the object described by the file.
3) Press F6 to compile the object into polygons.
4) Press F7 to export this compiled object to an stl file.
5) Open the stl file in the software used by your 3D printer and follow it's instructions.

# Assembly

The clamp is built around a Bauhaus 100mm Einhandzwinge made by BAHAG AG, Gutenbergstr. 21, 68167 Mannheim, Deutschland. https://www.bauhaus.info/zwingen/bauhaus-einhandzwinge/p/24734257

The pogo pin cluster is SOIC8 SOP8 chip test probe. https://www.aliexpress.com/i/1005005362824378.html

Remove the orange wing-bold and nut from the Einhandzwinge.
Insert the nut into the 3D printed base.
Insert the metal shaft of the Einhandzwinge into the base, the orange pad faces down.
Secure the metal shaft with the orange wing-bolt.
Remove the orange pad and replace it with the 3D printed arm.
Insert the pogo-pin cluster into the arm, it can be rotated, the orientation depends on the laptop being flashed.

# Usage

## Connection
Expose the motherboard of the laptop and position it so the pogo pins are over the ePROM chip.
Press the orange button and slide the pins close to the chip.
While holding the pogo-pins with one hand use the other hand to press the trigger until an electrical connection is made.

## Disconnection
Place your index finger on the orange button and your thump on the top of the metal bar and squeeze.
