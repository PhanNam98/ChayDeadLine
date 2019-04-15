using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TinTuc.Models;

namespace TinTuc.Controllers
{
    public class HomeController : Controller
    {
        TinTucEntities db = new TinTucEntities();
        public ActionResult Index()
        {
            var list = db.News.Take(3).ToList();
            return View(list);
        }

        public ActionResult About(int id)
        {
            ViewBag.Message = "Chi tiết";
            News a = db.News.Where(p => p.news_id == id).SingleOrDefault();
            
            return View(a);
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}