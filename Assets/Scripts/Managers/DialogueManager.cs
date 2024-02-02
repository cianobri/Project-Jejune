using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class DialogueManager : MonoBehaviour
{
    [SerializeField] string dialogueSceneName = "Dialogue";

    string currentInkName;

    public static DialogueManager instance;
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

    public void OnEnable()
    {
        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    public void OnDisable()
    {
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }

    void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        if (scene.name == dialogueSceneName)
        {
            // Set the ink manager to the right dialogue.
            InkManager.instance.GoToKnot(currentInkName);
        }
    }

    public void EnableDialogueWindow()
    {
        SceneManager.LoadScene(dialogueSceneName, LoadSceneMode.Additive);
    }

    public void EnableAndSetDialogue(string inkName)
    {
        currentInkName = inkName;
        SceneManager.LoadScene(dialogueSceneName, LoadSceneMode.Additive);
    }

    public void DisableDialogueWindow()
    {
        SceneManager.UnloadSceneAsync(dialogueSceneName);
    }
}
