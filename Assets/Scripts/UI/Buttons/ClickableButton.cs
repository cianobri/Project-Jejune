using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class ClickableButton : MonoBehaviour, IPointerEnterHandler, IPointerDownHandler
{
    AudioSource audioSource;

    UIAudio uiAudio;
    float mOverVolumeScale = 0.2f;

    void Start()
    {
        uiAudio = AudioManager.instance.uiAudioClips;   
        audioSource = AudioManager.instance.GetComponent<AudioSource>();
    }
    public void OnMouseOverAudio()
    {
        audioSource.volume = mOverVolumeScale*AudioManager.instance.masterVolume;
        if (uiAudio.mouseOverClip != null)
        {
            audioSource.PlayOneShot(uiAudio.mouseOverClip);
        }

    }
    public void OnMouseClickAudio()
    {
        audioSource.volume = AudioManager.instance.masterVolume;
        if (uiAudio.mouseClickClip != null)
        {
            audioSource.PlayOneShot(uiAudio.mouseClickClip);
        }
    }
    public void OnPointerDown(PointerEventData eventData)
    {
        OnMouseClickAudio();
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        // Your mouse-over behavior goes here
        OnMouseOverAudio();
    }
}
