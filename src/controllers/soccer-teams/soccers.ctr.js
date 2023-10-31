import { db } from "../../db/index.js";
import { handlerDataSrtringToArray } from "../../helpers/index.js";
const pool = await db("equipos_futbol");
if (!pool) throw new Error("No hay conexion con la base de datos");


export class SoccerTeamsCtr {
  all = async (req, res) => {
    const query = await pool.query("SELECT * FROM `equipos`");
    const clubs = query[0].map((club) => {
      club.telefonos = handlerDataSrtringToArray(club.telefonos);
      return club;
    });
    res.status(200).json({
      message: "Get all teams",
      clubs,
    });
  }
  id = (req, res) => {
    res.status(200).json({
      message: "Get id team",
    });
  }
}

const equipos = {
  get: {
    all: async (req, res) => {
      const query = await pool.query("SELECT * FROM `equipos`");
      const clubs = query[0].map((club) => {
        club.telefonos = handlerDataSrtringToArray(club.telefonos);
        return club;
      });
      res.status(200).json({
        message: "Get all teams",
        clubs,
      });
    },
    id: (req, res) => {
      res.status(200).json({
        message: "Get id team",
      });
    },
  },
};

export default equipos;
