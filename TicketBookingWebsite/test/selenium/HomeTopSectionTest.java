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

public class HomeTopSectionTest {

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
    
    //Test case 1: Kiểm tra nút mở trang profile
    @Test
    public void testDisplayProfileLinkAfterLogin() {
        driver.get("http://localhost:9999/DoAnWebCinema/login.htm");
        WebElement emailField = wait.until(ExpectedConditions.visibilityOfElementLocated(By.name("email")));
        WebElement passwordField = driver.findElement(By.name("password"));
        WebElement submitButton = driver.findElement(By.name("submit"));

        emailField.sendKeys("nguyenquockhoa5549@gmail.com");
        passwordField.sendKeys("05032003");
        submitButton.click();

        wait.until(ExpectedConditions.urlContains("/trangchu.htm"));

        WebElement profileLink = wait.until(ExpectedConditions.visibilityOfElementLocated(
                By.cssSelector("#top > div > div > div.col-md-4 > div > p > a")));

        assertTrue("Profile link should be displayed", profileLink.isDisplayed());
        assertTrue("Profile link should contain user name", profileLink.getText().trim().length() > 0);
        assertTrue("Profile link should go to account page", profileLink.getAttribute("href").contains("customer/account.htm"));

        profileLink.click();
        wait.until(ExpectedConditions.urlContains("/customer/account.htm"));
        assertTrue("Should navigate to profile page", driver.getCurrentUrl().contains("/customer/account.htm"));
    }

    
    //Test case 2: Kiểm tra thanh tìm kiếm
    @Test
    public void testSearchBarFunctionality() {
    	
        WebElement searchForm = wait.until(ExpectedConditions.presenceOfElementLocated(
                By.cssSelector("#top > div > div > div.col-md-5 > div > form")));
        WebElement searchInput = driver.findElement(By.cssSelector("#top > div > div > div.col-md-5 > div > form > input"));

        assertTrue("Search form should be present", searchForm.isDisplayed());
        assertTrue("Search form action should end with '/DoAnWebCinema/search.htm'",
                searchForm.getAttribute("action").endsWith("/DoAnWebCinema/search.htm"));

        assertTrue("Search input should be present", searchInput.isDisplayed());
        assertEquals("Search input placeholder should be 'Search...'", 
                "Search...", searchInput.getAttribute("placeholder"));

        searchInput.sendKeys("mai");
        searchForm.submit();

        wait.until(ExpectedConditions.urlContains("/login.htm"));

        WebElement emailField = wait.until(ExpectedConditions.visibilityOfElementLocated(By.name("email")));
        WebElement passwordField = driver.findElement(By.name("password"));
        WebElement submitButton = driver.findElement(By.name("submit"));

        emailField.sendKeys("nguyenquockhoa5549@gmail.com");
        passwordField.sendKeys("05032003");
        submitButton.click();

        wait.until(ExpectedConditions.urlContains("/film/detail/ma=13.htm"));

        WebElement searchResults = wait.until(ExpectedConditions.presenceOfElementLocated(
                By.cssSelector("body > div.detail-movie-container > div > div.product--name > h3")));
        assertTrue("Search results should be displayed", searchResults.isDisplayed());
    }

    @After
    public void tearDown() throws InterruptedException {
        Thread.sleep(3000);
        driver.quit();
        System.out.println("After all tests");
    }
}