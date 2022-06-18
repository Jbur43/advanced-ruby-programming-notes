# $LOAD_PATH << "./"
p $LOAD_PATH.prepend("./")
require "refinements"

# $LOAD_PATH is an env variable with a list of folders where it will
# look for files to load in the order of the array items. So if
# we add something to $LOAD_PATH you may want to preprend it to the list
# so it is looked for first.

# You can always load the absolute path of a file, but you would normally
# modify the load path.
require "./refinements"

# this is typically used to require a file in the same directory
# this method will basically add the ./ to the file path passed to it.
# again typically you would opt to modify load path over using require_relative
require_relative "splat.rb"

# The variables below can be used to grab this information, loop through the files

# This will print the file name the variable is run as
p __FILE__
# => "require_and_relative.rb"

# This will print the path of the current directory
p __dir__
# => "/Users/jack.burum/dev-study-and-practice/advanced-ruby-programming"

require_relative "splat" # is equal to:
require "#{__dir__}/splat"


