using System.Collections.Generic;
using System.Linq;
using System;
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

        [HttpGet("{id}")]
        public async Task<ActionResult<Product>> GetById(long id)
        {
            var product = await _context.Products.FindAsync(id);

            if (product == null)
            {
                //NotFound
                //Http status Code: 404
				//A product matching the provided id parameter doesn't exist in the database.
                return NotFound();
            }

            //Ok
            //Http status Code: 200
            //A product matching the provided id parameter exists in the database.
            //The product is included in the response body in the media type as defined in the Accept HTTP request header (JSON by default).
            return product;
        }

        [HttpPost]
        public async Task<ActionResult<Product>> Create(Product product)
        {
           try {
			    _context.Products.Add(product);
				await _context.SaveChangesAsync();

				//CreatedAtAction
				//Http status Code: 201
				//The product was added to the database.
				//The product is included in the response body in the media type as defined in the Accept HTTP request header (JSON by default).
				return CreatedAtAction(nameof(GetById), new { id = product.Id }, product);
		   }
		   catch(Exception)
		   {
			   //BadRequest
			   //Http status Code: 400
			   //The Product object provided in the request body is invalid.
			   return BadRequest();
		   }
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(long id, Product product)
        {
			try 
			{
				if (id != product.Id)
				{
					//BadRequest
					//Http status Code: 400
					//The Product object's Id value doesn't match the id value provided in the route.
					return BadRequest();
				}

				_context.Entry(product).State = EntityState.Modified;
				await _context.SaveChangesAsync();

				//NoContent
				//Http status Code: 204
				//The product was updated in the database.
				return NoContent();
			}
			catch(Exception)
			{
			   //BadRequest
			   //Http status Code: 400
			   //The Product object provided in the request body is invalid.
			   return BadRequest();
			}
        }

        [HttpDelete("{id}")]
		public async Task<IActionResult> Delete(long id)
		{
			try
			{
				var product = await _context.Products.FindAsync(id);

				if (product == null)
				{
					//NotFound
					//Http status Code: 404
					//A product matching the provided id parameter doesn't exist in the database.
					return NotFound();
				}

				_context.Products.Remove(product);
				await _context.SaveChangesAsync();

				//NoContent
				//Http status Code: 204
				//The product was deleted in the database.
				return NoContent();
			}
		   catch(Exception)
		   {
			   //BadRequest
			   //Http status Code: 400
			   //Error occure when deleting Product.
			   return BadRequest();
		   }
		}
    }
}
