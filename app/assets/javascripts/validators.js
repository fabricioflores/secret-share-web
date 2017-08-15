window.ClientSideValidations.callbacks.element.after = function(element, message) {
  var id = element.attr('id');

  if (id === 'secret_available') {
    var $form = element.closest('form');
    var validators = $form[0].ClientSideValidations.settings.validators;
    var $input = $('#secret_needed');
    $input.isValid(validators);
    $input.trigger('focusout');
  }
}
