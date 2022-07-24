import com.github.houbb.word.checker.util.EnWordCheckers;
import com.github.houbb.word.checker.util.ZhWordCheckers;
import com.github.houbb.word.checker.util.WordCheckers;
import java.nio.file.Paths;
import java.nio.file.Files;
import java.nio.file.Path;

public class fuzz_word_checker {
    public static void main(String[] args) throws Exception
    {
        Path path = Paths.get(args[0]);
        byte[] data = Files.readAllBytes(path);
        if(data.length == 0) {
            return;
        }

        System.out.println(new String(data));
        System.out.println(WordCheckers.isCorrect(new String(data)));
    }
}
