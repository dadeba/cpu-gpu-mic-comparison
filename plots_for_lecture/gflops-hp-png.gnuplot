#!/usr/bin/gnuplot
set term pngcairo size 1560,960 font "Times,34"

set style data lines
set style line 1  linetype -1 linewidth 3 lc rgb "#00D317"
set style line 2  linetype -1 linewidth 3 lc rgb "#971c00"
set style line 3  linetype -1 linewidth 2 lc rgb "#000000"
set style increment user

#set size 1.40,1.30
set border linewidth 1.5

set logscale y
set format y "10^{%L}"
set key samplen 6 spacing 3.0
set key bottom right
set grid lw 3

set xrange [2015.4:2025.0]
set ylabel "TFLOP/sec"
set xlabel "End of Year"

set yrange [10:6800]
set output "gflops-hp-2024.png"
set title "Theoretical Peak Performance, Half Precision"

# Labels AMD
set label "MI25"            at 2016,35 center rotate by 00 textcolor rgb "#971c00"
set label "MI60"            at 2018,23 center rotate by 00 textcolor rgb "#971c00"
set label "MI100"           at 2020.25,150 center rotate by 00 textcolor rgb "#971c00"
set label "MI200"           at 2021.5,350 center rotate by 00 textcolor rgb "#971c00"
set label "MI300X"          at 2023.75,1190 center rotate by 00 textcolor rgb "#971c00"

# Labels TPU
set label "TPUv1"           at 2016,65 center rotate by 00 textcolor rgb "#000000"
set label "TPUv2"           at 2017,75 center rotate by 00 textcolor rgb "#000000"
set label "TPVv3"           at 2018.25,170 center rotate by 00 textcolor rgb "#000000"
set label "TPUv4"           at 2021.5,200 center rotate by 00 textcolor rgb "#000000"
set label "TPUv5p"          at 2023.5,650 center rotate by 00 textcolor rgb "#000000"

# Labels NVIDIA
set label "P100"   at 2016,15 center rotate by 00 textcolor rgb "#00D317"
set label "V100"   at 2017,40 center rotate by 00 textcolor rgb "#00D317"
set label "RTX"    at 2018,50 center rotate by 40 textcolor rgb "#00D317"
set label "A100"   at 2020,450 center rotate by 40 textcolor rgb "#00D317"
set label "H100"   at 2022,2800 center rotate by 00 textcolor rgb "#00D317"
set label "B100"   at 2024,3000 center rotate by 00 textcolor rgb "#00D317"

plot '../data-hp-nvidia.txt' using 1:2 with linesp pt 5 ps 3.0 title "NVIDIA", \
     '../data-amd-hp.txt'    using 1:2 with linesp pt 7 ps 3.0 title "AMD",\
     '../data-google-hp.txt'    using 1:2 with linesp pt 7 ps 3.0 title "Google"
