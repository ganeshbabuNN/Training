#05dec2022
#comments 
#every line to be started # for the comments
#3+3

#structure for R program

##1st way - calculator way
3+3
print("hello Robot")

hello =3 #store a value in a variable using = sign or <- (less with -)
hello<-3
print(hello)

##2nd way - Function
hello = function(){
  print("Hello vaihav")
}

hello()
#hello is function name
#function() is keyword or object

#3rd way - using objects (class and methods)
employee =list(name="vaibhav",age=32,contact="93838",persontype="robot")
class(employee) <-'empinfo'

employee #calling the oops ways

employee.status <- function(){
  print("print the employee status")
}

employee

employee.status() #method 

#there two types of objects s3 and s4 objects types

#5dec2022#################################

#variables
#dynamically typed 
a <- 4
print(a)
typeof(a)
b<-2.8
typeof(b)
c<-"ganesh"
print(c)
c<-'ganesh'
typeof(c)
d<-"3"
typeof(d)
e<-1+2i
typeof(e)
#double, character and complex

class(a)
class(b)
class(c)
class(d)
class(e)
#to know the type of variable using typeof and class

#finding variables
# R objects it may be variable, function , classes, any data types
print(ls()) 

var_g ="vaibhav"
print(var_g)
print(ls(pattern = "var"))
print(ls(all.name=TRUE)) #TRUE hides the 

#how to check if that variables exists in memory
exists("a")
exists("e")
exists("ga")

#how to delete or remove variable in R workspace
rm(a)
exists("a")
print(a)
rm(b,c)
print(b)
print(c)
exists("b")
rm(list=ls())

#how to assign a value to a variable
#leftward assigment
a =3
a <- 3
print(a)
a <-c(3,2,3,3,3)
print(a)
b <- c(3,2,"ganesh",3.2,1+2i)
print(b)

#rightward assigment
c(4,3,2.9) = c #invalid
c(4,3,2.9) -> c
print(c)

#how to print multiple values in R
print(2 2)
cat(2,3)
cat(a,b)

#how to assign multiple variable to single value
a=b=c=5

a,b,c=3,2,4 #not 

#rules of variables
2a <- 3#invalid
a2 <- 3
var_name3. = 4
var_name3% = 4 #invalid
.var_name2 = 4
var.name=3
.2var_name=3#invalid
_var_name =3 #invalid



