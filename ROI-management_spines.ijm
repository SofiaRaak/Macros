// Automatically rename all entries in ROI manager
// Extract the name of the active image
image = getTitle();
// get image base
image_base = substring(image, 6, image.length);

for (i=0; i < roiManager("count"); i++){
	// select ROI
	roiManager("Select", i);
	if (i == 0){
		// rename first ROI dendrite
		roiManager("Rename", "dendrite");
	}else{
		// rename rest spine + number
		roiManager("Rename", "spine"+i);
	}
}

// Perform all measurments on selected image
for (i=0; i < roiManager("count"); i++){
	roiManager("Select", i);
	roiManager("Measure");
}

// Select all ROIs, save
ROIs = newArray(roiManager("Count"));

for (i=0; i < roiManager("Count"); i++){
	ROIs[i] = i;
}

// Target directory
dir = getDirectory("Select Output Directory");

// Export ROIs
roiManager("Select", ROIs);
roiManager("Save", dir+"/"+image+".zip");

// Remove ROIs from manager
roiManager("Deselect");
roiManager("Delete");


// Close open image
close();
// Close remaining images
selectImage("MAX_C2"+image_base);
close();
selectImage("C2"+image_base);
close();

