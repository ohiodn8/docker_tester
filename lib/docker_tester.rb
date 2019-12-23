require "docker_tester/version"
require 'docker-api'

module DockerTester
  class Error < StandardError; end
  class Engine < ::Rails::Engine
    isolate_namespace DockerTester
    if defined?(Rails::Server)
      ## Docker Api Check b4 Start-Up 
      config.after_initialize do
        if OS.windows?
        else    
          puts "*** Docker Version Check via docker-api gem ***"   
          docker_version = Docker.version.present?	
          if docker_version != true	
			system "kill -INT $(cat tmp/pids/server.pid)"				
			puts "*** DOCKER API NOT DETECTING DOCKER ***" 
		  else
		    print "Docker_URL: "
		    puts Docker.url
			puts "* * *"
			puts "**Starting GlueBelt Git Server Container**"
			image = Docker::Image.create('fromImage' => 'qii404/git-server:latest')
			container = Docker::Container.create(
			  'name' => 'gluebelt-git-server',
			  'Image' => 'qii404/git-server:latest',
			  'ExposedPorts' => { '22/tcp' => {} },
			  'HostConfig' => {
				'PortBindings' => {
				  '22/tcp' => [{ 'HostPort' => '2022' }]
				}
			  }
			)
			container.start 
			
			
		  end
			
        end    
      end 
    end 
  end
end
