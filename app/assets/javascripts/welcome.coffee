$ ->
  $('.ui.sidebar')
    .sidebar('attach events', '.toc.item')

  $('.masthead')
    .visibility(
      once: false
      onBottomPassed: () ->
        $('.borderless.menu').transition('fade in')
      onBottomPassedReverse: () ->
        $('.borderless.menu').transition('fade out')
  )

  $('.ui.form.contactForm')
    .form(
      fields:
        first_name:
          identifier: 'first_name',
          rules: [
              type   : 'empty',
              prompt : 'Please enter your name'
          ],
        last_name:
          identifier: 'first_name',
          rules: [
              type   : 'empty',
              prompt : 'Please enter your name'
          ],
        email:
          identifier: 'email',
          rules: [
              type   : 'empty',
              prompt : 'Please enter your email'
          ],
        subject:
          identifier: 'subject',
          rules: [
              type   : 'empty',
              prompt : 'Please enter your subject'
          ],
        message:
          identifier: 'message',
          rules: [
              type   : 'empty',
              prompt : 'Please enter your message'
          ]
  )