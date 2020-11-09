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
        return jsonAPI._request('/getHomeList', params, "get");
    }

    getAllArticles(){
        return jsonAPI._request('/getAllArticleList', {}, "get");
    }

    getArticleDetail(params){
        return jsonAPI._request('/getArticle', params, "get");
    }
    // save(project){
    //     return jsonAPI.requestWithAuth('/list', null, this._conf);
    // }

    delete(params){
        return jsonAPI.requestWithAuth('delete', params, this._conf);
    }
}

export default new Panel();