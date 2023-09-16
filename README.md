
# Shiny dashboard - A sample dataset

Using the "Shiny" web app, this is my sample dashboard for data visualisation. I've used a data set on bird surveys from 1977 to 2002 in this instance.
## Data-Set Description
The following provides some additional information about each column in the dataset:

1.record_id: A unique identifier for each record or observation.

2.month: The month when the observation was recorded.

3.day: The day of the month when the observation was recorded.

4.year: The year when the observation was recorded. The years discussed here range from 1977 to 2002.

5.plot_id: An identifier for the specific location or plot where the observation was made.

6.species_id: An identifier for the species observed. There are 20 distinct species of birds.

7.sex: The sex of the individual from the observed species (e.g., male "M" or female "F").

8.hindfoot_length: The length of the hindfoot (part of an animal's foot) measured in some units (e.g., millimeters).

9.weight: The weight of the individual from the observed species, possibly measured in some units (e.g., grams).

## Code

*Make sure you have the following library installed first.*

```bash
 install.packages("ggplot2")
```
```bash
library(ggplot2)
surveys <- read.csv("C:/R program/surveys_complete.csv")
View(surveys)
str(surveys)
```
*Please refer to the code from **Survey_visualization** for the visualisation portion.*

*Run the following code once the necessary graphs have been created.
Make sure you type the code below into the console.*
```bash
install.packages("devtools")
devtools::install_github("gertstulp/ggplotgui")
```
*Create a new Shiny web application now, and see the **app.R** for further code. Make the necessary modifications as needed.*

*After completing the above precesses, open a new script and enter the following code in order to get an Rgui*
```bash
library("ggplotgui")
ggplot_shiny()
```

## Demo
The Shiny app's appearance is demonstrated in the following video:
https://github.com/YatinKande/Surverys_Shiney/assets/135036330/6cde95a6-3d0e-4500-9a86-069a99c747c0

The Shiny Gui is shown in the following:
https://github.com/YatinKande/Surverys_Shiney/assets/135036330/69012439-546a-4819-912f-fe8f0b30f783


## 🚀 About Me
I started working towards being a Data Science professional in 2020, and I'm continue doing it by completing my Master's degree by 2025.


## 🛠 Skills
R, Python, SQL, HTML, CSS


## 🔗 Links
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/YatinKande)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/yatin-k-91687a207/)
[![Instagram](https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/yatinkande/)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/YatinKande)


