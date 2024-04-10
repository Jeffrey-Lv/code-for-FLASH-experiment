
// set a file direction
folder = "720nA";
direc = "D:/Research/Flash/231/";
dir=direc+folder+"/";
list = getFileList(dir);
for (i = 0; i < list.length; i+= 4) {
    // open nuclei pic
    open(dir + list[i+1]);
	run("8-bit");
	setAutoThreshold("Li dark no-reset");
	setOption("BlackBackground", true);
	run("Convert to Mask");
	run("Fill Holes");
	run("Erode");
	run("Erode");
	run("Erode");
	run("Analyze Particles...", "size=3000-Infinity pixel display clear summarize add composite");
	roiManager("reset");
	
	//open mito pic
	open(dir + list[i+2]);
	setMinAndMax(0, 60);
	run("8-bit");
	setAutoThreshold("Li dark no-reset");
	setOption("BlackBackground", true);
	run("Convert to Mask");
	run("Create Selection");
	// set ROI to pic
	roiManager("Add");
	
	//open cytc pic
	open(dir + list[i+3]);
	run("8-bit");
	setAutoThreshold("Default dark no-reset");
	setOption("BlackBackground", true);
	run("Convert to Mask");
	run("Measure");
	roiManager("Show All");
	run("Invert");
	roiManager("Fill");
	run("Invert");
	run("Convert to Mask");
	run("Measure");
	saveAs("Tiff", direc+folder+"_"+ ""+i +"_cytochrome-c_pic.tif");
	saveAs("Results", direc+folder+"_"+ ""+i +"_cytochrome-c_area.csv");
	close;
	close;
	close;
	//roiManager("reset");
};
