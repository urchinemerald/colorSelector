ArrayList<colorSelect> colorSelectors;
PImage img, blurImg;
Boolean selectMode = true;
Boolean EuclideanColorDifference = true;
String imgString = "test2.png";

void setup() {
  size(1080, 1280, P3D);
  img = loadImage(imgString);
  //img.resize(width, height);
  image(img, 0, 0);
  filter(BLUR, 2);
  blurImg = get(0, 0, width, height);

  colorSelectors = new ArrayList<colorSelect>();
}

void draw() {
  background(255);

  if (selectMode) {
    selectLoop();
  } else {
    drawLoop();
  }

  if (EuclideanColorDifference) {
    print("Currently measuring color differance by Euclidean Color Difference" + "\n");
  } else {
    print("Currently measuring color differance by l*a*b" + "\n");
  }
  print("frame :" + frameCount + "\n" +"\n");
}


void keyPressed() {
  switch(key) {
    case('s') :
    selectMode = !selectMode;
    break;
    case('e') :
    EuclideanColorDifference = !EuclideanColorDifference;
    break;
    case('p') :
    saveFrame("Saves/" + "frame_" + frameCount + "_img_" + imgString + "_" + year() + "_" + month()+ "_"  + day() + "_" + hour() + "_" +second() +  ".jpg");
    break;
  }
}
