
cell="10A";
path_r="D:/2024/Experiment_24/"+cell+"_FOCI_r/";
dose_rate_g=newArray("ctrl","4.2nA","720nA","7.3uA");
dose_rate=dose_rate_g[3];
path=path_r+dose_rate+"/";
fileNames=getFileList(path);
run("Set Measurements...", "area integrated area_fraction limit redirect=None decimal=3");
for (f = 0; f < lengthOf(fileNames); f+=3) {
    open(path+fileNames[f+2]);//green
    run("8-bit");
    setAutoThreshold("Li dark");
    setOption("BlackBackground", true);
    run("Convert to Mask", "method=Default background=Dark calculate black");
    run("Measure");
    close();
}

saveAs("Results", path_r+cell+"_FOCI_"+dose_rate+"_intensity.csv");

	if (isOpen("Results")) {
		   selectWindow("Results");
		   run("Close");
	}

for (f = 0; f < lengthOf(fileNames); f+=3) {
    open(path+fileNames[f+1]);//blue
   
    run("8-bit");
    setAutoThreshold("Mean dark");
    setOption("BlackBackground", true);
    run("Convert to Mask", "method=Default background=Dark calculate black");
    run("Fill Holes");
    run("Watershed");
    run("Analyze Particles...", "size=500-Infinity display clear summarize add composite");
    
    close();
}
selectWindow("Summary");

saveAs("Text",path_r+cell+"_FOCI_"+dose_rate+"_number.txt");
	

if (isOpen("Summary")) {
		   selectWindow("Summary");
		   run("Close");
	}
		

if (isOpen("Results")) {
		   selectWindow("Results");
		   run("Close");
	}
		
if (isOpen("Results_from")) {
		   selectWindow("Results_from");
		   run("Close");
	}

	
