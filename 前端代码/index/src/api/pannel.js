import  jsonAPI from './json-api';

class Panel {
    constructor(){
        this._conf = {
            baseURL: '',
            // baseURL: '/srv/drawing/oa/panel'
        }
    }
    save(project){
        return jsonAPI._request('/login', project, this._conf);
    }
    getHome(params){
        console.log(params);
        return jsonAPI._request('/getHomeList', params, "get");
        
    }
    // save(project){
    //     return jsonAPI.requestWithAuth('/list', null, this._conf);
    // }

    delete(params){
        return jsonAPI.requestWithAuth('delete', params, this._conf);
    }
}

export default new Panel();