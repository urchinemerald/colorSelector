// RGB TO LAB
float[] rgbToLab(int r, int g, int b) {
  float[] xyz = rgbToXyz(r, g, b);
  return xyzToLab(xyz[0], xyz[1], xyz[2]);
}

float[] rgbToXyz(int r, int g, int b) {
  float rr = r / 255.0;
  float gg = g / 255.0;
  float bb = b / 255.0;

  rr = (rr > 0.04045) ? pow((rr + 0.055) / 1.055, 2.4) : rr / 12.92;
  gg = (gg > 0.04045) ? pow((gg + 0.055) / 1.055, 2.4) : gg / 12.92;
  bb = (bb > 0.04045) ? pow((bb + 0.055) / 1.055, 2.4) : bb / 12.92;

  float x = (rr * 0.4124564 + gg * 0.3575761 + bb * 0.1804375) * 100;
  float y = (rr * 0.2126729 + gg * 0.7151522 + bb * 0.0721750) * 100;
  float z = (rr * 0.0193339 + gg * 0.1191920 + bb * 0.9503041) * 100;
  return new float[]{x, y, z};
}

float[] xyzToLab(float x, float y, float z) {
  float Xr = 95.047;
  float Yr = 100.000;
  float Zr = 108.883;

  x /= Xr;
  y /= Yr;
  z /= Zr;

  x = (x > 0.008856) ? pow(x, 1.0 / 3.0) : (7.787 * x) + (16.0 / 116.0);
  y = (y > 0.008856) ? pow(y, 1.0 / 3.0) : (7.787 * y) + (16.0 / 116.0);
  z = (z > 0.008856) ? pow(z, 1.0 / 3.0) : (7.787 * z) + (16.0 / 116.0);

  float L = (116 * y) - 16;
  float a = 500 * (x - y);
  float b = 200 * (y - z);
  return new float[]{L, a, b};
}
