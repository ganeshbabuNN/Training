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

# 07Dec2022
#scope



hello <- function(){
  f=3
  print(c)
}

hello()
f

g=3
hello <- function(){
  g=2
  print(g)
}
hello()
g=4
hello()

#constants

PI_C = 3.14
print(PI)


######################### 08Dec2020 #########
#data types

#numeric, integer, logical , complex, character and raw

a<- 3 # scalar 
print(a)
b<- c(3,3,2,2) #vector
print(b)

numerical <- 323
typeof(numerical)
print(numerical)
class(numerical)

mydecimal <- 323.32
typeof(mydecimal)
class(mydecimal)

myinterger <-3223L
print(myinterger)
typeof(myinterger)
class(myinterger)

mycomplex <- 3+2i
print(mycomplex)
typeof(mycomplex)
class(mycomplex)


mychar <-"I love to be a friend with Mr Robot for ever"
mychar1 <-'I love to be a friend with Mr Robot for ever'
cat(mychar,"\n",mychar1) # \n escape character

class(mychar)
typeof(mychar)

myraw <- charToRaw("I love to be a friend with Mr Robot for ever")
class(myraw)
typeof(myraw)

myloc <- TRUE
typeof(myloc)
myloc <- true

#for number
a<-0

#for string
b <- ''

#to test if this belong the right data type
is.numeric(434)
is.numeric(434.22)
is.numeric(43L) #something wrong
is.integer(232)
is.integer(232.22)
is.integer(23L)
is.character('2')
is.character(32)

typeof(data)

###################################
###################################
#09Dec2022 ###################################
###################################
###################################
a <- 2
vec <-c(32,3,2)
myvect <- c(23,2.2,'gr',3+2i,vec,a)
myvect
class(myvect)
typeof(myvect)

myvec1 <- 3:10 # : operator
print(myvec1)

myvec2 <- 10:1 #descending
print(myvec2)

myvec4 <- 20:-5
print(myvec4)
myvec3 <-c(6:12,59)
print(myvec3)

#atomic vector
myvec6 <- c(3,3,2,3) #numeric vector
myvect7 <- c(3L,5L,6L) #integer vector
myvect8 <- c("ganesh","vaihav","rudrix") #charac vector
myvect9 <-c(FALSE,TRUE) #logical vector

#as function
a<- '3'
class(a)
b<- as.integer(a)
class(b)
as.numeric()
as.logical()
as.character()
as.complex(43)

#rep()
rep(3,4)
rep(c(4,3,2),4)
rep(c(1,2,3),each=5)
rep(3:6,5)
rep(2:5,each=3)

#seq()
seq(1,10)
seq(1,10,0.5)
seq(0,20,2)
seq(10,1,-2)
seq(1,4,length=10)

rep(seq(1,3,0.5),3)
rep(seq(1,3,0.5),each=3)

#random number
sample(100,12)
sample(10:20,10)

#unifrom random number
runif(100,1,5)

#reading and accessing the vector
myvec10 <- c(1,2,3,4,5,6,7,8,9,10)
myvec10
myvec10[1]
myvec10[0]
myvec10[9]

#index vector
mychar <-c("a"=3,"b"=4,"c"=8)
mychar["a"]
mychar["b"]

#logical index vector
mylog <-c(1,2,3,4)
mylog[c(TRUE,FALSE,TRUE,FALSE)]

###### 13DEC2022 #######################
#######################
#######################

myvec <- c(3,3,2,3)
class(myvec)
typeof(myvec)

myvec1 <- c('g','b','c','ga','ds')
class(myvec1)
typeof(myvec1)

myvec1 <- c('g','b','c','ga','ds',3,2,3,3,2+2i)
class(myvec1)
typeof(myvec1)

#using colon operator
mycolon <- 3:10
mycolon

mycolon <- -5:10
mycolon

mycolvec <- c(4:10,-4)
mycolvec

#using rep() function
rep(5,3)
rep("ab",3)
rep(c(1,3,4),3)
rep(c(3,5,2),each=5)
rep(2:5,4)
rep(2:4,each=5)
numeric(4) #get the value of zero 
numeric(10)
character(6)
logical(4)

#using seq()
seq(from=5,to=10,by=0.5)
seq(5,10,0.5)
seq(10,3,-2)
seq(10,3,length=100)
rep(seq(1,10,2),10)

#atomic vector
#numeric vector
mynv <- 4.5
mynv <-c(3,2,4,5,6)
mynv
class(mynv)
a<- as.numeric(myinv)
class(a)
#integer vector
myinv <- rep(seq(3L,5L),4)
class(myinv)
a <- as.integer(mynv)
a
c<- as.integer("54")
class(c)
class(a)
#character 

mychar <- c("43","ga","ss","rw","po")
mychar
class(mychar)
e<- as.character(myinv)
class(e)

#logical 
as.logical(4)
as.logical(3>4)
as.logical(myinv)
as.logical(3)
a=4
b=3
c=6
d=9
mylog <-c(a>b,c<b,d>c)
mylog

#random number
sample(100,12)
sample(100)
sample(5:100,10)

#empty vector
x=c()
typeof(x)

y <- NULL
typeof(y)

z <- vector()
typeof(z)

a <-c(x,1,3,y,4)
a

#readin/access element in vector

myvec <-c(3,4,6,2,4,7,"ga")
length(myvec)
myvec
myvec[1]
myvec[0]
myvec[4]

#character index === named
myvec <-c("a"=3,"b"=4,"c"=6)
myvec
myvec["a"]
myvec[1]

#index --> indices not index
myind <- c(43,4,5,6,2,3,4,5,6,7,8,9,3,2,2,4,55)
myind[1]
myind[c(3,6,8)]
myind[2:5]
myind[5:1]
myind[c(2:5,12)]
length(myind)
myind[length(myind)]
min(myind)
myind[min(myind)]
myind[-1]
myind[c(-1,-3,-5)]
myind[-2:-4]
myind[c(-2:-4)]
myind[c(2:-4)]

myind[3]
myind
myind[3]<-66
myind


##16DEC2022#########################################
####################################################
myind <- c(43,4,5,6,2,3,4,5,6,7,8,9,3,2,2,4,55)

#boolean operator , < ,>, ==. logical

myind[myind==4]
myind[myind>10]
myind[myind<10]
myind[myind<=10]
myind[myind>=10]
myind[myind!=4]

#logical operator And(&), OR(|) and not !
myind[(myind>1) & (myind<10)]
myind[(myind>1) | (myind<10)]
myind[(myind>1) & (myind!=55)]

#which functions used to find which index is belong
which(myind==55)
which(myind>10)

#%in% searches the values in the vector
myind[myind %in% 10]
myind[myind %in% 55]
myind[myind%in%c(55,100)]

#all() and any()

#all is special function that checks whether all the comonetns in the vectors meet certains conditions
myind <- c(43,46,77,54,23,54,77,55)
all(myind <0)
all(myind <30)
all(myind <80)
all(myind <50)
all((myind >1) & (myind<100))
all((myind >1) & (myind<100))

#any functions


