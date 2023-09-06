const emitError = (options) => {
    try {
        const newError = new Error();
        if (typeof options === 'string') {
            const temArray = options.split(",")
            newError.name = temArray[1]
            newError.message = temArray[0]
            if(temArray[2] && temArray[2].length > 0){
                newError.stack = temArray[2]
            }
            
        } 
        if (typeof options === 'object') {
            if (Array.isArray(options)) {
                newError.name = options[1]
                newError.message = options[0]
                if(options[2] && options[2].length > 0){
                    newError.stack = options[2]
                }
            
            } else {
                const { name, message, stack } = options
                newError.name = name
                newError.message = message
                if(stack && stack.length > 0){
                    newError.stack = stack
                }

            }
        } else {
            newError.name = 'Global Error'
            newError.message = `Internal server error`
            newError.stack = '500'
        }
        return newError
    } catch (error) {
        throw new Error(error)
    }
}
export default emitError 