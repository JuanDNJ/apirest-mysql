import * as tmi from "tmi.js";
import { io } from "../../app.js";
import { twitchOaut } from "../../config/index.js";

const opts = {
    identity: {
        username: 'shacoBot',
        password: `oauth:${twitchOaut}`
    },
    channels: [
        'juandnjv'
    ]
};

const client = new tmi.client(opts);
// Register our event handlers (defined below)
client.on('message', onMessageHandler);

// Called every time the bot connects to Twitch chat
client.on('connected', (addr, port) => {
    client.action('shacoBot', `Bienvenidos¡ Conexion con  ${addr}:${port}`)
    // console.log(`* Connected to ${addr}:${port}`);
});

// Connect to Twitch:
client.connect().catch(err => console.log(err));

function onMessageHandler(target, context, msg, self) {

    if (self) { return; } // Ignore messages from the bot

    // Remove whitespace from chat message
    const commandName = msg.trim();
    io.on('connection', (soket) => {
        console.log(`${soket.client.id} a user connected `);
        soket.on('message', (msg) => {
            io.emit('message', commandName)
        })
        io.emit('message', commandName)
    });
    // If the command is known, let's execute it
    if (commandName === '!dice') {
        const num = rollDice();
        client.say(target, `You rolled a ${num}`);
        console.log(`* Executed ${commandName} command`);
    } else {
        console.log(`* Unknown command ${msg}`);
    }
}

// Function called when the "dice" command is issued
function rollDice() {
    const sides = 6;
    return Math.floor(Math.random() * sides) + 1;
}



export const twitch = {
    all: async (req, res) => {
        try {
            res.status(200).json({
                message: 'Twitch'
            });
        } catch (error) {
            console.log(error);
        }
    }
}