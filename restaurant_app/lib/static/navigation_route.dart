enum NavigationRoute {
  mainRoute("/main"),
  detailRoute("detail"),
  searchRoute("search"),
  settingRoute("setting"),
  favoriteRoute("favorite");

  const NavigationRoute(this.name);
  final String name;
}
