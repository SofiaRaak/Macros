// Check windows contain images
if(nImages==0){
     print("No images are open");
} else{
	print("Images successully opened");
}

// Iterate through images to get list of image names
names = newArray(nImages);

for(i=1; i<=nImages; i++){
	 selectImage(i);
	 names[i-1] = getTitle();
}

// Choose thresholding algorithm
Dialog.create("Thresholding");
Dialog.addString("Algorithm: ", "Otsu");
Dialog.show();

thresh_alg = Dialog.getString();

// Iterate through all names of images to split images,
// produce MaxProj of C1 and C2, close C1 stack,
// threshold C2 MaxProj
for (i=0; i<names.length; i++){
	// select first image
	selectImage(names[i]);
	
	// split GFP and mCherry channels
	run("Split Channels");
	
	// select GFP channel, create max projection
	selectImage("C1-"+names[i]);
	run("Z Project...", "projection=[Max Intensity]");
	// close window with C1 stack
	selectImage("C1-"+names[i]);
	close();

	// select mCherry channel, create max projection
	selectImage("C2-"+names[i]);
	run("Z Project...", "projection=[Max Intensity]");

	// select mCherry max projection, threshold
	selectImage("MAX_C2-"+names[i]);
	setAutoThreshold(thresh_alg+" dark");
	setOption("BlackBackground", false);
	run("Convert to Mask");

	//select Ago staining channel, create max projection
	selectImage("C3"+names[i);
	run("Z Project...", "projection=[Max Intensity]");
	//close window with C3 stack
	selectImage("C3"+names[i);
	close(); 
}