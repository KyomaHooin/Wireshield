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
	cylinder(h=bottomThick+2, d=2);
}

module bottom_mount(offsetX,offsetY,Thick) {
	difference() {
		translate([offsetX, offsetY, Thick]) cylinder(h=bottomMountHight, d=bottomMountDia);
		translate([offsetX, offsetY, Thick-1]) cylinder(h=bottomMountHight+2, d=2);
	}
}

module top_mount(offsetX,offsetY,Thick) {
	difference() {
		translate([offsetX, offsetY, Thick]) cylinder(h=topMountHight, d=topMountDia);
		translate([offsetX, offsetY, Thick-1]) cylinder(h=topMountHight+2, d=topMountHoleDia);
	}
}

module spacer(offsetX,offsetY) {
	color("grey") {
		difference() {
			translate([offsetX, offsetY,0]) {
				linear_extrude(height=spacerHeight) circle(d=5,$fn=6);
			}
			translate([offsetX, offsetY,-1]) {
				linear_extrude(height=spacerHeight+2) circle(d=2);
			}
		}
	}
}

module top_sink() { cylinder(h=1, r1=1, r2=2); }

