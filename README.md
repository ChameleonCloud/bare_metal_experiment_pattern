# Getting Started with Chameleon: Power Management Experiment

This guide will show you how to use Chameleon inside of a Jupyter 
notebook. The experiment being investigated by this notebook is a
measuring how power and energy are affected by the proportion of
node cores a load is being run on.

To provision nodes, setup instances, and run a program in the cloud,
check out `Experiment.ipynb` in the file explorer in the left sidebar. 
Alternatively, you can skip this step, and use our saved data for the
the analysis step.

To run an analysis of the data generated by the experiment, check out
`Analysis.ipynb`.

## Requirements

This experiment requires a Chameleon account with an active project allocation. If you are viewing this at `jupyter.chameleoncloud.org`, you should be all set.

## Estimated Time

Around 1 hour

## Overview of Steps

1. __(Experiment.ipynb)__ Create the experiment environment:

    a. Obtain a reservation for a baremetal node
    
    b. Create an instance on that node
    
    c. Run setup to install needed programs
    
2. __(Experiment.ipynb)__ Run experiment

    a. Run the experiment script on the instance
    
    b. Download the output
    
3. __(Analysis.ipynb)__ Analyze data

    a. Plot the data for each run

## Disclaimer

While we have tried our best to keep our systems as robust as possible, sometimes unexpected errors may arise. A fix for authorization errors may be to relog (File > Log Out, then "Return to Jupyterhub"). Errors that may happen while running specific cells are mentioned.

## Contact

Please contact help@chameleoncloud.org for general Chameleon support, or feel free to email markpowers@uchicago.edu.

# Jupyter Notebook Quickstart

Jupyter Notebooks provide a way to share writing, code, and output together. In this document, each cell may be one of these items. To reproduce this experiement, you should select each code block, modify the contents if needed, and then run it. You can run a cell by clicking it, then clicking the "play" button in the top bar, or by typing ctrl+enter.

