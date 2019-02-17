pkg load symbolic

vout = 12;
vin = 60;
iout = 3.5;
rls = 10.5e3;
rdc = 45e-3;
vstart = 18;
vstop = 17;
lo = 33e-6;
dcj = 380e-12;
voripple = 0.1;
cout = 100e-6;

vf = 0.7;
rdson = 92e-3;
dmax = 0.9;
i1 = 1.2e-6;
ihys = 3.4e-6;
vena = 1.2;
fsw = 600e3;
fdiv = 8;
voutsc = 0.1;
ton = 135e-9;
icl = 4.7;
kind = 0.3;
diout = 1.75;
dvout = 0.02;
ioh = 2.625;
iol = 0.875;
vpeak = dvout + vout;
vi = vout;
gmps = 12;
gmea = 350e-6;
vref = 0.8;

% equation 1
vin_min = (vout + vf + rdc + iout)/0.99 + rdson * iout - vf
% equation 2
vout_max = dmax * (vin_min - iout * rdson + vf) - vf + iout * rdc
% equation 3
rhs = rls * (vout - 0.8)/0.8
% equation 4
ruvloh = (vstart - vstop)/ihys
% equation 5
ruvlol = vena / ((vstart - vena)/ruvloh + i1)
% equation 6
tss = 1024 / fsw
% equation 7
rt = 101756 / ((fsw / 1000) ^ 1.008)
% equation 8
%fsw = 92417 / (rt ^ 0.991)
% equation 9
fsw_max_skip = 1/ton * ((iout * rdc + vout + vf)/(vin - iout * rdson + vf))
% equation 10
fsw_shift = fdiv / ton * ((icl * rdc + voutsc + vf)/(vin - icl * rdson + vf))
lo_min = ((vin - vout)/(iout * kind) * (vout / (vin * fsw)))
iripple = (vout * (vin - vout))/(vin * lo * fsw)
il_rms = sqrt(iout ^ 2 + 1/12 * ((vout * (vin - vout)) / (vin * lo * fsw))^2)
il_peak = iout + iripple / 2
pd = ((vin - vout) * iout * vf) / vin + (dcj * fsw * (vin + vf)^2)/2
cout_min_1 = (2 * diout)/(fsw * dvout)
cout_min_2 = lo * (ioh ^ 2 - iol ^ 2)/(vpeak ^ 2 - vi ^ 2)
cout_min_3 = (1 / (fdiv * fsw)) * 1 / (voripple / iripple)
%cout = max([cout_min_1, cout_min_2, cout_min_3])
resr_max = voripple / iripple
resr = 2.5e-3
icout = (vout * (vin - vout))/(sqrt(12) * vin * lo * fsw)
fp = iout / (2 * pi * vout * cout)
fz = 1 / (2 * pi * resr * cout)
fco_1 = sqrt(fp * fz)
fco_2 = sqrt(fp * fsw / 2)
fco = min(fco_1, fco_2)

r4 = ((2 * pi * fco * cout)/gmps) * (vout / (vref * gmea))
c5 = 1 / (2 * pi * r4 * fp)
c8_1 = (cout * resr) / r4
c8_2 = 1 / (r4 * fsw * pi)
c8 = max(c8_1, c8_2)

