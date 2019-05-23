class NoDupAR<T> extends ArrayList<T> { //an arraylist with no duplicates
  public NoDupAR() {
    super();
  }
  public boolean add(T t) {
    if (contains(t)) {
      return false;
    } else {
      super.add(t);
      return true;
    }
  }
}