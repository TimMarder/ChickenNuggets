import java.util.LinkedList;

//instance variables
class Customer implements Comparable<Customer>{
  String[] menu = {"hamburger", "chickenburger", "grilledcheese", 
  "salad", "orangeJuice", "appleJuice"};
  LinkedList<Food> orderList = new LinkedList<Food>();
  float tipRate, waitTime;
  boolean isLeaving;
  int priority, xPos, yPos;
  String comment;
  PImage img;
  
  //default constructor: instantiate the instance variables
  Customer() {
    priority = 2;
    tipRate = 0.15;
    waitTime = 20;
    isLeaving = false;
    comment = "Thank you";
    img = loadImage("Image/customer.png");
    xPos = 50;
    yPos = 450;
    orderList = makeOrder((int)(Math.random() * 3));
  }
  
  
  
//-------------PQueue--Helper----------------
  boolean equals(Customer other) {
    return priority == other.priority;
  }
  
  int compareTo(Customer other) {
    if(this.equals(other)) {
      return 0;
    } else if (priority > other.priority) {
      return 1;
    } else {
      return -1;
    }
  }

  
  //------------Customer's methods----------------
    //randomly adds items from the menu to the orderList
  LinkedList<Food> makeOrder(int numItem) {
    for (int x = numItem; x >= 0; x--) {
      orderList.add(new Food(menu[(int)(Math.random() * menu.length)]));
    }
    return orderList;
  }
  
   //return the name of each food in the orderList
  ArrayList<String> getOrder() {
    ArrayList<String> typeList = new ArrayList<String>();
    for(Food order: orderList) {
      typeList.add(order.getType());
    }
    return typeList;
  }
  
    //display the name of each food in the orderList
  String printOrder() {
    String types = "";
    for(Food order: orderList) {
      types = types + order.getType() + ", " ;    
    }
    return types;  
  }
  
    //once order is successfully served, you will receive tips for service
  double setTips() {
    double total = 0;
    for(Food order: orderList) {
      total += order.getPrice();
    }
    return total * tipRate;
  }
 
    //create icon for customer
  void display() {
    image(img, xPos, yPos, 50, 100);
  }

  //create the animation of a queue of customers
  void setPOrder(int newY) {
    yPos = newY;
  }
 
}
