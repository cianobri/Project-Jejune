using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using UnityEngine.SceneManagement;
public class SaveSystem : MonoBehaviour
{
    public static SaveSystem instance;
    private void Awake() 
    { 
        if (instance != null && instance != this) 
        { 
            Destroy(gameObject); 
        } 
        else 
        { 
            instance = this; 
        } 
        
    }

    [System.Serializable]
    public class SaveData
    {
        public PlayerData playerData;
        public SceneData sceneData;
        public string inkStoryState;
    }

    [System.Serializable]
    public class PlayerData
    {
        public Vector3 position;
        public Vector3 rotation;
    }

    [System.Serializable]
    public class SceneData
    {
        public string sceneName;
    }

    public void SaveGame(string saveFileName)
    {
        SaveData saveData = new SaveData();

        if (Player.instance != null)
        {
            // Player info.
            saveData.playerData = new PlayerData
            {
                position = Player.instance.transform.position,
                rotation = Player.instance.transform.rotation.eulerAngles
            };
        }
        else
        {
            Debug.Log("Player is null, save failed!");
            return;
        }

        // Scene info.
        saveData.sceneData = new SceneData
        {
            sceneName = SceneLoadManager.instance.activeSceneName
        };

        // Ink story state
        saveData.inkStoryState = InkManager.instance.story.state.ToJson();

        // Convert saveData to JSON
        string saveJson = JsonUtility.ToJson(saveData);

        // Save data to a file
        SaveToFile(saveFileName + "_saveData.json", saveJson);
    }


    private void SaveToFile(string fileName, string data)
    {
        string filePath = Path.Combine(Application.persistentDataPath, fileName);

        try
        {
            File.WriteAllText(filePath, data);
            Debug.Log("Saved data to: " + filePath);
        }
        catch (System.Exception e)
        {
            Debug.LogError("Failed to save data: " + e.Message);
        }
    }

    public void LoadGame(string saveFileName)
    {
        // Load data from a file
        string filePath = Path.Combine(Application.persistentDataPath, saveFileName);
        string saveJson = LoadFromFile(filePath + "_saveData.json");
        if (!string.IsNullOrEmpty(saveJson))
        {
            // Convert JSON to SaveData
            SaveData saveData = JsonUtility.FromJson<SaveData>(saveJson);
            Scene currentScene = SceneManager.GetSceneByName(SceneLoadManager.instance.activeSceneName);
            // Apply Ink story state
            if (!string.IsNullOrEmpty(saveData.inkStoryState))
            {
                InkManager.instance.story.state.LoadJson(saveData.inkStoryState);
            }
            SceneLoadManager.instance.LoadNewScene(currentScene, saveData.sceneData.sceneName, saveData.playerData.position, saveData.playerData.rotation, true);
        } else
        {
            Debug.Log("JSON is empty?");
        }
    }

    private string LoadFromFile(string fileName)
    {
        string filePath = Path.Combine(Application.persistentDataPath, fileName);

        if (File.Exists(filePath))
        {
            try
            {
                return File.ReadAllText(filePath);
            }
            catch (System.Exception e)
            {
                Debug.LogError("Failed to load data: " + e.Message);
            }
        }

        return null;
    }
}