#encoding: utf-8
class PartnerController < ApplicationController
  
  def login
  	
  	if session[:user]
  		respond_to do |format|
  		format.html {redirect_to :controller=>'partner', :action => 'dashboard', :id => session[:user], :notice => 'Conexão realizada com sucesso!' }
  		end
  	end
  
  end

  def partner_auth

  	email = params[:email]
  	password = params[:password]

  	@search_partner = Establishment.where("email = ? AND password = ?", params[:email], params[:password])
  	
  	respond_to do |format|

  	if @search_partner.count == 1
  		@search_partner.each do |p|
  			@id = p.id
  		end
  		format.html {redirect_to :controller=>'partner', :action => 'dashboard', :id => @id, :notice => 'Conexão realizada com sucesso!' }

  	else
  		flash[:notice] =  'Usuário não encontrado!'
  		format.html { 
        redirect_to :controller=>'partner', :action => 'login'
         }

  	end
  end
  end

  def dashboard
  	@id = params[:id]
  	# salvando variavel de sessão
  	session[:user] = @id

  	@partner = Establishment.find(session[:user])

  end

  def destroy_user
  	@user = session[:user] = nil

  	redirect_to :controller => 'partner', :action => 'login'

  end

end
