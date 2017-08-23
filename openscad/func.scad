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
	cylinder(h=bottomThick+2, d=piHoleDia);
}

module bottom_mount(offsetX,offsetY,Thick) {
	difference() {
		translate([offsetX, offsetY, Thick]) cylinder(h=bottomMountHight, d=bottomMountDia);
		translate([offsetX, offsetY, Thick-1]) cylinder(h=bottomMountHight+2, d=piHoleDia);
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
				linear_extrude(height=15) circle(d=6.2,$fn=6);
			}
			translate([offsetX, offsetY,-1]) {
				linear_extrude(height=15+2) circle(d=2.75);
			}
		}
	}
}
