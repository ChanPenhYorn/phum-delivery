import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.phum.delivery.dev"
            resValue(type = "string", name = "app_name", value = "Delivery Dev")
            resValue(type = "string", name = "variable_one", value = "example variable one")
            resValue(type = "string", name = "variable_two", value = "example variable two")
        }
        create("staging") {
            dimension = "flavor-type"
            applicationId = "com.phum.delivery.staging"
            resValue(type = "string", name = "app_name", value = "Delivery Staging")
            resValue(type = "string", name = "variable_one", value = "example variable one")
            resValue(type = "string", name = "variable_two", value = "example variable two")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.phum.delivery"
            resValue(type = "string", name = "app_name", value = "Delivery")
            resValue(type = "string", name = "variable_one", value = "example variable one")
            resValue(type = "string", name = "variable_two", value = "example variable two")
        }
    }
}