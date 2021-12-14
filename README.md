# To Pay or Not to Pay? Comparing Free v.s. Paid Android Applications on Google Play Store

In this project, we are interested in mining the frequent patterns including the app rating feature for different price ranges in Google Play Store. We want to know how different aspects of apps like category, being editor choice or not, content rating, etc., affect the app ratings in free v.s. paid apps and in different price ranges.

## Data 

We use the publicly available data on Kaggle which can be found here https://www.kaggle.com/gauthamp10/google-playstore-apps

## Research Questions

##### RQ1: What are the frequent patterns of free, high-rated apps?
##### RQ2:What are the frequent patterns of paid, high-rated apps?
##### RQ3: What are the differences and similarities between the frequent patterns of free v.s. paid apps that are highly rated?

## Methodology

### Preprocessign

- resolving the missing data
- resolving the duplications
- resolving the outliers
- reducing data
- selecting features
- any other data preparation needed using the programming language R

### Frequent Pattern Mining

- FPClose[1] from the SPMF(https://www.philippe-fournier-viger.com/spmf/) Java open source library

### Post Processing

- visualizing our results we intend to use D3.js(https://d3js.org/)

## Biblography

[1]  G. Grahne and J. Zhu. 2005. Fast algorithms for frequent itemset mining using FP-trees. IEEE Transactions on Knowledge and Data Engineering 17, 10 (2005), 1347–1362. https://doi.org/10.1109/TKDE.2005.16

## Tutorials and websites I used
### R
- https://stackoverflow.com/questions/28513444/how-to-tell-what-packages-you-have-used-in-r
- https://stackoverflow.com/questions/32556967/understanding-r-is-na-and-blank-cells
- https://www.tutorialspoint.com/r/r_csv_files.htm
- https://stackoverflow.com/questions/43855752/r-using-if-statement-to-compare-factors-with-different-levels
- https://www.datasciencemadesimple.com/delete-or-drop-rows-in-r-with-conditions-2/
- https://statsandr.com/blog/outliers-detection-in-r/
- https://www.journaldev.com/44068/sink-function-in-r
- https://www.delftstack.com/howto/r/remove-last-character-in-r/#use-the-substr-function-to-remove-the-last-characters-in-r

### JavaScript
- https://stackoverflow.com/questions/2250953/how-do-i-create-javascript-array-json-format-dynamically/35610656
- https://stackoverflow.com/questions/1078118/how-do-i-iterate-over-a-json-structure
- https://observablehq.com/@d3/horizontal-bar-chart
- https://stackoverflow.com/questions/58701387/d3-js-select-node-element-based-on-attributes-value-using-selectall

### Latex/Overleaf
- https://stackoverflow.com/questions/3068555/how-to-insert-manual-line-breaks-inside-latex-tables
- https://tex.stackexchange.com/questions/161431/how-to-solve-longtable-is-not-in-1-column-mode-error
- https://www.overleaf.com/learn/latex/Errors/Extra_alignment_tab_has_been_changed_to_%5Ccr
- https://www.overleaf.com/learn/latex/Errors/Misplaced_alignment_tab_character_%26

### Eclipse and Github
- https://www.youtube.com/watch?v=LPT7v69guVY

