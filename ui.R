library(shiny)
library(mosaicData)
source('prefix.R')
data("SaratogaHouses")

shinyUI(navbarPage("Saratoga house prices estimator", 
 tabPanel("Main page",
  sidebarLayout(
    sidebarPanel(
      checkboxInput("show1", prefix(1)),
      checkboxInput("show2", prefix(2)),
      checkboxInput("show3", prefix(3)),
      checkboxInput("show4", prefix(4)),
      checkboxInput("show5", prefix(5)),
      checkboxInput("show6", prefix(6)),
      checkboxInput("show7", prefix(7)),
      checkboxInput("show8", prefix(8)),
      checkboxInput("show9", prefix(9)),
      checkboxInput("show10", prefix(10)),
      checkboxInput("show11", prefix(11)),
      checkboxInput("show12", prefix(12)),
      checkboxInput("show13", prefix(13)),
      checkboxInput("show14", prefix(14)),
      checkboxInput("show15", prefix(15)),
      conditionalPanel(
         condition = "input.show1 == true",
         selectInput("in1",
                     label = prefix(1),
                     choices = seq(from = range(SaratogaHouses$bedrooms)[1], to = range(SaratogaHouses$bedrooms)[2]),
                     selected = 1)
      ),
      conditionalPanel(
        condition = "input.show2 == true",
        selectInput("in2",
                    label = prefix(2),
                    choices = seq(from = range(SaratogaHouses$rooms)[1], to = range(SaratogaHouses$rooms)[2]),
                    selected = 1)
      ),
      conditionalPanel(
        condition = "input.show3 == true",
        selectInput("in3",
                    label = prefix(3),
                    choices = seq(from = range(SaratogaHouses$bathrooms)[1], to = range(SaratogaHouses$bathrooms)[2], by = .5),
                    selected = 1)
      ),
      conditionalPanel(
        condition = "input.show4 == true",
        numericInput("in4", prefix(4), 
                     round(mean(SaratogaHouses$age)/5)*5,
                     min = min(SaratogaHouses$age),
                     max = max(SaratogaHouses$age),
                     step = 5)
      ),
      conditionalPanel(
        condition = "input.show5 == true",
        numericInput("in5", prefix(5), 
                     round(mean(SaratogaHouses$livingArea)/100)*100,
                     min = min(SaratogaHouses$livingArea),
                     max = max(SaratogaHouses$livingArea),
                     step = 100)
      ),
      conditionalPanel(
        condition = "input.show6 == true",
        selectInput("in6",
                    label = prefix(6),
                    choices = levels(factor(SaratogaHouses$heating)),
                    selected = 1)
      ),
      conditionalPanel(
        condition = "input.show7 == true",
        selectInput("in7",
                    label = prefix(7),
                    choices = levels(factor(SaratogaHouses$fuel)),
                    selected = 1)
      ),
      conditionalPanel(
        condition = "input.show8 == true",
        selectInput("in8",
                    label = prefix(8),
                    choices = levels(factor(SaratogaHouses$sewer)),
                    selected = 1)
      ),
      conditionalPanel(
        condition = "input.show9 == true",
        selectInput("in9",
                    label = prefix(9),
                    choices = seq(from = range(SaratogaHouses$fireplaces)[1], to = range(SaratogaHouses$fireplaces)[2]),
                    selected = 1)
      ),
      conditionalPanel(
        condition = "input.show10 == true",
        radioButtons("in10",
                    label = prefix(10),
                    choices = levels(SaratogaHouses$waterfront),
                    inline = TRUE)
      ),
      conditionalPanel(
        condition = "input.show11 == true",
        radioButtons("in11",
                     label = prefix(11),
                     choices = levels(SaratogaHouses$newConstruction),
                     inline = TRUE)
      ),
      conditionalPanel(
        condition = "input.show12 == true",
        radioButtons("in12",
                     label = prefix(12),
                     choices = levels(SaratogaHouses$centralAir),
                     inline = TRUE)
      ),
      conditionalPanel(
        condition = "input.show13 == true",
        numericInput("in13", prefix(13), 
                     round(median(SaratogaHouses$pctCollege)/10)*10,
                     min = 0,
                     max = 100,
                     step = 5)
      ),
      conditionalPanel(
          condition = "input.show14 == true",
          sliderInput("in14",
                      prefix(14),
                   min = min(SaratogaHouses$lotSize)*.5,
                   max = max(SaratogaHouses$lotSize)*1.5,
                   value = mean(SaratogaHouses$lotSize))
      ),
      conditionalPanel(
        condition = "input.show15 == true",
        numericInput("in15", prefix(15), 
                     round(mean(SaratogaHouses$landValue)/100)*100,
                     min = min(SaratogaHouses$landValue),
                     max = max(SaratogaHouses$landValue),
                     step = 1000)
      )
      #submitButton('Submit')
    ),
    
    mainPanel(
      
      h3('Price estimation:'),
      verbatimTextOutput('price'),
      h4('Selected parameters to fit the model:'),
        conditionalPanel(
          condition = "input.show1 == true",
          verbatimTextOutput('in1')
        ),
        conditionalPanel(
          condition = "input.show2 == true",
          verbatimTextOutput('in2')
        ),
        conditionalPanel(
          condition = "input.show3 == true",
          verbatimTextOutput('in3')
        ),
        conditionalPanel(
          condition = "input.show4 == true",
          verbatimTextOutput('in4')
        ),
        conditionalPanel(
          condition = "input.show5 == true",
          verbatimTextOutput('in5')
        ),
        conditionalPanel(
          condition = "input.show6 == true",
          verbatimTextOutput('in6')
        ),
        conditionalPanel(
          condition = "input.show7 == true",
          verbatimTextOutput('in7')
        ),
        conditionalPanel(
          condition = "input.show8 == true",
          verbatimTextOutput('in8')
        ),
        conditionalPanel(
          condition = "input.show9 == true",
          verbatimTextOutput('in9')
        ),
        conditionalPanel(
          condition = "input.show10 == true",
          verbatimTextOutput('in10')
        ),
        conditionalPanel(
          condition = "input.show11 == true",
          verbatimTextOutput('in11')
        ),
        conditionalPanel(
          condition = "input.show12 == true",
          verbatimTextOutput('in12')
        ),
        conditionalPanel(
          condition = "input.show13 == true",
          verbatimTextOutput('in13')
        ),
        conditionalPanel(
          condition = "input.show14 == true",
          verbatimTextOutput('in14')
        ),
        conditionalPanel(
          condition = "input.show15 == true",
          verbatimTextOutput('in15')
        )
    )
  )
),
  tabPanel("Similar properties", 
           tabPanel("Similar", dataTableOutput('similar10'))
)))