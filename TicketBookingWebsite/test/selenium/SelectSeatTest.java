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
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertEquals;

public class SelectSeatTest {
    private WebDriver driver;
    private WebDriverWait wait;
    private JavascriptExecutor js;

    @Before
    public void setUp() {
        driver = new ChromeDriver();
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        js = (JavascriptExecutor) driver;
        driver.manage().window().maximize();
        driver.get("http://localhost:9999/DoAnWebCinema/customer/payment/1169.htm");
        System.out.println("Before each test - Browser opened and navigated to payment page");
    }

    @Test
    public void testSelectSeatsAndVerifyPrice() throws InterruptedException {
        try {
            // Step 1: Handle login if not already logged in
            boolean isLoggedIn = false;
            try {
                WebElement userName = wait.until(ExpectedConditions.presenceOfElementLocated(
                    By.cssSelector(".top_1r a[href='customer/account.htm']")));
                if (userName.isDisplayed()) {
                    isLoggedIn = true;
                    System.out.println("Step 1: User already logged in, proceeding to seat selection");
                }
            } catch (Exception e) {
                System.out.println("Step 1: User not logged in, performing login");
            }

            if (!isLoggedIn) {
                WebElement emailField = wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.name("email")));
                WebElement passwordField = wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.name("password")));
                WebElement submitButton = wait.until(ExpectedConditions.elementToBeClickable(
                    By.name("submit")));

                emailField.sendKeys("nguyenquockhoa5549@gmail.com");
                passwordField.sendKeys("05032003");
                submitButton.click();
                System.out.println("Step 1: Login completed");
                Thread.sleep(2000);
            }

            // Step 2: Select seat A1
            WebElement seatA1 = wait.until(ExpectedConditions.elementToBeClickable(
                By.cssSelector("#tab-pane-1 > div > div.seat-container > div:nth-child(1) > span:nth-child(1)")
            ));
            js.executeScript("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});", seatA1);
            Thread.sleep(1000); // Delay to observe scroll
            seatA1.click();
            System.out.println("Step 2: Selected seat A1");
            Thread.sleep(2000); // Delay after selection

            // Step 3: Select seat E6
            WebElement seatE6 = wait.until(ExpectedConditions.elementToBeClickable(
                By.cssSelector("#tab-pane-1 > div > div.seat-container > div:nth-child(5) > span:nth-child(6)")
            ));
            js.executeScript("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});", seatE6);
            Thread.sleep(1000); // Delay to observe scroll
            seatE6.click();
            System.out.println("Step 3: Selected seat E6");
            Thread.sleep(2000); // Delay after selection

            // Step 4: Verify total price
            WebElement totalPriceElement = wait.until(ExpectedConditions.visibilityOfElementLocated(
                By.id("totalPrice")
            ));
            String totalPriceText = totalPriceElement.getText().trim();
            System.out.print("Tổng tiền: " + totalPriceText);
            assertEquals("Total price does not match expected value", "85500 VNĐ", totalPriceText);
            System.out.println("Step 4: Total price verified - " + totalPriceText);

            // Step 5: Click Confirm button
            WebElement confirmButton = wait.until(ExpectedConditions.elementToBeClickable(
                By.cssSelector("#reserveFooter > form > button")
            ));
            js.executeScript("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});", confirmButton);
            Thread.sleep(1000);
            confirmButton.click();
            System.out.println("Step 5: Clicked Confirm button");
            Thread.sleep(2000);

            // Log final results
            System.out.println("Test completed successfully:");
            System.out.println("Selected seats: A1, E6");
            System.out.println("Total price: " + totalPriceText);

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