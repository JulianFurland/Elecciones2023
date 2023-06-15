using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP6_Elecciones_Sher_y_Furland.Models;

namespace TP6_Elecciones_Sher_y_Furland.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

      public IActionResult Index()
    {
        ViewBag.ListaPartidos = DB.ListarPartidos();
        return View();
    }
       public IActionResult VerDetallePartido(int IdPartido)
    {
        ViewBag.Partido = DB.VerInfoPartido(IdPartido);
        return View();
    }
         public IActionResult VerDetalleCandidato(int IdCandidato)
    {
        ViewBag.Candidato = DB.VerInfoCandidato(IdCandidato);
        return View();
    }
        public IActionResult AgregarCandidato(int IdPartido)
    {   
        ViewBag.IdPartido = IdPartido;
        return View();
    }

        [HttpPost]public IActionResult GuardarCandidato(Candidato can)
        {
            DB.AgregarCandidato(can);
            return View("VerDetallePartido");
        }
        public IActionResult EliminarCandidato(Candidato can)
        {
            DB.EliminarCandidato(can.IdCandidato);
            return View("VerDetallePartido");
        }

        public IActionResult Elecciones()
        {
            ViewBag.ListaPartidos = DB.ListarPartidos();
            return View();
        }
        public IActionResult Creditos()
        {
            return View();
        }
}
