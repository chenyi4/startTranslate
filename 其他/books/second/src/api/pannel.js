import  jsonAPI from './json-api';

class Panel {
    constructor(){
        this._conf = {
            baseURL: '',
            // baseURL: '/srv/drawing/oa/panel'
        }
    }
    save(project){
        return jsonAPI._request('/login.php', project, this._conf);
    }
    
    getAll(project){
        return jsonAPI._request('/index.php', project, this._conf);
    } 

    getDetail(project){
        return jsonAPI._request('/detail.php', project, this._conf);
    }
    // save(project){
    //     return jsonAPI.requestWithAuth('/list', null, this._conf);
    // }

    delete(params){
        return jsonAPI.requestWithAuth('delete', params, this._conf);
    }
}

export default new Panel();