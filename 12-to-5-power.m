fsel = 1.25e6;
vin = 12;
vout = 5;
iout = 0.5;
lo = 2.2e-6;
co = 44e-6;
rl = 21.35e-3;
rol = 24e3;
roh = 147e3;
css = 100e-9;

rdsonh = 100e-3;
ilimh = 3.5;
tpd = 50e-9;
vfb = 0.7;
lo_min = 0.7e-6;

ton = 1e-9 * 200 * vin/(vin - vout)
ilpsm = (vin - vout) / lo * ton
dvo = (lo * vin^2)/(200 * co) * (1 / (vin - vout) + 1 / vout)
vin_min = vout + iout * (rdsonh + rl)
ipeak = ilimh + (vin - vout)/lo * tpd;
vout_exact = ((roh + rol) * vfb) / rol
%roh = rol * ((vout / vfb) - 1)
rol = roh / ((vout / vfb) - 1)
dilmax = vin / lo_min * 100e-9
ilmax = iout + dilmax / 2
tss = css / (2.5e-6 / 0.7)

printf('Minimum input voltage: %fv\n', vin_min);
printf('Rhigh: %fk, Rlow: %fk\n', roh / 1e3, rol / 1e3);
printf('Inductor ripple current: %fA\n', ilmax);
printf('Soft start time: %fms\n', tss / 1e3);
printf('Exact output voltage: %fV\n', vout_exact);
