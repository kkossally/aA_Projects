require 'active_support'
require 'active_support/inflector'
require 'active_support/core_ext'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req # should this be req = Rack::Request.new(env)? No! b/c the app sets req and res variables before instantiating MyController
    @res = res # should this be res = Rack::Response.new? 
    # @already_built_response = false # we don't need to set this here b/c calling it will return nil, which is falsey
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    unless already_built_response?
      res.status = 302
      # res['Content-Type'] = content_type ???
      res.location = url
      @already_built_response = true
      session.store_session(@res)
    else
      fail 'double render'
    end
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    unless already_built_response?
      res['Content-Type'] = content_type
      res.write(content)
      @already_built_response = true
      session.store_session(@res)
    else
      fail 'double render'
    end
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    # controller_directory = File.dirname(__FILE__)

    # template_file = File.join("#{controller_directory}", "views", "#{self.class.to_s.underscore}", "#{template_name}.html.erb")
    
    template_file = "views/#{self.class.to_s.underscore}/#{template_name}.html.erb"
    content = ERB.new( File.read(template_file) ).result(binding)
    render_content(content, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

