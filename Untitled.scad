//translate([10, 5, 10])cube([10, 20, 10]);

//color("red")translate([0, 30, 0])rotate([90, 0, 0])cylinder(h=10, r=5, $fn=50);

//color("blue")rotate([90, 0, 0])translate([0, 30, 0])cylinder(h=10, r=5, $fn=50);

//cylinder(h=10, r1=5, r2=1);

//cylinder(h=10, r1=5, r2=0, $fn=4);

//cylinder(h=10, r=5, $fn=3);

//sphere(r=10);

//difference(){
//    union(){
//        color("red")cube([10, 20, 10]);
//        color("blue") translate([0, 0, 10]) cube([10, 20, 10]);
//    }
//    translate([5, 10, -1])cylinder(h=22, r=2);
//   translate([5, 15, -1])cylinder(h=22, r=2);
//    translate([-1, 4, 5])rotate([0, 90, 0])cylinder(h=12, r=2);
//}   
//------------------------------------------
module piulita(inaltime, raza_exterioara, raza_interioara)
{
    difference(){
        cylinder(h=inaltime, r=raza_exterioara, $fn=6);
        translate([0, 0, -1])cylinder(h=inaltime+2, r=raza_interioara, $fn=30);
    }
}
//------------------------------------------------
module piulita_M3()
{
    piulita(2.4, 3, 1.5);
}    
//------------------------------------------------
module piulita_M4()
{
    piulita(3.2, 3.83, 2);
}    
//------------------------------------------------
for(i=[0: 2: 99])
    translate([15 * i, 0, 0])piulita(5, 6, 2);

translate([0, 10, 0])piulita_M3();
translate([0, 20, 0])piulita_M4();
//translate([15, 0, 0]);
//translate([28, 0, 0]);