# from http://databasically.com/2010/09/19/converting-erb-to-haml-in-rails3/
class ConvertToHaml
  def initialize
    @from_path = File.join(File.dirname(__FILE__), 'app', 'views')
  end
  
  def convert!
    Dir["#{@from_path}/**/*.erb"].each do |file|
      puts file
      # for each .erb file in the path, convert it & output to a .haml file
      `bundle exec html2haml -ex #{file} #{file.gsub(/\.erb$/, '.haml')}`
    end
  end
end

ConvertToHaml.new.convert!