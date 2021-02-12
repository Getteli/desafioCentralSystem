import axios from "axios";
import UrlService from "./UrlService";
import CookieService from "./CookieService";

const expiresAt = 60 * 24;

class AuthService {
  async doUserLogin(credentials) {
    try {
      // retorna o link gerado para poder fazer o login e tudo mais pelo navegador
      // TIVE PROBLEMAS COM O DEEP LINK LOCALMENTE
      return UrlService.conectAPI()+"?"+credentials;
      // const response = await axios.get(UrlService.conectAPI()+"?"+credentials);
      // return response.data;
    } catch (error) {
      console.error("Error", error.response);
      return false;
    }
  }

  async loginUserApp(credentials) {
    try {
      const response = await axios.get(UrlService.loginClient()+"?"+credentials);
      // console.log(response.data);
      if(response.data){
        let date = new Date();
        date.setTime(date.getTime() + expiresAt * 60 * 1000);
        const options = { path: "/", expires: date };
        CookieService.set("access_token", response.data.access_token, options);
        CookieService.set("email", response.data.email, options);
        return true;
      }

      // return response.data;
      return false;
    } catch (error) {
      console.error("Error", error.response);
      return false;
    }
  }

}

export default new AuthService();
