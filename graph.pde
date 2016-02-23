int n = 100;     // n = |v|
float p = .05;  // probability that any edge (u,v) exists

float p_0;      // initialization variables
color c;
point coord;

int desC = 0;  // counter so that the graph draws itself slowly over time
int srC = 0;
boolean drawn = false;

node [] nodes = new node[n];

boolean drawGraph = false;
boolean DFS = true;
boolean BFS = false;

ArrayList<Integer> path = new ArrayList<Integer>();
boolean [] visited = new boolean[n];

void setup() {
  size(800, 800);
  background(0);
  stroke(200);
  fill(255);
  
  for (int i=0; i<n; i++) {
    c = color(int(random(50,256)), int(random(50,256)), int(random(50,256)));
    coord = new point( int(random(width)), int(random(height)) );
    nodes[i] = new node(i, c, coord); // creates arraylist of nodes
    visited[i] = false;
  }
  
  for (int i=0; i<n; i++) {
    for (int j=i+1; j<n; j++) {
      p_0 = random(0,1);
      if (p_0 < p) {
        nodes[i].addEdge(j);
        nodes[j].addEdge(i); // if undirected
      }  
    }
  }
}

void draw() { 
/*
              ### DRAW GRAPH ###
*/
  if (drawGraph) {
    if (desC < n && !drawn) {
      // drawing the nodes first loop through
      nodes[desC].draw();
      desC++;
    } else if (srC >= n) {
      drawGraph = false;
      DFS = true;
    } else if (desC < n && drawn) {
      // changing the destination node
      if (nodes[srC].checkEdge(desC)) {
        gradientLine( ( nodes[srC].getPoint() ).x, ( nodes[srC].getPoint() ).y,
                ( nodes[desC].getPoint() ).x, ( nodes[desC].getPoint() ).y,
                nodes[srC].getColor(), nodes[desC].getColor() );
        
        desC++;
      } else {
        // incrementing the counter so one line is drawn per frame
        while (!nodes[srC].checkEdge(desC) && desC < n) {
          desC++;
        }
      }
    } else if (desC == n) {
      // changing the source node
      srC++;
      if (!drawn) {
        drawn = true;
        srC = 0;
      }
      desC = srC + 1;
    }
  }
/*
              ### DEPTH FIRST SEARCH ###
*/
  if (DFS) {
    if (DFSSTART) {
      stroke(0, 0, 0, 180);
      fill(0, 0, 0, 180);
      rect(0, 0, width, height);
      DFSSTART = false;
    }
    if (path.size() == 0) {
      // starting the path (either first time initialization or moving to a new connected component)
      for (int i=0; i<n; i++) {
        if (visited[i] == false) {
          srC = i;
        }
      }
      desC = 0;
      path.add(srC);
      visited[srC] = true;
      nodes[srC].draw();
    } else if (desC >= n) {
      // back up the path
      if (path.size() >= 2) {
        desC = 0;
        srC = path.get(path.size()-2);
        path.remove(path.size()-1);
      } else if (path.size() == 1) {
        path.remove(path.size()-1);
      }
    } else {
      if (nodes[srC].checkEdge(desC) && !visited[desC]) {
        // move along one line
        gradientLine( ( nodes[srC].getPoint() ).x, ( nodes[srC].getPoint() ).y,
                ( nodes[desC].getPoint() ).x, ( nodes[desC].getPoint() ).y,
                nodes[srC].getColor(), nodes[desC].getColor() );
        nodes[desC].draw();
        path.add(desC);
        visited[desC] = true;
        srC = desC;
        desC = 0;
      } else {
        while( (!nodes[srC].checkEdge(desC) || visited[desC]) && desC < n ) {
          // increment counter so next frame moves properly
          desC++;
        }
      }
    }
  }
/*
              ### BREADTH FIRST SEARCH ###
*/
  if (BFS) {
    
  }
}

void gradientLine(int x1, int y1, int x2, int y2, color a, color b) {
  float deltaX = x2-x1;
  float deltaY = y2-y1;
  float tStep = 1.0/dist(x1, y1, x2, y2);
  for (float t = 0.0; t < 1.0; t += tStep) {
    fill(lerpColor(a, b, t));
    ellipse(x1+t*deltaX,  y1+t*deltaY, 1, 1);
  }
}
