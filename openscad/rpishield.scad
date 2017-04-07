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
avOverHang=2.30;
avY=53.5-avWidth/2;

hdmiWidth=11.37;
hdmiLength=15.07;
hdmiHeight=7.86-piThick;
hdmiOverHang=1.9;
hdmiY=32-(hdmiWidth/2);

microWidth=5.59;
microLength=8.04;
microHeight=4.22-piThick;
microOverHang=1.9;
microY=10.6-(microWidth/2);

gpioWidth=5.01;
gpioLength=50.27;
gpioHeight=10.2-piThick;
gpioY=HoleOffset/2+29-gpioLength/2;
gpioX=1.05;

module pi(edgeCut=0) {
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
		translate([usb1Offset, piLength-usbLength+usbOverHang+edgeCut, piThick])
			cube([usbWidth, usbLength, usbHeight]);
		translate([usb2Offset, piLength-usbLength+usbOverHang+edgeCut, piThick])
			cube([usbWidth, usbLength, usbHeight]);
		// ETH
		translate([ethOffset, piLength-ethLength+ethOverHang+edgeCut, piThick])
			cube([ethWidth, ethLength, ethHeight]);
		// HDMI Plug
		translate([piWidth-hdmiWidth+hdmiOverHang+edgeCut, hdmiY, piThick])
			cube([hdmiWidth, hdmiLength, hdmiHeight]);
		// AV
		translate([piWidth-avLength+avOverHang+edgeCut, avY, piThick])
			cube([avLength, avWidth, avHeight]);
		// microUSB
		translate([piWidth-microWidth+microOverHang+edgeCut, microY, piThick])
			cube([microWidth, microLength, microHeight]);
	}
	// GPIO Headers
	color("black") {
		translate([gpioX, gpioY, piThick])
			cube([gpioWidth, gpioLength, gpioHeight]);
	}
}

//----------------------------
//SHIELD

shieldWidth=56;
shieldLength=65;
shieldThick=1.33;
shieldHoleDia=2.75;
shieldHoleOffset=HoleOffset;

shieldSPIWidth=2.54;
shieldSPILength=9*2.54;
shieldSPIHeight=gpioHeight;
shieldSPIoffsetX=(shieldWidth-shieldSPILength)/2;
shieldSPIoffsetY=2.5;

shiledJackWidth=7.05;
shiledJackLength=14.90;
shiledJackHeight=7.38-shieldThick;
shiledJackX=shieldWidth-shiledJackLength+2.5;
shiledJackY=25;

shiledLEDWidth=5.05;
shiledLEDLength=14.90;
shiledLEDHeight=5.38-shieldThick;
shiledLEDX=shieldWidth-shiledJackLength+2.5;
shiledLEDY=40;

shieldGPIOWidth=5.01;
shieldGPIOLength=50.27;
shieldGPIOHeight=10.2-piThick;
shieldGPIOY=(shieldLength-shieldGPIOLength)/2;
shieldGPIOX=1.05;

module shield(shieldEdgeCut=0) {
	color("seagreen")
	difference() {
		cube([shieldWidth, shieldLength, shieldThick]);
		translate([shieldHoleOffset, shieldHoleOffset, -1]) shield_hole();
		translate([shieldWidth-shieldHoleOffset, shieldHoleOffset, -1]) shield_hole();
		translate([shieldHoleOffset, shieldLength-shieldHoleOffset, -1]) shield_hole();
		translate([shieldWidth-shieldHoleOffset, shieldLength-shieldHoleOffset, -1]) shield_hole();
	}
	color("black") {
		translate([shieldGPIOX, shieldGPIOY, shieldThick])// GPIO
			cube([shieldGPIOWidth, shieldGPIOLength, shieldGPIOHeight]);
		translate([shieldSPIoffsetX,shieldSPIoffsetY,shieldThick])// SPI
			cube([shieldSPILength,shieldSPIWidth,shieldSPIHeight]);
		translate([shiledJackX+shieldEdgeCut,shiledJackY,shieldThick])// JACK
			cube([shiledJackLength,shiledJackWidth,shiledJackHeight]);
		translate([shiledJackX+shieldEdgeCut,shiledJackY-10,shieldThick])
			cube([shiledJackLength,shiledJackWidth,shiledJackHeight]);
		translate([shiledLEDX+shieldEdgeCut,shiledLEDY,shieldThick])// LED
			cube([shiledLEDLength,shiledLEDWidth,shiledLEDHeight]);
		translate([shiledLEDX+shieldEdgeCut,shiledLEDY+10,shieldThick])
			cube([shiledLEDLength,shiledLEDWidth,shiledLEDHeight]);
	}
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

displaySPIWidth=2.54;
displaySPILength=11*2.54;
displaySPIHeight=gpioHeight;
displaySPIoffsetX=(displayWidth-displaySPILength)/2;
displaySPIoffsetY=displayLength-2.5-displaySPIWidth/2;

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
		color("lightblue") { // SCREEN
			translate([0,screenOffset,displayThick]) 
				cube([displayWidth, displayLength-2*screenOffset, displayThick]);
		}
		color("black") { // SPI
			translate([displaySPIoffsetX,displaySPIoffsetY,-displaySPIHeight])
				cube([displaySPILength,displaySPIWidth,displaySPIHeight]);
		}
	}
}

//----------------------------
// SPACER

spacerHeight=15;

module spacer_mount() {
	spacer(HoleOffset, HoleOffset);
	spacer(shieldWidth-HoleOffset,HoleOffset);
	spacer(HoleOffset,shieldLength-HoleOffset);
	spacer(shieldWidth-HoleOffset,shieldLength-HoleOffset);
}

//----------------------------
//CASE TOP
//
// display, bottom screw cylinder
// pwr,jack,USB side
// liplock


topWidth=piWidth;
topLength=piLength;
topHeight=30-piThick;
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
		translate([0,0,-10]) pi(edgeCut=3);
		translate([0,0,10]) shield(shieldEdgeCut=3);
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
		translate([0,0,bottomThick+bottomMountHight]) pi(edgeCut=3);
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
	translate([0,0,0])
		case_bottom();
	translate([0,0,bottomThick+bottomMountHight])
		pi();
	translate([0,0,bottomThick+bottomMountHight+piThick])
		spacer_mount();
	translate([0,0,bottomThick+bottomMountHight+piThick+spacerHeight])
		shield();
	translate([0,0,bottomThick+bottomMountHight+piThick+spacerHeight+shieldThick++spacerHeight])
		display();
	translate([0,0,bottomThick+bottomMountHight+piThick+shieldThick+displayThick+topThick]) case_top();
}

