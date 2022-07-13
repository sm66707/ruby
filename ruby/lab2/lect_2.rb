#!/usr/bin/env ruby
#How to Rescue Exceptions in Ruby
# In Ruby, all exceptions and errors are extensions of the Exception class
# the begin-rescue is a code block that can be used to deal with raised exceptions
# without interrupting program execution.
# In other words, you can begin to execute a block of code,
# and rescue any exceptions that are raised.

# Rescuing Exceptions

=begin
By default, begin-rescue rescues every instance of the StandardError class.
This includes no method errors, type errors, runtime errors,
and every custom error that is intended to be rescued within
a Ruby application
begin
  # ...
rescue => e
  # ...
end

When a StandardError exception is raised within the begin block,
an instance of it will be passed to the rescue block as the variable e
=end

# Rescuing Specific Exceptions
# to specifically rescue StandardError exceptions
# if we wanted to rescue all argument errors
# begin
#   # ...
# rescue ArgumentError => e
#   # ...
# end

# if we want to rescue more than one exception type? Much like an if-elsif-else chain

# begin
#   # ...
# rescue ArgumentError => e
#   # ...
# rescue TypeError => e
#   # ...
# rescue => e
#   # ...
# end

# Rescuing All Exceptions
# begin
#   # ...
# rescue Exception => e
#   # ...
# end

#  How to check Ruby syntax to identify exceptions
# begin
#     # may raise an exception
# rescue AnException
#     # exception handler
# rescue AnotherException
#     # exception handler
# else
#     # other exceptions
# ensure
#     # always executed
# end

# begin
#    file = open("/tmp/myfile")
# rescue Errno::ENOENT
#    p "File not found"
# else
#    p "File opened"
# end


# begin
#    raise 'A test exception.'
# rescue Exception => e
#    puts e.message
#    puts e.backtrace.inspect
# end


# begin
#     # may raise an exception
#     # exception handler
#     # 2/0
#     x = 3
# rescue => e
#     p "---", e
#     p "====", e.message
# else
#     p "No exception happened."
# ensure
#     # always executed
#     p "Finally always executed."
# end


# begin
#     # may raise an exception
#     # exception handler
#     2/0
#     # x = 3
# rescue Exception => e
#     p "---", e
#     puts e.message
#     puts e.backtrace.inspect
# else
#     p "No exception happened."
# ensure
#     # always executed
#     p "Finally always executed."
# end



#=========FILE===========#

# The File.new Method
# aFile = File.new("filename", "mode")
#    # ... process the file
# aFile.close

# The File.open Method
=begin
You can use File.open method to create a new file object
and assign that file object to a file. However,
there is one difference in between
File.open and File.new methods.
The difference is that the File.open method can be associated with a block,
whereas you cannot do the same using the File.new method.
=end

# File.open("filename", "mode") do |aFile|
#    # ... process the file
# end


# read
# The sysread Method
# You can use the method sysread to read the contents of a file.
#You can open the file in any of the modes when using the method sysread.
# aFile = File.new("ruby.txt", "r")
# if aFile
#    content = aFile.sysread(20)
#    puts content
# else
#    puts "Unable to open file!"
# end

# The syswrite Method
# You can use the method syswrite to write the contents into a file.
# aFile = File.new("write.txt", "r+")
# if aFile
#    aFile.syswrite("ABCDEF")
# else
#    puts "Unable to open file!"
# end

# The each_byte Method
#  The method each_byte is always associated with a block.
# aFile = File.new("write.txt", "r+")
# if aFile
#    # aFile.syswrite("sss")
#    aFile.each_byte {|ch| putc ch; putc ?. }
# else
#    puts "Unable to open file!"
# end

#The IO.readlines Method
# The class File is a subclass of the class IO.
# The class IO also has some methods, which can be used to manipulate files.
# This method returns the contents of the file line by line.
# arr = IO.readlines("ruby.txt")
# puts arr[0] # first line
# puts arr[1] # second line

# The IO.foreach Method
# IO.foreach("ruby.txt"){|block| puts block}

# examples with methods
# open file
# file = File.open("ruby.txt")
# # file_data = file.read
# # p file_data
# # puts file_data.split
# file_data = file.readlines.map(&:chomp)
# puts file_data
#
# # When you’re done working with a file you want to close it to free up memory & system resources.
# file.close
#
# # As an alternative to having to open & close the file, you can use the File.read method:
# file_data = File.read("ruby.txt").split
# puts file_data

