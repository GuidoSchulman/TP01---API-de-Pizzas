import config from './../dbconfig.js';
import sql from 'mssql';
import Pizza from './../Models/pizza.js';
export default class PizzaService {
    
    getAll = async () => {
        let returnEntity=0;
        console.log('Estoy en: PizzaService.getAll()');
        try{
            let pool = await sql.connect(config);
            let result = await pool.request()
            .query('SELECT * FROM Pizzas');
        returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
         return returnEntity;
    }
    getById = async (id) => {
        let returnEntity = null;
        console.log('Estoy en: PizzaService.GetById(id)');
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                .input('pId', sql.Int, id)
                .query('SELECT * FROM Pizzas Where id = @pId');
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }
    insert = async (Pizza) => {
        let rowsAffected = 0;
        console.log('Estoy en: PizzaService.insert(pizza)');
        try{
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pNombre',sql.VarChar,Pizza.nombre)
            .input('pLibreGluten',sql.Bit,Pizza.libreGluten)
            .input('pImporte',sql.Float,Pizza.importe)
            .input('pDescripcion',sql.VarChar,Pizza.descripcion)
            .query('INSERT [dbo].[Pizzas] ([Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (@pNombre,@pLibreGluten, @pImporte, @pDescripcion)'),
            rowsAffected = result.rowsAffected
        }catch(error){
            console.log(error);

        }
    return rowsAffected;
    }
    
    update = async (Pizza,Id) => {
        let rowsAffected = 0;
        console.log('Estoy en: PizzaService.update(pizza)');
        try{
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pId',sql.Int,Id)
            .input('pNombre',sql.VarChar,Pizza.nombre)
            .input('pLibreGluten',sql.Bit,Pizza.libreGluten)
            .input('pImporte',sql.Float,Pizza.importe)
            .input('pDescripcion',sql.VarChar,Pizza.descripcion)
            //.query('UPDATE [dbo].[Pizzas] SET [Nombre]=',"@pNombre",' [LibreGluten]=@pLibreGluten, [Importe]=@pImporte, [Descripcion]=','@pDescripcion' , 'WHERE Id=@pId')
            .query('UPDATE [dbo].[Pizzas] SET [Nombre]=@pNombre,  [LibreGluten]=@pLibreGluten, [Importe]=@pImporte, [Descripcion]= @pDescripcion  WHERE Id=@pId')
            rowsAffected = result.rowsAffected
        }catch(error){
            console.log(error);

        }
        console.log(Pizza.Nombre)
    return rowsAffected;
    }
    deletById = async (id) => {
        let rowsAffected = 0;
        console.log('Estoy en: PizzaService.deleteById(id)');
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                .input('pId', sql.Int, id)
                .query('DELETE FROM Pizzas WHERE id=@pId')
            rowsAffected = result.rowsAffected;


        } catch (error) {
            console.log(error);
        }
        return rowsAffected
    }
}
