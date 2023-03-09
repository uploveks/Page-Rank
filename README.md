# PageRank Algorithm
This project contains three implementations of the PageRank algorithm: iterative, algebraic, and inverse power method. It also includes a function that computes the membership function for a given interval.

## Table of Contents

1. [About the project](#start-description)
2. [Input](#build-description)

<a name="start-description"></a>
## About the project

PageRank is an algorithm developed by Google used to rank web pages in search engine results. It assigns a score to each page based on the quality and quantity of links pointing to it, with higher scores indicating greater importance and relevance.
The two main methods for implementing PageRank are:

- Iterative method: In this method, the algorithm iteratively calculates the PageRank score for each web page based on the score of the pages linking to it. The algorithm starts with an initial score for each page and then iteratively updates the score until it converges to a stable value. This method is relatively simple to implement and can handle large-scale web graphs.

- Algebraic method: In this method, the web pages and their links are represented as a matrix, and the PageRank algorithm calculates the scores by solving a linear algebraic equation. This method is more computationally efficient than the iterative method and is particularly useful for very large web graphs. However, it requires more advanced mathematical knowledge to implement.

### **ITERATIVE**

The program opens a file named "nume" and checks if it was successfully opened. It reads the number of nodes N and each line of the adjacency matrix A, setting a 1 in position (node, neighbor) and 0 otherwise. It then creates a vector that represents the number of links for each node. The transpose of K is needed, but since it is a diagonal matrix with the number of links on the diagonal, we can set its elements to 1/Links_in to obtain its inverse. We calculate the stochastic matrix using: M = (K(-1) * A) transposed. Initially, R, which represents the page ranks, has N elements, all equal to 1/N. The program calculates R  until the calculation error is less than eps. The iteration stops when (R-previous_R) is less than eps.
### **PR_INV**

The PR_INV approach calculates the PageRank of a graph using the inverse of a matrix. The program first reads in the number of rows in matrix A. It then calculates the Q and R matrices using the Gram-Schmidt algorithm. The program then solves for the inverse of A using the QR decomposition of A. Finally, the program calculates the PageRank.

### **ALGEGRAIC**

The algebraic approach calculates the PageRank of a graph. The program first reads in the number of nodes in the graph and creates a matrix A to represent the links between the nodes. The program then creates a vector to represent the number of links for each node. Next, the program calculates the transpose of K, which is a diagonal matrix with the number of links on the diagonal, and sets each entry to be 1/links_in. The program then calculates the PageRank values. 

### **MEMBERSHIP**

The APARTENENTA program reads in two values, val1 and val2, and calculates the function u(x) = ax + b such that u(val1) = 0 and u(val2) = 1. The program then prints the value of u(x) for a range of values of x between 0 and 1.

### **PAGERANK**

The PAGERANK program reads in a directed graph from a file, calculates the PageRank using both the iterative and algebraic approaches, and outputs the results to a file.

<a name="build-description"></a>
## Write input

The file begins with the total number of pages, which corresponds to the number of rows in the matrix.

The subsequent pages contain data in the following format:

- Each line begins with the parent page, which is the page that has references in other files. 
- The second number on the line represents the number of hyperlinks contained on the parent page. 
- The remaining numbers on the line correspond to hyperlinks pointing to other parent pages.

Once the matrix of hyperlinks has been read, the next step is to compute the fuzzy function using param1 and param2 to determine the grade or ranking of each page.


