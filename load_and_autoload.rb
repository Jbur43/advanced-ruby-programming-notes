$LOAD_PATH.unshift("./concerns")
# require will only load the file once, no matter how many
# times you require a file
# require "flename"

# load will load it as many times as it is required
# load also looks for files in $LOAD_PATH like require.
# load use case would be rails where you want to reload the files
# in development when a new request comes into your app.
# load "filename"

# require and load will load the files immediately

# this method will predefine the Authentication
# constant for us and whenever it is accessed is when
# it will load the authentication.rb file. So you are delaying
# the load or require until it is actually used.
# It will only load it once
# this method expects you to pass in a filename, which is why rails
# uses a different mechanism for autoloading (next vid)
autoload :Authentication, "authentication.rb"

Authentication