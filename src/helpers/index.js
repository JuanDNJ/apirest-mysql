export const helperValidateEmailAndPassword = (email, password) => {
    if(email === undefined || password === undefined || email.length === 0 || password.length === 0) return false
    if(password.length > 15 || password.length < 6) return false
    if(password.match(/[^a-zA-Z0-9]/g)) return false

    if(email.match(/[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-{2,4}]/g)) return false

    return true
}