abstract class NavEvent {}

class NavigateToPage extends NavEvent {
  final int index;
  NavigateToPage(this.index);
}
