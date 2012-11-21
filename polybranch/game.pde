class Game{
  ArrayList layers;
  String origin;
  
  
  float speed;

  Game(){
    origin = "I EXIST";
    layers = new ArrayList();
   
    speed = 0.003;
    
    //make 6 layers
    for(int i = 0; i < 12; i++){
      layers.add(new Layer(16, width, height));
    }
    //set the distance var for these 6 layers
    for(int i = layers.size(); i > 0; i--){
      Layer layer = (Layer) layers.get(i-1);
      //println(1.0/(i));
      layer.distance = 1.2/layers.size()*i;
      layer.easedDistance = easeInExpo(layer.distance, layer.distance, 0,1,1);
    }
    
    //println("game has "+layers.size());
  }
  
  public void update(){
    for(int i = 0; i < layers.size(); i++){
      Layer layer = (Layer) layers.get(i);
      if(layer.easedDistance > 4 && i == layers.size()-1){
        layers.add(0, layer);
        layers.remove(layers.size()-1);
        layer.reset();
      }else{
        layer.updateDist(speed);
        layer.render();
      }
    }
  }
  
  public void display(){
    for(int i = 0; i < layers.size(); i++){
      Layer layer = (Layer) layers.get(i);
      layer.render();
    }
  }
}