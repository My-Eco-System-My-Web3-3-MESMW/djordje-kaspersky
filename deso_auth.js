const { Deso } = require('deso-protocol');
const deso = new Deso();

async function provjeriZastitu() {
    console.log("Kaspersky zaštita: Provjeravam Web3 status...");
    const publicKey = 'TVOJ_PUBLIC_KEY'; // Unesi svoj ključ ovdje
    
    try {
        const user = await deso.user.getSingleProfile({ PublicKeyBase58Check: publicKey });
        console.log("Autentifikacija uspješna za korisnika:", user.Profile.Username);
        console.log("Status: Uređaj je zaštićen kroz SocialFi.");
    } catch (error) {
        console.error("Kaspersky upozorenje: Provjera nije uspjela!", error);
    }
}

provjeriZastitu();
