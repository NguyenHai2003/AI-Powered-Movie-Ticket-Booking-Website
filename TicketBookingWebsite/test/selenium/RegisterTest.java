package selenium;

import java.time.Duration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.junit.Assert;

public class RegisterTest {
    
    private WebDriver driver;
    private WebDriverWait wait;

    @Before
    public void setUp() {
        driver = new ChromeDriver();
        wait = new WebDriverWait(driver, Duration.ofSeconds(20));
        driver.manage().window().maximize();
        driver.get("http://localhost:9999/DoAnWebCinema/register.htm");
        System.out.println("Before each test - Browser opened and navigated to register page");
    }

    @Test
    public void testSuccessfulRegistration() {
        String uniqueEmail = "nguyenquocminhkhoa" + System.currentTimeMillis() + "@gmail.com";
        System.out.println("Starting testSuccessfulRegistration with email: " + uniqueEmail);
        fillForm("Nguyen Quoc Minh Khoa", "true", "0912345678", 
                uniqueEmail, "123456", "Ho Chi Minh", "15", "06", "1995");
        
        clickSubmitButton();

        try {
            WebElement modal = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("registerSuccessModal")));
            WebElement modalBody = modal.findElement(By.className("modal-body"));
            System.out.println("Modal body text: " + modalBody.getText());
            Assert.assertTrue("Should show success message in modal",
                modalBody.getText().contains("successfully registered"));
        } catch (Exception e) {
            System.out.println("Modal not found. Page source: " + driver.getPageSource());
            throw e;
        }
    }

    @Test
    public void testInvalidPhoneNumberFormat() {
        System.out.println("Starting testInvalidPhoneNumberFormat");
        fillForm("Nguyen Van Binh", "true", "abc123", 
                "nguyenvanb@gmail.com", "123456", "Ha Noi", "15", "06", "1995");
        
        clickSubmitButton();

        try {
            WebElement phoneError = wait.until(ExpectedConditions.visibilityOfElementLocated(
                By.xpath("//input[@id='customer_phone']/following-sibling::span[@class='errors']")
            ));
            System.out.println("Phone error text: " + phoneError.getText());
            Assert.assertTrue("Should show phone number format error",
                phoneError.getText().contains("phone number") || phoneError.getText().contains("Số điện thoại không hợp lệ!"));
        } catch (Exception e) {
            System.out.println("Phone error not found. Page source: " + driver.getPageSource());
            throw e;
        }
    }

    @Test
    public void testInvalidEmailFormat() {
        System.out.println("Starting testInvalidEmailFormat");
        fillForm("Nguyen Van Cuong", "false", "0912345678", 
                "nguyenvancuong.com", "123456", "Vung Tau", "15", "06", "1995");
        
        WebElement emailField = driver.findElement(By.id("customer_email"));

        clickSubmitButton();

        String validationMessage = emailField.getAttribute("validationMessage");
        System.out.println("Email validation message: " + validationMessage);

        Assert.assertTrue("Email validation should mention '@' or format",
            validationMessage.contains("@") || validationMessage.toLowerCase().contains("email"));
    }

    @Test
    public void testDuplicateEmail() {
        System.out.println("Starting testDuplicateEmail");
        fillForm("Nguyen Quoc Khoa", "true", "0912345678", 
                "nguyenquockhoa5549@gmail.com", "Password123!", "Dong Nai", "15", "06", "1995");
        
        clickSubmitButton();

        try {
            // Check for global error message in error-message div (for duplicate email)
        	WebElement errorMessage = wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("#dstaikhoan\\.email\\.errors")));
            System.out.println("Error message text: " + errorMessage.getText());
            Assert.assertTrue("Should show duplicate email error",
                errorMessage.getText().contains("already exists") || errorMessage.getText().contains("đã tồn tại"));
        } catch (Exception e) {
            System.out.println("Error message not found. Page source: " + driver.getPageSource());
            throw e;
        }
    }

    private void fillForm(String name, String gender, String phone, String email, 
                         String password, String address, String day, String month, String year) {
        driver.findElement(By.id("customer_name")).sendKeys(name);
        new Select(driver.findElement(By.id("customer_gender"))).selectByValue(gender);
        driver.findElement(By.id("customer_phone")).sendKeys(phone);
        driver.findElement(By.id("customer_email")).sendKeys(email);
        driver.findElement(By.id("customer_password")).sendKeys(password);
        new Select(driver.findElement(By.id("customer_address"))).selectByValue(address);
        new Select(driver.findElement(By.id("customer_daybir"))).selectByValue(day);
        new Select(driver.findElement(By.id("customer_monthbir"))).selectByValue(month);
        new Select(driver.findElement(By.id("customer_yearbir"))).selectByValue(year);
    }

    private void clickSubmitButton() {
        WebElement submitButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("btn-submit")));
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView({block: 'center', behavior: 'smooth'});", submitButton);
        try {
            submitButton.click();
        } catch (Exception e) {
            // Fallback: Use JavaScript to click if direct click fails
            ((JavascriptExecutor) driver).executeScript("arguments[0].click();", submitButton);
        }
        System.out.println("Submit button clicked successfully");
    }

    @After
    public void tearDown() throws InterruptedException {
        Thread.sleep(3000);
        driver.quit();
        System.out.println("After all tests");
    }
}