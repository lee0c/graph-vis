int n = 100;     // n = |v|
float p = .05;  // probability that any edge (u,v) exists

float p_0;      // initialization variables
color c;
point coord;

int desC = 0;  // counter so that the graph draws itself slowly over time
int srC = 0;
boolean drawn = false;

color a, b;

node [] nodes = new node[n];

boolean drawGraph = false;
boolean DFS = true;
boolean BFS = false;

ArrayList<Integer> path = new ArrayList<Integer>();

void setup() {
  size(800, 800);
  background(0);
  stroke(200);
  fill(255);
  
  for (int i=0; i<n; i++) {
    c = color(int(random(50,256)), int(random(50,256)), int(random(50,256)));
    coord = new point( int(random(width)), int(random(height)) );
    nodes[i] = new node(i, c, coord); // creates arraylist of nodes
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
  if (drawGraph) {
    if (desC < n && !drawn) { // drawing the nodes first loop through
      nodes[desC].draw();
      desC++;
    } /*else if (srC == n) {
      background(0);
      stroke(255);
      for (int i=0; i<n; i++) {
        nodes[i].draw();
        for (int j=i+1; j<n; j++) {
          if (nodes[i].checkEdge(desC)) {
            line( ( nodes[i].getPoint() ).x, ( nodes[i].getPoint() ).y,
                    ( nodes[j].getPoint() ).x, ( nodes[j].getPoint() ).y);
          }
        }
      }
    } else if (srC > n) {
      println("Done");
    } */else if (desC < n && drawn) { // changing the destination node
      if (nodes[srC].checkEdge(desC)) {
        a = nodes[srC].getColor();
        b = nodes[desC].getColor();
        
        gradientLine( ( nodes[srC].getPoint() ).x, ( nodes[srC].getPoint() ).y,
                ( nodes[desC].getPoint() ).x, ( nodes[desC].getPoint() ).y, a, b);
        
        desC++;
      } else {
        while (!nodes[srC].checkEdge(desC) && desC < n) {
          desC++;
        }
      }
    } else if (desC == n) { // changing the source node
      if (!drawn) {
        drawn = true;
      }
      srC++;
      desC = srC + 1;
    }
  } else if (DFS) {
    if (path.size() == 0) {
      srC = 0;
      path.add(0);
    } else {
      
    }
      
      
  } else if (BFS) {
    
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