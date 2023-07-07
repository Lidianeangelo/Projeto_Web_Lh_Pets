using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using LHPet.Models;

namespace LHPet.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        //instâncias do tipo cliente
        Cliente cliente1=new Cliente(1, "Lidiane Angelo", "343454567-76","lidiane-angelo@gmail.com","Lua");

        //lista de clientes
        List<Cliente> listaClientes=new List<Cliente>();
        listaClientes.Add(cliente1);

        ViewBag.listaClientes=listaClientes; //coloca na bolsa e manda pra View

        //instâncias do tipo cliente
        Fornecedor fornecedor1=new Fornecedor(1, "Juliana Cruz", "33.343.466/0001-90","juliana-cruz@gmail.com");

        //lista de clientes
        List<Fornecedor> listaFornecedor=new List<Fornecedor>();
        listaFornecedor.Add(fornecedor1);

        ViewBag.listaFornecedor=listaFornecedor; //coloca na bolsa e manda pra View

        return View();
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
}
