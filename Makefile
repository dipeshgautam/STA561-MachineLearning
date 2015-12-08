final_project.pdf: final_project.tex crp.png polya-urn-1.png polya-urn-5.png polya-urn-50.png dpgmm.png dpmeans.png
	pdflatex Report
	pdflatex Report
	pdflatex Report

polya-urn-1.png polya-urn-5.png polya-urn-50.png: Polya.R
	Rscript Polya.R

crp.png: CRP.R
	Rscript CRP.R

dpgmm.png: dpgmm-plot.R clusters-dpgmm.txt mcdonalds-normalized-data.txt
	Rscript dpgmm-plot.R

clusters-dpgmm.txt: dp-gmm.py
	python dp-gmm.py

dpmeans.png: dp-means-plot.R dp-means.R
	Rscript dp-means-plot.R
    
    
    
all: Report.pdf
