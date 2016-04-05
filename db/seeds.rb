Badge.where(name: 'teamhero', description: 'Pessoa que mais contribuiu para o time').first_or_create
Badge.where(name: 'men at work', description: 'Alto número de pull requests').first_or_create
Badge.where(name: 'like a boss', description: 'Contribui ativamente para o time criando issues').first_or_create
Badge.where(name: 'IMHO', description: 'Você comenta em muitas atividades do projeto').first_or_create
