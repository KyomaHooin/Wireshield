
cube([3,2,0.05]);//podstava

side = [[0,0],[3,0],[3,2],[0,2]];//bok
fill = [[0.05,0.05],[2.95,0.05],[2.95,1.95],[0.05,1.95]];//vypln

translate([0,0,0.05]) {// okraj
    linear_extrude(height=0.3) {// vyska boku
        polygon(concat(side,fill),paths=[[0,1,2,3],[4,5,6,7]]);// polygon
    }
}
