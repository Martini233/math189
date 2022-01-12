#email: g5wu@ucsd.edu

######## Enterting data ########
#### univariate ####
# to run one line code, simply use ctrl/command + enter
#### numeric ####
x = 4
y <- 2

x + y
x - y
x*y
x/y
x^y

#### characteristic ####
z = 'math'
z = "math"
u = '1'

#### logical ####
a <- TRUE
b <- T
c <- F

w = NA

#### class ####
class(x)
class(z)
class(u)
class(w)

v = as.numeric(u)
class(v)
is.numeric(v)

as.numeric(z)
#### logical operations ####
x == 4 # equal to?
y == 3

x != 1 # not equal to?

!(x == 4)

x >= 3
y < 1

x > 3 & y > 1 #and
x > 3 & y < 1

x > 3 | y < 0 #or

######## Vectors ########
vec1 = c(45,43,46,48,51,46,50,47,46,45)
vec2 = 1:10
#This is wrong: vec3 = 1:2:20
vec3 = seq(1,20,2)
help('seq')
seq(from = 1, to = 20, by = 2)
vec4 = c('math 170A', 'math 170B', 'math 170C', 'math 180A', 'math 180B', 'math 180C',
         'math 181A', 'math 181B', 'math 183', 'math 185')

sum(vec2)
mean(vec1)
median(vec1)
max(vec1)
min(vec1)
var(vec1)
summary(vec1)

#standard deviation
sd(vec1)

#length of a vector
length(vec4)

#get the i-th value#
vec1[2]      #i = 2
vec1[c(1,3,5)]

#find the correspinding index
which(vec1 == 45)
which(vec1 == max(vec1))

#order
order(vec1) #index. default: increasing

help('order')
order(vec1, decreasing = T)

vec1_sort <- vec1[order(vec1)]

#named vector
vec5 = c(90, 91, 95, 96, 98, 85, 93, 95, 92, 88)
names(vec5) <- vec4
vec5

#### operations btw vectors ####
vec1 + vec2
vec1 - vec3
vec1 * vec2 #this is Hadamard product!
as.numeric(vec1 %*% vec2) #this is dot product!

######## Matrices ########
help('matrix')
A = matrix(1:6, nrow = 2, ncol = 3) #default: by column
B = matrix(1:6, nrow = 2, ncol = 3, byrow = T)
C = matrix(2:7, nrow = 2, ncol = 3)

t(A) #transpose
dim(A) #dimension of a matrix
A*C #this is Hadamard product!

#dot product
A %*% t(C)
t(A) %*% A

######## table ########
sample_data1 <- rpois(100, 5)
sample_data2 <- rpois(100, 2)
ts <- table(sample_data1)

####
rm(list = ls()) #clear workspace
#ctrl + L : clear console

######## Packages ########
install.packages('pracma')
library(pracma)
dot(vec1, vec2)

#detach
detach('package:pracma')

######## Datasets (data frame class) ########
library(MASS)
dataset <- Cars93
class(dataset)

#structure of a dataset
str(dataset)

#summary statistics
summary(dataset)

#extract a varible
weight <- dataset$Weight
mpg_city <- dataset$MPG.city

#attach a dataset
attach(Cars93)
Weight
MPG.city

#Remember to detach the dataset if you are working on multiple ones!!!
detach(Cars93)
Weight

######## Plots ########
#histogram (works for numeric variables)
hist(dataset$Weight)
dev.off() #clear all plots

hist(dataset$Weight, main = "Histogram of Car Weights", xlab = 'Weight', col = 'grey')

#barplot (works for categorical variables)
manu <- table(dataset$Manufacturer)
JP_cars <- which(names(manu) %in% c('Honda', 'Acura', 'Toyota', 'Lexus', 'Nissan', 'Infiniti'))
barplot(manu[JP_cars], main = 'Japenese Cars',
        xlab = 'Manufacturers', ylab = 'Frequency', axes = T, axis.lty = 1)

#boxplot
boxplot(mpg_city)
boxplot(mpg_city, xlab = "MPG in City", col = 'yellow', outpch = 8, outcol = 'red')
boxplot(mpg_city, xlab = "MPG in City", col = 'yellow', outpch = '?', outcol = 'red')

#scatter plot
plot(weight, mpg_city)
plot(weight, mpg_city, main = "relation btw car weight & mpg in city",
     xlab = 'car weight', ylab = 'mpg in city', pch = 19, cex = 0.8, col = 'darkgreen')

#linear regression
lin <- lm(formula = mpg_city ~ weight)
abline(lin, lwd = 1.5, col = 'red')