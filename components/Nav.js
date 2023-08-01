import Login from "./auth/Login";
import { getServerSession } from "next-auth/next";
import  {authOptions} from "../pages/api/auth/[...nextauth]";
import Link from "next/link";

export default async function Nav() {
    const session = await getServerSession(authOptions)
    //hacer que muestre el return solo si está logueado

    return (
        <nav className="flex items-center justify-between bg-yellow-500">
            <Link href={"/"}>Home</Link>
            <Login session={session} />
            
        </nav>
    );
}    