library(shinythemes)
# Define UI
shinyUI(
             fluidPage(theme = shinythemes::shinytheme("superhero"),
    dashboardPage(
        dashboardHeader(title = 'Opioid Overdoses', titleWidth = 1600),
        dashboardSidebar(tags$blockquote('More than 72,000 Americans 
                         died from drug overdoses in 2017, 
                         including illicit drugs and 
                         prescription opioids — a 2-fold 
                         increase in a decade. 
                         Source: CDC WONDER'),
        selectInput("year", 
                    label = "Year", 
                    choices = years,
                    selected = '2016'),
        selectInput("state", 
                    label = "State", 
                    choices = states,
                    selected = 'State')),
       
        
        dashboardBody(
          
            tags$head( 
            tags$style(HTML(".main-sidebar { font-size: 20px; }")) 
          ),
          
                fluidRow(
                   box(title ='Opioid Deaths per 100,000 Residents by Year', status = 'primary',solidHeader = T,plotlyOutput("plot", height = 300, width=600),width=6),
                   box(title = 'Opiod Prescriptions per 100000 by Year and State', status = 'primary',solidHeader = T,plotOutput("plot3", height = 300),width = 6),
                
                fluidRow(
                    box(title = 'Opioids prescribing rate in US by State', status = 'primary',solidHeader = T,plotOutput("plot1", height = 300, width = 600), width = 6),
                    box(title = 'Opioid Overdose Death Rate(Age Adjusted) by State', status = 'primary',solidHeader = T,plotOutput("plot2", height = 300, width =600),width = 6)
                    
                    
                  )
                    )
    )
)
)
)



                    
           
 