# If you want to process a file one line at a time, you can use the foreach method.
# File.foreach("ruby.txt") { |line| puts line }

# Write to a File in Ruby

# Open the file in write mode (“w” flag)
# File.open("write.txt", "w") { |f| f.write "#{Time.now} - User logged in\n" }

# If you want to add new content to the file, use the “a” (append) flag, instead of the “w” (write) flag.
# One shortcut is to use File.write:
# File.write("ruby.txt", "data...", mode: "a")

# If you want to write an array to a file you’ll have to convert it into a string first.
# File.write("write.txt", [1,2,3].join("\n"), mode: "a")

# Ruby File Methods
# Renaming a file
# File.rename("old-name.txt", "new-name.txt")

# File size in bytes
# File.size("ruby.txt")
# #
# # # Does this file already exist?
# File.exists?("write.txt")
# #
# # # Get the file extension, this works even if the file doesn't exists
# File.extname("ruby.txt")
# # # => ".txt"
# #
# # # Get the file name without the directory part
# File.basename("lab_1.pdf")
# # # => "ebook.pdf"
# #
# # # Get the path for this file, without the file name
# File.dirname("lab_1.pdf")
# # # => "/tmp"
# #
# # # Is this actually a file or a directory?
# # File.directory?("cats")


# def find_files_in_current_directory
#   entries = Dir.entries(".")
#   entries.reject { |entry| File.directory?(entry) }
# end
# puts find_files_in_current_directory


# Directory Operations
# Using Dir.glob you can get a list of all the files that match a certain pattern.
# All files in current directory
# puts Dir.glob("*")
#
# # All files containing "spec" in the name
# puts Dir.glob("*spec*")
#
# # All ruby files
# p Dir.glob("*.rb")
#
# # This one line of code will recursively list all files in Ruby, starting from the current directory:
# # puts Dir.glob("**/**")
# puts Dir.glob("**/**/")
# puts Dir.pwd
#
# Dir.mkdir("/tmp/testing")

# How to Use The FileUtils Module check self study


#-------------------------OOP----------------------------------#

# define class -> class keyword name of class and end keyword
# class Box
#    #code
# end
# #
# # # The name must begin with a capital letter and
# # # by convention names that contain more than one word are run together
# # # with each word capitalized and no separating characters (CamelCase).
# #
# # # Define Ruby Objects
# #
# box1 = Box.new
# p box1
# # box2 = Box.new

#The initialize Method

# constructor

# class Box
#    def initialize
#      puts "constructor called"
#    end
# end
# box1 = Box.new

# The instance Variables
# class Box
#    def initialize(w,h)
#       # assign instance variables
#       @width, @height = w, h
#    end
# end
#
# b1 = Box.new(4, 4)

# They are accessed using the @ operator within the class but to access them outside of the class we use public methods, which are called accessor methods

#They are accessed using the @ operator within the class but
#to access them outside of the class we use public methods,
#which are called accessor methods

#The accessor & setter Methods
# To make the variables available from outside the class, they must be defined within accessor methods, these accessor methods are also known as a getter methods

# define a class
# class Box
# #    # constructor method
#    def initialize(w,h)
#       @width, @height = w, h
#    end
# #
# #    # accessor methods
#    def printWidth
#       @width
#    end
# #
#    def printHeight
#       @height
#    end
# end
# #
# # # create an object
# box = Box.new(10, 20)
# #
# # # use accessor methods
# x = box.printWidth()
# y = box.printHeight()
# #
# puts "Width of the box is : #{x}"
# puts "Height of the box is : #{y}"

# Ruby provides a way to set the values of those variables from outside of the class using setter methods
# define a class
# class Box
#    # constructor method
#    def initialize(w,h)
#       @width, @height = w, h
#    end
#
#    # accessor methods
#    def getWidth
#       @width
#    end
#    def getHeight
#       @height
#    end
#
#    # setter methods
#    def setWidth=(value)
#       @width = value
#    end
#    def setHeight=(value)
#       @height = value
#    end
# end
# #
# # # create an object
# box = Box.new(10, 20)
# #
# # # use setter methods
# box.setWidth = 30
# box.setHeight = 50
# #
# # # use accessor methods
# x = box.getWidth()
# y = box.getHeight()
# #
# #
# puts "Width of the box is : #{x}"
# puts "Height of the box is : #{y}"


