class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы купили билет')
  end

  def cancel_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: @user.email, subject: 'Вы успешно отменили билет')
  end
end
