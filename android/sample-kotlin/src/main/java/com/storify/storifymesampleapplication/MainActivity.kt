package com.storify.storifymesampleapplication

import android.content.Context
import android.graphics.Color
import android.os.Bundle
import android.util.Log
import android.widget.LinearLayout
import androidx.appcompat.app.AppCompatActivity
import com.storify.android_sdk.EventListener

import com.storify.android_sdk.StorifyMe
import com.storify.android_sdk.local.Config
import com.storify.android_sdk.network.model.Story
import com.storify.android_sdk.ui.view.StoriesView

@Suppress("PrivatePropertyName")
class MainActivity : AppCompatActivity() {
    private val WIDGET_ID_1 = 5628
    private val WIDGET_ID_2 = 6452
    private val TAG = this::class.java.name

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // initialize StorifyMe SDK
        StorifyMe.init(
            context = this,
            apiKey = "a92e4e01-b5f5-4a80-bada-916af596e1ab",
            accountId = "storify"
        )

        // attach listener to get notified on various events and actions
        StorifyMe.instance.eventListener = object : EventListener() {
            override fun onLoad(stories: List<Story>) {
                Log.d(TAG, "onLoad() ${stories.joinToString()}")
            }

            override fun onFail(exception: Exception) {
                Log.d(TAG, "onFail() ${exception.message}")
            }

            override fun onStoryOpened(story: Story, index: Int) {
                Log.d(TAG, "onStoryOpened() $story : index: $index")
            }

            override fun onStoryClosed(story: Story) {
                Log.d(TAG, "onStoryClosed() $story")
            }

            override fun onAction(type: String, slide: Any, action: String) {
                Log.d(TAG, "onAction() - type: $type - slide: $slide - action: $action")
            }

            override fun onEvent(event: String, data: Map<String, Any>) {
                Log.d(TAG, "onEvent() - event: $event - data: $data")
            }
        }

        // initialize view
        val storiesView = findViewById<StoriesView?>(R.id.storiesView).apply {
            // set widgetId for stories widget (REQUIRED!)
            this.widgetId = WIDGET_ID_1
        }

        // customize view in code (optional)
        storiesView.also {
            it.storyBorderColor = Color.RED
            it.storyBorderSize = 10
            it.storyTextColor = Color.CYAN
            it.widgetBackgroundColor = Color.GREEN
        }

        // construct params to send as query parameters
        val config = Config.Builder()
            .setSegments(arrayListOf("vip", "man"))
            .setQueryParameter("param1", "holiday")
            .setQueryParameter("param2", "vacation")
            .build()

        // inject additional params
        storiesView.config = config

        // load data from server
        storiesView.load()


        /**
         * Add widget programmatically
         */
        findViewById<LinearLayout>(R.id.main).also {
            val storiesView = StoriesView(this).apply {
                this.widgetId = WIDGET_ID_2
                layoutParams =
                    LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        this@MainActivity.toDpi(150)
                    )
            }
            it.addView(storiesView)
            storiesView.load()
        }
    }

    private fun Context.toDpi(size: Int): Int {
        return resources.displayMetrics.density.toInt() * size
    }
}