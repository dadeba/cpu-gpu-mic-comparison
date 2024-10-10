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
set ylabel "GB/sec"
set xlabel "End of Year"

set yrange [10:9200]
set output "mem-bw-2024.png"
set title "Theoretical Peak Memory Bandwidth Comparison"

# Labels AMD
set label "HD 3870"         at 2007,90 center rotate by 30 textcolor rgb "#971c00"
set label "HD 4870"         at 2008,150 center rotate by 30 textcolor rgb "#971c00"
set label "HD 5870"         at 2009,210 center rotate by 30 textcolor rgb "#971c00"
set label "HD 6970"         at 2010,240 center rotate by 30 textcolor rgb "#971c00"
set label "HD 6970"         at 2011,240 center rotate by 30 textcolor rgb "#971c00"
set label "HD 7970 GHz Ed." at 2012,370 center rotate by 30 textcolor rgb "#971c00"
set label "HD 8970"         at 2013,350 center rotate by 30 textcolor rgb "#971c00"
set label "FirePro W9100"   at 2014,420 center rotate by 30 textcolor rgb "#971c00"
set label "FirePro S9150"   at 2015,420 center rotate by 30 textcolor rgb "#971c00"
set label "MI25"            at 2016,300 center rotate by 30 textcolor rgb "#971c00"
set label "MI60"            at 2018,800 center rotate by 30 textcolor rgb "#971c00"
set label "MI100"           at 2020,900 center rotate by 00 textcolor rgb "#971c00"
set label "MI200"           at 2021,4000 center rotate by 00 textcolor rgb "#971c00"
set label "MI300X"          at 2023,6000 center rotate by 00 textcolor rgb "#971c00"

# Labels Intel
set label "X5482"         at 2007,20 center rotate by 30 textcolor rgb "#005197"
set label "X5492"         at 2008,20 center rotate by 30 textcolor rgb "#005197"
set label "W5590"         at 2009,25 center rotate by 30 textcolor rgb "#005197"
set label "X5680"         at 2010,25 center rotate by 30 textcolor rgb "#005197"
set label "X5690"         at 2011,25 center rotate by 30 textcolor rgb "#005197"
set label "E5-2690"       at 2012,40 center rotate by 30 textcolor rgb "#005197"
set label "E5-2697 v2"    at 2013,45 center rotate by 30 textcolor rgb "#005197"
set label "E5-2699 v3"    at 2014,50 center rotate by 30 textcolor rgb "#005197"
set label "E5-2699 v3"    at 2015,50 center rotate by 30 textcolor rgb "#005197"
set label "E5-2699 v4"    at 2016,55 center rotate by 30 textcolor rgb "#005197"
set label "Platinum 8180" at 2017,90 center rotate by 30 textcolor rgb "#005197"
set label "Platinum 9282" at 2018,150 center rotate by 30 textcolor rgb "#005197"

# Labels NVIDIA
set label "Tesla C1060"  at 2008,80 center rotate by 30 textcolor rgb "#00D317"
set label "Tesla C1060"  at 2009,80 center rotate by 30 textcolor rgb "#00D317"
set label "Tesla C2050"  at 2010,110 center rotate by 30 textcolor rgb "#00D317"
set label "Tesla M2090"  at 2011,140 center rotate by 30 textcolor rgb "#00D317"
set label "Tesla K20"    at 2012,160 center rotate by 30 textcolor rgb "#00D317"
set label "Tesla K20X"   at 2013,170 center rotate by 00 textcolor rgb "#00D317"
set label "Tesla K40"    at 2014.5,245 center rotate by 00 textcolor rgb "#00D317"
set label "Tesla P100"   at 2016,850 center rotate by 00 textcolor rgb "#00D317"
set label "V100"   at 2017,1050 center rotate by 00 textcolor rgb "#00D317"
set label "A100"   at 2019.5,2200 center rotate by 00 textcolor rgb "#00D317"
set label "H100"   at 2024.2,6800 center rotate by 00 textcolor rgb "#00D317"

# Labels Xeon Phi
#set label "Xeon Phi 7120 (KNC)" at 2014,190 center rotate by 00
#set label "Xeon Phi 7290 (KNL)" at 2016,450 center rotate by 55

# Labels AMD
set label "EPYC 7601" at 2017.3,220 center rotate by 00 textcolor 'red'
set label "EPYC 7642" at 2019.3,250 center rotate by 00 textcolor 'red'
set label "EPYC 7763" at 2021.3,180 center rotate by 00 textcolor 'red'
set label "EPYC 9684X" at 2023.3,550 center rotate by 00 textcolor 'red'

plot '../data-intel.txt'     using 1:5 with linesp pt  9 ps 3.0 title "INTEL Xeon CPUs", \
     '../data-dp-nvidia.txt' using 1:4 with linesp pt  5 ps 3.0 title "NVIDIA Tesla GPUs", \
     '../data-amd.txt'       using 1:5 with linesp pt  7 ps 3.0 title "AMD Radeon GPUs", \
     '../data-amd-epyc.txt'  using 1:5 with linesp pt 13 ps 3.0 linetype rgbcolor 'red' title "AMD EPYCs"
