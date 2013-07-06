module ApplicationHelper

  def form_for model, options
    options[:url] = ''
    super(model, options)
  end

end
