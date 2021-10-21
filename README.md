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

- CFP-Growth++[1] from the SPMF(https://www.philippe-fournier-viger.com/spmf/) Java open source library

### Post Processing

- visualizing our results we intend to use D3.js(https://d3js.org/)

## Biblography

[1] R. Uday Kiran and P. Krishna Reddy. 2011. Novel techniques to reduce search space in multiple minimum supports-based frequent pattern mining algorithms. In EDBT 2011, 14th International Conference on Extending Database Technology, Uppsala, Sweden, March 21-24, 2011, Proceedings, Anastasia Ailamaki, Sihem AmerYahia, Jignesh M. Patel, Tore Risch, Pierre Senellart, and Julia Stoyanovich (Eds.). ACM, 11–20. https://doi.org/10.1145/1951365.1951370

