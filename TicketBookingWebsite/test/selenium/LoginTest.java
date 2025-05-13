package selenium;

import java.time.Duration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.junit.Assert;

public class LoginTest {

    private WebDriver driver;
    private WebDriverWait wait;

    @Before
    public void setUp() {
        driver = new ChromeDriver();
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        driver.manage().window().maximize();
        driver.get("http://localhost:9999/DoAnWebCinema/login.htm");
        System.out.println("Before each test - Browser opened and navigated to login page");
    }

    //Test case 1: Login thành công
    @Test
    public void testLoginSuccess() {
    	
        WebElement emailField = driver.findElement(By.name("email"));
        WebElement passwordField = driver.findElement(By.name("password"));
        WebElement submitButton = driver.findElement(By.name("submit"));

        emailField.sendKeys("nguyenquockhoa5549@gmail.com");
        passwordField.sendKeys("05032003");
        submitButton.click();

        wait.until(ExpectedConditions.urlContains("/trangchu.htm"));

        try {
        	
            WebElement userProfile = wait.until(
                ExpectedConditions.visibilityOfElementLocated(
                    By.cssSelector(".top_1r a[href='customer/account.htm']")
                )
            );
            Assert.assertTrue("User profile link should be displayed", userProfile.isDisplayed());
            Assert.assertFalse("User name should not be empty", userProfile.getText().trim().isEmpty());

            //Kiểm tra navbar
            WebElement navMenu = driver.findElement(By.id("navbar_sticky"));
            Assert.assertTrue("Navigation menu should be displayed", navMenu.isDisplayed());
            
            //Kiểm tra 3 banner
            WebElement carousel = driver.findElement(By.id("carouselExampleCaptions"));
            Assert.assertTrue("Carousel banner should be displayed", carousel.isDisplayed());

            //Kiểm tra 6 phim hot
            WebElement latestMovies = driver.findElement(By.id("trend"));
            Assert.assertTrue("Latest Movies section should be displayed", latestMovies.isDisplayed());

            //Kiểm tra 6 sự kiện
            WebElement featuredEvents = driver.findElement(By.id("upcome"));
            Assert.assertTrue("Featured Events section should be displayed", featuredEvents.isDisplayed());

            //Kiểm tra danh mục phim
            WebElement movieCategories = driver.findElement(By.id("popular"));
            Assert.assertTrue("Movie Categories section should be displayed", movieCategories.isDisplayed());

            //Kiểm tra chân trang
            WebElement footer = driver.findElement(By.id("footer"));
            Assert.assertTrue("Footer should be displayed", footer.isDisplayed());

            //Kiểm tra chatbot
            WebElement chatboxIcon = driver.findElement(By.className("chatbox-icon"));
            Assert.assertTrue("Chatbox icon should be displayed", chatboxIcon.isDisplayed());

            System.out.println("All key elements verified successfully after login");

        } catch (Exception e) {
            System.err.println("Test failed: " + e.getMessage());
            Assert.fail("Failed to verify page elements: " + e.getMessage());
        }
    }
    
    //Test case 2: Login thất bại
    @Test
    public void testLoginFail() {
        WebElement emailField = driver.findElement(By.name("email"));
        WebElement passwordField = driver.findElement(By.name("password"));
        WebElement submitButton = driver.findElement(By.name("submit"));

        emailField.sendKeys("nguyenquockhoa5549@gmail.com");
        passwordField.sendKeys("05032002"); // Sai mật khẩu
        submitButton.click();

        System.out.println("Login submitted with incorrect credentials");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

        WebElement errorMsgGeneral = wait.until(ExpectedConditions.visibilityOfElementLocated(
            By.xpath("//div[contains(@style, 'color: red')]")));

        WebElement errorEmail = driver.findElement(By.id("errorEmail"));
        WebElement errorPassword = driver.findElement(By.id("errorPassword"));

        String errorGeneralText = errorMsgGeneral.getText().trim();
        String errorEmailText = errorEmail.getText().trim();
        String errorPasswordText = errorPassword.getText().trim();

        System.out.println("Error General: " + errorGeneralText);
        System.out.println("Error Email: " + errorEmailText);
        System.out.println("Error Password: " + errorPasswordText);

        boolean hasError = !errorGeneralText.isEmpty() ||
                           !errorEmailText.isEmpty() ||
                           !errorPasswordText.isEmpty();

        Assert.assertTrue("At least one error message should be displayed", hasError);

        String currentUrl = driver.getCurrentUrl();
        Assert.assertTrue("Should remain on login page after failed attempt", currentUrl.contains("/login.htm"));
    }

    @After
    public void tearDown() throws InterruptedException {
        Thread.sleep(3000);
        driver.quit();
        System.out.println("After all tests");
    }

}