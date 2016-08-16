#!/usr/bin/gnuplot

set term postscript eps enhanced

set style data lines
set style line 1  linetype -1 linewidth 3 lc rgb "#005197"
set style line 2  linetype -1 linewidth 3 lc rgb "#00D317"
set style line 3  linetype -1 linewidth 3 lc rgb "#971c00"
set style line 4  linetype -1 linewidth 3 lc rgb "#000000"
set style increment user

set size 1.15,1.15
set border linewidth 1.5

set logscale y
set format y "10^{%L}"
set xrange [2006.4:2016.6]
set key samplen 6 spacing 3.0
set key bottom right
set grid lw 3
set ylabel "GFLOP/sec per Processing Element"
set xlabel "End of Year"

set yrange [10:1000]
set output "gflops-per-core-sp.eps"
set title "Theoretical Peak Performance per Core/Multiprocessor, Single Precision"

# Labels AMD
set label "HD 3870"         at 2007,170  center rotate by 30 textcolor rgb "#971c00"
set label "HD 4870"         at 2008,170 center rotate by 30 textcolor rgb "#971c00"
set label "HD 5870"         at 2009,180 center rotate by 30 textcolor rgb "#971c00"
set label "HD 6970"         at 2010,160 center rotate by 30 textcolor rgb "#971c00"
set label "HD 6970"         at 2011,160 center rotate by 30 textcolor rgb "#971c00"
set label "HD 7970 GHz Ed." at 2012,170 center rotate by 30 textcolor rgb "#971c00"
set label "HD 8970"         at 2013,150 center rotate by 30 textcolor rgb "#971c00"
set label "FirePro W9100"   at 2014,160 center rotate by 30 textcolor rgb "#971c00"
set label "FirePro S9150"   at 2015,160 center rotate by 30 textcolor rgb "#971c00"

# Labels Intel
set label "X5482"      at 2007,20 center rotate by 30 textcolor rgb "#005197"
set label "X5492"      at 2008,21 center rotate by 30 textcolor rgb "#005197"
set label "W5590"      at 2009,21 center rotate by 30 textcolor rgb "#005197"
set label "X5680"      at 2010,22 center rotate by 30 textcolor rgb "#005197"
set label "X5690"      at 2011,22 center rotate by 30 textcolor rgb "#005197"
set label "E5-2690"    at 2012,35 center rotate by 30 textcolor rgb "#005197"
set label "E5-2697 v2" at 2013,30 center rotate by 30 textcolor rgb "#005197"
set label "E5-2699 v3" at 2014,55 center rotate by 30 textcolor rgb "#005197"
set label "E5-2699 v3" at 2015,55 center rotate by 30 textcolor rgb "#005197"
set label "E5-2699 v4" at 2016,55 center rotate by 30 textcolor rgb "#005197"

# Labels NVIDIA
set label "8800 GTS"       at 2007,50 center rotate by 30 textcolor rgb "#00D317"
set label "GTX 280"        at 2008,45  center rotate by 30 textcolor rgb "#00D317"
set label "GTX 285"        at 2009,50  center rotate by 30 textcolor rgb "#00D317"
set label "GTX 580"        at 2010,75 center rotate by 30 textcolor rgb "#00D317"
set label "GTX 580"        at 2011,75 center rotate by 30 textcolor rgb "#00D317"
set label "GTX 680"        at 2012,500 center rotate by 30 textcolor rgb "#00D317"
set label "GTX Titan"      at 2013,450 center rotate by 30 textcolor rgb "#00D317"
set label "Tesla K40"      at 2014,450  center rotate by 30 textcolor rgb "#00D317"
set label "GTX Titan X"    at 2015,400 center rotate by 30 textcolor rgb "#00D317"
set label "NVIDIA Titan X" at 2016,300 center rotate by 30 textcolor rgb "#00D317"

# Labels Xeon Phi
set label "Xeon Phi 7120 (KNC)" at 2014.4,32 center rotate by 00
set label "Xeon Phi 7290 (KNL)" at 2016,122 center rotate by 55


