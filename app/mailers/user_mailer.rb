class UserMailer < ApplicationMailer
  require 'mandrill'

  DEFAULT_FROM_EMAIL = 'admin@mataemonline.com'.freeze
  MANDRILL = Mandrill::API.new(Rails.application.secrets.mandrill_apikey)

  def registration_email(user)
    options = {
      subject: 'Registration',
      email: user.email,
      global_merge_vars: [
       {
         name: 'name',
         content: user_name(user),
       },
      ],
      template_name: 'user-registration',
    }

    mandrill_send options
  end

  def reset_password(user, reset_link)
    options = {
      subject: 'Forgot Your Password',
      email: user.email,
      global_merge_vars: [
       {
          name: 'name',
          content: user_name(user),
       },
       {
          name: 'reset_link',
          content: reset_link,
       }
      ],
      template_name: 'forgot-password',
    }

    mandrill_send options
  end

  def order_processing(user, order_id, status)
    order_statuses = {
      accept: { subject: 'Order Confirmation', template_name: 'order-confirmation' },
      reject: { subject: 'Order Failure', template_name: 'order-failure'},
      mark_out_for_delivery: { subject: 'Order Delivery', template_name: 'order-delivery'},
    }
    order = order_statuses[status.to_sym]
    options = {
      subject: order[:subject],
      email: user.email,
      global_merge_vars: [
       {
          name: 'name',
          content: user_name(user),
       },
       {
          name: 'order_id',
          content: order_id,
       },
       {
          name: 'order_link',
          content: 'http://mataemonline.com/',
       },
      ],
      template_name: order[:template_name],
    }

    mandrill_send options
  end

  private

  def user_name(user)
    (user.full_name.present? ? user.full_name : user.email.split('@').first).strip.titleize
  end

  def mandrill_send(opts = {})
    message = {
      subject: "#{opts[:subject]}",
      from_name: 'Mataemonline',
      from_email: DEFAULT_FROM_EMAIL,
      to: [{'email' => "#{opts[:email]}", 'type' => 'to'}],
      host: 'smtp.mandrillapp.com',
      port: 587,
      username: Rails.application.secrets.mandrill_username,
      password: Rails.application.secrets.mandrill_apikey,
      global_merge_vars: opts[:global_merge_vars]
    }
    MANDRILL.messages.send_template opts[:template_name], [], message
  rescue Exception => e
    ExceptionNotifier.notify_exception(e)
  end

end