# class Book
#   # attr_reader :title, :author
#   # attr_writer :title, :author
#   attr_accessor :title, :author
#   def initialize(title, author)
#     @title  = title
#     @author = author
#   end
# end
# #
# deep_dive = Book.new("Ruby Deep Dive", "Hola Castello")
# fun = Book.new("Fun With Programming", "White Cat")
# p deep_dive.author
# deep_dive.author = ''
# p deep_dive.author

# This attr_reader is like opening a window so people can peer into the object & get the data they want.
# There is nothing special about this, an attr_reader is a shortcut for writing an accessor method like this one


    # attr_reader (read-only)
    # attr_writer (write-only)
    # attr_accessor (read & write)

# The instance Methods
# define a class
# class Box
#    # constructor method
#    def initialize(w,h)
#       @width, @height = w, h
#    end
#    # instance method
#    def getArea
#       @width * @height
#    end
# end
#

# attr_writer or attr_accessor you can change the value of instance variables outside the class.

# # create an object
# box = Box.new(10, 20)
# #
# # # call instance methods
# a = box.getArea()
# puts "Area of the box is : #{a}"

# The class Methods and Variables @@
# A class variable must be initialized within the class definition as shown below.


# self keyword
# It’s a Ruby keyword that gives you access to the current object.
# This “current object” depends on the context.
# context, the context is where your code is at any given moment.

# def coffee
#   puts self
# end
# coffee # main

# main Because it’s the name of the top-level object,
# it’s an object where you’ll find all the methods defined outside a class.


# But if you define a method inside a class named Cat,
# then self would be a Cat object.
# class Cat
#   def meow
#     puts self
#   end
# end
# #
# Cat.new.meow
# we can tell that the value of self changes depending on where you use it.

#Using Self For Disambiguation
#One practical use for self is to be able to tell the difference between a method & a local variable.
#It’s not a great idea to name a variable & a method the same. But if you have to work with that situation,
#then you’ll be able to call the method with self.method_name.

# class Example
#   def do_something
#     banana = "variable"
#     puts banana
#     puts self.banana
#   end
#   def banana
#     "method"
#   end
# end
# Example.new.do_something


#A local variable takes priority.
#That’s why we need to use self here if we want to call the banana method,
#instead of printing the value of the banana variable.



# A class method is defined using def self.methodname(),
#  which ends with end delimiter
# and would be called using the class name as classname.methodname

# class Food
#   def self.cook
#     "cook"
#   end
# end
# p Food.cook
# Self vs Itself -> self study

# class Box
#    # Initialize our class variables
#    @@count = 0
#    def initialize(w,h)
#       # assign instance avriables
#       @width, @height = w, h
#
#       @@count += 1
#    end
#
#    def self.printCount()
#       puts "Box count is : #@@count"
#    end
# end
# #
# # # create two object
# box1 = Box.new(10, 20)
# box2 = Box.new(30, 100)
# #
# # # call class method to print box count
# Box.printCount()



#The to_s Method
# Any class you define should have a to_s instance method to return a string representation of the object.
# class Box
#    # constructor method
#    def initialize(w,h)
#       @width, @height = w, h
#    end
#    # define to_s method
#    def to_s
#       "(w:#@width,h:#@height)"  # string formatting of the object.
#    end
# end
# #
# # # create an object
# box = Box.new(10, 20)
# #
# # # to_s method will be called in reference of string automatically.
# puts "String representation of box is : #{box}"

# Access Control
#Public Methods , Private Methods and Protected Methods
# Methods are public by default except for initialize, which is always private.

# define a class
# class Box
#    # constructor method
#    def initialize(w,h)
#       @width, @height = w, h
#    end
#
#    # instance method by default it is public
#    def getArea
#       getWidth() * getHeight
#    end
#
#    # define private accessor methods
#    def getWidth
#       @width
#    end
#
#    def getHeight
#       @height
#    end
#    # make them private
#    private :getWidth, :getHeight
#
#    # instance method to print area
#    def printArea
#       @area = getWidth() * getHeight
#       puts "Big box area is : #@area"
#    end
#    # make it protected
#    protected :printArea
# end
#
# # create an object
# box = Box.new(10, 20)
#
# # call instance methods
# a = box.getArea()
# puts "Area of the box is : #{a}"
#
# # try to call protected or methods
# box.printArea()

# => method => Public, private :method, protected :method


# Class Inheritance
# Ruby does not support multiple levels of inheritances but Ruby supports mixins
# A mixin is like a specialized implementation of multiple inheritance in which only the interface portion is inherited.
=begin
When creating a class, instead of writing completely
new data members and member functions, the programmer can designate
that the new class should inherit the members of an existing class.
This existing class is called the base class or superclass,
and the new class is referred to as
the derived class or sub-class.

