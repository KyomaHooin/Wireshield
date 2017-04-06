//
// RPi Shiled / display display case
//

drawPi=0;
drawShiled=0;
drawdisplay=0;
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

module bottom_hole() {
	cylinder(h=bottomThick+2, d=piHoleDia);
}

module bottom_mount(offsetX,offsetY,Thick) {
	difference() {
		translate([offsetX, offsetY, Thick]) cylinder(h=bottomMountHight, d=bottomMountDia);
		translate([offsetX, offsetY, Thick-1]) cylinder(h=bottomMountHight+2, d=piHoleDia);
	}
}

//----------------------------
//RPI

piWidth=56;
piLength=85;
piThick=1.33;
piHoleDia=2.75;
piShieldLength=65;
HoleOffset=3.5;

usbWidth=13.28;
usbLength=17.05;
usbHeight=17.03-piThick;
usb1Offset=piWidth-29-usbWidth/2;
usb2Offset=piWidth-47-usbWidth/2;
usbOverHang=2;

ethWidth=15.96;
ethLength=21.33;
ethHeight=15.00-piThick;
ethOffset=piWidth-10.25-(ethWidth/2);
ethOverHang=2.32;

avWidth=7.05;
avLength=14.90;
avHeight=7.38-piThick;
avRadius=avWidth/2;
avOverHang=2.30;
avYset=53.5-avWidth/2;

hdmiWidth=11.37;
hdmiLength=15.07;
hdmiHeight=7.86-piThick;
hdmiOverHang=1.9;
hdmiYset=32-(hdmiWidth/2);

microWidth=5.59;
microLength=8.04;
microHeight=4.22-piThick;
microOverHang=1.9;
microYset=10.6-(microWidth/2);

gpioWidth=5.01;
gpioLength=50.27;
gpioHeight=10.2-piThick;
gpioYset=HoleOffset/2+29-gpioLength/2;
gpioXset=1.05;

module pi() {
	color("seagreen")
	difference() {
		cube([piWidth, piLength, piThick]);
		translate([HoleOffset, HoleOffset, -1]) pi_hole();
		translate([piWidth-HoleOffset, HoleOffset, -1]) pi_hole();
		translate([HoleOffset, piShieldLength-HoleOffset, -1]) pi_hole();
		translate([piWidth-HoleOffset, piShieldLength-HoleOffset, -1]) pi_hole();
	}
	color("Silver") {
		// USB
		translate([usb1Offset,piLength-usbLength+usbOverHang,piThick]) cube([usbWidth, usbLength, usbHeight]);
		translate([usb2Offset,piLength-usbLength+usbOverHang,piThick]) cube([usbWidth, usbLength, usbHeight]);
		// ETH
		translate([ethOffset,piLength-ethLength+ethOverHang,piThick]) cube([ethWidth, ethLength, ethHeight]);
		// HDMI Plug
		translate([piWidth-hdmiWidth+hdmiOverHang,hdmiYset, piThick]) cube([hdmiWidth, hdmiLength, hdmiHeight]);
	}
	// AV
	translate([piWidth-avLength+avOverHang,avYset,piThick]) cube([avLength,avWidth, avHeight]);
	// microUSB
	translate([piWidth-microWidth+microOverHang,microYset,piThick]) cube([microWidth, microLength, microHeight]);
	// GPIO Headers
	color("black") {
		translate([gpioXset, gpioYset, piThick]) cube([gpioWidth, gpioLength, gpioHeight]);
	}
}

//----------------------------
//SHIELD

shieldWidth=56;
shieldLength=65;
shieldThick=1.33;
shieldHoleDia=2.75;
shieldHoleOffset=HoleOffset;

module shield() {
	color("seagreen")
	difference() {
		cube([shieldWidth, shieldLength, shieldThick]);
		translate([shieldHoleOffset, shieldHoleOffset, -1]) shield_hole();
		translate([shieldWidth-shieldHoleOffset, shieldHoleOffset, -1]) shield_hole();
		translate([shieldHoleOffset, shieldLength-shieldHoleOffset, -1]) shield_hole();
		translate([shieldWidth-shieldHoleOffset, shieldLength-shieldHoleOffset, -1]) shield_hole();
	}
	color("black") {
		translate([gpioXset, gpioYset, piThick]) cube([gpioWidth, gpioLength, gpioHeight]);
	}
	//JACK
	//LED
	//SPI
	//MEGA
}

//----------------------------
//TFT

displayWidth=42.46;
displayLength=67.2;
screenOffset=5;
displayThick=1.33;
displayHoleRadius=1.7;
displayHoleWoffset=3.5;
displayHoleLoffset=2.5;

displayOffsetW=(piWidth-displayWidth)/2;
displayOffsetH=(piLength-displayLength)/2;

module display() {
	translate([displayOffsetW,displayOffsetH,0]) {
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
// display, bottom screw cylinder
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
		translate([displayOffsetW, displayOffsetH+screenOffset, 0])// screen
			cube([displayWidth,displayLength-2*screenOffset,topHeight+1]);
		translate([displayOffsetW+displayHoleWoffset,displayOffsetH+displayHoleLoffset,topHeight-topThick-1])// display hole
			cylinder(h=topThick+2,r=displayHoleRadius);
		translate([displayWidth+displayHoleWoffset, displayOffsetH+displayHoleLoffset, topHeight-topThick-1])
			cylinder(h=topThick+2,r=displayHoleRadius);
		translate([displayOffsetW+displayHoleWoffset, topLength-displayOffsetH-displayHoleLoffset, topHeight-topThick-1])
			cylinder(h=topThick+2,r=displayHoleRadius);
		translate([displayWidth+displayHoleWoffset, topLength-displayOffsetH-displayHoleLoffset, topHeight-topThick-1])
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
		translate([HoleOffset,HoleOffset,-1]) bottom_hole();// mount hole
		translate([shieldWidth-HoleOffset,HoleOffset,-1]) bottom_hole();
		translate([HoleOffset,shieldLength-HoleOffset,-1]) bottom_hole();
		translate([shieldWidth-HoleOffset,shieldLength-HoleOffset,-1]) bottom_hole();
		translate([0,0,bottomThick+bottomMountHight]) pi();
	}
	//mount buffer
	bottom_mount(HoleOffset, HoleOffset,bottomThick);
	bottom_mount(shieldWidth-HoleOffset,HoleOffset,bottomThick);
	bottom_mount(HoleOffset,shieldLength-HoleOffset,bottomThick);
	bottom_mount(shieldWidth-HoleOffset,shieldLength-HoleOffset,bottomThick);
}

//----------------------------
// MAIN

if (drawPi) { pi(); }
if (drawShiled) { shield(); }
if (drawdisplay) { display(); }
if (drawCaseTop) { case_top(); }
if (drawCaseBottom) { case_bottom(); }

if (drawAll) {
//	translate([0,0,0]) case_bottom();
//	translate([0,0,20]) pi();
//	translate([0,0,35]) shield();
//	translate([0,0,50]) display();
//	translate([0,0,60]) case_top();
	translate([0,0,0]) case_bottom();
	translate([0,0,bottomThick+bottomMountHight]) pi();
	translate([0,0,bottomThick+bottomMountHight+piThick+15]) shield();
	translate([0,0,bottomThick+bottomMountHight+piThick+15+shieldThick+15]) display();
	translate([0,0,bottomThick+bottomMountHight+piThick+15+shieldThick+displayThick+topThick]) case_top();
}

