import fs from "fs" // importar fs
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
const viewEngine = (filePath, options, callback) => {
    fs.readFile(filePath,'utf8', (err, content) => {
        if (err) return callback(new Error(err))
        console.log(Object.entries(options))
        return callback(null, rendered(content))
    })
}
const rendered = (template) => {
    let result = /{{(.*?)}}/g.exec(template);
    const arr = [];
    let firstPos;
    while (result) {
        firstPos = result.index;
        if (firstPos !== 0) {
            arr.push(template.substring(0, firstPos));
            template = template.slice(firstPos);
        }
        arr.push(result[0]);
        template = template.slice(result[0].length);
        result = /{{(.*?)}}/g.exec(template);
    }
    if (template) arr.push(template);
    return arr;
}

const compileToString = (template) => {
    const ast = template; let fnStr = `""`; ast.map(t => {
        // checking to see if it is an interpolation 
        if (t.startsWith("{{") && t.endsWith("}}")) {
            // append it to fnStr 
            fnStr += `+data. ${t.split(/{{|}}/).filter(Boolean)[0].trim()} `;
        } else {
            // append the string to the fnStr 
            fnStr += `+" ${t} "`;
        }
    }); 
    return fnStr;
}
const compiled = (template) => { return new Function("data", "return " + compileToString(template)) }

// const meta = (options) => {
//     const { title, description, keywords, author, url, image, type, site_name, locale } = options;
//     const titleTag = `<title>${title}</title>`;
//     const descriptionTag = `<meta name="description" content="${description}">`;
//     const keywordsTag = `<meta name="keywords" content="${keywords}">`;
//     const authorTag = `<meta name="author" content="${author}">`;
//     const urlTag = `<meta property="og:url" content="${url}">`;
//     const imageTag = `<meta property="og:image" content="${image}">`;
//     const typeTag = `<meta property="og:type" content="${type}">`;
//     const siteNameTag = `<meta property="og:site_name" content="${site_name}">`;
//     const localeTag = `<meta property="og:locale" content="${locale}">`;
//     const metaTags = [titleTag, descriptionTag, keywordsTag, authorTag, urlTag, imageTag, typeTag, siteNameTag, localeTag];
//     return metaTags.join('\n');
// }
export {
    validField,
    handlerHashString,
    handlerCompareHashString,
    handlerJwtSign,
    handlerJwtVerify,
    viewEngine,
    rendered,
    compiled
}
