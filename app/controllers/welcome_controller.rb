class WelcomeController < ApplicationController
  def index
    @appInfo = {title: 'Welcome! this is a Test of Rails App', subtitle:'choose your destiny...'}
  end
end