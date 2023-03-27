using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using Dapper;
using Pizzas.API.Models;
public static class BD
{
    private static string CONNECTION_STRING = @"Persist Security Info=False;User ID=Pizzas;password=VivaLaMuzza123;Initial Catalog=DAI-Pizzas;Data Source=.;";
    public static List<Pizza> GetAll()
    {
        List<Pizza> returnList;
        returnList = new List<Pizza>();
        using (var connection = new SqlConnection(CONNECTION_STRING))
        {
            returnList = connection.Query<Pizza>("Pizzas_ObtenerTodos", commandType: System.Data.CommandType.StoredProcedure).ToList();
        }
        return returnList;
    }


    public static Pizza GetById(int id)
    {
        Pizza returnEntity = null;

        using (var connection = new SqlConnection(CONNECTION_STRING))
        {
            returnEntity = connection.QueryFirstOrDefault<Pizza>("Pizzas_ObtenerPorId", new { idPizza = id }, commandType: System.Data.CommandType.StoredProcedure);
        }

        return returnEntity;
    }

    public static int Insert(Pizza pizza)
    {

        int intRowsAffected = 0;
        using (SqlConnection connection = new SqlConnection(CONNECTION_STRING))


        {
            intRowsAffected = connection.Execute("Pizzas_Insertar", new { nombre = pizza.Nombre, libreGluten = pizza.LibreGluten, importe = pizza.Importe, descripcion = pizza.Descripcion }, commandType: System.Data.CommandType.StoredProcedure);
        }
        return intRowsAffected;
    }

    public static int UpdateById(Pizza pizza)
    {

        int intRowsAffected = 0;
        using (var connection = new SqlConnection(CONNECTION_STRING))
        {
            intRowsAffected = connection.Execute("Pizzas_UpdatePorID", new
            {

                idPizza = pizza.Id,
                nombre = pizza.Nombre,
                libreGluten = pizza.LibreGluten,
                importe = pizza.Importe,
                descripcion = pizza.Descripcion
            }, commandType: System.Data.CommandType.StoredProcedure
            );
        }
        return intRowsAffected;
    }

    public static int DeleteById(int id)
    {

        int intRowsAffected = 0;


        using (SqlConnection connection = new SqlConnection(CONNECTION_STRING))
        {
            intRowsAffected = connection.Execute("Pizzas_DeleteById", new { idPizza = id }, commandType: System.Data.CommandType.StoredProcedure);
        }
        return intRowsAffected;
    }

}


