addToDoc = (doc, s) ->
  head = doc.getElementsByTagName("head")[0]
  if onload
    head.appendChild(s)
  else
    doc.body.appendChild(s)

importJS = (el, src, look_for, onload) ->
  doc = el.document
  s = doc.createElement("script")
  s.setAttribute("type", "text/javascript")
  s.setAttribute("src", src)
  if onload
    wait_for_script_load(el,look_for, onload)
  addToDoc(doc, s)

importCSS = (el, href, look_for, onload) ->
  doc = el.document
  s = doc.createElement("link")
  s.setAttribute("rel", "stylesheet")
  s.setAttribute("type", "text/css")
  s.setAttribute("media", "screen")
  s.setAttribute("href", href)
  if onload
    wait_for_script_load(el, look_for, onload)
  addToDoc(doc, s)

wait_for_script_load = (el, look_for, callback) ->
  interval = setInterval (() ->
    unless el.eval("typeof " + look_for) is "undefined"
      clearInterval(interval)
      callback()), 50

jQuery () ->
  if $("body.proxy").length > 0
    page = document.getElementById('page').contentWindow
    importCSS page, "https://dv0akt2986vzh.cloudfront.net/stable/lib/selectorgadget.css"
    importJS page, "https://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js", "jQuery", () ->
      jQuery.noConflict()
      importJS page, "https://dv0akt2986vzh.cloudfront.net/stable/vendor/diff/diff_match_patch.js", "diff_match_patch", () ->
        importJS page, "https://dv0akt2986vzh.cloudfront.net/stable/lib/dom.js", "DomPredictionHelper", () ->
          importJS page, "https://dv0akt2986vzh.cloudfront.net/stable/lib/interface.js"
