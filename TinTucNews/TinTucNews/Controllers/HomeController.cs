using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using TinTucNews.Models;
using System.Linq;
using System.Threading.Tasks;

namespace TinTucNews.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger _logger;
        private readonly NewContext _context;

        public HomeController(NewContext context, ILogger<HomeController> logger)
        {
            _context = context;
            _logger = logger;
        }


        // GET: News
        public async Task<IActionResult> Index()
        {
            // Sends a message to configured loggers, including the Stackdriver logger.
            // The Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker logger will log all controller actions with
            // log level information. This log is for additional information.
            var lst = await _context.News.ToListAsync();
            _logger.LogInformation("Home page hit!");
            return View(lst);
        }

        // GET: New/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                _logger.LogInformation("Return nothing");
                return NotFound();
            }

            var @new = await _context.News
                .FirstOrDefaultAsync(m => m.Id == id);

            if (@new == null)
            {
                _logger.LogInformation("Return nothing");
                return NotFound();
            }
            DetailNewS de = new DetailNewS(@new, await _context.News.ToListAsync());
            _logger.LogInformation("Details hit!");
            return View(de);
        }

        public async Task<IActionResult> Catelogies(int id = 0)
        {
            if (id == 0)
            {
                _logger.LogInformation("Return nothing");
                return View("Error");
            }
            var lst = await _context.News.Where(x => x.Id_Category == id).ToListAsync();
            _logger.LogInformation("Catelogies hit!");

            return View(lst);
        }

        public async Task<IActionResult> Search(string key)
        {
            if (key == null || key == "")
            {
                _logger.LogInformation("Return nothing");
                return View("Error");
            }
            var lst = await _context.News.Where(p => p.Title.Contains(key) || p.Content.Contains(key)).ToListAsync();
            _logger.LogInformation("Search hit!");
            return View(lst);
        }

        public IActionResult About()
        {
            return View();
        }

        public IActionResult Contact()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Error()
        {
            // Log messages with different log levels.
            _logger.LogError("Error page hit!");
            return View();
        }
    }
}
