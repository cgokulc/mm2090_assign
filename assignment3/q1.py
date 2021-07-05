#!/usr/bin/python3
row_lines=[]
slot_lines=[]
position_lines=[]
filename = "table.txt"
with open(filename) as f:
    line=f.readline()
    while(line):
        word=line.split()
        if(word[1]=='is-a'):
            word=line.split()
            table_name=word[0]
        elif(word[1]=='has-row'):
            row_lines.append(line)
        elif(word[1]=='has-slot'):
            slot_lines.append(line)
        elif(word[1]=='starts-at' or word[1]=='ends-at'):
            position_lines.append(line)
        line = f.readline()

row_names=["8","9","10","11","12","13","14","15","16","17"]
column_names=[]
slot_list=[]

for line in row_lines:
    word=line.split()
    column_names.append(word[2])

def column_num(column_name):
    for i in range(0,len(column_names)):
        if(column_names[i]==column_name):
            break
    return i

for line in slot_lines:
    slot=[]
    rows=[]
    word=line.split()
    slot.append(word[2])
    slot.append(column_num(word[0]))
    for i in range(0,len(position_lines)):
        word_2=position_lines[i].split()
        word_3=word_2[2].split(':')
        if(word_2[0]==word[2] and word_2[1]=='starts-at'):
            rows.append(int(word_3[0])-8)
        elif(word_2[0]==word[2] and word_2[1]=='ends-at'):
            rows.append(int(word_3[0])-8)
    slot.append(rows)
    slot_list.append(slot)

cells=[['' for c in range(len(row_names))] for r in range(len(column_names))]

for slot in slot_list:
    for j in range(slot[2][0],slot[2][1]+1):
        cells[slot[1]][j]=slot[0]  

import matplotlib.pyplot as plt

table = plt.table(cellText = cells,  
                  rowLabels = column_names,  
                  colLabels = row_names, 
                  loc='center')

plt.axis('off')
plt.grid('off')

plt.savefig('q1-{}.jpg'.format(table_name))

print("Table saved as","q1-{}.jpg".format(table_name),"in the current directory")
mergeabl=[]
notmergeabl=[]

for i in range(0,len(cells)-1):
	for j in range(i+1,len(cells)):
		clash=0
		for a in range(0,len(cells[0])):
			if(cells[i][a] and cells[j][a]):                      #some error in here below if statement is not executed
				clash=clash+1
		if(clash==0):
			mergeabl.append([column_names[i],column_names[j]])
		else:
			notmergeabl.append([column_names[i],column_names[j]])    
print("Mergeable: ",mergeabl)
print("Not Mergeable: ",notmergeabl)	

