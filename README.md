# Graph Visualizations
Visualizations of breadth first and depth first searches

Code written by Lee Cattarin<br>
gradientLine function written by Processing forums user @asimes and found here:<br>
https://forum.processing.org/two/discussion/5620/how-to-draw-a-gradient-colored-line

Files:<br>
|| graph.pde, the main code<br>
|| node.pde, the node class<br>
|| point.pde, a bare-bones point (x,y) class

Classes:<br>
NODE is a node class. Each node knows its "name", coordinates, and color, as well as the name of all the nodes it is connected to. In the weighted-dfs branch, nodes know the number of total nodes and the weight of each edge that leaves it.<br>
POINT is a simple class with public variables. It holds a constructor and two ints. That's all.

Branches:<br>
MASTER currently has the capability to draw the graph, perform unweighted depth first search, or both.<br>
WEIGHTED-DFS is in progress. When complete, it will choose which node to move to next by scanning line lengths (weights) instead of moving in order.
