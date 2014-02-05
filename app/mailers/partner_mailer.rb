class PartnerMailer < ActionMailer::Base
  default from: "trazcupom@ifollowagencia.com.br"

  
  def send_ticket(idoffer,idestablishment, iduser)
  @establishment_email = Establishment.find(idestablishment)
  @offer_title = Offer.find(idoffer)
  @user = User.find(iduser)
  mail to: @establishment_email.email, bcc: @user.email ,subject: "Parabéns acabaram de  realizar o download do Voucher: #{@offer_title.name}"
  end
end
