# frozen_string_literal: true

# Public: General Application Helper
module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice
      'alert alert-primary'
    when :success
      'alert alert-success'
    when :error, :alert
      'alert alert-danger'
    else
      'alert alert-secondary'
    end
  end
end
