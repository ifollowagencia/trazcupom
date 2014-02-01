class PdfticketController < ApplicationController
  def print
  	@offer = Offer.find(params[:idoffer])
    @code = Download.where("offer_id = ? AND user_id = ?", params[:idoffer], current_user.id)
    @regra = Rule.where("offer_id = ?", params[:idoffer])
    @notas = Note.where("offer_id = ?", params[:idoffer])
  end
end
