#!/usr/bin/python

import csv

def load_bom(filename):
    res = [];
    with open(filename, 'rb') as csvfile:
        reader = csv.reader(csvfile, delimiter=' ', quotechar='"');
        for row in reader:
            res.append(row);

    res = res[13:];
    res = list(filter(lambda x: len(x) > 0, res));
    res = list(filter(lambda x: x[0] != "BOM", res));
    res = list(filter(lambda x: x[0] != "Generated", res));
    return res;

bom = load_bom("motordriver-2x-bom-master.csv");
#bom_motor = load_bom("motordriver-2x-motor-nofit.csv");
#bom_ui = load_bom("motordriver-2x-ui-nofit.csv");
print(bom)
