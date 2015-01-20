module ApplicationHelper
  # Generates HTML block for buttons adjusted to inputs offset.
  #
  # Examples:
  #
  #   = simple_form_for resource, :html => { class: 'form-horizontal' }, :wrapper => :horizontal_form do
  #     = f.input :email
  #     = f.input :password
  #     = horizontal_form_buttons do
  #       = f.submit 'Log in', :class => 'btn btn-default'
  #
  def horizontal_form_buttons(&block)
    content_tag(:div, :class => 'form-group') do
      content_tag(:div, :class => 'col-sm-offset-4 col-sm-8') do
        capture(&block)
      end
    end
  end

  # Generates HTML wrapper for device forms.
  #
  # Examples:
  #
  #   = device_form 'Log in' do
  #     = simple_form_for resource, ...
  #
  #     = render 'devise/shared/links'
  #
  def device_form(title, &block)
    content_tag(:div, :class => 'panel panel-default device-form') do
      html = content_tag(:div, :class => 'panel-heading') do
        content_tag(:div, title, :class => 'panel-title')
      end

      html << content_tag(:div, :class => 'panel-body') do
        capture(&block)
      end

      html.html_safe
    end
  end
end
