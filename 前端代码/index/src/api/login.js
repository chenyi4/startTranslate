import  jsonAPI from './json-api';

class Login {
    constructor(){
        this._conf = {
            baseURL: '',
            // baseURL: '/srv/drawing/oa/panel'
        }
    }
    
    loginPost(project){
        //登陆接口，登陆
        return jsonAPI._request('/index/login/loginset', {}, 'get');
    }
}

export default new Login();