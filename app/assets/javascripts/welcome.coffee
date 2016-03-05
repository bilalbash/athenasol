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
      onSuccess: (e,f) ->
        e.preventDefault()
        $('.ui.form.contactForm').addClass('loading')
        returnRequest = $.get "https://bilalbash.herokuapp.com/email_post",
          message: $('#message', '.ui.form.contactForm').val(),
          subject: $('#subject', '.ui.form.contactForm').val(),
          email: $('#email', '.ui.form.contactForm').val()
        returnRequest.done (data) ->
          console.log('message sent')
          $('.ui.form.contactForm').removeClass('loading')
          $('.field-js', '.ui.form.contactForm').addClass('disabled')
          alert('Message has been sent successfully')

        returnRequest.fail (data) ->
          console.log('server error')

      fields:
        first_name:
          identifier: 'first_name',
          rules: [
              type   : 'empty',
              prompt : 'Please enter your first name'
          ],
        last_name:
          identifier: 'last_name',
          rules: [
              type   : 'empty',
              prompt : 'Please enter your last name'
          ],
        email:
          identifier: 'email',
          rules: [
              type   : 'empty',
              prompt : 'Please enter your email'
          ,
              type   : 'email',
              prompt : 'Please enter a valid email'
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
