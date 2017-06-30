# Stochastic-Sensing
Determine the concentrations of two unknown analytes using given stochastic sensing data obtained with nanopore currents.

We are given six sets of data consisting of control measurements of two analytes. Three different known concentrations of each analyte were tested using a nanopore. The current through the nanopore is sampled every 0.5 millisecond for roughly 20 seconds. The association constant(k_on) and disassociation constant(k_off) of each analyte for the pore is unknown.

AvgCurrent.m:
We first determine the average low(unbound) current for the nanopore, as well as the average high(bound) currents for each analyte. This allows us to establish a threshold which we can use to evaluate the state of the pore at each data point (unbound, bound to analyte1, or bound to analyte2).
