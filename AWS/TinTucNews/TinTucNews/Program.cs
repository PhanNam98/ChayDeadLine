using System.IO;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;

namespace TinTucNews
{
    public class Program
    {
        public static IHostingEnvironment HostingEnvironment { get; private set; }
        public static IConfiguration Configuration { get; private set; }

        public static void Main(string[] args)
        {
            var host = new WebHostBuilder()
              .UseKestrel()
              .UseContentRoot(Directory.GetCurrentDirectory())
              .UseIISIntegration()
              .ConfigureAppConfiguration((context, configBuilder) =>
              {
                  HostingEnvironment = context.HostingEnvironment;

                  configBuilder.SetBasePath(HostingEnvironment.ContentRootPath)
                      .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                      .AddJsonFile($"appsettings.{HostingEnvironment.EnvironmentName}.json", optional: true)
                      .AddEnvironmentVariables();

                  Configuration = configBuilder.Build();
              })
              .UseStartup<Startup>()
              .Build();

            host.Run();
        }
    }
}
