# Explore Datasets

This application is an application for quick exploration of the datasets included in the datasets package (base) in R. There are three choices to be made in the application:
- Choose dataset to be plotted
- Choose what to plot on the x-axis
- Choose what to plot on the y-axis

## Data processing
All the datasets in the dataset package is not data frames. Therefore, the datasets that aren't data frames are removed prior to creating the application. 

## Plotting
The plotting is made with the use of the plotly package in R and the plot type is set to be chosen based on the class of the data in the specific column. The choice of plot type is made by the plot_ly() function.
