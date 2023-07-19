import validField from "./validate-field.helper.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { hashSecretKey } from "../config/index.js";

const handlerHashString = async (string, genSalt) => {
    try {
        if (typeof genSalt !== 'number') throw new Error('genSalt must be a number');
        const salt = await bcrypt.genSalt(genSalt ?? 10);
        const hash = await bcrypt.hash(string, salt);
        return hash;
    } catch (error) {
         throw new Error(error);
    }
}
const handlerCompareHashString = async (string, hash) => {
    try {
        const match = await bcrypt.compare(string, hash);
        if (!match) throw new Error('Password not match');
        return match;
    } catch (error) {
        throw new Error(error);
    }
}
const handlerJwtSign = async (string) => {
    try {
        const jwtSign = jwt.sign(string, hashSecretKey);
        if (!jwtSign) throw new Error('Token not signed');
        return jwtSign;
    } catch (error) {
        return error;
    }
}
const handlerJwtVerify = async (string) => {
    try {
        const jwtVerify = jwt.verify(string, hashSecretKey);
        if (!jwtVerify) throw new Error('Token not valid');
        return jwtVerify;
    } catch (error) {
        return error
    }
}

export {
    validField,
    handlerHashString,
    handlerCompareHashString,
    handlerJwtSign,
    handlerJwtVerify,
}
