import org.scalatest.FlatSpec

/**
 * @since 16/09/19
 */
class HelloWorldTest extends FlatSpec {

    "The BinaryTrainAUROC" should "match" in {
        withClue("BinaryTrainAUROC: ") {
            assertResult(0) {
                1
            }
        }
    }

}
