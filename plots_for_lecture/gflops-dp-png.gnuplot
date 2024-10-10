#!/usr/bin/gnuplot

set term pngcairo enhanced size 1920,1440 fontscale 2.0

set style data lines
set style line 1  linetype -1 linewidth 3 lc rgb "#005197"
set style line 2  linetype -1 linewidth 3 lc rgb "#00D317"
set style line 3  linetype -1 linewidth 3 lc rgb "#971c00"
set style line 4  linetype -1 linewidth 3 lc rgb "#000000"
set style increment user

#set size 1.40,1.30
set border linewidth 1.5

set logscale y
set format y "10^{%L}"
set xrange [2006.4:2025.0]
set key samplen 6 spacing 3.0
set key bottom right
set grid lw 3
set ylabel "GFLOP/sec"
set xlabel "End of Year"

set yrange [30:90000]
set output "gflops-dp-2024.png"
set title "Theoretical Peak Performance, Double Precision"


unset label

# Labels AMD
set label "HD 3870"         at 2007,160  center rotate by 40 textcolor rgb "#971c00"
set label "HD 4870"         at 2008,350  center rotate by 40 textcolor rgb "#971c00"
set label "HD 5870"         at 2009,800 center rotate by 40 textcolor rgb "#971c00"
set label "HD 6970"         at 2010,900 center rotate by 40 textcolor rgb "#971c00"
set label "HD 6970"         at 2011,900 center rotate by 40 textcolor rgb "#971c00"
set label "HD 7970 GHz Ed." at 2012,650 center rotate by 40 textcolor rgb "#971c00"
set label "HD 8970"         at 2013,800 center rotate by 40 textcolor rgb "#971c00"
set label "FirePro W9100"   at 2014,4000 center rotate by 40 textcolor rgb "#971c00"
set label "FirePro S9150"   at 2015,4000 center rotate by 40 textcolor rgb "#971c00"
set label "MI25"            at 2016,425 center rotate by 40 textcolor rgb "#971c00"
set label "MI60"            at 2018,9500 center rotate by 00 textcolor rgb "#971c00"
set label "MI100"           at 2019.5,13000 center rotate by 00 textcolor rgb "#971c00"
set label "MI200"           at 2021,25000 center rotate by 00 textcolor rgb "#971c00"
set label "MI300X"          at 2023,50000 center rotate by 00 textcolor rgb "#971c00"

# Labels Intel
set label "X5482"         at 2007,40  center rotate by 40 textcolor rgb "#005197"
set label "X5492"         at 2008,40  center rotate by 40 textcolor rgb "#005197"
set label "W5590"         at 2009,40  center rotate by 40 textcolor rgb "#005197"
set label "X5680"         at 2010,60  center rotate by 40 textcolor rgb "#005197"
set label "X5690"         at 2011,60  center rotate by 40 textcolor rgb "#005197"
set label "E5-2690"       at 2012,130 center rotate by 40 textcolor rgb "#005197"
set label "E5-2697 v2"    at 2013,180 center rotate by 40 textcolor rgb "#005197"
set label "E5-2699 v3"    at 2014,450 center rotate by 40 textcolor rgb "#005197"
set label "E5-2699 v3"    at 2015,450 center rotate by 40 textcolor rgb "#005197"
set label "E5-2699 v4"    at 2016,550 center rotate by 40 textcolor rgb "#005197"
set label "Platinum 8180" at 2017,1650 center rotate by 40 textcolor rgb "#005197"
set label "Platinum 9282" at 2018.5,4200 center rotate by 40 textcolor rgb "#005197"

# Labels NVIDIA
set label "Tesla C1060"  at 2008,130 center rotate by 40 textcolor rgb "#00D317"
set label "Tesla C1060"  at 2009,160 center rotate by 40 textcolor rgb "#00D317"
set label "Tesla C2050"  at 2010,260 center rotate by 40 textcolor rgb "#00D317"
set label "Tesla M2090"  at 2011,450 center rotate by 40 textcolor rgb "#00D317"
set label "Tesla K20"    at 2012,1700 center rotate by 40 textcolor rgb "#00D317"
set label "Tesla K20X"   at 2013,1900 center rotate by 40 textcolor rgb "#00D317"
set label "Tesla K40"    at 2014,1900 center rotate by 40 textcolor rgb "#00D317"
set label "Tesla K40"    at 2015,2000 center rotate by 40 textcolor rgb "#00D317"
set label "Tesla P100"   at 2016,7000 center rotate by 40 textcolor rgb "#00D317"
set label "V100"   at 2017,4900 center rotate by 40 textcolor rgb "#00D317"
set label "A100"   at 2020,7800 center rotate by 00 textcolor rgb "#00D317"
set label "H100"   at 2022,23000 center rotate by 00 textcolor rgb "#00D317"
set label "B100"   at 2024,27000 center rotate by 00 textcolor rgb "#00D317"

# Labels Xeon Phi
#set label "Xeon Phi 7120 (KNC)" at 2014.3,920 center rotate by 00
#set label "Xeon Phi 7290 (KNL)" at 2016,2700 center rotate by 50

# Labels AMD
set label "EPYC 7601" at 2017.3,820 center rotate by 00 textcolor 'red'
set label "EPYC 7642" at 2019.3,1520 center rotate by 00 textcolor 'red'
set label "EPYC 7763" at 2021.3,1800 center rotate by 00 textcolor 'red'
set label "EPYC 9684X" at 2023.3,2500 center rotate by 00 textcolor 'red'


plot '../data-intel.txt'     using 1:3 with linesp pt  9 ps 3.0 title "INTEL Xeon CPUs", \
     '../data-dp-nvidia.txt' using 1:2 with linesp pt  5 ps 3.0 title "NVIDIA Tesla GPUs", \
     '../data-amd.txt'       using 1:3 with linesp pt  7 ps 3.0 title "AMD Radeon GPUs", \
     '../data-amd-epyc.txt'  using 1:3 with linesp pt 13 ps 3.0 linetype rgbcolor 'red' title "AMD EPYCs" 
