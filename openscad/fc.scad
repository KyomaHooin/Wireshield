//
// RPi Shield - functions
//

include <tft.scad>

module rounded_rect(x, y, z, radius) {
	linear_extrude(height=z)
		minkowski() {
			square([x,y]);
			circle(r = radius);
		}
}

module bottom_hole() {
    translate([piHoleOffset, piHoleOffset,-1]) cylinder(h=bottomThick+2, d=2.5);
    translate([piX-piHoleOffset, piHoleOffset,-1]) cylinder(h=bottomThick+2, d=2.5);
    translate([piHoleOffset, shieldY-piHoleOffset,-1]) cylinder(h=bottomThick+2, d=2.5);
    translate([piX-piHoleOffset, shieldY-piHoleOffset,-1]) cylinder(h=bottomThick+2, d=2.5);
}

module bottom_mount(offsetX,offsetY,Thick) {
	difference() {
		translate([offsetX, offsetY, Thick]) cylinder(h=bottomMountHight, d=bottomMountDia);
		translate([offsetX, offsetY, Thick-1]) cylinder(h=bottomMountHight+2, d=2.5);
	}
}

module spacer(offsetX,offsetY) {
    difference() {
		translate([offsetX, offsetY,0]) cylinder(h=spacerHeight, d=5);
		translate([offsetX, offsetY,-1]) cylinder(h=spacerHeight+2, d=2.5);
	}
}

module top_mount(offsetX,offsetY,Thick) {
	difference() {
		translate([offsetX, offsetY, Thick]) cylinder(h=topMountHeight, d=topMountDia);
		translate([offsetX, offsetY, Thick-1]) cylinder(h=topMountHeight/2, d=topMountHoleDia);
	}
}

module top_display_hole() {
    translate([displayHoleOffsetX,displayHoleOffsetY,topHeight-topThick-1])
        cylinder(h=topThick+2, d=2.5);
    translate([displayHoleOffsetXX,displayHoleOffsetY,topHeight-topThick-1])
        cylinder(h=topThick+2, d=2.5);
    translate([displayHoleOffsetX,displayHoleOffsetYY,topHeight-topThick-1])
        cylinder(h=topThick+2, d=2.5);
    translate([displayHoleOffsetXX,displayHoleOffsetYY,topHeight-topThick-1])
        cylinder(h=topThick+2, d=2.5);
}

module top_display_mount(offsetX,offsetY,Thick) {
	difference() {
		translate([offsetX, offsetY, Thick]) cylinder(h=topDisplayMountHeight, d=topDisplayMountDia);
		translate([offsetX, offsetY, Thick-1]) cylinder(h=topDisplayMountHeight+2, d=topDisplayMountHoleDia);
	}
}

module top_sink() { cylinder(h=1, r1=1.25, r2=2.5); }

module bottom_lip() {
    translate([bottomThick/2, bottomThick/2, bottomThick/2 - 1])
        rotate([90,0,0])
            rounded_rect(piX-bottomThick, ethHeight+2, bottomThick/2, bottomThick/2);
}

module bottom_side_lip() {
    translate([bottomThick/2,bottomThick/2, bottomThick/2 - 1])
        rotate([0,270,0])
            rounded_rect(hdmiHeight+2, 58-bottomThick, bottomThick/2, bottomThick/2);
}
