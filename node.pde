// Node class
// One vertice on a graph (directed or undirected)
// Knows its name, color, and position on the canvas
// Knows what edges it has

public class node {
  int v;                // node's "name"
  ArrayList<Integer> e; // list of destinations
  color c;              // color
  point p;              // coordinates
  
  public node (int v, color c, point p) {
    this.v = v;
    this.e = new ArrayList<Integer>();
    this.c = c;
    this.p = p;
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
  
  public void setup() {
    
  }
  
  public void draw() {
    noStroke();
    fill(c);
    ellipse(p.x, p.y, 5, 5);
  }
}