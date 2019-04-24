using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using TinTucNews.Models;
using TinTucNews.Models.Extension;

namespace TinTucNews.Controllers
{
    public class AccountsController : Controller
    {
        private readonly ILogger _logger;
        private readonly NewContext _context;

        public AccountsController(NewContext context, ILogger<AccountsController> logger)
        {
            _context = context;
            _logger = logger;

        }

        // GET: Accounts
        public async Task<IActionResult> Index()
        {
            _logger.LogInformation("Account page hit!");
            return View(await _context.Accounts.ToListAsync());
        }

        // GET: Accounts/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts
                .FirstOrDefaultAsync(m => m.Id == id);
            if (account == null)
            {
                return NotFound();
            }
            _logger.LogInformation("Account Details hit!");
            return View(account);
        }

        // GET: Accounts/Create
        public IActionResult Create()
        {
            _logger.LogInformation("Account Create hit!");
            return View();
        }

        // POST: Accounts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Username,Password,CreatedDate,UpdatedDate")] Account account)
        {
            if (ModelState.IsValid)
            {
                string temp = HashPwdTool.GeneratePassword(account.Password);
                account.Password = temp;
                _context.Add(account);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index)).WithSuccess("Thông báo", "Tạo tài khoản thành công!");
            }
            return View(account);
        }

        // GET: Accounts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts.FindAsync(id);
            if (account == null)
            {
                return NotFound();
            }
            _logger.LogInformation("Account Edit hit!");
            return View(account);
        }

        // POST: Accounts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Username,Password,CreatedDate,UpdatedDate")] Account account)
        {
            if (id != account.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(account);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AccountExists(account.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index)).WithSuccess("Thông báo", "Cập nhật tài khoản thành công!");
            }
            return View(account);
        }

        // GET: Accounts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts
                .FirstOrDefaultAsync(m => m.Id == id);
            if (account == null)
            {
                return NotFound();
            }
            _logger.LogInformation("Delete page hit!");
            return View(account);
        }

        // POST: Accounts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var account = await _context.Accounts.FindAsync(id);
            _context.Accounts.Remove(account);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index)).WithSuccess("Thông báo", "Xoá tài khoản thành công!");
        }

        private bool AccountExists(int id)
        {
            return _context.Accounts.Any(e => e.Id == id);
        }
    }
}
