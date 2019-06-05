static class InterSorts {
  static void insertionSort(ArrayList<Intersection> data) {
    for (int i = 1; i < data.size(); i++) {
      Intersection now = data.get(i);
      int j = i - 1;
      while (j > -1 && data.get(j).getDist() > now.getDist()) {
        data.set(j + 1, data.get(j));
        j--;
      }
      data.set(j + 1, now);
    }
  }
}
