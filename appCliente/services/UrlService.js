// altere o host para o IP da maquina atual.
let apiDomain = "http://192.168.1.40:8000/"; // servidor da API
let clientDomain = "http://192.168.1.40:8001/"; // backend do aplicativo

class UrlService {
  static conectAPI() {
    return clientDomain + "prepare-to-login";
  }
  static loginClient() {
    return clientDomain + "login-via-app";
  }
  static saveUserProfileUrl() {
    return apiDomain + "api/user";
  }
  static getCurrentUserAcitiviesUrl() {
    return apiDomain + "api/activities";
  }
  static getTodoUrl() {
    return apiDomain + "api/todos";
  }
  static markTodoCompleteUrl(id) {
    return apiDomain + "api/todo/complete/" + id;
  }
  static changeTodoOrderUrl() {
    return apiDomain + "api/todo/reorder";
  }
  static saveTodoUrl() {
    return apiDomain + "api/todo/save";
  }
  static removeTodoUrl() {
    return apiDomain + "api/todo/remove";
  }
}

export default UrlService;
