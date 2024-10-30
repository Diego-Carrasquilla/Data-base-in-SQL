using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

[ApiController]
[Route("api/[controller]")]
public class EspacioPublicoController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    public EspacioPublicoController(ApplicationDbContext context)
    {
        _context = context;
    }

    [HttpGet("{codigo}")]
    public async Task<IActionResult> GetEspacioPublicoById(string codigo)
    {
        var espacio = await _context.EspaciosPublicos
            .FirstOrDefaultAsync(e => e.ID_Unico == codigo);

        if (espacio == null)
        {
            return NotFound(new { message = "Espacio público no encontrado." });
        }

        return Ok(espacio);
    }
}
