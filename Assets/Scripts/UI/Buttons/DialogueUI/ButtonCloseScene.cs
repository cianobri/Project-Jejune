﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class ButtonCloseScene : MonoBehaviour
{
    public void CloseScene()
    {
        GameManager.instance.currentGameState = GameManager.GameState.Exploration;
        SceneManager.UnloadSceneAsync(gameObject.scene.name);
    }
}
