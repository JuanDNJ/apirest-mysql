import validField from "./validate-field.helper.js";
import emitError from "./emit-error.js";
import bcrypt from "bcrypt";
import crypto from "crypto";
import jwt from "jsonwebtoken";
import { HASH_SECRET_KEY, IAT, EXP, EXP_USER} from "../config/index.js";

const handlerHashString = async (string) => {
    try {
        const salt = await bcrypt.genSalt(10);
        const hash = await bcrypt.hash(string, salt);
        return hash;
    } catch (error) {
        throw new Error(error);
    }
}
const handlerCompareHashString = async (string, hash) => {
    try {
        const match = await bcrypt.compare(string, hash);
        return match;
    } catch (error) {
        throw new Error(error);
    }
}
const handlerJwtPayload = (payload) => {
    const options = { iat: IAT, sub: payload};
    if(payload.rol === 'admin'){
        return  {
            iat: IAT, 
            exp: EXP,
            sub: payload
        }
    }else{
        return  {
            iat: IAT, 
            exp: EXP_USER,
            sub: payload
        }
    }
   
}
const handlerJwtSign = async (string) => {
    try {
        const jwtSign = jwt.sign(string, HASH_SECRET_KEY);
        if (!jwtSign) throw new Error('Token not signed');
        return jwtSign;
    } catch (error) {
        return error;
    }
}
const handlerJwtVerify = async (string) => {
    try {
        const jwtVerify = jwt.verify(string, HASH_SECRET_KEY);
        if (!jwtVerify) throw new Error('Token not valid');
        return jwtVerify;
    } catch (error) {
        return error
    }
}
const handlerDataSrtringToArray = (string) => {
    let data
    if (string && string.length) {
        data = string.split(",")
        // console.log(telefonos.map(tel => tel.trim()))
        data = data.map(tel => tel.trim())
    }
    return data
}

const newUID = () => crypto.randomUUID()


export {
    validField,
    handlerHashString,
    handlerCompareHashString,
    handlerJwtSign,
    handlerJwtPayload,
    handlerJwtVerify,
    handlerDataSrtringToArray,
    newUID,
    emitError
}
