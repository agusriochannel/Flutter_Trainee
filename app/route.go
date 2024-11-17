package main

import (
	"github.com/gofiber/fiber/v2"

	"the-nest/handlers"
)

func SetupRoutes(app fiber.Router) {
	authRoutes := app.Group("/auth")
	authRoutes.Post("/register", handlers.SignUpUser)
	authRoutes.Post("/login", handlers.SignInUser)
	authRoutes.Get("/logout", DeserializeUser, handlers.LogoutUser)

	app.Get("/users/me", DeserializeUser, handlers.GetMeHandler)
	app.Get("/users/", DeserializeUser, allowedRoles([]string{"admin", "moderator"}), handlers.GetUsersHandler)

	authRoutes = app.Group("/c") 
	authRoutes.Get("/list", handlers.ListVAHandler)
	authRoutes.Post("/check_No_va", handlers.CheckNoVAHandler)	
	authRoutes.Post("/pay_No_va", handlers.PayNoVAHandler)
}
