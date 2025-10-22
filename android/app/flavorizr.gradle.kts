import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.solid.principle.dev"
            resValue(type = "string", name = "app_name", value = "Dev App")
            resValue(type = "string", name = "variable_one", value = "example variable one")
            resValue(type = "string", name = "variable_two", value = "example variable two")
        }
        create("staging") {
            dimension = "flavor-type"
            applicationId = "com.solid.principle.staging"
            resValue(type = "string", name = "app_name", value = "Staging App")
            resValue(type = "string", name = "variable_one", value = "example variable one")
            resValue(type = "string", name = "variable_two", value = "example variable two")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.solid.principle"
            resValue(type = "string", name = "app_name", value = "Prod App")
            resValue(type = "string", name = "variable_one", value = "example variable one")
            resValue(type = "string", name = "variable_two", value = "example variable two")
        }
    }
}