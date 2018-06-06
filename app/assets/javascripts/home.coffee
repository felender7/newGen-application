(($) ->

  $.fn.textition = (options) ->
    # ----------------
    # VARS
    # ---------------
    # options
    data = $.extend({
      map:
        x: 100
        y: 50
        z: 1000
      speed: 1
      animation: 'ease'
      handler: 'click'
      perspective: 300
      autoplay: false
      interval: 3
      element: this
    }, options)
    # vars
    div = this
    child = @children()
    letters = undefined
    index = 0
    position = {}
    playing = undefined
    # ----------------
    # UTILITY
    # ---------------
    # filter text

    filter = (val) ->
      switch val
        when ' '
          return '&nbsp;'
        else
          return val
      return

    # get position

    getPosition = ->
      span = child.first()
      position.top = span.offset().top - (div.offset().top)
      position.left = span.offset().left - (div.offset().left)
      position.width = span.width()
      return

    # random distance

    val = (val) ->
      Math.round(Math.random() * val) - (val / 2)

    # ----------------
    # BIND
    # ---------------
    # hide letters

    hide = ->
      x = 0
      y = 0
      z = 0
      for i of data.map
        switch i
          when 'x'
            x = val(data.map.x)
          when 'y'
            y = val(data.map.y)
          when 'z'
            z = val(data.map.z)
      $(this).css
        '-webkit-transform': 'translate3d(' + x + 'px, ' + y + 'px, ' + z + 'px)'
        '-moz-transform': 'translate3d(' + x + 'px, ' + y + 'px, ' + z + 'px)'
        '-ms-transform': 'translate3d(' + x + 'px, ' + y + 'px, ' + z + 'px)'
        '-o-transform': 'translate3d(' + x + 'px, ' + y + 'px, ' + z + 'px)'
        'transform': 'translate3d(' + x + 'px, ' + y + 'px, ' + z + 'px)'
      return

    # disappear

    disappear = (span) ->
      $(span).css('opacity', 0).children().each hide
      index++
      if index > child.length - 1
        index = 0
      return

    # show

    show = ->
      $(this).css
        '-webkit-transform': 'translate3d(0px, 0px, 0px)'
        '-moz-transform': 'translate3d(0px, 0px, 0px)'
        '-ms-transform': 'translate3d(0px, 0px, 0px)'
        '-o-transform': 'translate3d(0px, 0px, 0px)'
        'transform': 'translate3d(0px, 0px, 0px)'
      return

    # appear

    appear = (span) ->
      $(span).css('opacity', 1).children().each show
      return

    # run

    run = (e) ->
      if data.autoplay and e and !e.isTrigger
        clearInterval playing
        playing = setInterval(play, data.interval * 1000)
      disappear child[index]
      appear child[index]
      return

    # ----------------
    # CSS
    # ---------------
    # child style

    childStyle = ->
      $(this).css
        '-webkit-transform-style': 'preserve-3d'
        '-moz-transform-style': 'preserve-3d'
        '-ms-transform-style': 'preserve-3d'
        '-o-transform-style': 'preserve-3d'
        'transform-style': 'preserve-3d'
        '-webkit-transition': 'opacity ' + data.speed + 's ' + data.animation
        '-moz-transition': 'opacity ' + data.speed + 's ' + data.animation
        '-ms-transition': 'opacity ' + data.speed + 's ' + data.animation
        '-o-transition': 'opacity ' + data.speed + 's ' + data.animation
        'transition': 'opacity ' + data.speed + 's ' + data.animation
        'position': 'absolute'
        'display': 'block'
        'width': position.width
        'left': position.left
        'top': position.top
      return

    # div style

    divStyle = ->
      pos = div.css('position')
      div.css
        '-webkit-perspective': data.perspective + 'px'
        '-moz-perspective': data.perspective + 'px'
        '-ms-perspective': data.perspective + 'px'
        '-o-perspective': data.perspective + 'px'
        'perspective': data.perspective + 'px'
        'position': if `pos == 'static'` then 'relative' else pos
        'height': div.height()
        'width': div.width()
      return

    #	letter style

    letterStyle = ->
      $(this).css
        '-webkit-transition': '-webkit-transform ' + data.speed + 's ' + data.animation
        '-moz-transition': '-moz-transform ' + data.speed + 's ' + data.animation
        '-ms-transition': '-ms-transform ' + data.speed + 's ' + data.animation
        '-o-transition': '-o-transform ' + data.speed + 's ' + data.animation
        'transition': 'transform ' + data.speed + 's ' + data.animation
        'display': 'inline-block'
      return

    # ----------------
    # INITIALIZATION
    # ---------------
    # create letters

    createLetters = ->
      span = $(this)
      text = span.text()
      code = ''
      i = 0
      while i < text.length
        code += '<l>' + filter(text[i]) + '</l>'
        i++
      span.html code
      return

    # draw

    draw = ->
      other = child.not(':first')
      other.hide().css 'opacity', 0
      divStyle()
      child.each createLetters
      child.each childStyle
      letters = div.find('l')
      letters.each letterStyle
      other.show().children().each hide
      return

    # play

    play = ->
      run()
      return

    # init

    init = ->
      time = new Date
      getPosition()
      draw()
      if data.handler
        data.element.bind data.handler, run
      if data.autoplay
        playing = setInterval(play, data.interval * 1000)
      return

    # Run
    init()
    return

  return
) jQuery
