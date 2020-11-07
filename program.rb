def generate_name(index)
  index < 9 ? "0#{index}.jpg" : "#{index}.jpg"
end

require 'FileUtils'

puts 'Please enter the absolute path from where you want to copy'
copy_path = gets.chomp
puts 'Please enter the target path'
target_path = gets.chomp

pic_names = Dir["#{copy_path}/**/*.{JPEG,JPG,jpeg,jpg}"]

Dir.chdir target_path

puts "Copying #{pic_names.length}"

pic_names.each.with_index(1) do |pic_name, index|
  print '.' # progress bar
  new_name = generate_name(index)
  if File.exists?(new_name)
    raise "Stopped on overwriting, file #{new_name} already exists!"
  else
    FileUtils.cp pic_name, new_name
  end
end

puts
puts "All pictures copied!"
