// Node class
// One vertice on a graph (directed or undirected)
// Knows its name, color, and position on the canvas
// Knows what edges it has

public class node {
  int v;                // node's "name"
  ArrayList<Integer> e; // list of destinations
  color c;              // color
  point p;              // coordinates
  int n;                // number of nodes
  float [] w;             // weights of connected verts
  
  public node (int v, color c, point p, int n) {
    this.v = v;
    this.e = new ArrayList<Integer>();
    this.c = c;
    this.p = p;
    this.n = n;
    this.w = new float[n];
    for (int i=0; i<n; i++) {
      w[i] = 0;
    }
  }
  
  public void addEdge(int dest) {
    e.add(dest);
  }
  
  public boolean checkEdge(int dest) {
    for (Integer dests : e) {
      if (dests == dest) {
        return true;
      }
    }
    return false;
  }
  
  public point getPoint() {
    return p;
  }
  
  public color getColor() {
    return c;
  }
  
  public void addWeight(float weight, int dest) {
    w[dest] = weight;
  }
  
  public float getWeight(int dest) {
    return w[dest];
  }
  
  public void setup() {
    
  }
  
  public void draw() {
    noStroke();
    fill(c);
    ellipse(p.x, p.y, 5, 5);
  }
}