package selenium;

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

import java.time.Duration;

import static org.junit.Assert.assertTrue;

public class ShowtimeTest {
    private WebDriver driver;
    private WebDriverWait wait;
    private JavascriptExecutor js;

    @Before
    public void setUp() {
        driver = new ChromeDriver();
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        js = (JavascriptExecutor) driver;
        driver.manage().window().maximize();
        driver.get("http://localhost:9999/DoAnWebCinema/datve/2025-04-08.htm?chinhanh=1");
        System.out.println("Before each test - Browser opened and navigated to showtime page");
    }

    @Test
    public void testSpecificBranchDateAndShowtime() throws InterruptedException {
        try {
            // Step 1: Select branch "Tu Tru Cinema Tien Giang"
            WebElement branchSelect = wait.until(ExpectedConditions.visibilityOfElementLocated(
                By.cssSelector("#branch-select")));
            Select branchDropdown = new Select(branchSelect);
            
            boolean branchFound = false;
            for (WebElement option : branchDropdown.getOptions()) {
                if (option.getText().equals("Tu Tru Cinema Tien Giang")) {
                    branchDropdown.selectByVisibleText("Tu Tru Cinema Tien Giang");
                    branchFound = true;
                    break;
                }
            }
            assertTrue("Branch 'Tu Tru Cinema Tien Giang' not found", branchFound);
            
            System.out.println("Step 1: Branch selected");
            Thread.sleep(2000);
            
            wait.until(ExpectedConditions.stalenessOf(branchSelect));

            // Step 2: Select date "09/04/2025"
            WebElement showtimesList = wait.until(ExpectedConditions.visibilityOfElementLocated(
                By.id("showtimes-list")));
            
            WebElement dateButton = wait.until(ExpectedConditions.elementToBeClickable(
                By.cssSelector("#showtimes-list > a.btn.btn-light.WE.text-muted")
            ));
            
            String dateText = dateButton.getText();
            assertTrue("Date button doesn't show expected date", 
                dateText.contains("9/4") || dateText.contains("09/04") || dateText.contains("WE"));
            
            dateButton.click();
            System.out.println("Step 2: Date selected - " + dateText);
            Thread.sleep(2000);
            
            assertTrue("Date button doesn't contain expected date", 
                dateText.contains("9/4") || dateText.contains("09/04"));
            
            wait.until(ExpectedConditions.presenceOfElementLocated(
                By.cssSelector(".showtime-item")));

            // Step 3: Select a showtime with scrolling
            WebElement showtimeButton = wait.until(ExpectedConditions.elementToBeClickable(
                By.cssSelector("#home > div > div:nth-child(1) > div.col-md-8.col-8 > div > div > div:nth-child(1) > a")
            ));
            
            js.executeScript("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});", showtimeButton);
            Thread.sleep(1000);
            
            String showtimeText = showtimeButton.getText();
            showtimeButton.click();
            System.out.println("Step 3: Showtime selected - " + showtimeText);
            Thread.sleep(2000);

            // Step 4: Conditional login
            boolean isLoggedIn = false;
            try {
                // Check if user name element exists (indicating logged-in state)
                WebElement userName = wait.until(ExpectedConditions.presenceOfElementLocated(
                    By.cssSelector(".top_1r a[href='customer/account.htm']")));
                if (userName.isDisplayed()) {
                    isLoggedIn = true;
                    System.out.println("Step 4: User already logged in, skipping login");
                }
            } catch (Exception e) {
                // If user name element not found, assume not logged in
                System.out.println("Step 4: User not logged in, proceeding with login");
            }

            if (!isLoggedIn) {
                // Perform login
                WebElement emailField = wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.name("email")));
                WebElement passwordField = wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.name("password")));
                WebElement submitButton = wait.until(ExpectedConditions.elementToBeClickable(
                    By.name("submit")));

                emailField.sendKeys("nguyenquockhoa5549@gmail.com");
                passwordField.sendKeys("05032003");
                submitButton.click();
                System.out.println("Step 4: Login completed");
                Thread.sleep(2000);
            }

            // Step 5: Verify navigation to payment page
            wait.until(ExpectedConditions.urlContains("/payment/"));
            String currentUrl = driver.getCurrentUrl();
            assertTrue("Did not navigate to payment page", 
                currentUrl.contains("/DoAnWebCinema/customer/payment/"));
            
            System.out.println("Step 5: Navigated to payment page - " + currentUrl);
            Thread.sleep(2000);

            // Log final results
            System.out.println("Test completed successfully:");
            System.out.println("Selected branch: Tu Tru Cinema Tien Giang");
            System.out.println("Selected date: " + dateText);
            System.out.println("Selected showtime: " + showtimeText);

        } catch (Exception e) {
            System.err.println("Test failed: " + e.getMessage());
            throw e;
        }
    }

    @After
    public void tearDown() throws InterruptedException {
        Thread.sleep(3000);
        if (driver != null) {
            driver.quit();
        }
        System.out.println("After all tests");
    }
}