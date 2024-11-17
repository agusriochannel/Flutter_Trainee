package handlers

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"net/http"

	"the-nest/initializers"
	"the-nest/models"

	"github.com/gofiber/fiber/v2"
)

// 22. [Group C] Buat API List VA: Ambil Data List Billing dari External API List VA
//               dan kembalikan list ke FE

// // Fungsi untuk memanggil External API

func callExternalAPI(pass, url string) ([]byte, error) {

	client := &http.Client{}
	//url = url
	// Buat request baru
	req, err := http.NewRequest(pass, "http://147.139.143.164:8082/api/v1"+url, nil)
	if err != nil {
		return nil, err
	}

	// Mengirim Permintaan dengan client.Do
	resp, err := client.Do(req)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	// Baca isi body response
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	fmt.Println("1. ", body)
	// Cek status response
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("T0 failed to fetch data, status code: %d", resp.StatusCode)
	}

	return body, nil
}

// List Virtual Account
func ListVAHandler(c *fiber.Ctx) error {
	// Simulasi External API untuk mengambil list billing
	externalURL := "va"
	resp, err := callExternalAPI("GET", externalURL)
	if err != nil {
		return c.Status(http.StatusBadGateway).JSON(fiber.Map{
			"error": "T1 Failed to fetch list from external API",
		})
	}

	return c.JSON(fiber.Map{
		"data": string(resp),
	})
}

// 23. [Group C] Buat API Check No VA: Check unpaid No VA from VA id via External API List Unpaid No VA
//               dan API Generate No VA (Jika belum ada)

func CheckNoVAHandler(c *fiber.Ctx) error {
	vaID := c.Params("/va")

	var va models.VirtualAccount
	if err := initializers.DB.Where("va_id = ? AND is_paid = ?", vaID, false).First(&va).Error; err != nil {
		// Jika tidak ada, maka generate nomor VA baru dari API eksternal
		generateURL := "/:va"
		resp, err := callExternalAPI("POST", generateURL)
		fmt.Println(err)
		if err != nil {
			return c.Status(http.StatusBadGateway).JSON(fiber.Map{
				"error": "T2 Failed to generate VA number from external API",
			})
		}

		// Simulasi respon generate VA
		va.NoVA = string(resp)
		va.VAID = vaID
		va.Amount = 100000 // Contoh nilai yang diberikan
		va.IsPaid = false
		initializers.DB.Create(&va)
	}

	return c.JSON(va)
}

// 24. [Group C] Buat API Pay No VA: Bayar VA sesuai dengan va id dan no va dan amount-nya
//               via External API Pay No VA dan kembalikan info ke FE

func PayNoVAHandler(c *fiber.Ctx) (error) {
	payload := struct {
		VA string `json:"va"`
	}{}

	if err := c.BodyParser(&payload); err != nil {
		return err
	}

	externalrequest := struct {
		VA string `json:"va_code"`
		VA_ID string `json: "va_id"`
	}{
		VA_ID: payload.VA,
	}
	v, _ := json.Marshal(externalrequest)

	client := &http.Client{}
	// Buat request baru
	req, err := http.NewRequest("POST", "http://147.139.143.164:8082/api/v1/va", bytes.NewBuffer(v))

	if err != nil {
		return c.JSON(err) 
	}

	// Mengirim Permintaan dengan client.Do
	resp, err := client.Do(req)
	if err != nil {
		return c.JSON(err)
	}
	defer resp.Body.Close()

	// Baca isi body response
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return c.JSON(err)
	}
	fmt.Println("1. ", body)
	// Cek status response
	if resp.StatusCode != http.StatusOK {
		return fmt.Errorf("failed to fetch data, status code: %d", resp.StatusCode)
	} 

	return c.JSON(err) 

	return c.JSON(fiber.Map{
		"message":  "Payment successful",
		"response": resp,
	})
}
