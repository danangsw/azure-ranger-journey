using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RetailApi.Data;
using RetailApi.Models;

namespace RetailApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly ProductsContext _context;

        public ProductsController(ProductsContext context)
        {
            _context = context;
        }

        [HttpGet]
        public ActionResult<List<Product>> GetAll() =>
            _context.Products.ToList();

        // The GET (by ID) action will go here

        // The POST action will go here

        // The PUT action will go here

        // The DELETE action will go here
    }
}
