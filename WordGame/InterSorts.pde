class InterSorts {
  void insertionSort(ArrayList<int[]> data) {
    for (int i = 1; i < data.size(); i++) {
      int now = data.get(i)[0];
      int j = i - 1;
      while (j > -1 && data.get(j)[0] > now) {
        data.set(j + 1, data.get(j));
      }
      data.set(j + 1, data.get(i));
    }
  }
}
