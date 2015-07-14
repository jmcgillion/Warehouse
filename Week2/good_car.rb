class GoodCar

	attr_accessor :model, :year, :color

def initialize(model, year, color)
  	model = model
  	year = year
  	color = color
  end

  def test_drive
  	"We are driving a #{year} #{model} that is looking pretty good in #{color}!"
  end


  def change_info(model, year, color)
  	self.model = model
  	self.year = year
  	self.color = color
  end
end


toy = GoodCar.new('4-Runner', 2012, 'black')

toy.change_info('LandCruiser', 2015, 'grey')

puts toy.test_drive




















