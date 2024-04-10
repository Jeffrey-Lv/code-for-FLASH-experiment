// Set a file direction
folder = "7.2uA";
direc="D:/Research/Finals/branch_length/231/"
dir = direc+folder+"/";
list = getFileList(dir);
for (i = 0; i < list.length; i += 4) {
    // read nuclei
    open(dir + list[i+1]);
	run("8-bit");
	setAutoThreshold("Li dark no-reset");
	run("Threshold...");
	setThreshold(5, 255);
	setOption("BlackBackground", true);
	run("Convert to Mask");
	run("Analyze Particles...", "size=1000-Infinity pixel display clear summarize add composite");
	close;
};


