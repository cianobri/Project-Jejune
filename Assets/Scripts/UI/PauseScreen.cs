using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.SceneManagement;

public class PauseScreen : MonoBehaviour
{

    bool isPaused = false;
    [SerializeField] string pauseScreenSceneName = "PauseScreen";
    public static PauseScreen instance;
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

    void Start()
    {
        KeyInputParser.instance.pauseScreenPressed.AddListener(TogglePause);
    }

    void TogglePause()
    {
        isPaused = !isPaused;

        if (isPaused)
        {
            PauseGame();
        }
        else
        {
            ResumeGame();
        }
    }

    void PauseGame()
    {
        if (GameManager.instance.currentGameState == GameManager.GameState.Exploration)
        {
            GameManager.instance.currentGameState = GameManager.GameState.Paused;
            Time.timeScale = 0f; // Stop time
            isPaused = true;
            LoadPauseScreen();
        }
    }

    public void ResumeGame()
    {
        if (GameManager.instance.currentGameState == GameManager.GameState.Paused)
        {
            GameManager.instance.currentGameState = GameManager.GameState.Exploration;
            Time.timeScale = 1f; // Resume time
            isPaused = false;
            UnloadPauseScreen();
        }
    }

    void LoadPauseScreen()
    {
        if (!SceneManager.GetSceneByName(pauseScreenSceneName).isLoaded)
        {
            SceneManager.LoadSceneAsync(pauseScreenSceneName, LoadSceneMode.Additive);
        }
    }

    void UnloadPauseScreen()
    {
        if (SceneManager.GetSceneByName(pauseScreenSceneName).isLoaded)
        {
            SceneManager.UnloadSceneAsync(pauseScreenSceneName);
        }
    }
}
