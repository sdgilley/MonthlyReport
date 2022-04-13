import csv
with open('whatchanged.csv', newline='') as csvfile:
    changed = csv.reader(csvfile, delimiter=' ')
    for row in changed:
        print(', '.join(row))
