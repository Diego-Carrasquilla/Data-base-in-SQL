using Microsoft.EntityFrameworkCore;
using TuProyecto.Models;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    public DbSet<EspacioPublico> EspaciosPublicos { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        modelBuilder.Entity<EspacioPublico>()
            .ToTable("espacio_publico");

        // Si es Keyless
        modelBuilder.Entity<EspacioPublico>().HasNoKey();

        // Si tiene clave primaria no necesitas la línea anterior.
    }
}
