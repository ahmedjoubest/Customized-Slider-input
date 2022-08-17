
var shinySliderUpdate = new Shiny.InputBinding();

$.extend(shinySliderUpdate, {
  // const range = $(".range-slider #range");
  //const tooltip = $(".range-slider #tooltip");
  //const minTextValue = $(".range-slider .min-value");
  //const maxTextValue =  $(".range-slider .max-value");
  
  initialize: function(el){
  },
  
  find: function(scope) {
    return $(scope).find(".range-slider");
  },

  getValue: function(el) {
      var range_min = $(el).children("#range").attr("min");
    var range_max = $(el).children("#range").attr("max");
    var range_value = $(el).children("#range").val();
    
   $(el).children(".min-value").innerHTML = range_min;
   $(el).children(".max-value").innerHTML = range_max;
   
    const newValue = Number((range_value - range_min) * 100 / (range_max - range_min));
    const newPosition = 14 - (newValue * 0.30);
    console.log(range_value);
    $(el).children("#tooltip").html('<span>'+range_value+'</span>');
  //  $(el).children("#tooltip").style.left = `calc(${newValue}% + (${newPosition}px))`;
  
    $(el).children("#tooltip").css("left", `calc(${newValue}% + (${newPosition}px))` );
    
   // document.documentElement.style.setProperty("--range-progress", `calc(${newValue}% + (${newPosition}px))`);
    $(el).children(el).css("--range-progress", `calc(${newValue}% + (${newPosition}px))`)
    console.log("updated!");
    return parseInt($(el).children("#range").val());
  },
  
  setValue: function(el, value) {
    
  // values for min-max text based on range input
  
    
    console.log("updated!");
    
    $(el).children("#range").val(newValue);
    
    console.log("updated!!!!");
  },
  
  subscribe: function(el, callback) {
    $(el).children("#range").on("input.shinySliderUpdate", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).children("#range").off(".shinySliderUpdate");
  }
});


Shiny.inputBindings.register(shinySliderUpdate);

//document.addEventListener("DOMContentLoaded", shinySliderUpdate);

