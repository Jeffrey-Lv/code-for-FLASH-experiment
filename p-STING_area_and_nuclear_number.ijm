

// 设置文件夹路径
folder = "7.2uA";
dir = "D:/Peking_Unversity_main_work/24_2_18_pSTING_231/"+folder+"/";
list = getFileList(dir);
for (i = 0; i < list.length; i += 4) {
    // 打开细胞核图片
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
	
	//打开线粒体图像
	open(dir + list[i+2]);
	run("Unsharp Mask...", "radius=1 mask=0.60 stack");
	//run("Enhance Local Contrast (CLAHE)", "blocksize=250 histogram=256 maximum=4 mask=*None*");
	run("Median...", "radius=2 stack");
	run("Convert to Mask");
	run("Create Selection");
	// 将ROI设定到图像上
	roiManager("Add");
	
	//打开pSTING图像
	open(dir + list[i+3]);
	run("8-bit");
	setAutoThreshold("Default dark no-reset");
	setOption("BlackBackground", true);
	run("Convert to Mask");
	roiManager("Show All");
	roiManager("Measure");
	saveAs("Results", "D:/Peking_Unversity_main_work/24_2_18_pSTING_231/"+folder+"_"+ ""+i +"_pSTING_area.csv");
	close;
	close;
	close;
	roiManager("reset");
};
