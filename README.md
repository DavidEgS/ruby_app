Log Summary Script

A script to read a file given with name given as command line argument and present the data sumarised
and ordered.

RUNNING THE PROGRAM

Begin by placing the file you wish to call in the ruby_app folder
to call in your command line type 'ruby lib/app.rb YOUR_FILE_NAME.log'
you can use  asecond option argument to generate a csv of the data as well
type 'ruby lib/app.rb YOUR_FILE_NAME.log --csv'
The order important filename first csv options second
You can use a file in a different location by supplying the full file path in the command line argument.


STRUCTURE

app.rb holds a script and uses a single class in an asscoiated file.
Calling app the script initalizes the class and calls the methods to create an output
of the summary in the command line.

GEMS

No gems are used so it is easily called with ruby

Tests though are done with rspec in the spec folder. Using these will require the rspec gem installed which I haven't included here.
This is my first attempt at writing rspec tests any feedback would be appreciated. I have built them for the public methods with my test data
and worked towards passing them. I haven't written checks on the private methods.

WARNING

v1 is currently misisng data validation this will not check if your log file has good formats
and won't raise errors or skip poor data.
