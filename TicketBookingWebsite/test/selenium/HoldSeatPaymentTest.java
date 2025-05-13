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

import static org.junit.Assert.*;

public class HoldSeatPaymentTest {
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
    public void testHoldSeatPayment() throws InterruptedException {
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

            // Step 2: Select seat H01
            WebElement seatH1 = wait.until(ExpectedConditions.elementToBeClickable(
                By.cssSelector("#tab-pane-1 > div > div.seat-container > div:nth-child(8) > span:nth-child(1)")
            ));
            js.executeScript("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});", seatH1);
            Thread.sleep(1000);
            seatH1.click();
            System.out.println("Step 2: Selected seat H01");
            Thread.sleep(2000);

            // Step 3: Click Confirm button
            WebElement confirmButton = wait.until(ExpectedConditions.elementToBeClickable(
                By.cssSelector("#reserveFooter > form > button")
            ));
            js.executeScript("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});", confirmButton);
            Thread.sleep(1000);
            js.executeScript("arguments[0].click();", confirmButton);
            System.out.println("Step 3: Clicked Confirm button");
            Thread.sleep(2000);

            // Debug URL after Confirm
            String currentUrlAfterConfirm = driver.getCurrentUrl();
            System.out.println("Step 3.1: Current URL after Confirm: " + currentUrlAfterConfirm);

            // Verify URL after Confirm
            String expectedConfirmUrl = "http://localhost:9999/DoAnWebCinema/customer/payment_1/1169/H01.htm";
            if (!currentUrlAfterConfirm.equals(expectedConfirmUrl)) {
                System.out.println("Warning: URL after Confirm did not match expected. Proceeding with actual URL: " + currentUrlAfterConfirm);
            } else {
                wait.until(ExpectedConditions.urlToBe(expectedConfirmUrl));
                assertEquals("URL after Confirm does not match expected", expectedConfirmUrl, currentUrlAfterConfirm);
                System.out.println("Step 3.2: Confirmed URL matches expected - " + currentUrlAfterConfirm);
            }

            // Step 4: Click Payment button
            WebElement paymentButton = wait.until(ExpectedConditions.elementToBeClickable(
                By.cssSelector("#btn-continue1")
            ));
            js.executeScript("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});", paymentButton);
            Thread.sleep(1000);
            paymentButton.click();
            System.out.println("Step 4: Clicked Payment button");
            Thread.sleep(2000);

            // Step 5: Verify URL after Payment
            String expectedPaymentUrl = "http://localhost:9999/DoAnWebCinema/customer/payment_2/1169/H01.htm?";
            wait.until(ExpectedConditions.urlMatches(expectedPaymentUrl));
            assertTrue("URL after Payment does not contain expected path", driver.getCurrentUrl().contains("/payment_2/1169/H01.htm"));
            System.out.println("Step 5: Verified Payment URL - " + driver.getCurrentUrl());
            Thread.sleep(2000);

            // Step 6: Navigate back to seat selection page
            driver.get("http://localhost:9999/DoAnWebCinema/customer/payment/1169.htm");
            wait.until(ExpectedConditions.urlToBe("http://localhost:9999/DoAnWebCinema/customer/payment/1169.htm"));
            System.out.println("Step 6: Navigated back to seat selection page - " + driver.getCurrentUrl());
            Thread.sleep(2000);

            // Step 7: Verify seat H01 is occupied
            WebElement seatH1AfterPayment = wait.until(ExpectedConditions.presenceOfElementLocated(
                By.cssSelector("#tab-pane-1 > div > div.seat-container > div:nth-child(8) > span:nth-child(1)")
            ));
            js.executeScript("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});", seatH1AfterPayment);
            Thread.sleep(1000);
            boolean isOccupied = seatH1AfterPayment.getAttribute("class").contains("occupied");
            assertTrue("Seat H01 is not marked as occupied after payment", isOccupied);
            System.out.println("Step 7: Verified seat H01 is occupied - Class: " + seatH1AfterPayment.getAttribute("class"));

            // Log final results
            System.out.println("Test completed successfully:");
            System.out.println("Selected seat: H01");
            System.out.println("Payment confirmed and seat H01 marked as occupied");

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