require 'grape'
require 'form_robot'

class FormRobotAPIV1 < Grape::API
    version 'v1', :using => :path
    format :json

    desc 'Request a task'
    params do
        requires :instructions, type: Array, desc: 'Your instructions'
    end
    resource :tasks do
        post do
            robot = Robot.new
            instructions = params[:instructions]
            robot.carry_out(instructions)

            { :response => robot.last_response }
        end
    end
end
