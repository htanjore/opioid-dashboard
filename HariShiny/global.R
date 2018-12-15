library(shinydashboard)
library(tidyverse)
library(ggplot2)
library(plotly)
library(scales)
library(shinythemes)



overdoses_shiny <- readRDS(file = 'overdoses.RDS')

years <- as.data.frame(overdoses_shiny) %>% 
  select(Year) %>% 
  unique()

years <- sort(years$Year)

total_prescriptions_shiny <- readRDS(file = 'total_prescriptions.RDS')


states <- as.data.frame(total_prescriptions_shiny) %>% 
  select(State) %>% 
  unique()

states <- sort(states$State)


overdose_2006_2016_shiny <- readRDS(file = 'overdose_2006_2016.RDS')


states <- as.data.frame(overdose_2006_2016_shiny) %>% 
  select(State) %>% 
  unique()

states <- sort(states$State)


#load datset of prescription counts by state
op_2016_shiny <- readRDS(file = 'op_2016.RDS')

# create states in alphabetical order for dropdown
states <- as.data.frame(op_2016_shiny) %>%
  select(State) %>%
  unique()

states <- sort(states$State)


opioids_prescriptions_2013_2016_shiny <- readRDS(file = 'prescriptions2013_2016.RDS')
opioids <- as.data.frame(opioids_prescriptions_2013_2016_shiny) %>%
  select(Drug_Name) %>%
  unique()

opioids <- sort(opioids$Drug_Name)



