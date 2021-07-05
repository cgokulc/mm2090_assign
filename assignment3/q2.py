#!/usr/bin/python3
import numpy as np
import math 
x=np.linspace(0,5,num=50)
np.random.seed(0)
y=0.075*np.power(x,4.4)*np.power(np.e,-0.9*x)+0.05*np.random.normal(size=50)

import matplotlib.pyplot as plt
plt.scatter(x,y,color='r')
plt.savefig("q2_scatterplt.jpg",dpi=400)
print("Scatter plot is saved as q2_scatterplt.jpg in current directory")

from scipy import optimize
def func(x,a,b,c):
    return a*np.power(x,b)*np.power(np.e,-1*c*x)
    
par, par_var=optimize.curve_fit(func,x,y,p0=[0.1,2,1])

plt.plot(x,func(x,par[0],par[1],par[2]),'b-',label="curve fit with function $ax^be^{-cx}$")
plt.scatter(x,y,color='r')
plt.legend(loc='best')
plt.xlabel('time $\\longrightarrow$')
plt.ylabel('growth $\\longrightarrow$')
plt.savefig("q2_curvefitplt.jpg",dpi=400)
print("Curve-fit plot is saved as q2_curvefitplt.jpg in current directory")

max_index=0
max_slope=0
for i in range(49):
    if((func(x[i+1],par[0],par[1],par[2])-func(x[i],par[0],par[1],par[2]))/(x[i+1]-x[i])>max_slope):
        max_slope=(func(x[i+1],par[0],par[1],par[2])-func(x[i],par[0],par[1],par[2]))/(x[i+1]-x[i])
        max_index=i
print("Maximum growth @ x=",x[max_index],"at the rate of",max_slope)
