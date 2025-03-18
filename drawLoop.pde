
void drawLoop() {

  noStroke();

  int range = int(map(mouseX, 0, width, 1, 100));
  float pushBack = mouseY;
  print("range :" + range + "\n");
  print("pushBack :" + range + "\n");


  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      color c = blurImg.get(x, y);
      color cFill = img.get(x, y);
      fill(cFill);
      push();
      if (isWithinRange(c, range)) {
        translate(0, 0, -100);
        rect(x, y, 1, 1);
        pop();
      } else {
        translate(0, 0, -pushBack);
        rect(x, y, 1, 1);
        pop();
      }
    }
  }
}


boolean isWithinRange(color c, int range) {

  for (colorSelect target : colorSelectors) {
    float dist;
    if (EuclideanColorDifference) {
      dist = dist(red(c), blue(c), green(c), red(target.c), blue(target.c), green(target.c));
    } else {
      float value[] = rgbToLab(int(red(target.c)), int(green(target.c)), int(blue(target.c)));
      float value2[] = rgbToLab(int(red(c)), int(green(c)), int(blue(c)));
      dist = dist(value[0], value[1], value[2], value2[0], value2[1], value2[2]);
    }
    if (dist < range) {
      return true;
    }
  }

  return false;
}
