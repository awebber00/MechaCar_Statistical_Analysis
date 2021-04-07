library(dplyr)
mechacar_table <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_table)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_table))
MPG_model1 <- lm(mpg ~ vehicle_length,mechacar_table)
MPG_yvals1 <- MPG_model1$coefficients['vehicle_length']*mechacar_table$vehicle_length + MPG_model1$coefficients['(Intercept)']
plt1 <- ggplot(mechacar_table,aes(x=vehicle_length,y=mpg))
plt1 + geom_point() + geom_line(aes(y=MPG_yvals1), color = "red")
MPG_model2 <- lm(mpg ~ vehicle_weight,mechacar_table)
MPG_yvals2 <- MPG_model2$coefficients['vehicle_weight']*mechacar_table$vehicle_weight + MPG_model2$coefficients['(Intercept)']
plt2 <- ggplot(mechacar_table,aes(x=vehicle_weight,y=mpg))
plt2 + geom_point() + geom_line(aes(y=MPG_yvals2), color = "red")
MPG_model3 <- lm(mpg ~ spoiler_angle,mechacar_table)
MPG_yvals3 <- MPG_model3$coefficients['spoiler_angle']*mechacar_table$spoiler_angle + MPG_model3$coefficients['(Intercept)']
plt3 <- ggplot(mechacar_table,aes(x=spoiler_angle,y=mpg))
plt3 + geom_point() + geom_line(aes(y=MPG_yvals3), color = "red")
MPG_model4 <- lm(mpg ~ ground_clearance,mechacar_table)
MPG_yvals4 <- MPG_model4$coefficients['ground_clearance']*mechacar_table$ground_clearance + MPG_model4$coefficients['(Intercept)']
plt4 <- ggplot(mechacar_table,aes(x=ground_clearance,y=mpg))
plt4 + geom_point() + geom_line(aes(y=MPG_yvals4), color = "red")
MPG_model5 <- lm(mpg ~ AWD,mechacar_table)
MPG_yvals5 <- MPG_model5$coefficients['AWD']*mechacar_table$AWD + MPG_model5$coefficients['(Intercept)']
plt5 <- ggplot(mechacar_table,aes(x=AWD,y=mpg))
plt5 + geom_point() + geom_line(aes(y=MPG_yvals5), color = "red")

population_table <- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F)
plt <- ggplot(population_table,aes(x=PSI))
plt + geom_density()

total_summary <- population_table %>% group_by() %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=mean(PSI), SD=sd(PSI), .groups = 'keep')

lot_summary <- population_table %>% group_by(.data) %>% summarize(Manufacturing_Lot=mean(), Mean=mean(PSI), Median=median(PSI), Variance=mean(PSI), SD=sd(PSI), .groups = 'keep')

t.test(population_table$PSI,mu = 1500)
t.test(subset(population_table,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)
t.test(subset(population_table,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)
t.test(subset(population_table,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)