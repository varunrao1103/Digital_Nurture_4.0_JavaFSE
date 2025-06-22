public class ProductFactory {
    public static Product createProduct(int productId, String productName, String category) {
        return new Product(productId, productName, category);
    }
}