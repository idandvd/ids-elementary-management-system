
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

    getControllerByActionAndId(controllerName, action, id) {
        var x = this.http.get(environment.api + controllerName + "/" + action + "/" + id);
        return x;
    }

    CheckUserExists(username, password) {
        const headers = new HttpHeaders({ 'Content-Type': ' charset=utf-8' });
        return this.http.post(environment.api + "CheckUserExists/" + username + "/" + password, { headers });
        // return this.http.post(environment.api + "CheckUserExists/","{\"username\":\""+username+"\","+
        //                                                            "{\"password\":\""+password+"\"}",{headers});
    }

    HasConflict(day_id, hour_id, teacher_id, class_id) {
        const headers = new HttpHeaders({ 'Content-Type': ' charset=utf-8' });
        return this.http.get(environment.api + "ClassScheduleTable/HasConflict/" + day_id + "/" + hour_id + "/" + teacher_id + "/" + class_id, { headers });
    }

    saveClassSchecule(schedule) {
        const headers = new HttpHeaders({ 'Content-Type': 'application/json; charset=utf-8' });
        return this.http.post(environment.api + "ClassScheduleTable/", JSON.stringify(schedule), { headers });
    }

    saveTeacherClassAccesses(teacherClassAccess) {
        const headers = new HttpHeaders({ 'Content-Type': 'application/json; charset=utf-8' });
        return this.http.post(environment.api + "TeacherClassAccess/", JSON.stringify(teacherClassAccess), { headers });
    }


    addModel(model, modelName) {
        const headers = new HttpHeaders({ 'Content-Type': 'application/json; charset=utf-8' });
        return this.http.post(environment.api + modelName + "/", JSON.stringify(model), { headers });

    }

    deleteModel(id, modelName) {
        //const headers = new HttpHeaders({ 'Content-Type': 'application/json; charset=utf-8' });
        return this.http.delete(environment.api + modelName + "/" + id);

    }

    saveModelWithRoute(model, modelName, route) {
        const headers = new HttpHeaders({ 'Content-Type': 'application/json; charset=utf-8' });
        return this.http.post(environment.api + modelName + "/" + route, JSON.stringify(model), { headers });

    }

    addTeacherType(teacherTypeName) {
        const headers = new HttpHeaders({ 'Content-Type': 'application/json; charset=utf-8' });
        return this.http.post(environment.api + "TeacherTypes/", "{\"name\":\"" + teacherTypeName + "\"}", { headers });

    }

    uploadFile(formData, modelName) {
        const headers = new HttpHeaders({ 'Content-Type': 'application/json; charset=utf-8' });
        return this.http.post(environment.api + modelName + "/Import", formData)

    }
}