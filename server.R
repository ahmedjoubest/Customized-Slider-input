shinyServer(function(input, output, session) {
  
  output$out <- renderText({
    paste0("Input = ",as.character(input$a))
  })
  
})