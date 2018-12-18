
# Define server logic required to draw a histogram
   
  server <- function(input, output) {
    
    output$plot <- renderPlotly({
      # specify some map projection/options
      
      # filter overdoses_shiny based on Year
      data <- overdoses_shiny %>% 
        filter(Year == input$year)
      
      l <- list(color = toRGB("white"), width = 2)
      g <- list(
        scope = 'usa',
        projection = list(type = 'albers usa'),
        showlakes = FALSE,
        lakecolor = toRGB('white')
      )
      plot_geo(data, locationmode = 'USA-states') %>%
        add_trace(
          z = ~Opioid_Death_Rate, locations = ~Abbrev,zmin = 0, zmax = 43,
          colors = 'Reds'
        ) %>%
        colorbar(title = "    Deaths \nPer 100000") %>%
        layout(
          geo = g)
    })
    
    output$plot1 <- renderPlot({
      # specify some map projection/options
      
      # filter overdoses_shiny based on Year
      data <- total_prescriptions_shiny %>% 
        filter(State == input$state)
      
      ggplot(data, aes(Year, Prescribing_Rate, group = State, color = State)) + 
        geom_line(size = 1) +
        scale_y_continuous(labels = comma)+
        geom_point(size=3, shape=21, aes(fill=factor(State)))+
        labs(color = "US State", fill = 'US State')+
        ylab('Prescribtion per 100 Persons') +
        xlab('Year') +
        theme_bw()
    })
    
    output$plot2 <- renderPlot({
      # specify some map projection/options
      
      # filter overdoses_shiny based on Year
      data <- overdose_2006_2016_shiny %>% 
        filter(State == input$state)
      
      ggplot(data, aes(Year, Opioid_Death_Rate, group = State, color = State)) + 
        geom_line(size = 1) +
        scale_y_continuous(labels = comma)+
        geom_point(size=3, shape=21, aes(fill=factor(State)))+
        labs(color = "US State", fill = 'US State')+
        ylab('Overdose deaths per 100,000 Residents') +
        
        xlab('Year') +
        theme_bw()
    })
    
    output$plot3 <- renderPlot({ 
      validate(need(input$year %in% c(2013,2014,2015,2016), 'Dataset Not available'))
      data <- opioids_prescriptions_2013_2016_shiny %>%
        filter(State == input$state,Year == input$year)

    ggplot(data,aes(reorder(Drug_Name, Prescriptions_per_100000), Prescriptions_per_100000)) +
      geom_bar(stat = 'identity',aes(fill = -Prescriptions_per_100000),show.legend = FALSE) + coord_flip()+
      xlab('Opioid') +
      ylab('Prescriptions per 100000') +
      scale_y_continuous(labels = comma)+
        theme_bw()

   })
  }
    
 
  #   output$click <- renderPrint({
  #     d <- event_data("plotly_click")
  #     if (is.null(d)) "Click on a state to view event data" else d
  #   })
  #   
  # }
  

