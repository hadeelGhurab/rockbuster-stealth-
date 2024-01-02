# Rockbuster Stealth
## Analysis of video rental data for business strategy recommendations
## **Objective**

#### Rockbuster Stealth LLC business intelligence department requires a launch strategy for moving their video rental business to a streaming service. The management board has asked for a presentation addressing a number of business questions to inform their 2020 company strategy.
- Which movies contributed the most/least to revenue gain?
- What was the average rental duration for all videos?
- Which countries are Rockbuster customers based in?
- Where are customers with a high lifetime value based?
- Do sales figures vary between geographic regions?

Data was filtered, summarized, and cleaned in PostgreSQL. SQL queries included joining tables and using subqueries, and a data dictionary to explain the relational database was created. Tableau was then used to visualize the data.
 
## **Data Limitations**

#### Data is included for film rentals in 2006, so timeliness is an issue. Data collection after initial implementation of strategic business plan, particularly among the high lifetime value customers as outlined below, will provide guidelines for pivoting in targeted marketing campaigns. Data integrity was checked using SQL queries to identify non-uniform, duplicate, and missing values.
 
## **Analysis and Results**
### [Sample SQL Queries used](https://github.com/hadeelGhurab/rockbuster-stealth-/tree/main/queries)

## **Recommendations**

### [Tableau dashboard](https://public.tableau.com/app/profile/hadeel.ghurab/vizzes)

1. Strategically choose markets to roll out the streaming service. Targeting these 10 countries for initial sales and marketing campaigns captures high individual and total revenue potential.
 
<kbd>![Recommendations_1](https://github.com/hadeelGhurab/rockbuster-stealth-/blob/main/tableau-report/Customer-distribution-map.png)<kbd>
 
2. Marketing and sales campaigns target geographic location content preferences based on customer count globally .
 
<kbd>![Recommendations_2](https://github.com/hadeelGhurab/rockbuster-stealth-/blob/main/tableau-report/Top-ten-countries-per-customer-count.png)<kbd>
 
3. From the top ten countries Rockbuster plan to Ward the to five customer top customers base on the total amount paid as a way of boosting sales and building customer loyalty.
 
<kbd>![Recommendations_3](https://github.com/hadeelGhurab/rockbuster-stealth-/blob/main/tableau-report/Top-five-customers.png)<kbd>

 
## **Summary**

<kbd>![Summary](https://github.com/hadeelGhurab/rockbuster-stealth-/blob/main/tableau-report/summary.PNG)<kbd>
