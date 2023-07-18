import validField from "./validate-field.helper.js";
import bcrypt from "bcrypt";

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
export {
    validField,
    handlerHashString,
    handlerCompareHashString
}
