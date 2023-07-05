namespace Projeto_Web_Lh_Pets_versão_1;

public class Program
{
    public static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);
        var app = builder.Build();

        app.MapGet("/", () => "Projeto Web - LH Pets versão 1!");

        app.UseStaticFiles(); //habilitando função para chamar as páginas
        app.MapGet("/index",(HttpContext contexto)=>{ //habilitar a rota
            contexto.Response.Redirect("index.html",false);
        });


        Banco dba=new Banco();
        app.MapGet("/listaClientes", (HttpContext contexto) => {
            contexto.Response.WriteAsync(dba.GetListaString());
        });

        app.Run();
    }
}
