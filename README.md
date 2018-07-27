# Advection Equation Solutions
This repository contains MATLAB implementations of numerical solutions to the advection equation, in particular:

<a href="https://www.codecogs.com/eqnedit.php?latex=u_t&plus;au_x=0,&space;\:\:\:\:&space;u(x,0)=u_0(x)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?u_t&plus;au_x=0,&space;\:\:\:\:&space;u(x,0)=u_0(x)" title="u_t+au_x=0, \:\:\:\: u(x,0)=u_0(x)" /></a>

with smooth initial data

<a href="https://www.codecogs.com/eqnedit.php?latex=u_0(x)&space;=&space;e^{-100(x-0.3)^2},&space;\:\:\:&space;x\in(0,1),\:\:\:&space;u(0,t)=u(1,t)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?u_0(x)&space;=&space;e^{-100(x-0.3)^2},&space;\:\:\:&space;x\in(0,1),\:\:\:&space;u(0,t)=u(1,t)" title="u_0(x) = e^{-100(x-0.3)^2}, \:\:\: x\in(0,1),\:\:\: u(0,t)=u(1,t)" /></a>

and Riemann initial data

<a href="https://www.codecogs.com/eqnedit.php?latex=u_0(x)&space;=&space;1-H(x)=\begin{cases}&space;1,&space;&x<0&space;\\&space;\frac{1}{2},&space;&x=0&space;\\&space;0,&space;&x>0&space;\end{cases},\:\:\:&space;x\in[-0.5,1],\:\:\:u(-0.5,t)=1" target="_blank"><img src="https://latex.codecogs.com/gif.latex?u_0(x)&space;=&space;1-H(x)=\begin{cases}&space;1,&space;&x<0&space;\\&space;\frac{1}{2},&space;&x=0&space;\\&space;0,&space;&x>0&space;\end{cases},\:\:\:&space;x\in[-0.5,1],\:\:\:u(-0.5,t)=1" title="u_0(x) = 1-H(x)=\begin{cases} 1, &x<0 \\ \frac{1}{2}, &x=0 \\ 0, &x>0 \end{cases},\:\:\: x\in[-0.5,1],\:\:\:u(-0.5,t)=1" /></a>

The included figures shows the approximated solution against the true solution. 
