class ApiUrl {
  String getApiUrl() {
    String url = "https://intranet.chic-aparts.com/api/";
    // "https://season.mayem-solutions.com/api/";
    // "http://127.0.0.1:8000/api/";
    // "http://10.0.2.2:8000/api/";
    return url;
  }

  String getUrl() {
    String url = //"https://season.mayem-solutions.com/";
        // "http://127.0.0.1:8000/";
        "https://intranet.chic-aparts.com/";
    // "http://10.0.2.2:8000/";
    return url;
  }

  String getKey() {
    String key =
        // "ToSgvodAnZeyr9tb0CaMDZBtTbkug1t3pemyfqkBwCivdivLxgdWzN0eiuyLjSis"; //local
        // "7RK4nnAnjWsCXBtEhgYfGYymXUQg0ryYVOHfHlIHYbbXqZxoJAnXg0170UCAYi1C"; //preprod
        "8jzYVMRrfesKL0b69351MkRyYYl17Q4YAM0AtmDfaCJptvmFx6P5sOUVFplIImMl"; //prod
    return key;
  }
}
