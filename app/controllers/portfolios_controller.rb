class PortfoliosController < ApplicationController
  
  layout 'portfolio'
  
  def index
    @port = Portfolio.all
  end
  
  def angular
    @angular_port = Portfolio.angular
  end

  
  def new
    @port = Portfolio.new
    3.times { @port.technologies.build }
  end
  
  def create
    @port = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @port.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit 
    @port = Portfolio.find(params[:id])
    
  end
  
  def update
    @port = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @port.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show
    @port = Portfolio.find(params[:id])
  end
  
  def destroy
    @port = Portfolio.find(params[:id])
    @port.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
    end
  end

  private
  
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                      )
  end
  
  

end
