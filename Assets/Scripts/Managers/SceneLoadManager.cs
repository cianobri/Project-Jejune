using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
public class SceneLoadManager : MonoBehaviour
{
    public static SceneLoadManager instance;

    [SerializeField] string sceneLoadName = "SceneLoad"; // Name of the scene with the black canvas to hide loading.
    [SerializeField] float transitionHoldTimeSec = 0.2f;
    Vector3 playerPosition;
    Vector3 playerRotation;

    Scene sceneToUnload;
    Scene playerScene;
    
    Coroutine sceneChangeCoroutine;
    bool sceneChanging;

    string sceneNameToLoad;
    public string activeSceneName; // Set when the scene are successfully loaded.
    bool playerIsActive = true;

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

    public void LoadNewScene(Scene oldScene, string newSceneName, Vector3 position, Vector3 rotation, bool playerSceneActive)
    {
        
        sceneToUnload = oldScene;
        sceneNameToLoad = newSceneName;
        playerPosition = position;
        playerRotation = rotation;
        playerIsActive = playerSceneActive;



        if (sceneChanging)
        {
            StopCoroutine(sceneChangeCoroutine);
        }

        sceneChangeCoroutine = StartCoroutine(StartSceneChange());
        sceneChanging = true;
    }

    IEnumerator StartSceneChange()
    {

        GameManager.instance.currentGameState = GameManager.GameState.Loading;

        // Remove the graph.
        var data = AstarPath.active.astarData;
		var sceneGraph = data.gridGraph;
		if (sceneGraph != null)
		{
			data.RemoveGraph(sceneGraph);
		}

        AsyncOperation asyncLoad = SceneManager.LoadSceneAsync(sceneLoadName, LoadSceneMode.Additive);

        while (!asyncLoad.isDone)
        {
            yield return null;
        }

        //yield return new WaitForSeconds(transitionHoldTimeSec);
        Scene playerScene = SceneManager.GetSceneByName("PlayerScene");
        if (playerScene.isLoaded)
        {
            Player.instance.gameObject.SetActive(false);
        }
        
        StartCoroutine(UnloadSceneAsync());
    }

    IEnumerator UnloadSceneAsync()
    {

        if (sceneToUnload != null && sceneToUnload.isLoaded)
        {
            
            AsyncOperation asyncUnload = SceneManager.UnloadSceneAsync(sceneToUnload.name);
            while (!asyncUnload.isDone)
            {
                yield return null;
            }
        }
        // Load the new scene additively
        StartCoroutine(LoadSceneAdditive());
    }

    IEnumerator LoadSceneAdditive()
    {
        
        AsyncOperation asyncLoad = SceneManager.LoadSceneAsync(sceneNameToLoad, LoadSceneMode.Additive);

        while (!asyncLoad.isDone)
        {
            yield return null;
        }

        // Load the AStar graph.s
		TextAsset asset = Resources.Load("AStarGraphs/" + sceneNameToLoad) as TextAsset;
        
		if (asset != null)
		{
			AstarPath.active.astarData.DeserializeGraphs(asset.bytes);
		} else
		{
			Debug.Log("WARNING: Graph asset is null.");
		}

        // New scene is now loaded, enable player and set position.
        Scene playerScene = SceneManager.GetSceneByName("PlayerScene");

        if (playerIsActive)
        {
            if (!playerScene.isLoaded)
            {
                AsyncOperation asyncLoadPlayer = SceneManager.LoadSceneAsync("PlayerScene", LoadSceneMode.Additive);
                while (!asyncLoadPlayer.isDone)
                {
                    yield return null;
                }
            }
            // We've checked that the scene is active.
            Player.instance.gameObject.SetActive(true);


            if (playerPosition != null && playerRotation != null)
            {
                Player.instance.transform.position = playerPosition;
                Player.instance.transform.rotation = Quaternion.Euler(playerRotation);
            }
            
        }

        //yield return new WaitForSeconds(transitionHoldTimeSec);
        AsyncOperation asyncUnload = SceneManager.UnloadSceneAsync(sceneLoadName);

        while (!asyncUnload.isDone)
        {
            yield return null;
        }

        MouseInputParser.instance.Refresh();
        activeSceneName = sceneNameToLoad;
        GameManager.instance.currentGameState = GameManager.GameState.Exploration;
        sceneChanging = false;
    }
}
