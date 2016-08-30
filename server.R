#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(mosaicData)
library(stats)
source('prefix.R')
data("SaratogaHouses")
NCONTROLS = 15
FACTOR_FIELDS = c(6, 7, 8, 10, 11, 12)
ROWS_SIMILAR = 5
SaratogaHousesSorted <- SaratogaHouses[order(-SaratogaHouses$price),]

shinyServer(function(input, output) {
  for (x in 1:15) {
    local({
      i <- x
      output[[paste0('in', i)]] <- renderText({paste0(prefix(i), ': ', input[[paste0('in', i)]])})
    })
  }
  
  fieldsString <- reactive({
    str = ""
    onList <- sapply(1:NCONTROLS, function(i) {
      if(input[[paste0('show', i)]]) {1} else {0} })
    
    for (i in 1:NCONTROLS)
      if (onList[i] == 1)
        str <- paste0(str, fieldname(i), '+')
    
    if (str != '') {
      str <- substr(str, 1, nchar(str) - 1)
      str <- paste0('price ~ ', str)
      constructFields <- 'data.frame('
      for (i in 1:NCONTROLS) {
        if (onList[i] == 1) {
          fieldValue <- input[[paste0('in', i)]]
          if (i %in% FACTOR_FIELDS) #add hyphens to the names of factor fields
              fieldValue <- paste0("'", fieldValue, "'")
          constructFields <- paste0(constructFields, fieldname(i), "=", fieldValue, ',')
        }
      }
      constructFields <- substr(constructFields, 1, nchar(constructFields) - 1)
      constructFields <- paste0(constructFields, ')')
      new.data <- eval(parse(text = constructFields))
      lModel <- lm(as.formula(str), data = SaratogaHouses)
      predict(lModel, new.data)[1]
    }
    else
      "No parameters selected"
  })
  
  output$price <- renderText({fieldsString()})
  
  similarTable <- reactive({
    onList <- sapply(1:NCONTROLS, function(i) {
      if(input[[paste0('show', i)]]) {1} else {0} })
    if (1 %in% onList) {
      index <- which.min(SaratogaHousesSorted$price > fieldsString())
      SaratogaHousesSorted[
        max(index-ROWS_SIMILAR+1, 1):min(index+ROWS_SIMILAR, 
                                         nrow(SaratogaHousesSorted)),]
    }
    else
      data.frame()
  })
  
  output$similar10 <- renderDataTable({similarTable()})
})