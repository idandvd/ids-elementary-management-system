import { UserType } from "./user_type";


export class User {
    Id: number;
    Username: string;
    Password: string;
    UserType: any;
    Token?: string;
}