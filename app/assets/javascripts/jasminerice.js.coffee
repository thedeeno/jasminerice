#=require jasmine
#=require jasmine-html
#=require jasmine-jquery-1.3.1

(->
  execJasmine = ->
    jasmineEnv.execute()
  jasmineEnv = jasmine.getEnv()
  jasmineEnv.updateInterval = 1000

  window.jsApiReporter = new jasmine.JsApiReporter()
  htmlReporter = new jasmine.HtmlReporter()

  jasmineEnv.addReporter htmlReporter
  jasmineEnv.addReporter jsApiReporter

  jasmineEnv.specFilter = (spec) ->
    htmlReporter.specFilter spec

  currentWindowOnload = window.onload
  window.onload = ->
    currentWindowOnload()  if currentWindowOnload
    execJasmine()
)()
