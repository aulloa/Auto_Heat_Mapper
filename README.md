## Auto Heat Mapper
##### The goal of Auto Heat Mapper is to simply take X and Y data, in my example case eye tracking data, and create a smooth heat map overlayed on an image.

### The Gui
 - Auto_Heat_Mapper operates on a GUI which allows the user to browse through their device to find the appropriate image, XY data, and a plae to store the final image.
 	- ![](https://raw.githubusercontent.com/aulloa/Auto_Heat_Mapper/master/Gui_Example_1.JPG)



   - ![](https://raw.githubusercontent.com/aulloa/Auto_Heat_Mapper/master/Gui_Example_2.JPG)

### The Figures
 - Auto_Heat_Mapper uses a kernel smoothing function to create a 3D mesh which is overlayed on top of the image. The mesh is then set to a color and transparancy map which allows us to observe heat map data without disturbing too much of the image.
 	- ![](https://raw.githubusercontent.com/aulloa/Auto_Heat_Mapper/master/Heat_Map_1.JPG)

 	- ![](https://raw.githubusercontent.com/aulloa/Auto_Heat_Mapper/master/Heat_Map_2.JPG)

### The Code
 - Auto_Heat_Mapper used the [gkde2.m Bivariant Kernel Density Estimation](http://www.mathworks.com/matlabcentral/fileexchange/19280-bivariant-kernel-density-estimation-v2-0/content/gkde2.m) available on File Exchange.
 	- I did customize the bandwith for the smoothing function from N = 50 to N = 100.

 - Example pictures and eye tracking data from different studies were obtained from [here](http://www.csc.kth.se/~kootstra/index.php?item=215&menu=200). The data was generously available and citations for the atual papers are below.
 	- Kootstra, G., de Boer, B., and Schomaker L.R.B. (2011) Predicting Eye Fixations on Complex Visual Stimuli using Local Symmetry. Cognitive Computation, 3(1):223-240. doi: 10.1007/s12559-010-9089-5
 	- Olmos, A., Kingdom, F. A. A. (2004), A biologically inspired algorithm for the recovery of shading and reflectance images, Perception, 33, 1463 - 1473. 

### Planned Future Work
 - Re-organizing of the code for easy reading
 - Switch from .mat XY data to dynamic data
 - Automatic Saving of Plots Feature
 - Refining the Gui
 - Scatter Plot Comparison Check Feature