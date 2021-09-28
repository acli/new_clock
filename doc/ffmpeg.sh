:
set -x
cuckoo=data/72699__benboncan__cuckoo.wav
ffmpeg -nostdin -hide_banner -y\
	-i "$cuckoo" \
	-i "$cuckoo" \
	-filter_complex "[0]volume=64/127,atrim=0.05:10.65[g0];[1]atrim=0.05:10.65,adelay=10286[g1];[g0][g1]amix=inputs=2"  test.oga

#1631591999.73#  DEBUG: schedule: [0 [(play) (72699__benboncan__cuckoo) 0.05 10.65] 64]
#1631591999.73#  DEBUG: schedule: [0 (noteon 1 48 64)]
#1631591999.73#  DEBUG: schedule: [1.71428571428571 (noteon 1 48 64)]
#1631591999.73#  DEBUG: schedule: [3.42857142857143 (noteon 1 48 64)]
#1631591999.73#  DEBUG: schedule: [5.14285714285714 (noteon 1 48 64)]
#1631591999.73#  DEBUG: schedule: [6.85714285714286 (noteon 1 48 64)]
#1631591999.73#  DEBUG: schedule: [8.57142857142857 (noteon 1 48 64)]
#1631591999.73#  DEBUG: schedule: [10.2857142857143 [(play) (72699__benboncan__cuckoo) 0.05 10.65] 64]
#1631591999.73#  DEBUG: schedule: [10.2857142857143 (noteon 1 48 64)]
#1631591999.73#  DEBUG: schedule: [12 (noteon 1 48 64)]
#1631591999.73#  DEBUG: schedule: [13.7142857142857 (noteon 1 48 64)]
#1631591999.73#  DEBUG: schedule: [15.4285714285714 (noteon 1 48 64)]
#1631591999.73#  DEBUG: schedule: [17.1428571428571 (noteon 1 48 64)]
#1631591999.73#  DEBUG: schedule: [18.8571428571429 (noteon 1 48 64)]
