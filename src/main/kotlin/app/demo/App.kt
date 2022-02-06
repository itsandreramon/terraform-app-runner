package app.demo

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@SpringBootApplication
class App {

	@GetMapping
	fun index(): String {
		return "Hello world!"
	}
}

fun main(args: Array<String>) {
	runApplication<App>(*args)
}
