## Overview of Codebase


### main functions 

| File	                | Description	     | Details
| ------                | ------             | ------ 
| ./functions/bot.js    | Main Bot Code	     | Imports telebot, alba credentials, and userids. Initializes a telebot instance with the token.
| ./functions/dev.js	| Local Code deployment	| Will send data to LucasBotLocalTestsBot.
| ./functions/index.js	| Production Code deployment	| Will send data to BerkeleyPortugueseBot.

### utls 

| File  	              | Description	       | Details
| ------                  | ------             | ------
| utils/parseAlbaHTML.js | Parse Alba HTML	|   Extracts id, territory, city, status, and details. Exports these values.
| utils/requestAlbaTerritories.js	| Request Alba Territories	| Fetches HTML for requesting territories.
| utils/validateUserIds.js	        | Validate User IDs	| Validates the user IDs for authentication.
