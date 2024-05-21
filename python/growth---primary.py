# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"72974.0","system":"readv2"},{"code":"23670.0","system":"readv2"},{"code":"4697.0","system":"readv2"},{"code":"34777.0","system":"readv2"},{"code":"23495.0","system":"readv2"},{"code":"63290.0","system":"readv2"},{"code":"26683.0","system":"readv2"},{"code":"43004.0","system":"readv2"},{"code":"61211.0","system":"readv2"},{"code":"19575.0","system":"readv2"},{"code":"27888.0","system":"readv2"},{"code":"50704.0","system":"readv2"},{"code":"35139.0","system":"readv2"},{"code":"36894.0","system":"readv2"},{"code":"73682.0","system":"readv2"},{"code":"15563.0","system":"readv2"},{"code":"93732.0","system":"readv2"},{"code":"95638.0","system":"readv2"},{"code":"102246.0","system":"readv2"},{"code":"31219.0","system":"readv2"},{"code":"22032.0","system":"readv2"},{"code":"55820.0","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('slow-fetal-growth-or-low-birth-weight-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["growth---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["growth---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["growth---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
