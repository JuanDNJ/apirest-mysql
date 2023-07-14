import {config}  from "dotenv"
config()

export const PORT_SERVER = process.env.PORT_SERVER || 5174;
export const DB_PORT = process.env.DB_PORT || 9500;
export const DB_HOST = process.env.DB_HOST || "localhost";
export const DB_USER = process.env.DB_USER || "juandfe";
export const DB_PASSWORD = process.env.DB_PASSWORD || "NereaJoel@2023";
export const DB_NAME = process.env.DB_NAME || "mascotas";