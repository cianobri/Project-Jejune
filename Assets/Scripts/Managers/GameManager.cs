using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
/**
Global class storing the state of the game.
**/

public class GameManager : MonoBehaviour
{
    public string defaultSceneName = "TestScene";

    public enum GameState
    {
        MainMenu,
        Dialogue,
        Loading,
        Paused,
        Exploration
    }

    public GameState currentGameState = GameState.Exploration;

    public static GameManager instance;
    private void Awake() 
    { 
        if (instance != null && instance != this) 
        { 
            Destroy(this); 
        } 
        else 
        { 
            instance = this; 
        } 
    }
    
    public bool DebugOn = true;
    

}
