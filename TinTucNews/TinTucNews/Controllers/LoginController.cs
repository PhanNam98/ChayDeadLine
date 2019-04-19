using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TinTucNews.Models;
using TinTucNews.Models.Extension;

namespace TinTucNews.Controllers
{
    public class LoginController : Controller
    {
        private readonly NewContext _context;

        public LoginController(NewContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (ModelState.IsValid == true)
            {

                var accountDb = _context.Accounts.FirstOrDefault(x => x.Username == model.Username);

                if (accountDb != null)
                {
                    if (HashPwdTool.CheckPassword(model.Password, accountDb.Password))
                    {
                        await this.SignInUser(accountDb, false);
                        return this.RedirectToAction("Index", "Home").WithSuccess("Thông báo", "Success! Welcome back " + accountDb.Username.ToUpper() + "!");
                    }
                    else
                    {
                        ModelState.AddModelError(string.Empty, "Invalid Username or password");
                        return View("Index");
                    }
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Invalid Username or password");
                    return View("Index");
                }
            }
            else
            {
                ModelState.AddModelError(string.Empty, "Invalid Username or password");
                return View("Index");
            }
        }


        private async Task SignInUser(Account acc, bool isPersistent)
        {
            // Initialization.
            var claims = new List<Claim>();

            try
            {
                // Setting
                HttpContext.Session.SetString("IdAccount", acc.Id.ToString());
                HttpContext.Session.SetString("Username", acc.Username);
                claims.Add(new Claim(ClaimTypes.Name, acc.Username));
                var claimIdenties = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                var claimPrincipal = new ClaimsPrincipal(claimIdenties);
                var authenticationManager = Request.HttpContext;

                // Sign In.
                await authenticationManager.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, claimPrincipal, new AuthenticationProperties() { IsPersistent = isPersistent });
            }
            catch (Exception ex)
            {
                // Info
                throw ex;
            }
        }

        public async Task<IActionResult> Logout()
        {
            try
            {
                // Setting.
                var authenticationManager = Request.HttpContext;

                // Sign Out.
                HttpContext.Session.Remove("IdAccount");
                HttpContext.Session.Remove("Username");
                await authenticationManager.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            }
            catch (Exception ex)
            {
                // Info
                throw ex;
            }

            // Info.
            return this.RedirectToAction("Index", "Home");
        }

    }
}