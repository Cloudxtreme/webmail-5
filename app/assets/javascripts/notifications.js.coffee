#= require bootstrap_notify

class @Notifications
  DEFAULT_OPTIONS = { type: 'info', closable: true, fadeOut: { enabled: true, delay: 5000 } }

  @container: () ->
    @_container ||= $('#flash_messages')

  @message: (text, options = {}) ->
    notification_options = $.extend({}, { message: { text: text } }, options)
    @container().notify($.extend({}, DEFAULT_OPTIONS, notification_options)).show()

  @notice: (text, options = {}) ->
    @message(text, $.extend({}, options, { type: 'success' }))

  @info: (text, options = {}) ->
    @message(text, $.extend({}, options, { type: 'info' }))

  @warning: (text, options = {}) ->
    @message(text, $.extend({}, options, { type: 'warning' }))

  @alert: (text, options = {}) ->
    @message(text, $.extend({}, options, { type: 'danger' }))

  @displayFlash: (noticeMessage, alertMessage) ->
    @notice(noticeMessage) if noticeMessage?.length > 0
    @alert(alertMessage) if alertMessage?.length > 0
