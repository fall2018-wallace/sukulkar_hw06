
#Loading Libraries
library('ggplot2')

#Creating histogram for population
histPopulation <- ggplot(dfMerged, aes(x = population))+
  geom_histogram(color ='black', fill= 'white', bins=30)+
  ggtitle("Histogram for Population")
histPopulation

#Creating histogram for murder rate
histMurder <- ggplot(dfMerged, aes(x = Murder))+
  geom_histogram(color ='black', fill= 'white', bins=30)+
  ggtitle("Histogram for Murder")
histMurder

#Creating histogram for assault
histAssault <- ggplot(dfMerged, aes(x = Assault))+
  geom_histogram(color ='black', fill= 'white', bins=30)+
  ggtitle("Histogram for Assault")
histAssault

#Creating histogram for urban pop
histUrbanPop <- ggplot(dfMerged, aes(x = UrbanPop))+
  geom_histogram(color ='black', fill= 'white', bins=30)+
  ggtitle("Histogram for UrbanPop")
histUrbanPop

#Creating histogram for rape
histRape <- ggplot(dfMerged, aes(x = Rape))+
  geom_histogram(color ='black', fill= 'white', bins=30)+
  ggtitle("Histogram for Rape")
histRape

#Creating box plot for Population
boxPopulation <- ggplot(dfMerged, aes(x=factor(0), y=population))+
  geom_boxplot(color = "Black", fill = "white")+
  ggtitle("Boxplot for Population")
boxPopulation

#Creating box plot for Murder
boxMurder <- ggplot(dfMerged, aes(x=factor(0), y=Murder))+
  geom_boxplot(color = "Black", fill = "white")+
  ggtitle("Boxplot for Murder")
boxMurder

#Histogram vs Boxplot
#In our case, a histogram depicts the situation with population and murder. 
#Therefore, it is easy to understand a histogram.

#Number of murders per state using bar chart
#10000 in the below is the scaling factor, to make the graph appear correctly
dfMerged$MurderPerState <- dfMerged$population * dfMerged$Murder/10000
View(dfMerged)

#Bar chart with number of murders per state
barMurderPerState <- ggplot(dfMerged, aes(x=stateName, y=MurderPerState))+
  geom_col(color = "Black", fill = "white")+
  ggtitle("Bar chart of Murders per State")
barMurderPerState

#Bar chart with rotated text on x-axis along with title
barMurderPerStateR <- barMurderPerState + theme(axis.text.x = element_text(angle = 90, hjust = 1))
barMurderPerStateR

#Bar chart with sorted number of murders per state
barMurderPerStateS <- ggplot(dfMerged, aes(x=reorder(stateName,Murder), y=MurderPerState))+
  geom_col(color = "Black", fill = "white")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  ggtitle("Bar chart of Murders per State with sorted murder rate")
barMurderPerStateS

#showing percentOver18 as the color of the bar in the same bar chart (barMurderPerStateS)
barMurderPerStateSF <- ggplot(dfMerged, aes(x=reorder(stateName,Murder), y=MurderPerState, fill=percentOver18))+
  geom_col()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  ggtitle("Bar chart of Murders per State with sorted murder rate with percentOver18 fill")
barMurderPerStateSF

#Scatter plot
scatterPlot <- ggplot(dfMerged, aes(x = population, y = percentOver18))+
  geom_point(aes(size = Murder, color = Murder))
scatterPlot
