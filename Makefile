Report.pdf: Report.tex plots/crp.png plots/polya-urn-1.png plots/polya-urn-5.png plots/polya-urn-50.png plots/dpgmm.png plots/dpmeans.png
	pdflatex Report
	pdflatex Report
	pdflatex Report

plots/polya-urn-1.png plots/polya-urn-5.png plots/polya-urn-50.png: codes/Polya.R
	Rscript codes/Polya.R

plots/crp.png: codes/CRP.R
	Rscript codes/CRP.R

plots/dpgmm.png: codes/dpgmm-plot.R data/clusters-dpgmm.txt data/mcdonalds-normalized-data.txt
	Rscript codes/dpgmm-plot.R

data/clusters-dpgmm.txt: codes/dp-gmm.py
	python codes/dp-gmm.py

plots/dpmeans.png: codes/dp-means-plot.R codes/dp-means.R
	Rscript codes/dp-means-plot.R
    
    
    
all: Report.pdf
