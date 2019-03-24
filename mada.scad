translate([30, 10, 83])
import("TR1_spider.stl");
raza_motor_hole=11;
inaltime_mijloc_roata_dintara=7.2;
raza_mijloc_roata_dintata=11.65;
raza_roata_dintata=12.75;
inaltime_roata_dintata=1;
inaltime_flange=17.5;
inaltime_piesa_plastic=2;
raza_surub_slip_ring=2.75;
lungime_piesa_plastic=76;
latime_piesa_plastic=47;
inaltime_surub=4;
raza_surub=1.25;
latime_nema11=28.2;
inaltime_nema11=31.5;
distanta_gauri_nema11=23/2;

module nema11()
{
    difference() {
    // body
     translate([-latime_nema11/2, -latime_nema11/2, 0])
            color("gray") cube([latime_nema11, latime_nema11, inaltime_nema11]);
    // holes
            translate([distanta_gauri_nema11, distanta_gauri_nema11, inaltime_nema11 - 2]) cylinder (h=inaltime_surub, r=raza_surub, center = true, $fn=100);
            translate([distanta_gauri_nema11, -distanta_gauri_nema11, inaltime_nema11 - 2]) cylinder (h=inaltime_surub, r=raza_surub, center = true, $fn=100);
            translate([-distanta_gauri_nema11, distanta_gauri_nema11, inaltime_nema11 - 2])  cylinder (h=inaltime_surub, r=raza_surub, center = true, $fn=100);
            translate([-distanta_gauri_nema11, -distanta_gauri_nema11, inaltime_nema11 - 2]) cylinder (h=inaltime_surub, r=raza_surub, center = true, $fn=100);
    }
    translate([0, 0, inaltime_nema11]) color("yellow")cylinder (h = 2, r = 11, $fn = inaltime_nema11 - 2);
        // shaft
    translate([0, 0, inaltime_nema11]) cylinder(h = 20, r = 2.5, $fn = 30);
}
//---------------------------------------------------

module piesa_plastic()
{
    difference(){
        color("fuchsia") 
        union () {
            cube([lungime_piesa_plastic, latime_piesa_plastic, inaltime_piesa_plastic]);
        // margins
            translate ([0, 0, -4]) cube([lungime_piesa_plastic, inaltime_piesa_plastic, 4]);
            translate ([0, 45, -4]) cube([lungime_piesa_plastic, inaltime_piesa_plastic, 4]);
        }
        // motor screw holes
        translate([distanta_gauri_nema11/2, latime_piesa_plastic/2 - 11.5, -1]) cylinder (h=inaltime_surub, r=raza_surub, $fn=10);
        translate([distanta_gauri_nema11/2, latime_piesa_plastic/2 + distanta_gauri_nema11/2, -1]) cylinder (h=inaltime_surub, r=raza_surub, $fn=10);
        
        // motor hole
        translate([0, latime_piesa_plastic/2, -1]) cylinder (h=inaltime_surub, r=raza_motor_hole, $fn=100);
        // slip ring screw holes
            translate ([21 + 2 + 22, latime_piesa_plastic/2, -1] + [inaltime_flange * sin(30), inaltime_flange * cos(30), 0]) cylinder (h=inaltime_surub, r=raza_surub_slip_ring);
            translate ([21 + 2 + 22, latime_piesa_plastic/2, -1] + [inaltime_flange * sin(150), inaltime_flange * cos(150), 0]) cylinder (h=inaltime_surub, r=raza_surub_slip_ring);
            translate ([21 + 2 + 22, latime_piesa_plastic/2, -1] + [inaltime_flange * sin(270), inaltime_flange * cos(270), 0]) cylinder (h=inaltime_surub, r=raza_surub_slip_ring);

        // slip ring hole
        translate ([21 + 2 + 22, latime_piesa_plastic/2, -1]) cylinder (h=inaltime_surub, r=raza_motor_hole);
        // IR hole
        translate([73 - 4.5, latime_piesa_plastic/2 - 6, 0]) cube ([9, 22 - 5, 5]);
        // ir screw hole
        translate([72, latime_piesa_plastic/2 -9, -1]) cylinder (h=inaltime_surub, r=raza_surub, $fn = 10);
    }
}
//---------------------------------------------------
module slip_ring()
{
    cylinder(h=inaltime_flange, r=raza_motor_hole, $fn = 100);
        // flange
    translate([0, 0, 17]) {
        difference(){
            cylinder(h = 2, r = 22, $fn = 100);
            // holes
            translate ([inaltime_flange * sin(30), inaltime_flange * cos(30), -1]) cylinder (h=inaltime_surub, r=raza_surub_slip_ring);
            translate ([inaltime_flange * sin(150), inaltime_flange * cos(150), -1]) cylinder (h=inaltime_surub, r=raza_surub_slip_ring);
            translate ([inaltime_flange * sin(270), inaltime_flange * cos(270), -1]) cylinder (h=inaltime_surub, r=raza_surub_slip_ring);
        }
    }
    // rotor
    translate([0, 0, 14]) cylinder (h = 20, r = 2, $fn=100);  
}    
//---------------------------------------------------
module IR()
{
    difference(){
        color("green") cube([9, 23, 1], true);
        // screw hole
        translate([0, -9, 0]) cylinder(h=1, r=1.95, $fn=30);
    }
    translate([0, 0, 3])
    color("black")cube([6.35, 13.75, 7], true);
    
    translate([0, -3, 5])
    color("gray") sphere(2.3, $fn=100); 
    
    translate([0, 3, 5])
    color("gray") sphere(2.3, $fn=100);
}
//---------------------------------------------------
module roata_dintata()
{
    union()
    {
        color("red")cylinder (h=inaltime_roata_dintata, r=raza_roata_dintata, $fn=30);
        translate([0, 0, 1])
        color("white")cylinder (h=inaltime_mijloc_roata_dintara, r=raza_mijloc_roata_dintata, $fn=30);
        translate([0, 0, 8])
        color("red")cylinder (h=inaltime_roata_dintata, r=raza_roata_dintata, $fn=30);
    }
}
//----------------------------------------------------
module roata_dintata2()
{
    union()
    {
        
        color("red")cylinder (h=inaltime_roata_dintata, r=raza_roata_dintata, $fn=30);
        translate([0, 0, 1])
        color("white")cylinder (h=inaltime_mijloc_roata_dintara, r=raza_mijloc_roata_dintata, $fn=30);
        translate([0, 0, 8])
        color("red")cylinder (h=inaltime_roata_dintata, r=raza_roata_dintata, $fn=30);
        translate([0, 0, 15])
        color("blue")cube([12, 12, 11],true);
    }
}
//---------------------------------------------------
module piesa_plastic2()
{
    color("white") cube([50.1,58.3,3],true);
}
//---------------------------------------------------

nema11();
translate ([45, 0, 16]) slip_ring();
translate ([71.5, 0, 34]) IR();
translate([0, -latime_piesa_plastic/2, inaltime_nema11]) piesa_plastic();
translate([0, 0, 35])roata_dintata();
translate([45, 0, 35])roata_dintata2();
translate([45, 5, 75])rotate ([90, 0, 0])piesa_plastic2();
//---------------------------------------------------

