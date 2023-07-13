/***********************************************************/
//  отрисовка графиков

void driwRect() {
  textSize(50 / setGraf);
  for (int i = 0; i < setGraf; ++i) {
    stroke(0);
    rect(0, (h / setGraf * i), w, (h / setGraf * (i + 1)));
  }

  for (int k = 0; k < setGraf; ++k) {
    for (int j = 1; j < setLine; ++j) {
      stroke(200);
      line(0, h / setGraf / setLine * j + h / setGraf * k, w, h / setGraf / setLine * j + h / setGraf * k);
      fill(0);
    }
    for (int j = 0; j < 24; ++j) {
      fill(0);
      stroke(200);
      line(1 + w / 24 * j, h / setGraf * (k + 1), 1 + w / 24 * j, h / setGraf * (k + 1) - h / setGraf);
      line(1 + w / 24 * j + w / 24 / 2, h / setGraf * (k + 1), 1 + w / 24 * j + w / 24 / 2, h / setGraf * (k + 1) - h / setGraf);

      stroke(0);
      line(1 + w / 24 * j, h / setGraf * (k + 1), 1 + w / 24 * j, h / setGraf * (k + 1) - 15);
      text(j, 6 + w / 24 * j, h / setGraf * (k + 1) - 4);
      line(w / 24 / 2 + 1 + w / 24 * j, h / setGraf * (k + 1), w / 24 / 2 + 1 + w / 24 * j, h / setGraf * (k + 1) - 5);
    }
  }

  fill(255);
}

/***********************************************************/
//  первичная отрисовка данных

void driwData() {
  raznicaData = dataMax - dataMin;
  koeff = h / setGraf / (raznicaData / setLine * 2 + raznicaData);

  driwRect();

  stroke(255, 0, 0);
  strokeWeight(1);

  for (int i = 0; i < dataData.length; ++i) {
    a = h / setGraf - (dataDataOld - dataMin + raznicaData / setLine) * koeff;
    b = h / setGraf - (dataData[i] - dataMin + raznicaData / setLine) * koeff;

    if (a > h / setGraf || b > h / setGraf) {
      a = h / setGraf;
      b = h / setGraf;
    }

    line((dataTimeOld / shiftTime + shift), a, (dataTime[i] / shiftTime + shift), b);

    dataTimeOld = dataTime[i];
    dataDataOld = dataData[i];
  }
  dataTimeOld = 0;
  dataDataOld = 0;

  float[] razm = new float[setLine];
  razm[0] = dataMin;
  razm[setLine - 1] = dataMax;
  for (int s = 1; s < setLine; ++s) {
    razm[s] = raznicaData / setLine * s + dataMin;
    print(razm[s] + "-");
  }
  println();

  for (int l = 0; l < setGraf; ++l) {
    for (int k = 0; k < setLine; ++k) {
      fill(0);
      text(razm[setLine - k - 1], 1800, h / setGraf / setLine * k);
    }
  }
  fill(255);
}

/***********************************************************/
