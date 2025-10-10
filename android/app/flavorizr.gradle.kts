import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.penh.delivery.dev"
            resValue(type = "string", name = "app_name", value = "Delivery Dev")
        }
        create("staging") {
            dimension = "flavor-type"
            applicationId = "com.penh.delivery.staging"
            resValue(type = "string", name = "app_name", value = "Delivery Staging")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.penh.delivery"
            resValue(type = "string", name = "app_name", value = "Delivery Prod")
        }
    }
}