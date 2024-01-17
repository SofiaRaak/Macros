aliases = newArray("A", "B", "C", "D", "E", "F", "G", "H", 
			"I", "J", "K", "L", "O", "P", "Q", "R", "S",
			"T", "U", "V", "W", "X", "Y", "Z");
msg1 =	"Please provide the number of groups to \n"+
		"randomise below.";

msg2 =	"Please provide the names of the groups to \n"+
		"randomise below.";

// Check windows contain images
if(nImages==0){
     print("No images are open");
}
if(nImages>aliases.length) {
	print("Not enough aliases to randomise images");
}

//prompt user for number of groups to randomise
Dialog.create("Number of groups");
Dialog.addMessage(msg1);
Dialog.addNumber("Groups: ", 2);
Dialog.show();

nGroups = Dialog.getNumber();

//prompt user for names of groups to randomise
Dialog.create("Group names");
Dialog.addMessage(msg2);
for(i=1; i<=nGroups; i++){
	Dialog.addString("Group " + toString(i) + ": ", "");
}
Dialog.show()

groups = newArray(nGroups);

for(i=0; i<nGroups; i++){
	groupNames = Dialog.getString();
	groups[i] = groupNames;
};

// Iterate through images to get list of image names
names = newArray(nImages);

for(i=1; i<=nImages; i++){
	 selectImage(i);
	 names[i-1] = getTitle();
}

//prompt for directory name
Dialog.create("Directory path");
Dialog.addString("Directory to save randomised images at: ", "");
Dialog.show();
dirName = Dialog.getString();

//Prep key
key = "Key\t Alias\n";

//Prep aliases
Alias = Array.slice(aliases, "A", nGroups);
randomd = shuffle(Alias);


//Iterate through all groups, all images to duplicate and rename them
for(i=0; i<(nGroups); i++){
	group_count = 1;
	for(j=0; j<nImages; j++){
		//Something going wrong here
		if(indexOf(names[j], groups[i]) != -1){
			key += randomd[i] + group_count + "    " + names[j] + "\n";
			selectImage(names[j]);
			run("Duplicate...", "title=[" + randomd[i] + group_count + "] duplicate");
			selectImage(names[j]);
			close();
			group_count += 1;
		}
	}
}

//save key
print(key);
selectWindow("Log");
saveAs("Text", dirName + "/key.txt");
close();

//iterate through images and save them
for(i=1; i<=nImages(); i++){
	selectImage(i);
	Name = getTitle();
	saveAs("Tiff", dirName + "/" + Name + ".tif");
}

//functions
function shuffle(array){
	shuffled = newArray(array.length);
	i = array.length-1;
	while(array.length>0 && i > -1){
		j = round(i*random);
		shuffled[i] = array[j];
		array = Array.deleteIndex(array, j);
		i -= 1;
	}
	
	return shuffled;
}
