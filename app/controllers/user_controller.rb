class UserController < ApplicationController
	before_action :require_login, except: [:login, :register, :create, :loginUser]
	# before_action :require_correct_user, only: [:index, :edit, :patch, :destroy]

  	def create
	
		@person = Person.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
	    if @person.save
	    	session[:id] = @person.id
		# if params[:name] != '' or params[:email] != '' or params[:password] != '' or params[:confirm_password] != ''
		# 	Person.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  			redirect_to '/user/' +session[:id].to_s
		else
			flash[:error] = ["can't be blank", "invalid"]
			render '/user/register'
		end
	end

  	def loginUser
  		session[:id] = nil
		@person = Person.find_by(email: params[:email])
		if @person && @person.authenticate(params[:password])
			session[:id] = @person.id
			redirect_to '/user/' +session[:id].to_s
		else
			flash[:error] = ["Invalid"]
			redirect_to '/user/login'
		end
	end
	def index
		@person = Person.find(session[:id])
	end

	def destroySession
		session[:id] = nil
		redirect_to '/user/login'
	end

	def edit
		@person = Person.find(session[:id])
	end

	def patch
		person = Person.find(session[:id])
		person.update(name: params[:name], email: params[:email])
		redirect_to '/user/' +session[:id].to_s
	end

	def destroyAccount
		person = Person.find(session[:id])
		person.destroy
		redirect_to 'user/destroySession'
	end

	def secrets
		@secrets = Secret2.all
	end

	def createSecret
		person = Person.find(session[:id])
		person.secret2s.create(content: params[:new_secret])
		redirect_to '/user/' +session[:id].to_s
	end

	def deleteSecret
		secret = Secret2.find(params[:id])
		secret.destroy
		redirect_to '/user/' +session[:id].to_s
	end

	def likes
		person = Person.find(session[:id])
		Like2.create(person_id: person.id,secret2_id: params[:secret2_id])
		redirect_to '/secrets'
	end

	def unlike
		Like2.find_by(secret2_id: params[:like2_id]).destroy
		redirect_to '/secrets'
	end
end
