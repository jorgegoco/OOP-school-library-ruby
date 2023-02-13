require_relative 'menu'

def main
  puts 'Welcome to School library App!'
  menu = Menu.new
  menu.main_menu
end

main
