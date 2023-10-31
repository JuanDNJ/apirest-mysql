import "dotenv/config"

export const PORT_SERVER = process.env.PORT_SERVER ?? 0;
export const DB_PORT = process.env.DB_PORT ?? 9500;
export const DB_HOST = process.env.DB_HOST ?? "localhost";
export const DB_USER = process.env.DB_USER ?? "root";
export const DB_PASSWORD = process.env.DB_PASSWORD ?? "";
export const DB_NAME = process.env.DB_NAME ?? "api";
export const HASH_SECRET_KEY = process.env.HASH_SECRET_KEY;
export const IAT = Math.floor(Date.now() / 1000) - 30
export const EXP = Math.floor(Date.now() / 1000) + (90 * (24 * 60000)) // 3 meses
export const EXP_USER = Math.floor(Date.now() / 1000) + (30 * (24 * 60000)) // 3 meses
export const twitchAuthorization = (idClient) => `https://id.twitch.tv/oauth2/authorize?response_type=token&client_id=${idClient}&redirect_uri=http://localhost:3000&scope=chat%3Aread+chat%3Aedit`;
