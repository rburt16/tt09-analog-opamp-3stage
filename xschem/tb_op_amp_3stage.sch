v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 540 -1340 540 -1320 {
lab=GND}
N 630 -1340 630 -1320 {
lab=GND}
N 540 -1320 540 -1300 {
lab=GND}
N 540 -1320 630 -1320 {
lab=GND}
N 1060 -1340 1060 -1320 {
lab=GND}
N 1060 -1420 1060 -1400 {
lab=#net1}
N 1060 -1610 1060 -1510 {
lab=out}
N 1140 -1420 1240 -1420 {
lab=#net1}
N 1140 -1450 1140 -1420 {
lab=#net1}
N 1140 -1610 1140 -1510 {
lab=out}
N 1240 -1450 1240 -1420 {
lab=#net1}
N 1240 -1530 1240 -1510 {
lab=#net2}
N 1240 -1610 1240 -1590 {
lab=out}
N 540 -1730 540 -1400 {
lab=VDPWR}
N 700 -1320 800 -1320 {
lab=GND}
N 800 -1320 1060 -1320 {
lab=GND}
N 1020 -1730 1060 -1730 {
lab=out}
N 1060 -1730 1060 -1610 {
lab=out}
N 1140 -1610 1240 -1610 {
lab=out}
N 1060 -1610 1140 -1610 {
lab=out}
N 700 -1710 720 -1710 {
lab=in-}
N 910 -1790 1060 -1790 {
lab=out}
N 700 -1790 700 -1710 {
lab=in-}
N 700 -1790 850 -1790 {
lab=in-}
N 1060 -1790 1060 -1730 {
lab=out}
N 700 -1670 720 -1670 {
lab=GND}
N 700 -1670 700 -1320 {
lab=GND}
N 630 -1690 720 -1690 {
lab=in+}
N 630 -1690 630 -1400 {
lab=in+}
N 540 -1730 720 -1730 {
lab=VDPWR}
N 630 -1800 630 -1690 {
lab=in+}
N 1060 -1450 1060 -1420 {
lab=#net1}
N 1060 -1420 1140 -1420 {
lab=#net1}
N 700 -1810 700 -1790 {
lab=in-}
N 1060 -1810 1060 -1790 {
lab=out}
N 630 -1320 700 -1320 {
lab=GND}
N 540 -1750 540 -1730 {
lab=VDPWR}
N 800 -1390 800 -1320 {
lab=GND}
N 800 -1480 800 -1450 {
lab=x1.cmfb}
N 270 -1340 270 -1325 {
lab=GND}
N 270 -1325 270 -1320 {
lab=GND}
N 270 -1320 540 -1320 {
lab=GND}
N 270 -1420 270 -1400 {
lab=#net3}
N 220 -1500 270 -1500 {
lab=GND}
N 220 -1500 220 -1320 {
lab=GND}
N 220 -1320 270 -1320 {
lab=GND}
N 270 -1500 270 -1480 {
lab=GND}
C {devices/vsource.sym} 630 -1370 0 0 {name=Vin value="0.9 AC 1 pulse 0.1 1.2 0 10n 10n 500n 1u" savecurrent=false}
C {devices/vsource.sym} 540 -1370 0 0 {name=Vsupply value=1.8 savecurrent=false}
C {sky130_fd_pr/corner.sym} 380 -1540 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/code.sym} 375 -1680 0 0 {name=spice
only_toplevel=false
value="
.control
.option savecurrents
*.options temp=125
dc Vin 0.1 1.2 0.02 
*temp -40 125 15
plot v(in+) v(x1.commonmode) v(VDPWR)
plot v(out) v(x1.pdrive) v(x1.ndrive)
plot v(in+)-v(in-) ylimit 100u -100u ydelta 50u
plot @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[id] @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[id]
plot 1/(@m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[gm]+@m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[gm])
*plot i(Vmeas) title vs_Supply_tt_-40degto125deg
ac dec 100 1 1e9
plot db(v(out)/v(in+,in-)) ph(v(out)/v(in+,in-))*57.3 ylimit 180 -180 ydelta 20
plot db(v(out)/v(x1.in+2,x1.in-2)) ph(v(out)/v(x1.in+2,x1.in-2))*57.3 ylimit 180 -180 ydelta 20
plot db(v(out)) xlog ylimit 6 -6 ydelta 3
dc temp -40 125 5
*plot v(out) v(pdrive) v(ndrive)
*plot i(Vmeas) title vs_Temp_tt
*plot v(x1.drive) title vs_Temp_tt
*plot v(x1.ptat) title vs_Temp_tt
*set temp=-40
*tran 2n 1u
*plot v(VSS) title Start_Up_tt_-40deg
*plot v(x1.ptat) title Stability
*plot i(Vmeas) @m.x1.xm18.msky130_fd_pr__nfet_01v8[id] title Start_Up_tt
*set temp=125
tran 2n 1u
plot v(out) v(x1.pdrive) v(x1.ndrive)
plot @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[id]
*plot v(out) ylimit 0.86 1.04 ydelta 0.02
plot v(out)
plot v(x1.cmfb)
*plot V(VSS) title Start_Up_tt_125deg
*plot v(x1.ptat)
*plot i(Vmeas) @m.x1.xm18.msky130_fd_pr__nfet_01v8[id] title Start_Up_tt_125deg
noise v(out) Vin dec 10 1 100MEG 1
write noise1.all noise2.all
setplot noise1
setplot noise2
plot onoise_spectrum xlog ylog
*plot onoise.m.x1.xm15.msky130_fd_pr__pfet_01v8_lvt onoise.m.x1.xm14.msky130_fd_pr__nfet_01v8_lvt xlog ylog
*plot onoise.m.x1.xm14.msky130_fd_pr__nfet_01v8_lvt onoise.m.x1.xm14.msky130_fd_pr__nfet_01v8_lvt.id xlog ylog
save all
*set temp=27
op
print all
write tb_op_amp_3stage.raw
.endc
.save all @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[gm] @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.x1.xm11.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm12.msky130_fd_pr__pfet_01v8[gm]
+ @m.x1.xm15.msky130_fd_pr__pfet_01v8_lvt[gm] @m.x1.xm16.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.x1.xm14.msky130_fd_pr__nfet_01v8_lvt[gm] @m.x1.xm13.msky130_fd_pr__nfet_01v8_lvt[gm]
"}
C {devices/gnd.sym} 540 -1300 0 0 {name=l1 lab=GND}
C {devices/res.sym} 1060 -1480 0 0 {name=Rload
value=10k
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} 1060 -1370 0 0 {name=Vsupply1 value=0.9 savecurrent=false}
C {devices/lab_pin.sym} 630 -1800 1 0 {name=p12 sig_type=std_logic lab=in+}
C {devices/res.sym} 1240 -1480 0 0 {name=Rload1
value=100
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 1140 -1480 0 0 {name=Cload
m=1
value=1f
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1240 -1560 0 0 {name=Cload1
m=1
value=1f
footprint=1206
device="ceramic capacitor"}
C {devices/isource.sym} 800 -1420 0 0 {name=I7 value="0 pulse 0u 0u 0 2n 2n 500n 1u"}
C {devices/lab_pin.sym} 800 -1480 1 0 {name=p20 sig_type=std_logic lab=x1.cmfb}
C {devices/lab_pin.sym} 540 -1750 1 0 {name=p21 sig_type=std_logic lab=VDPWR}
C {/foss/designs/tt09-analog-opamp-3stage/xschem/op_amp_3stage.sym} 870 -1700 0 0 {name=x1}
C {devices/res.sym} 880 -1790 1 0 {name=Rfeedback
value=1
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 1060 -1810 1 0 {name=p1 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} 700 -1810 1 0 {name=p2 sig_type=std_logic lab=in-}
C {devices/vsource.sym} 270 -1370 0 0 {name=Vin1 value="0.9 pulse 0.1 1.7 0 10n 10n 500n 1u" savecurrent=false}
C {devices/res.sym} 270 -1450 0 0 {name=Rfb2
value=5k
footprint=1206
device=resistor
m=1}
