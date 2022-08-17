
uniSliderInput <- function(inputId, label, min, max, value, step = NULL, width = NULL){
  
  shiny:::validate_slider_value(min, max, value, "shinySlider")
  
  value <- shiny:::restoreInput(id = inputId, default = value)
  
  if(is.null(width)){
    width <- "300px"
  }
  
  tagList(
    # JS and CSS call
    singleton(tags$head(tags$script(src = "slider.js"))),
    suppressDependencies("bootstrap"),
    tags$link(rel = "stylesheet", type = "text/css", href = "main.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.min.css"),
    # Input
    div(
      id = inputId,
      class = "range-slider",
      style = paste0('width:',width,';'),
      tags$label(
        label,
        class="form-label"
      ),
      div(
        id="tooltip",
        style="left: calc(97.4706% + -15.1906px);",
        tags$span(value)
      ),
      tags$input(
        id="range",
        class="form-range",
        type="range",
        step = step,
        value = value,
        min = min,
        max = max
      ),
      div(
        class="min-max-container d-flex justify-content-between align-items-center",
        div(class="min-value",min),
        div(class="max-value",max)
      )
    )
  )
}


