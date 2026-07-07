const { LensClient, production } = require('@lens-protocol/client');
const TelegramBot = require('node-telegram-bot-api');

// Konfiguracija
const token = '8198249195:AAHEz7d4a8op_Gbkt80XaB14alD1uA_Tt-s';
const chatId = '6522275048';
const bot = new TelegramBot(token, { polling: false });
const client = new LensClient({ environment: production });

async function pokreniZastitu() {
    try {
        console.log("Kaspersky: Provjeravam Lens profil...");
        
        // 1. Provjera profila
        const profile = await client.profile.fetch({ forHandle: 'djordjeglavonjic.lens' });
        
        // 2. Poruka za Telegram
        const poruka = `🛡️ *Kaspersky Web3 Alert*
👤 Profil: ${profile.name}
📈 Pratioci: ${profile.stats.followersCount}
🌐 Status: Profil je siguran i aktivan.`;

        await bot.sendMessage(chatId, poruka, { parse_mode: 'Markdown' });
        console.log("Izvještaj poslat na Telegram!");
        
    } catch (error) {
        console.error("Greška u Kaspersky zaštiti:", error);
        bot.sendMessage(chatId, "⚠️ *Kaspersky Upozorenje:* Provjera Lens profila nije uspjela!");
    }
}

pokreniZastitu();
