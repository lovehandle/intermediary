window.MySelectorGadget = class MySelectorself

  SELECTED_CLASS:  "sg_selected"
  SUGGESTED_CLASS: "sg_suggested"
  REJECTED_CLASS:  "sg_rejected"

  selected: []
  rejected: []
  prediction_helper: new PathPredictor()
  restricted_elements: $.map([ "html", "body", "head", "base" ], (selector) -> $(selector).get(0))

  initialize: () ->
    @setup_event_handlers()

  setup_event_handlers: () ->
    $("a").on "click",      { self: @ }, @on_click_a
    $("*").on "mouseover",  { self: @ }, @on_mouseover
    $("*").on "mousedown",  { self: @ }, @on_mousedown
    $("*").on "mouseout",   { self: @ }, @on_mouseout
    $("html").on "keyup",   { self: @ }, @on_keyup
    $("html").on "keydown", { self: @ }, @on_keydown

  on_keyup: (e) ->
    self = e.data.self

  on_keydown: (e) ->
    self = e.data.self
    if e.keyCode == 27
      self.reset()

  reset: () ->
    for s in @selected
      $(s).removeClass(@SELECTED_CLASS)
    @selected = []


  on_click_a: (e) ->
    e.preventDefault()

  on_mouseover: (e) ->

  on_mousedown: (e) ->
    e.stopPropagation()
    self = e.data.self
    return false if el == document.body || el == document.body.parentNode
    el  = @
    $el = $(el)

    potential_el = self.first_selected_or_suggested_parent(el)

    if potential_el != null && potential_el != el
      el = potential_el
      $el = $(el)

    if $el.hasClass(self.SELECTED_CLASS)
      $el.removeClass(self.SELECTED_CLASS)
      self.selected.splice($.inArray(el, self.selected), 1)
    else if $el.hasClass(self.REJECTED_CLASS)
      $el.removeClass(self.REJECTED_CLASS)
      self.rejected.splice($.inArray(el, self.rejected), 1)
    else if $el.hasClass(self.SUGGESTED_CLASS)
      $el.addClass(self.REJECTED_CLASS)
      self.rejected.push(el)
    else
      $el.addClass(self.SELECTED_CLASS)
      self.selected.push(el)

    suggested = self.get_suggested()

  on_mouseout: (e) ->

  first_selected_or_suggested_parent: (el) ->
    return el if $(el).hasClass(@SUGGESTED_CLASS) || $(el).hasClass(@SELECTED_CLASS)
    while el.parentNode and (el = el.parentNode)
      if $.inArray(el, @restricted_elements) == -1
        return el if $(el).hasClass(@SUGGESTED_CLASS) || $(el).hasClass(@SELECTED_CLASS)
    null

  get_suggested: () ->
    @prediction_helper.predictCss($(@selected), $(@rejected.concat(@restricted_elements)))

