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
        return match;
    } catch (error) {
        throw new Error(error);
    }
}
const handlerJwtSign = async (string) => {
    try {
        const jwtSign = jwt.sign(string, hashSecretKey);
        console.log(jwtSign);
        return jwtSign;
    } catch (error) {
        throw new Error(error);
    }
}
const handlerJwtVerify = async (string) => {
    try {
        const jwtVerify = jwt.verify(string, hashSecretKey);
        console.log(jwtVerify);
        return jwtVerify;
    } catch (error) {
        throw new Error(error);
    }
}

export {
    validField,
    handlerHashString,
    handlerCompareHashString,
    handlerJwtSign,
    handlerJwtVerify,
}
