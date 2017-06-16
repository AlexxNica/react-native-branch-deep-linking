package io.branch.rnbranch;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import android.content.Context;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import javax.annotation.Nullable;

/**
 * Created by jdee on 6/7/17.
 */

public class RNBranchConfig {
    private JSONObject mConfiguration = null;
    public static final String TAG = "RNBranchConfig";

    public RNBranchConfig(Context context) {
        try {
            BufferedReader reader = null;
            try {
                reader = new BufferedReader(new InputStreamReader(context.getAssets().open("branch.json")));
            } catch (FileNotFoundException e) {
                return;
            }

            StringBuilder builder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                builder.append(line);
            }

            mConfiguration = new JSONObject(builder.toString());
        }
        catch (IOException e) {
            Log.e(TAG, "Error loading branch.json: " + e.getMessage());
        }
        catch (JSONException e) {
            Log.e(TAG, "Error parsing branch.json: " + e.getMessage());
        }
    }

    @Nullable
    public Object get(String key) {
        if (mConfiguration == null) return null;

        try {
            return mConfiguration.get(key);
        }
        catch (JSONException exception) {
            Log.e(TAG, "Error parsing branch.json: " + exception.getMessage());
            return null;
        }
    }

    public boolean getDebugMode() {
        if (mConfiguration == null) return false;

        try {
            return mConfiguration.getBoolean("debugMode");
        }
        catch (JSONException exception) {
            Log.e(TAG, "Error parsing branch.json: " + exception.getMessage());
            return false;
        }
    }
}