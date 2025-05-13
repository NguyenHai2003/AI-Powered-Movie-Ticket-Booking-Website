package selenium;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.junit.Assert.*;

public class HomeTopSelectionIsLoginTest {
	
    private WebDriver driver;
    private WebDriverWait wait;

    @Before
    public void setUp() {
        driver = new ChromeDriver();
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        driver.manage().window().maximize();
        driver.get("http://localhost:9999/DoAnWebCinema/");
        System.out.println("Before each test - Browser opened and navigated to login page");
    }
    
    // Test Case 1: Trường hợp chưa đăng nhập, Kiểm tra logo Tu Tru Cinema, nút Login, nút Register
    @Test
    public void testLogoDisplayAndButton() {
        WebElement logoLink = wait.until(ExpectedConditions.visibilityOfElementLocated(
                By.cssSelector("#top > div > div > div.col-md-3 > div > h3 > a")));
        
        assertTrue("Logo should be displayed", logoLink.isDisplayed());
        assertTrue("Logo text should contain 'Tu Tru Cinema'", 
                logoLink.getText().contains("Tu Tru Cinema"));
        assertEquals("Logo should link to homepage", "", logoLink.getAttribute("href"));

        logoLink.click();
        assertEquals("Should navigate to homepage", 
                "http://localhost:9999/DoAnWebCinema/", driver.getCurrentUrl());
        
        
        WebElement loginBtn = wait.until(ExpectedConditions.visibilityOfElementLocated(
                By.cssSelector("#top > div > div > div.col-md-4 > div > div > a:nth-child(2)")));
        assertTrue("Login button should be visible", loginBtn.isDisplayed());
        assertEquals("Login", loginBtn.getText().trim());

        WebElement registerBtn = wait.until(ExpectedConditions.visibilityOfElementLocated(
                By.cssSelector("#top > div > div > div.col-md-4 > div > div > a:nth-child(3)")));
        assertTrue("Register button should be visible", registerBtn.isDisplayed());
        assertEquals("Sign Up", registerBtn.getText().trim());

        loginBtn.click();
        wait.until(ExpectedConditions.urlContains("/login.htm"));
        assertTrue("Should navigate to login page", driver.getCurrentUrl().contains("/login.htm"));

        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        driver.navigate().back();
        wait.until(ExpectedConditions.urlToBe("http://localhost:9999/DoAnWebCinema/"));
        assertEquals("Should navigate back to homepage", 
                "http://localhost:9999/DoAnWebCinema/", driver.getCurrentUrl());

        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        registerBtn.click();
        wait.until(ExpectedConditions.urlContains("/register.htm"));
        assertTrue("Should navigate to register page", driver.getCurrentUrl().contains("/register.htm"));

        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    
    @After
    public void tearDown() throws InterruptedException {
        Thread.sleep(3000);
        driver.quit();
        System.out.println("After all tests");
    }

}
