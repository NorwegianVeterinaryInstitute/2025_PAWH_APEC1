New quarto file:
20260929_TidyData_Visualisation.md

## Part 1: 

Data verification: exploration 
- verify spelling - > different categories/variables spelling homogeneity


- new variable/column: variants : combine variable ST and serotype - format examples :  ST23-O78:H4
- outpuy verified data if necessary 
- compute/output contingency tables - and top fives for : ST, serotype, variants - excel and rds for reusability 
- directory results/202609_data_output
- new resutls figures results/figures/202609_draft

Questions to Solveig for Data cleaning 
                       Production
Foreldredyr, kjøttproduksjon:234   -> Parents
Kjøttproduksjon             :650   -> Broilers


Species 
Høns          : 77  -> Chicken
Hubbard       : 40  -> Hubbard
Hubbard JA 787:100  -> Hubbard
Ross          :  1  -> Ross 308
Ross 308      :646  -> Ross 308
Ross rowan    :  3  -> Ross rowan
Rowan 308     :  1  -> Rowan 308
Rowan Ranger  :  9  -> Rowan ranger
Rustic gold   :  2  -> Rustic gold
Sasso         :  5  -> Sasso


Serotypes that contain ONT or HNT ? processing  -> keep as such 


Top5 -> Apec Variants 



## Part 2: graphs final trials 
- on the validated data 
- they like both sankey and piechart plot 

### Based on  Fig7 pie chart 

- remove the number isolates / cases
- number of isolates / and send cases -> refer to supplementary -> export table then
- label showing size of the circles the - and represent proportional to isolate count 
- want it to say ST23-O78:H4 
- Try to move the legend on the right size and make more vertical the x label 
- try to say something legend size circle
- use the variants combination -> top 5 (if not enough top 10)



### Based on Fig8_year_st_serotype_alluvial 


#### First example: 
- same year ST and serotype
- only include the top 5 ST and "other box"

### Second example: 
- have first production type then year then APEC variant : combination ST and serotype 
- only include the top5 of ST and serotype - and everything else should be in an "other box" - should not be excluded 

? ST and serotype as top five or only ST as top 5

Third example:
- have first production type then ST then Serotype (top 5 ST)

I can try with the 5 tops with some variation ... 
