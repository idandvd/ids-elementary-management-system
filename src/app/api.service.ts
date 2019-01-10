import {Injectable} from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
 
const httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};
 
@Injectable()
export class ApiService {
 
    constructor(private http:HttpClient) {}
 
    // Uses http.get() to load data from a single API endpoint
    getFoods() 
    {
        var x = this.http.get('http://localhost:54048/api/products');
        return x;
    }
}