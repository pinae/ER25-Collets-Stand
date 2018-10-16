module er25_collet() {
    union() {
        cylinder(d1=25-2*22.34*tan(8), d2=25, h=22.33, $fn=64);
        translate([0, 0, 22.33]) cylinder(d=25, h=3.56, $fn=64);
        translate([0, 0, 22.33+3.56]) cylinder(d=22.8, h=3.1, $fn=64);
        translate([0, 0, 29]) cylinder(d1=26, d2=22, h=5, $fn=64);
    }
}

module collet_array() {
    for(i=[0:6]) {
        rotate([25, 0, 0]) translate([i*28, 0, 0]) er25_collet();
    }
    for(i=[0:5]) {
        rotate([40, 0, 0]) translate([i*28+14, 40, -6]) er25_collet();
        rotate([55, 0, 0]) translate([i*28+14, 80, -21]) er25_collet();
    }
}

module stand_inner(oversize=0) {
    difference() {
        translate([-16-oversize, -25-oversize, -5-oversize]) cube([200+2*oversize, 95+2*oversize, 82+2*oversize]);
        translate([-17, -65, 140]) rotate([0, 90, 0]) cylinder(d=271, h=202, $fn=512);
        collet_array();
        translate([-17, -25, 6.5]) rotate([45, 0, 0]) cube([202, 10, 10]);
        for(i=[0,1]) {
            hull() for(j=[0,1]) translate([-8+185*i, 65, 70-j*8]) rotate([90, 0, 0]) cylinder(d=10, h=50, $fn=32);
            hull() for(j=[0,1]) translate([-8+185*i, 75, 70-j*8]) rotate([90, 0, 0]) cylinder(d=5, h=50, $fn=32);
            translate([-8+185*i, 75, 70-8]) rotate([90, 0, 0]) cylinder(d=10, h=50, $fn=32);
        }
    }
}

module stand_base() {
    difference() {
        translate([-16, -25, -5]) cube([200, 95, 82]);
        translate([-17, -65, 140]) rotate([0, 90, 0]) cylinder(d=270, h=202, $fn=512);
        collet_array();
        translate([-17, -25, 7.5]) rotate([45, 0, 0]) cube([202, 10, 10]);
        for(i=[0,1]) {
            hull() for(j=[0,1]) translate([-8+185*i, 65, 70-j*8]) rotate([90, 0, 0]) cylinder(d=10, h=50, $fn=32);
            hull() for(j=[0,1]) translate([-8+185*i, 75, 70-j*8]) rotate([90, 0, 0]) cylinder(d=5, h=50, $fn=32);
            translate([-8+185*i, 75, 70-8]) rotate([90, 0, 0]) cylinder(d=10, h=50, $fn=32);
        }
        translate([0, -22.5, 7.5]) rotate([45, 0, 0]) linear_extrude(height=3) text(text="1 - 0,5", size=4.5, font="Liberation Sans", halign="center");
        translate([1*28, -22.5, 7.5]) rotate([45, 0, 0]) linear_extrude(height=3) text(text="1,5 - 1", size=4.5, font="Liberation Sans", halign="center");
        translate([2*28, -22.5, 7.5]) rotate([45, 0, 0]) linear_extrude(height=3) text(text="2 - 1", size=4.5, font="Liberation Sans", halign="center");
        translate([3*28, -22.5, 7.5]) rotate([45, 0, 0]) linear_extrude(height=3) text(text="3 - 2", size=4.5, font="Liberation Sans", halign="center");
        translate([4*28, -22.5, 7.5]) rotate([45, 0, 0]) linear_extrude(height=3) text(text="4 - 3", size=4.5, font="Liberation Sans", halign="center");
        translate([5*28, -22.5, 7.5]) rotate([45, 0, 0]) linear_extrude(height=3) text(text="5 - 4", size=4.5, font="Liberation Sans", halign="center");
        translate([6*28, -22.5, 7.5]) rotate([45, 0, 0]) linear_extrude(height=3) text(text="6 - 5", size=4.5, font="Liberation Sans", halign="center");
        translate([0*28+14, 8, 24]) rotate([31, 0, 0]) linear_extrude(height=3) text(text="7 - 6", size=4.5, font="Liberation Sans", halign="center");
        translate([1*28+14, 8, 24]) rotate([31, 0, 0]) linear_extrude(height=3) text(text="8 - 7", size=4.5, font="Liberation Sans", halign="center");
        translate([2*28+14, 8, 24]) rotate([31, 0, 0]) linear_extrude(height=3) text(text="9 - 8", size=4.5, font="Liberation Sans", halign="center");
        translate([3*28+14, 8, 24]) rotate([31, 0, 0]) linear_extrude(height=3) text(text="10 - 9", size=4.5, font="Liberation Sans", halign="center");
        translate([4*28+14, 8, 24]) rotate([31, 0, 0]) linear_extrude(height=3) text(text="11 - 10", size=4.5, font="Liberation Sans", halign="center");
        translate([5*28+14, 8, 24]) rotate([31, 0, 0]) linear_extrude(height=3) text(text="12 - 11", size=4.5, font="Liberation Sans", halign="center");
        translate([0*28+14, 37.5, 49]) rotate([48, 0, 0]) linear_extrude(height=3) text(text="13 - 12", size=4.5, font="Liberation Sans", halign="center");
        translate([1*28+14, 37.5, 49]) rotate([48, 0, 0]) linear_extrude(height=3) text(text="14 - 13", size=4.5, font="Liberation Sans", halign="center");
        translate([2*28+14, 37.5, 49]) rotate([48, 0, 0]) linear_extrude(height=3) text(text="15 - 14", size=4.5, font="Liberation Sans", halign="center");
        translate([3*28+14, 37.5, 49]) rotate([48, 0, 0]) linear_extrude(height=3) text(text="14 - 13", size=4.5, font="Liberation Sans", halign="center");
        translate([4*28+14, 37.5, 49]) rotate([48, 0, 0]) linear_extrude(height=3) text(text="15 - 14", size=4.5, font="Liberation Sans", halign="center");
        translate([5*28+14, 37.5, 49]) rotate([48, 0, 0]) linear_extrude(height=3) text(text="16 - 15", size=4.5, font="Liberation Sans", halign="center");
        stand_inner(1);
    }
}
stand_base();
color("gray") stand_inner();
//collet_array();