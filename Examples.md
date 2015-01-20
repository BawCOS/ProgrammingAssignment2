## Examples of how to use makeCacheMatrix and cacheSolve  
First create the list of functions on the matrix.  For this example I will use the matrix(1:4,2,2).  
mat<- makeCacheMatrix(matrix(1:4,2,2))  
mat  
Returns  
$set  
function (y)   
{  
    x <<- y  
    m <<- NULL  
}  
environment: 0x00000000147c73d8  

$get  
function ()  
x  
environment: 0x00000000147c73d8

$setinv  
function (inverse)   
m <<- inverse  
environment: 0x00000000147c73d8  

$getinv    

function ()   
m  
environment: 0x00000000147c73d8  
At this point no inverse has been calculated so  
mat$getinv()    

returns  

NULL  
but  

mat$get()  

returns  

      [,1] [,2]  
[1,]    1    3  
[2,]    2    4  

Now  
cacheSolve(mat)  
finds the inverse and returns
[,1] [,2]  
[1,]   -2  1.5  
[2,]    1 -0.5  
If I run it again I get  

getting cached data  
     [,1] [,2]  
[1,]   -2  1.5  
[2,]    1 -0.5  

I could put in a new matrix using   
mat$set(matrix(3:6,2,2))  
and then  
cacheSolve(mat)  
which returns  

     [,1] [,2]  
[1,]   -3  2.5  
[2,]    2 -1.5  

