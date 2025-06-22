import java.util.Arrays;
import java.util.Comparator;

public class SearchUtil {
    private static SearchUtil instance = null;

    private SearchUtil() {}

    public static SearchUtil getInstance() {
        if(instance == null) {
            instance = new SearchUtil();
        }
        return instance;
    }

    public static Product linearSearch(Product[] products, String name) {
        for(Product p: products) {
            if(p.getProductName().equalsIgnoreCase(name)) {
                return p;
            }
        }
        return null;
    }

    public static Product binarySearch(Product[] products, String name) {
        Arrays.sort(products, Comparator.comparing(Product:: getProductName));

        int left = 0, right = products.length -1;
        while(left <= right) {
            int mid = (left + right) / 2;
            int comparing = products[mid].getProductName().compareToIgnoreCase(name);

            if(comparing == 0) return products[mid];
            else if (comparing < 0) left = mid + 1;
            else right = mid - 1;
        }
        return null;
    }
}