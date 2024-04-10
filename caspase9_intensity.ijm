
// set a file direction
folder = "720nA";
dir = "D:/Research/Finals/cas9/23_3_18_10A_cleaved_caspase-9/"+folder+"/";
list = getFileList(dir);
for (i = 0; i < list.length; i+= 3) {
    // open nuclei pic
    open(dir + list[i+2]);
	run("8-bit");
	run("Measure");
	close;

};
