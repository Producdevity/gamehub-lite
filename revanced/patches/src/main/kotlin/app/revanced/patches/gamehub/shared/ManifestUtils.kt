package app.revanced.patches.gamehub.shared

import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Shared utility methods for safely mutating the AndroidManifest.xml Document.
 */
object ManifestUtils {
    /**
     * Safely collects and removes matching elements from a DOM Document to avoid concurrent
     * modification exceptions while iterating over live NodeLists.
     *
     * @param document The DOM Document to modify
     * @param tagNames List of element tag names to search for (e.g. "meta-data", "service")
     * @param predicate Lambda condition that returns true if the element should be removed
     */
    fun removeManifestTags(
        document: Document,
        tagNames: List<String>,
        predicate: (Element) -> Boolean
    ) {
        val tagsToRemove = mutableListOf<Element>()
        
        for (tagName in tagNames) {
            val elements = document.getElementsByTagName(tagName)
            for (i in 0 until elements.length) {
                val element = elements.item(i) as Element
                if (predicate(element)) {
                    tagsToRemove.add(element)
                }
            }
        }
        
        for (tag in tagsToRemove) {
            tag.parentNode.removeChild(tag)
        }
    }
}
