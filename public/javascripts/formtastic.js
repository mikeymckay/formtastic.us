currentlyFocusedElement = null

form_elements = $w('input select')

supported_attributes = $w("reasonableMin reasonableMax absoluteMin absoluteMax condition onFieldFocus ajaxURL")


Event.observe(window, 'load', function() {
  $$('form').each( function(form) {
    form.getElements().each( function(form_element) {
      form_element.addClassName('form_element')
      Event.observe(form_element, "focus", function() {currentlyFocusedElement = this})
      Event.observe(form_element, "focus", checkConditions)
      Event.observe(form_element, "blur", observeForValidity)
      new Insertion.After(form_element,"<span style='display:none' id='message_"+ form_element.identify()  +"'></span>")
      if(form.getAttribute("showFieldsSeparately")){
        Event.observe(form_element, "focus", hideAllElse)
        Event.observe(form_element, "blur", unhideAll)
      }
      ajaxURL = form_element.readAttribute('ajaxURL')
      if (ajaxURL != null){
        new Insertion.After(form_element, "<div id='autocomplete_" + form_element.identify()  + "' class='autocomplete'></div>")
        new Ajax.Autocompleter(form_element.identify(), "autocomplete_" + form_element.identify(), ajaxURL, { paramName: "searchString" });

      }
    })

  })
})

function hideAllElse(){
  current_form_element = this
  this.form.getElements().each( function(form_element, index) {
    if(form_element.identify() != current_form_element.identify()){
      new Effect.Fade(form_element)
    }
  })
}

function unhideAll(){
  this.form.getElements().each( function(form_element, index) {
    new Effect.Appear(form_element)
  })
}


Element.addMethods(form_elements, {
  skip: function(element) {
    element.next('.form_element').focus()
  }
})

function checkConditions(){
  if (eval(this.readAttribute('condition')) == false) {
    this.skip()
  }
}

function observeForValidity(){
  reasonableMin = this.readAttribute('reasonableMin')
  reasonableMax = this.readAttribute('reasonableMax')
  absoluteMin = this.readAttribute('absoluteMin')
  absoluteMax = this.readAttribute('absoluteMax')
  if( (absoluteMin != null && this.value < absoluteMin) || (absoluteMax != null && this.value > absoluteMax) ){
    pauseAndFocus(this)
    message = $('message_'+this.identify());
    message.innerHTML = "Data is not in valid range: " + absoluteMin + "-" + absoluteMax 
    new Effect.Appear(message)
    new Effect.Highlight(this, {startcolor:'#ff0000', endcolor:'#ffffff', restorecolor: "#ffffff", duration: 5})
    new Effect.Fade(message, {delay: 5})
  } else if( (reasonableMin != null && this.value < reasonableMin) || (reasonableMax != null && this.value > reasonableMax) ){
    message = $('message_'+this.identify());
    message.innerHTML = "Data is not in reasonable range: " + reasonableMin + "-" + reasonableMax 
    new Effect.Appear(message)
    new Effect.Highlight(this, {startcolor:'#ffB6C1', endcolor:'#ffffff', restorecolor: "#ffffff", duration: 5})
    new Effect.Fade(message, {delay: 5})
  } 
}

function pauseAndFocus(element){
  // This is a hack to get around timing issues
  setTimeout("$('" + element.identify() + "').focus()", 1);
}

function puts(text){
  $('scratchlog').innerHTML += text + "<br/>"
}
