// Позволяет передавать запрос по цепочке. Если класс не может его обработать,
// он передает его дальше

abstract class Middleware {
  Middleware? _next;

  Middleware linkWith(Middleware next) {
    _next = next;
    return next;
  }

  bool check(String email, String password);

  bool _checkNext(String email, String password) {
    return _next?.check(email, password) ?? true;
  }
}

class RoleCheckMiddleware extends Middleware {
  @override
  bool check(String email, String password) {
    if (email == 'admin') {
      print('Hello, admin!');
      return true;
    }
    print('Hello, user!');
    return _checkNext(email, password);
  }
}

class ThrottlingMiddleware extends Middleware {
  final int _requestPerMinute;
  int _request;


  ThrottlingMiddleware(this._requestPerMinute) : _request = 0;

  @override
  bool check(String email, String password) {
    _request++;
    if (_request > _requestPerMinute) {
      print('Request limit exceeded!');
      return true;
    } else {
      return _checkNext(email, password);
    }
  }
}

void main() {
  Middleware middleware = ThrottlingMiddleware(2);
  middleware.linkWith(RoleCheckMiddleware());
  middleware.check('admin', 'password');
  middleware.check('d', 'password');
  middleware.check('admin', 'password');
}