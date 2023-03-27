using Microsoft.AspNetCore.Mvc;
using Pizzas.API.Models;
using System.Text.Json;
namespace OMBDController.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class OMBDController: ControllerBase
    {

        [HttpGet("search")]
        public async Task<IActionResult> GetByTerm([FromQuery]string term)
        {
           string apiResponse= await HTTPHelper.GetContentAsync("http://www.omdbapi.com/?apikey=5ffe98f4&s="+term, null);
           var returnValue = JsonSerializer.Deserialize<SearchModel>(apiResponse);
           return Ok(returnValue);
        }
        [HttpGet("Movie/{id}")]
        public async Task<IActionResult> GetById(string id)
        {
           string apiResponse= await HTTPHelper.GetContentAsync("http://www.omdbapi.com/?apikey=5ffe98f4&i="+id, null);
           var returnValue = JsonSerializer.Deserialize<SearchByIdModel>(apiResponse);
           return Ok(returnValue);
        }



        }
    }