'use client'

import {  signIn, signOut } from "next-auth/react"
import Image from "next/image"
import {BsPersonPlus} from "react-icons/bs"




export default ({ session }) => {
    return (
        <> 
            {!session ? (
                <button className="p-3 border-transparent text-4xl border" 
                onClick={() => signIn("google")}
                >
                    <BsPersonPlus /> 
                    </button>   
            ) : (
                <div className="bg-green-500">
                <button onClick={() => signOut()}>
                    <Image 
                    className="object-fill h-12 w-12 rounded-full "
                     src={session?.user?.image} 
                     width="100" 
                     height={200} 
                     alt="Foto de Perfil" /> Logout
                </button>
                <h1>Hola a todos estoy logueado</h1>
                </div>
            )}
        </>
    );
};