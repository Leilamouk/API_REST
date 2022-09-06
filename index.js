var express = require("express") //import express;
var mysql = require("mysql") //import mysql;
var app = express()

app.use(express.json()) // adds a new middleware to the app;

const con = mysql.createConnection({   //connect to db;
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'shoesShop'
})

con.connect((err)=>{
    if(err)
    {
        console.log(err)
    }else{
        console.log('connexion établie');
    }
})

//respond with "Hello World" when a GET request is made to the homepage;
app.get('/', (req, res)=>{  
    res.send('Hello World');
})

//List the shoes saved in the database;
app.get('/api/chaussures', (req, res)=>{
    
    con.query('SELECT * FROM chaussures',(err,result)=>{
        if(err) res.status(500).send(err)
        
        res.status(200).json(result)
    })
})


//Add the shoes to the database;
app.post('/api/chaussures', (req, res)=>{
    const id_chaussure = req.body.id_chaussure;
    const id_marque = req.body.id_marque;
    const taille = req.body.taille;
    const couleur = req.body.couleur;
    const prix = req.body.prix;
    const nom_chaussure = req.body.nom_chaussure;

    
    con.query('INSERT INTO chaussures VALUES(NULL,?,?,?,?,?)',[id_chaussure,id_marque,taille,couleur,prix,nom_chaussure],(err,result)=>{
        if(err)
    {
        console.log(err)
    }else{
        res.send('POSTED');
    }
    })
})

//Add shoe brands to the database;
app.post('/api/marque', (req, res)=>{
    const id_marque = req.body.id_marque;
    const nom= req.body.nom;
    const logo= req.body.logo;
    
    
    con.query('INSERT INTO marque VALUES(NULL,?,?)',[id_marque, nom,logo],(err,result)=>{
        if(err)
    {
        console.log(err)
    }else{
        res.send('POSTED');
    }
    })
})



app.listen(4002, (err)=>{
    if(err)
    {
        console.log(err)
    }else{
        console.log('on port 4002');
    }
})