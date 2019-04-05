
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment';

const httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable()
export class ApiService {

    constructor(private http: HttpClient) { }

    // Uses http.get() to load data from a single API endpoint
    getControllers() {
        var x = this.getController('controllers');
        return x;
    }

    getController(controllerName) {
        var x = this.http.get(environment.api + controllerName);
        return x;
    }

    getControllerById(controllerName, id) {
        var x = this.http.get(environment.api + controllerName + "/" + id);
        return x;
    }

    CheckUserExists(username, password) {
        const headers = new HttpHeaders({ 'Content-Type': ' charset=utf-8' });
        return this.http.post(environment.api + "CheckUserExists/" + username + "/" + password, { headers });
        // return this.http.post(environment.api + "CheckUserExists/","{\"username\":\""+username+"\","+
        //                                                            "{\"password\":\""+password+"\"}",{headers});
    }

    addModel(model,modelName) {
        const headers = new HttpHeaders({ 'Content-Type': 'application/json; charset=utf-8' });
        return this.http.post(environment.api + modelName+"/", JSON.stringify(model) , { headers });

    }

    addTeacherType(teacherTypeName) {
        const headers = new HttpHeaders({ 'Content-Type': 'application/json; charset=utf-8' });
        return this.http.post(environment.api + "TeacherTypes/", "{\"name\":\"" + teacherTypeName + "\"}", { headers });

    }

    uploadFile(formData)
    {
        const headers = new HttpHeaders({ 'Content-Type': 'application/json; charset=utf-8' });
        return this.http.post(environment.api + "Students/Import", formData)

    }
}