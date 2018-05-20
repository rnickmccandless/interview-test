# frozen_string_literal: true

# Public: Top-Level Mailer Class
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
