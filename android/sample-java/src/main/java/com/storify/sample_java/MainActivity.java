package com.storify.sample_java;

import android.content.Context;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.widget.LinearLayout;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.storify.android_sdk.EventListener;
import com.storify.android_sdk.StorifyMe;
import com.storify.android_sdk.network.model.Story;
import com.storify.android_sdk.ui.view.StoriesView;

import java.util.List;
import java.util.Map;

@SuppressWarnings("FieldCanBeLocal")
public class MainActivity extends AppCompatActivity {
    private final int WIDGET_ID_1 = 5628;
    private final int WIDGET_ID_2 = 6452;
    private final String TAG = MainActivity.class.getName();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // initialize StorifyMe SDK
        StorifyMe.Companion.init(MainActivity.this, "a92e4e01-b5f5-4a80-bada-916af596e1ab", "storify");

        // attach listener to get notified on various events and actions
        StorifyMe.instance.setEventListener(new EventListener() {
            @Override
            public void onAction(@NonNull String type, @NonNull Object slide, @NonNull String action) {
                Log.d(TAG, "onLoad() ");
            }

            @Override
            public void onEvent(@NonNull String event, @NonNull Map<String, ?> data) {
                Log.d(TAG, "onEvent() ");
            }

            @Override
            public void onFail(@NonNull Exception e) {
                Log.d(TAG, "onFail() ");
            }

            @Override
            public void onLoad(@NonNull List<Story> list) {
                Log.d(TAG, "onLoad() ");
            }

            @Override
            public void onStoryClosed(@NonNull Story story) {
                Log.d(TAG, "onStoryClosed() ");
            }

            @Override
            public void onStoryOpened(@NonNull Story story, int index) {
                Log.d(TAG, "onStoryOpened() ");
            }
        });

        // initialize view
        StoriesView storiesView = findViewById(R.id.storiesView);

        // set widgetId for stories widget (REQUIRED!)
        storiesView.setWidgetId(WIDGET_ID_1);

        // customize view in code (optional)
        storiesView.setStoryBorderColor(Color.RED);
        storiesView.setStoryBorderSize(10);
        storiesView.setStoryTextColor(Color.CYAN);
        storiesView.setWidgetBackgroundColor(Color.GREEN);

        // load data from server
        storiesView.load();

        // Add storiesView widget programmatically
        LinearLayout main = findViewById(R.id.main);
        StoriesView storiesView1 = new StoriesView(MainActivity.this);
        storiesView1.setWidgetId(WIDGET_ID_2);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, toDpi(MainActivity.this, 150));
        storiesView1.setLayoutParams(layoutParams);
        main.addView(storiesView1);
        storiesView1.load();
    }

    private static int toDpi(Context context, int px) {
        return (int) (context.getResources().getDisplayMetrics().density * px);
    }
}