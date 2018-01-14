SimpleForm.setup do |config|
  config.error_notification_class = 'ui error message'
  config.button_class = 'ui blue submit button'
  config.boolean_label_class = nil
  config.form_class = 'ui form'

  config.wrappers :horizontal_form, tag: 'div', class: 'field', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label
    b.use :input
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.default_wrapper = :horizontal_form
end