plot 'data-intel.txt'     using 1:($2/$4)         with linesp pt 9 ps 3.0 title "Xeon CPUs, Intel", \
     'data-sp-nvidia.txt' using 1:($2/$6)         with linesp pt 5 ps 3.0 title "GeForce GPUs, NVIDIA", \
     'data-amd.txt'       using 1:($2/$7)         with linesp pt 7 ps 3.0 title "Radeon GPUs, AMD", \
     'data-intel-phi.txt' using 1:($2/$4)         with linesp pt 11 ps 3.0 title "Xeon Phis, Intel"
 
set yrange [1:1000]
set key top left Left reverse
set output "gflops-per-core-dp.eps"
set title "Theoretical Peak Performance per Core/Multiprocessor, Double Precision"

unset label

# Labels AMD
set label "HD 3870"         at 2007,40 center rotate by 30 textcolor rgb "#971c00"
set label "HD 4870"         at 2008,40 center rotate by 30 textcolor rgb "#971c00"
set label "HD 5870"         at 2009,40 center rotate by 30 textcolor rgb "#971c00"
set label "HD 6970"         at 2010.1,20 center rotate by 30 textcolor rgb "#971c00"
set label "HD 6970"         at 2011,20 center rotate by 30 textcolor rgb "#971c00"
set label "HD 7970 GHz Ed." at 2012,48 center rotate by 30 textcolor rgb "#971c00"
set label "HD 8970"         at 2013,40 center rotate by 30 textcolor rgb "#971c00"
set label "FirePro W9100"   at 2014,75 center rotate by 00 textcolor rgb "#971c00"
set label "FirePro S9150"   at 2015,47 center rotate by 00 textcolor rgb "#971c00"

# Labels Intel
set label "X5482"      at 2007,9 center rotate by 30 textcolor rgb "#005197"
set label "X5492"      at 2008,9 center rotate by 30 textcolor rgb "#005197"
set label "W5590"      at 2009,9 center rotate by 30 textcolor rgb "#005197"
set label "X5680"      at 2010,9 center rotate by 30 textcolor rgb "#005197"
set label "X5690"      at 2011,9 center rotate by 30 textcolor rgb "#005197"
set label "E5-2690"    at 2012,14 center rotate by 30 textcolor rgb "#005197"
set label "E5-2697 v2" at 2013,14 center rotate by 30 textcolor rgb "#005197"
set label "E5-2699 v3" at 2014.5,30 center rotate by 00 textcolor rgb "#005197"
set label "E5-2699 v4" at 2016,17 center rotate by 45 textcolor rgb "#005197"

# Labels NVIDIA
set label "Tesla C1060"  at 2008,1.6 center rotate by 30 textcolor rgb "#00D317"
set label "Tesla C1060"  at 2009,1.6 center rotate by 30 textcolor rgb "#00D317"
set label "Tesla C2050"  at 2010,55  center rotate by 30 textcolor rgb "#00D317"
set label "Tesla M2090"  at 2011,65  center rotate by 30 textcolor rgb "#00D317"
set label "Tesla K20"    at 2012,140 center rotate by 30 textcolor rgb "#00D317"
set label "Tesla K20X"   at 2013,140 center rotate by 30 textcolor rgb "#00D317"
set label "Tesla K40"    at 2014,140 center rotate by 30 textcolor rgb "#00D317"
set label "Tesla K40"    at 2015,140 center rotate by 30 textcolor rgb "#00D317"
set label "Tesla P100"   at 2016,130 center rotate by 30 textcolor rgb "#00D317"

# Labels Xeon Phi
set label "Xeon Phi 7120 (KNC)" at 2014.2,14 center rotate by 00
set label "Xeon Phi 7290 (KNL)" at 2016,25 center rotate by 45



plot 'data-intel.txt'     using 1:($3/$4) with linesp pt 9 ps 3.0 title "Xeon CPUs, Intel", \
     'data-dp-nvidia.txt' using 1:($2/$6) with linesp pt 5 ps 3.0 title "Tesla GPUs, NVIDIA", \
     'data-amd.txt'       using 1:($3/$7) with linesp pt 7 ps 3.0 title "Radeon GPUs, AMD", \
     'data-intel-phi.txt' using 1:($3/$4) with linesp pt 11 ps 3.0 title "Xeon Phis, Intel"
