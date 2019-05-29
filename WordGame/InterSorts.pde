static class InterSorts {
  static void insertionSort(ArrayList<int[]> data) {
    for (int i = 1; i < data.size(); i++) {
      int[] now = data.get(i);
      int j = i - 1;
      while (j > -1 && data.get(j)[0] > now[0]) {
        data.set(j + 1, data.get(j));
        j--;
      }
      data.set(j + 1, now);
    }
  }
}
