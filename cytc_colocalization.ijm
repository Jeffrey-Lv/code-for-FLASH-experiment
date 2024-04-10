doserate_list=newArray("ctrl","4_2nA","720nA","7_3uA");
group_list=newArray("1","2","3","4");
paths="C:/Users/12041/Desktop/final/";
for (d = 0; d < 4; d++) {
	doserate=doserate_list[d];
	path_d=paths+doserate+"/";
	for (g= 0; g < 4; g++) {
		group=group_list[g];
		path=path_d+group+"/";
		fileNames=getFileList(path);
		for (f = 0; f < lengthOf(fileNames); f=f+4) {
			file_red = fileNames[f+2];
			file_green=fileNames[f+3];
			open(path+file_red);
			run("8-bit");
			open(path+file_green);
			run("8-bit");
			run("Coloc 2", "roi_or_mask=<None> threshold_regression=Costes display_images_in_result display_shuffled_images li_histogram_channel_1 li_histogram_channel_2 li_icq spearman's_rank_correlation manders'_correlation kendall's_tau_rank_correlation 2d_intensity_histogram costes'_significance_test psf=3 costes_randomisations=10");
			run("Close All");
		}
		if (isOpen("Log")) {
	    selectWindow("Log");
	    saveAs("Text", path_d+group+".txt");
	    run("Close");
	}
		run("Close All");
	}
}