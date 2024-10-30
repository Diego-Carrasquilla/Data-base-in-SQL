using Microsoft.EntityFrameworkCore;

namespace TuProyecto.Models
{
    [Keyless]
    public class EspacioPublico
    {
        public string ID_Unico { get; set; }
        public string NombreEspacio { get; set; }
        public string DireccionEspacio { get; set; }
        public string TipoEspacio { get; set; }
        public string NombreBarrio { get; set; }
        public string NombreComuna { get; set; }
        public double AreaTotalM2 { get; set; }
        public int IdEspacio { get; set; }
        public string DominioEspacio { get; set; }
        public string EstadoEspacio { get; set; }
        public int IdEspacioGeo { get; set; }
        public double Longitud { get; set; }
        public double Latitud { get; set; }
        public int CodigoBarrio { get; set; }
        public int CodigoComuna { get; set; }
    }
}
