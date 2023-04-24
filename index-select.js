import config from './dbconfig.js';
import sql from 'mssql';
import PizzaService from './services/pizzas-services.js'
import Pizza from './Models/pizza.js'



let pizzaService=new PizzaService();
let GetById = await pizzaService.getById(4);
console.log(GetById);
let getAllPizzas= await pizzaService.getAll();
let pizzaNueva=new Pizza("Muzza Salada",1,400,"Una pizza rica");
let insertarPizza=await pizzaService.insert(pizzaNueva);
let pizza2=new Pizza("Muzza Salada",0,200,"Pizza mas barata");
let pizza3=Object.create(Pizza)
const returnedTarget = Object.assign(pizza3, pizza2);

console.log(pizza2);
let updeatearPizza=await pizzaService.update(pizza2,3);
let elimPizza=await pizzaService.deletById(2);


/*getAllPizzas.forEach(Pizza => {
    console.log(Pizza.Nombre);
});*/

console.log(insertarPizza)
console.log(updeatearPizza);
console.log(elimPizza)
process.exit()