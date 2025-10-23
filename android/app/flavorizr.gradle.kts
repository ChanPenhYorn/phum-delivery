import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.phum.delivery.dev"
            resValue(type = "string", name = "app_name", value = "Delivery Dev")
            resValue(type = "string", name = "FB_APP_ID", value = "1984193062357342")
            resValue(type = "string", name = "FB_CLIENT_TOKEN", value = "9174ded99feec83cdd0167fd8d554294")
            resValue(type = "string", name = "CLIENT_ID", value = "677667737775-8tltf5h299sros5moi98ubneof3jon3r.apps.googleusercontent.com")
        }
        create("staging") {
            dimension = "flavor-type"
            applicationId = "com.phum.delivery.staging"
            resValue(type = "string", name = "app_name", value = "Delivery Staging")
            resValue(type = "string", name = "FB_APP_ID", value = "1984193062357342")
            resValue(type = "string", name = "FB_CLIENT_TOKEN", value = "9174ded99feec83cdd0167fd8d554294")
            resValue(type = "string", name = "CLIENT_ID", value = "677667737775-bc73uf4hkn2b580qhcorfffk235uvk0t.apps.googleusercontent.com")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.phum.delivery"
            resValue(type = "string", name = "app_name", value = "Delivery")
            resValue(type = "string", name = "FB_APP_ID", value = "1984193062357342")
            resValue(type = "string", name = "FB_CLIENT_TOKEN", value = "9174ded99feec83cdd0167fd8d554294")
            resValue(type = "string", name = "CLIENT_ID", value = "677667737775-kh26ij3r554hk9at5gmtb73r0fpprtoh.apps.googleusercontent.com")
        }
    }
}