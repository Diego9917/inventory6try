//aqui se hará el post de los negocios para los usuarios registrados
import client from "../../../prisma/client";


// model Negocio {
//     id_negocio          String               @id @default(cuid())
//     userId              String
//     id_distribuidor     String
//     nombre_negocio      String
//     direccion_negocio   String
//     fecha_creacion      DateTime
//     usuario             User                 @relation(fields: [userId], references: [id])
//     distribuidor        Distribuidor         @relation(fields: [id_distribuidor], references: [id_distribuidor])
//     movimientos_entrada Movimiento_Entrada[]
//     movimientos_salida  Movimiento_Salida[]
//   }
export async function GET(request){
    const user = await client.user.findMany();

    await client.negocio.create({
        data: {
            userId: user[0].id,
            id_distribuidor: "1",
            nombre_negocio: "Negocio 1",
            direccion_negocio: "Calle 1",
            fecha_creacion: new Date(),
        },
    });

                
    return new Response(JSON.stringify(user))
}