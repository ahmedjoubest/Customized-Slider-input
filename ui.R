source("UniSliderInput.R")

shinyUI(fluidPage(
  
  tags$style(
    type='text/css',
    ".irs--shiny .irs-bar {
      background: #008FD4;
      height: 6px;
      top: 16px;
      }
    .irs--shiny .irs-min, .irs--shiny .irs-max{
      background-color: #fff;
      margin-top: 33px;
      color: #98989B;
      font-size: 15px;
    }
    .irs--shiny .irs-handle {
      top: 8px;
      background-color: #008FD4;
      border-color: #008FD4;
    }
    .irs--shiny .irs-line{
      background: #9ECAE0;
      border: 0px;
      height: 6px;
      top: 16px;
    }
    .irs--shiny .irs-from, .irs--shiny .irs-to, .irs--shiny .irs-single{
      color: #98989B;
      background-color: #fff;
      font-size: 15px;
      margin-top: 33px;
    }
    "
  ),
  
  titlePanel("Sliders"),
  
  mainPanel(
    fluidRow(
      column(12,
             br(),br(),
             tags$h3("Created input from scratch:"),
             uniSliderInput("a", value= 3, min=1, max=10, label="My Slider"),
             textOutput("out"),
             
             
             br(),br(),
             
             tags$h3("Customized Select input function overridig shiny CSS classes:"),
             br(),
             sliderInput("b", value= c(3), min=1, max=10,
                         label=HTML("<div style = 'font-size: 21px; color: #565656;
                                                    font-weight:649;'> 
                                    My Slider </div>"),
                         ticks = F),
             
             br(),
             
             sliderInput("c", value= c(3,7), min=1, max=10,
                         label=HTML("<div style = 'font-size: 21px; color: #565656;
                                                    font-weight:649;'> 
                                    My Slider </div>"),
                         ticks = F)
      )
    ))
))
