//
// RPi Shield - functions
//

module rounded_rect(x, y, z, radius) {
    linear_extrude(height=z)
        minkowski() {
            square([x,y]);
            circle(r = radius);
        }
}

module bottom_hole() {
    translate([piHoleOffset, piHoleOffset,-1]) cylinder(h=bottomThick+2, d=3);
    translate([piX-piHoleOffset, piHoleOffset,-1]) cylinder(h=bottomThick+2, d=3);
    translate([piHoleOffset, shieldY-piHoleOffset,-1]) cylinder(h=bottomThick+2, d=3);
    translate([piX-piHoleOffset, shieldY-piHoleOffset,-1]) cylinder(h=bottomThick+2, d=3);
}

module bottom_mount(offsetX,offsetY,Thick) {
    difference() {
        translate([offsetX, offsetY, Thick]) cylinder(h=bottomMountHeight, d=bottomMountDia);
        translate([offsetX, offsetY, Thick-1]) cylinder(h=bottomMountHeight+2, d=3);
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
        translate([offsetX, offsetY, Thick]) cylinder(h=spacerHeight+displayThick+topDisplayMountHeight, d=topMountDia);
        translate([offsetX, offsetY, Thick-1]) cylinder(h=(spacerHeight+displayThick+topDisplayMountHeight)/2, d=topMountHoleDia);
        translate([offsetX, offsetY, Thick-1]) cylinder(h=2, d=3.6);
    }
}

module top_mount_low(offsetX,offsetY,Thick) {
    difference() {
        translate([offsetX, offsetY, Thick]) cylinder(h=spacerHeight+displayThick+topDisplayMountHeight-0.5, d=topMountDia);
        translate([offsetX, offsetY, Thick-1]) cylinder(h=(spacerHeight+displayThick+topDisplayMountHeight-0.5)/2, d=topMountHoleDia);
        translate([offsetX, offsetY, Thick-1]) cylinder(h=2, d=3.6);
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
        translate([offsetX, offsetY, Thick]) cylinder(h=topDisplayMountHeight, r1=topDisplayMountDia/2, r2=topDisplayMountDia/2+0.5);
        translate([offsetX, offsetY, Thick-1]) cylinder(h=topDisplayMountHeight+2, d=topDisplayMountHoleDia);
    }
}

module top_sink() { cylinder(h=1.5, r1=1.25, r2=2.35); }

module usb_lip() {
    translate([1, bottomThick/2,0])
        rotate([90,0,0])
            rounded_rect(usbWidth, usbHeight, bottomThick/2, 1);
}

module micro_lip() {
    translate([bottomThick/2, 1, 0])
        rotate([0,270,0])
            rounded_rect(microHeight+1, microLength, bottomThick/2, 1);
}

module shield_lip() {
    translate([bottomThick/2, 1, 0])
        rotate([0,270,0])
            rounded_rect(shieldJackHeight, 2*shieldJackWidth+2.37, bottomThick/2, 1);
}

module sd_lip() {
    rotate([270,0,0])
        rounded_rect(cardWidth, bottomThick+bottomMountHeight, bottomThick, 1);
}

module lip_lock_bottom() {
    difference() {
        rounded_rect(bottomX+1, bottomY+1, 1, bottomThick);
        rounded_rect(bottomX+1, bottomY+1, 1, bottomThick/2-0.125);
    }
}

module lip_lock_top() {
    rounded_rect(bottomX+1, bottomY+1, 1, bottomThick/2+0.125);// bug
}

module harden() {
    cube([piHoleOffset-topMountDia/2+(topMountDia-topMountHoleDia)/2, topThick,
        spacerHeight+displayThick+topDisplayMountHeight]);
}

module harden_low() {
    cube([piHoleOffset-topMountDia/2+(topMountDia-topMountHoleDia)/2, topThick,
        spacerHeight+displayThick+topDisplayMountHeight-0.5]);
}

module button() {
    color("silver")
    rotate([0,90,0]) cylinder(h=15,d=8);
    translate([19,0,0])
        color("red")
        rotate([0,90,0]) cylinder(h=4,d=6); 
    translate([15,0,0])
        color("silver")
        rotate([0,90,0]) cylinder(h=4,d=4);
}
