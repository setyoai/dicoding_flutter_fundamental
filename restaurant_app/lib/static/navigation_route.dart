enum NavigationRoute {
  homeRoute("/"),
  detailRoute("detail"),
  searchRoute("search"),
  settingRoute("setting");

  const NavigationRoute(this.name);
  final String name;
}
