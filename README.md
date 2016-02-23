# Graph Visualizations
Visualizations of breadth first and depth first searches

Code written by Lee Cattarin\n
gradientLine function written by Processing forums user @asimes and found here:\n
https://forum.processing.org/two/discussion/5620/how-to-draw-a-gradient-colored-line\n

Files:
|| graph.pde, the main code
|| node.pde, the node class
|| point.pde, a bare-bones point (x,y) class

Classes:
NODE is a node class. Each node knows its "name", coordinates, and color, as well as the name of all the nodes it is connected to. In the weighted-dfs branch, nodes know the number of total nodes and the weight of each edge that leaves it.
POINT is a simple class with public variables. It holds a constructor and two ints. That's all.

Branches:
MASTER currently has the capability to draw the graph, perform unweighted depth first search, or both.
WEIGHTED-DFS is in progress. When complete, it will perform Dijkstra's algorithm, using the length of lines as weights.
