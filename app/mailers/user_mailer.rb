class UserMailer < ActionMailer::Base
  default from: "trazcupom@ifollowagencia.com.br"

  def download_ticket(idoffer, idestablishment, iduser)
    @establishment_email = Establishment.find(idestablishment)
    @offer_title = Offer.find(idoffer)
    @user = User.find(iduser)
    mail to: @user.email, bcc: @user.email ,subject: "Parabéns você acaba de realizar o download do Voucher: #{@offer_title.name}"
  end

end