# < syntax for extend
=end

# # define a class
# class Box
#    # constructor method
#    def initialize(w,h)
#       @width, @height = w, h
#    end
#    # instance method
#    def getArea
#       @width * @height
#    end
# end
# #
# # # define a subclass
# class BigBox < Box
#
#    # add a new instance method
#    def printArea
#       @area = @width * @height
#       puts "Big box area is : #@area"
#    end
# end
# #
# # # create an object
# box = BigBox.new(10, 20)
# #
# # # print the area
# box.printArea()

# Methods Overriding
# define a class
# class Box
#    # constructor method
#    def initialize(w,h)
#       @width, @height = w, h
#    end
#    # instance method
#    def getArea
#       @width * @height
#    end
# end
# #
# # # define a subclass
# class BigBox < Box
#
#    # change existing getArea method as follows
#    def getArea
#       @area = @width * @height
#       puts "Big box area is : #@area"
#    end
# end
# #
# # # create an object
# box = BigBox.new(10, 20)
# #
# # # print the area using overriden method.
# box.getArea()

# Operator Overloading
# class Box
#    attr_accessor :width, :height
#    def initialize(w,h)     # Initialize the width and height
#       @width,@height = w, h
#    end
#    #
#    def +(other)       # Define + to do vector addition
#       Box.new(@width + other.width, self.height + other.height)
#    end
#    # #
#    def -@           # Define unary minus to negate width and height
#       Box.new(-@width, -@height)
#    end
#
#    def *(scalar)           # To perform scalar multiplication
#       Box.new(@width*scalar, @height*scalar)
#    end
# end
# b1 = Box.new(1, 2)
# b2 = Box.new(2, 3)
# p b1 + b2

# Freezing Objects
=begin
Sometimes, we want to prevent an object from being changed.
The freeze method in Object allows us to do this,
effectively turning an object into a constant.
Any object can be frozen by invoking Object.freeze.
A frozen object may not be modified:
you can't change its instance variables.
=end

# # define a class
# class Box
#    # constructor method
#    def initialize(w,h)
#       @width, @height = w, h
#    end
#
#    # accessor methods
#    def getWidth
#       @width
#    end
#    def getHeight
#       @height
#    end
#
#    # setter methods
#    def setWidth=(value)
#       @width = value
#    end
#    def setHeight=(value)
#       @height = value
#    end
# end
# #
# # # create an object
# box = Box.new(10, 20)
# #
# # # let us freez this object
# box.freeze
# if( box.frozen? )
#    puts "Box object is frozen object"
# else
#    puts "Box object is normal object"
# end
# #
# # # now try using setter methods
# box.setWidth = 30
# box.setHeight = 50
# #
# # # use accessor methods
# x = box.getWidth()
# y = box.getHeight()
# #
# puts "Width of the box is : #{x}"
# puts "Height of the box is : #{y}"

# Class Constants
=begin
Once a constant is defined, you cannot change its value but you can access
a constant directly inside a class much like a variable but
if you want to access a constant outside of the class then
you would have to use
classname::constant as shown in the below example.
=end


# define a class
# class Box
#    BOX_COMPANY = "TATA Inc"
#    BOXWEIGHT = 10
#    # constructor method
#    def initialize(w,h)
#       @width, @height = w, h
#    end
#    # instance method
#    def getArea
#       @width * @height
#    end
# end
#
# # create an object
# box = Box.new(10, 20)
#
# # call instance methods
# a = box.getArea()
# puts "Area of the box is : #{a}"
# puts Box::BOX_COMPANY
# puts "Box weight is: #{Box::BOXWEIGHT}"

# Create Object Using Allocate
# # define a class
# class Box
#    attr_accessor :width, :height
#
#    # constructor method
#    def initialize(w,h)
#       @width, @height = w, h
#    end
#
#    # instance method
#    def getArea
#       @width * @height
#    end
# end
# #
# # # create an object using new
# box1 = Box.new(10, 20)
# #
# # # create another object using allocate
# box2 = Box.allocate
# #
# # # call instance method using box1
# a = box1.getArea()
# puts "Area of the box is : #{a}"
# #
# # # call instance method using box2
# a = box2.getArea()
# puts "Area of the box is : #{a}"

# # Class Information
# class Box
#    # print class information
#    puts "Type of self = #{self.class}"
#    puts "Name of self = #{self.name}"
# end
