# The path to Ruby Enlightenment starts with the following:

$LOAD_PATH << File.dirname(__FILE__)

require 'about_asserts'               #DONE
require 'about_nil'                   #DONE
require 'about_objects'               #DONE
require 'about_arrays'                #DONE
require 'about_array_assignment'      #DONE
require 'about_hashes'                #DONE
require 'about_strings'               #DONE
require 'about_symbols'               #DONE
require 'about_regular_expressions'   #DONE
require 'about_methods'               #DONE
in_ruby_version("2") do
  require 'about_keyword_arguments'   #DONE
end
require 'about_constants'             #DONE
require 'about_control_statements'    #DONE
require 'about_true_and_false'        #DONE
require 'about_triangle_project'      #DONE
require 'about_exceptions'            #DONE
require 'about_triangle_project_2'    #DONE
require 'about_iteration'             #DONE
require 'about_blocks'                #DONE
require 'about_sandwich_code'         #DONE
# require 'about_scoring_project'           #SKIPPED for the minute
require 'about_classes'               #DONE
require 'about_open_classes'          #DONE
require 'about_dice_project'          #DONE
require 'about_inheritance'           #DONE
require 'about_modules'               #DONE
require 'about_scope'                 #DONE
require 'about_class_methods'         #DONE
require 'about_message_passing'       #DONE
# require 'about_proxy_object_project'      #NOPE NOPE NOPE
require 'about_to_str'                #DONE
in_ruby_version("jruby") do
  require 'about_java_interop'        #Guess I don't have to do?
end
require 'about_extra_credit'
