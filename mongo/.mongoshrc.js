// Set a custom prompt
const originalPrompt = mongosh._prompt;

mongosh._prompt = function() {
    return `db: ${db.getName()}> `; // Change this to customize the prompt
};

