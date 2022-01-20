# Spine analysis pipeline

## Background

These macros were developed to help analyse fluorescent confocal images of dendritic spines.Speifically, they were developed to produce a binary mask for logging and handling ROIs.

The confocal images were acquired as Z-stacks on a Leical SP8 system using a GFP (for tracking GFP-tagged protein expression) and RFP (morphological marker) channel.

## Opening and pre-processing the .lif files

Open Fiji/ImageJ and open the .lif file of interest. Either open all or a subset of images. Run the pre-processing macro, which will do the following:

- Check image windows are open
- Split the colour channels for each image
- Produce max projections of each image for both channels, and close original GFP stack
- Automatically threshold RFP Max projection based on user input (default Otsu)

## Manual identification of secondary dendrite and spine

Following automatic pre-processing, a section of a secondary dendrite was chosen and length measures of dendrite and associated spines taken. ROIs of the dendrite and each spine were then produced, and the following measurment settings selected:

> Area
> Standard deviation 
> Bounding rectangle
> Mean gray value
> Perimeter

## Automatic ROI processing

Following manual identification of ROIs, choose the GFP max projection (C1). The ROI manager macro can then be run to automatically execute the following:

- Rename the first ROI dendrite, the following ROIs spine(n)
- Measure all ROIs on the GFP image
- Save all ROIs at a target directory chosen by user
- Empty the ROI manager and close all images related to the original GFP image

The results can then be manually exported and the procedure repeated for the next set of images.
