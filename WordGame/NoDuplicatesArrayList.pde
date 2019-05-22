class NoDupAR<T> extends ArrayList<T> {
  public NoDupAR() {
    super();
  }
  public boolean add(T t) {
    if (contains(t)) {
      return false;
    }
  }
}
