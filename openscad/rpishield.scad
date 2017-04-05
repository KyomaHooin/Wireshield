//
// RPi Shiled / TFT Display case
//

drawPi=0;
drawShiled=0;
drawDisplay=0;
drawCaseTop=0;
drawCaseBottom=0;
drawAll=1;

$fn=50;

//----------------------------
// FUNC

module rounded_rect(x, y, z, radius) {
	linear_extrude(height=z)
		minkowski() {
			square([x,y]);
			circle(r = radius);
		}
}

module display_hole() {
	cylinder(h=displayThick+2, r=displayHoleRadius);
}

module shield_hole() {
	cylinder(h=shieldThick+2, d=shieldHoleDia);
}

module pi_hole() {
	cylinder(h=piThick+2, d=piHoleDia);
}

module bottom_mount(offsetX,offsetY,Thick) {
	difference() {
		translate([offsetX, offsetY, Thick]) cylinder(h=bottomMountHight, d=bottomMountDia);
		translate([offsetX, offsetY, Thick-1]) cylinder(h=bottomMountHight+2, d=piHoleDia);
	}
}

//----------------------------
//RPI
//
// MicroUSB,ETH ..

piWidth=56;
piLength=85;
piThick=1.33;
piHoleDia=2.75;
piShieldLength=65;
piHoleOffset=3.5;

module pi() {
	color("seagreen")
	difference() {
		cube([piWidth, piLength, piThick]);
		translate([piHoleOffset, piHoleOffset, -1]) pi_hole();
		translate([piWidth-piHoleOffset, piHoleOffset, -1]) pi_hole();
		translate([piHoleOffset, piShieldLength-piHoleOffset, -1]) pi_hole();
		translate([piWidth-piHoleOffset, piShieldLength-piHoleOffset, -1]) pi_hole();
	}
}

//----------------------------
//SHIELD

shieldWidth=56;
shieldLength=65;
shieldThick=1.33;
shieldHoleDia=2.75;
shieldHoleOffset=3.5;

module shield() {
	color("seagreen")
	difference() {
		cube([shieldWidth, shieldLength, shieldThick]);
		translate([shieldHoleOffset, shieldHoleOffset, -1]) shield_hole();
		translate([shieldWidth-shieldHoleOffset, shieldHoleOffset, -1]) shield_hole();
		translate([shieldHoleOffset, shieldLength-shieldHoleOffset, -1]) shield_hole();
		translate([shieldWidth-shieldHoleOffset, shieldLength-shieldHoleOffset, -1]) shield_hole();
	}
	//JACK
	//LED
	//HEADER
	//MEGA
}

//----------------------------
//DISPLAY

displayWidth=42.46;
displayLength=67.2;
screenOffset=5;
displayThick=1.33;
displayHoleRadius=1.7;
displayHoleWoffset=3.5;
displayHoleLoffset=2.5;

DisplayOffsetW=(piWidth-displayWidth)/2;
DisplayOffsetH=(piLength-displayLength)/2;

module display() {
	translate([DisplayOffsetW,DisplayOffsetH,0]) {
		color("salmon")
		difference() {
			cube([displayWidth, displayLength, displayThick]);
			translate([displayHoleWoffset, displayHoleLoffset, -1]) display_hole();
			translate([displayWidth-displayHoleWoffset, displayHoleLoffset, -1]) display_hole();
			translate([displayHoleWoffset, displayLength-displayHoleLoffset, -1]) display_hole();
			translate([displayWidth-displayHoleWoffset, displayLength-displayHoleLoffset, -1]) display_hole();
		}
		color("lightblue")//SCREEN
		translate([0,screenOffset,displayThick])
			cube([displayWidth, displayLength-2*screenOffset, displayThick]);
	}
}

//----------------------------
//CASE TOP
//
// TFT, bottom screw cylinder
// pwr,jack,USB side
// liplock


topWidth=piWidth;
topLength=piLength;
topHeight=15-piThick;
topThick=3;
topMountHight=2;
topMountPiHight=topHeight;
topMountHoleDia=2;
topMountDia=6.2;

module case_top() {
	difference() {
		rounded_rect(topWidth, topLength, topHeight, topThick);
		translate([0,0,-topThick]) cube([piWidth, piLength, topHeight]);// filler
		translate([DisplayOffsetW, DisplayOffsetH+screenOffset, 0])// screen
			cube([displayWidth,displayLength-2*screenOffset,topHeight+1]);
		translate([DisplayOffsetW+displayHoleWoffset,DisplayOffsetH+displayHoleLoffset,topHeight-topThick-1])// display hole
			cylinder(h=topThick+2,r=displayHoleRadius);
		translate([displayWidth+displayHoleWoffset, DisplayOffsetH+displayHoleLoffset, topHeight-topThick-1])
			cylinder(h=topThick+2,r=displayHoleRadius);
		translate([DisplayOffsetW+displayHoleWoffset, topLength-DisplayOffsetH-displayHoleLoffset, topHeight-topThick-1])
			cylinder(h=topThick+2,r=displayHoleRadius);
		translate([displayWidth+displayHoleWoffset, topLength-DisplayOffsetH-displayHoleLoffset, topHeight-topThick-1])
			cylinder(h=topThick+2,r=displayHoleRadius);
	}
}


//----------------------------
//CASE BOTTOM
//
// ventilation
// liplock

bottomWidth=piWidth;
bottomLength=piLength;
bottomHeight=15+piThick;
bottomThick=3;
bottomMountHight=3;
bottomMountDia=6.2;

module case_bottom() {
	difference() {
		rounded_rect(bottomWidth, bottomLength, bottomHeight, bottomThick);
		translate([0,0,bottomThick]) cube([piWidth, piLength,  bottomHeight]);// filler
		translate([piHoleOffset,piHoleOffset,-1]) cylinder(h=bottomThick+2, d=piHoleDia);// mount hole
		translate([piWidth-piHoleOffset,piHoleOffset,-1]) cylinder(h=bottomThick+2, d=piHoleDia);
		translate([piHoleOffset,piShieldLength-piHoleOffset,-1]) cylinder(h=bottomThick+2, d=piHoleDia);
		translate([piWidth-piHoleOffset,piShieldLength-piHoleOffset,-1]) cylinder(h=bottomThick+2, d=piHoleDia);
		//pi();
	}
	//mount buffer
	bottom_mount(piHoleOffset,piHoleOffset,bottomThick);
	bottom_mount(piWidth-piHoleOffset,piHoleOffset,bottomThick);
	bottom_mount(piHoleOffset,piShieldLength-piHoleOffset,bottomThick);
	bottom_mount(piWidth-piHoleOffset,piShieldLength-piHoleOffset,bottomThick);
}

//----------------------------
// MAIN

if (drawPi) { pi(); }
if (drawShiled) { shield(); }
if (drawDisplay) { display(); }
if (drawCaseTop) { case_top(); }
if (drawCaseBottom) { case_bottom(); }

if (drawAll) {
//	translate([0,0,0]) pi();
//	translate([0,0,10]) shield();
//	translate([0,0,20]) display();
	translate([0,0,40]) case_top();
	translate([0,0,-0]) case_bottom();
}

