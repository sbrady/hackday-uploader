require 'sinatra'

class Myapp < Sinatra::Base

get '/ls' do
  return `ls -al views`
end

get '/env' do
return ENV.inspect
end

 post "/upload" do
    puts params.inspect

    create_file(".."/+params[:path],params['filedata'][:filename].split('.').last)

    File.open("../"+params[:path]+"/"+params['filedata'][:filename], "w") do |f|
      f.write(params['filedata'][:tempfile].read)
    end
    return "The file was successfully uploaded!"
  end

require 'fileutils'

def create_file(path, extension)
  #dir = File.dirname(path)

  #if File.directory?(dir)
    puts "made the dir"
    FileUtils.mkdir_p(path)
  #end

  #path << ".#{extension}"
  #File.new(path, 'w')
end

end



