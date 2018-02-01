# The Power of Ranking: The Ease of Doing Business Indicator as a form of Social Pressure

[Rush Doshi](http://rushdoshi.com/) • Harvard University  
[Judith Kelley](https://sanford.duke.edu/people/faculty/kelley-judith) • Sanford School of Public Policy • Duke University  
[Beth Simmons](https://www.sas.upenn.edu/polisci/people/standing-faculty/beth-simmons) • University of Pennsylvania

---

## Replication instructions

All the figures and tables for the paper can be replicated and reproduced with R. Ensure the following packages are installed:

- [`tidyverse`](http://tidyverse.tidyverse.org/)
- [`here`](https://cran.r-project.org/package=here)
- [`skimr`](https://cran.r-project.org/package=skimr)
- [`gridExtra`](https://cran.r-project.org/package=gridExtra)
- [`ggrepel`](https://cran.r-project.org/package=ggrepel)
- [`ggstance`](https://cran.r-project.org/package=ggstance)
- [`pander`](https://cran.r-project.org/package=pander)
- [`countrycode`](https://cran.r-project.org/package=countrycode)
- [`sandwich`](https://cran.r-project.org/package=sandwich)
- [`lmtest`](https://cran.r-project.org/package=lmtest)

This can be done with this R code:

```r
install.packages(c("tidyverse", "here", "gridExtra", "ggrepel", "ggstance", 
                   "pander", "countrycode", "sandwich", "lmtest"))
```

Also, install these additional items:

- [Clear Sans font](https://01.org/clear-sans)
- [XQuartz](https://www.xquartz.org/) if on macOS
- [RStudio](https://www.rstudio.com/products/rstudio/download/#download)

The project is structured as an RStudio project and uses [RMarkdown](http://rmarkdown.rstudio.com/rmarkdown_websites.html) to generate a website in the `_site/` subdirectory. This is currently hosted online at <https://stats.andrewheiss.com/edb-social-pressure/>, but the `_site/` directory can be uploaded anywhere else too. 

Open RStudio and go to Build > Build All to run all the scripts and generate everything. After building, you should have the following files:

- `_site/`: the complete website
- `output/data/`: CSV, R, and Stata versions of the cleaned data used in the analysis
- `output/tables/`: Markdown and .docx versions of the generated tables
- `output/figures`: PDF and PNG versions of the generated figures
