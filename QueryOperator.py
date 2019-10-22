import os


print("To see CE and PE Bar Chart, please enter 1")
query='select raw case when ce_chng_in_oi == "-" THEN 0 else tonumber(ce_chng_in_oi) END from market where meta().id like "24OCT2019_2019:10:22:_____:15:30" and strike_price between "11000" and "12000" order by tonumber(strike_price)'
cmd = "rm *.csv"
os.system(cmd)