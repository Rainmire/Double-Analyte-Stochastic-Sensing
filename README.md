# Double-Analyte Stochastic Sensing - MATLAB
Using these scripts, we can determine the concentrations of two analytes within any solution from data obtained using nanopore stochastic sensing. This requires a set of control calibration data of known concentrations from both analytes, and the experimental data from a solution containing unknown concentrations of analytes.

For our test, we are given six sets of data consisting of control measurements of two analytes. Three different known concentrations of each analyte were tested using a nanopore. The current through the nanopore is sampled every 0.5 millisecond for roughly 20 seconds. The association constant(k_on) and disassociation constant(k_off) of each analyte for the pore is unknown. Our goal is to calculate these constants and use that information to calculate the concentrations of both analytes in an unknown solution.

## AvgCurrent.m:
We first determine the average low(unbound) current for the nanopore, as well as the average high(bound) currents for each analyte. This allows us to establish a threshold which we can use to evaluate the state of the pore at each data point (unbound, bound to analyte1, or bound to analyte2).

## AvgTbound.m:
One method to determine k_off is using the method of averages, which requires knowing <Tbound>, the average duration of each binding event. AvgTbound calculates this by detecting the start and end of each binding even that occurs in a data set and recording their durations. These durations are then averaged to obtain <TBound>.

## AvgTunbound.m:
Similar to AvgTbound, this script determines <Tunbound>, and thus k_on by detecting unbinding events and calculating the average.

## AvgT.m:
Combination of AvgTbound and AvgTunbound, when both k_on and k_off need to be calculated at once.

## HistogramBound.m:
The second method to determine k is by using a histogram. This script determines binding intervals and records them similar to AvgTbound. The intervals are then placed into one of 20 bins depending on its length. The resulting data can be processed in EXCEL into a histogram.

## HistogramUnbound.m:
Histogram data generating script for unbound intervals.

## BindingProb.m:
Used to solve the unknown solution after obtaining the association and disassociation constants from the previous steps. It uses binding currents of each analyte and the unbound current to sorts an experimental data set into one of two arrays. This data can then be used to determine concentration using the method of averages, or plotted into a histogram for analysis.
