public class Main {
    public static void main(String[] args) {
        Product[] products = {
            ProductFactory.createProduct(101, "Laptop", "Electronics"),
            ProductFactory.createProduct(102, "Shirt", "Clothing"),
            ProductFactory.createProduct(103, "Book", "Stationary")
        };

        SearchUtil searcher = SearchUtil.getInstance();

        System.out.println("Linear Search: " + searcher.linearSearch(products, "Shirt"));
        System.out.println("Binary Search: " + searcher.binarySearch(products, "Book"));
    }
}