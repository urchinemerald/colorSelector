void selectLoop() {

  image(img, 0, 0);

  textSize(20);
  fill(255, 0, 0);
  text("SELECTMODE ACTIVE", width/2 - 60, height / 2);

  int x = width - 300;
  int y = 100;
  for (colorSelect cs : colorSelectors) {
    fill(255, 0, 0);
    text("R : " + red(cs.c) + " G :" + green(cs.c) + " B: " + blue(cs.c), x + 5, y);

    rect(x-22.5, y - 12.5, 25, 25);
    fill(cs.c);
    rect(x-20, y - 10, 20, 20);
    y+=30;
  }
  fill(255, 0, 0);
  text("instructions:", 100, 200);
  text("select where on the image you want to sample the color", 100, 220);
  text("press 's' to leave select mode ", 100, 240);
  text("while in active mode", 100, 280);
  text("press 'e' to change measuring color differance by Euclidean Color Difference to L*a*b", 100, 300);
  text("press 'p' to save the current image", 100, 320);
}

void mouseClicked() {
  if (selectMode) {
    int xPos = mouseX;
    int yPos = mouseY;
    color c = blurImg.get(xPos, yPos);
    colorSelectors.add(new colorSelect(c));
  }
}
