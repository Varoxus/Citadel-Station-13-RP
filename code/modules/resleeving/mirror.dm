//////////////////////////////////////////////////////////////
////////////////////////Mirror Implants//////////////////////
////////////////////////////////////////////////////////////

/obj/item/implant/mirror
	name = "Mirror"
	desc = "A small implanted disk that stores a copy of ones conciousness, updated at times of rest."
	catalogue_data = /datum/category_item/catalogue/technology/resleeving
	icon = 'icons/vore/custom_items_vr.dmi'
	icon_state = "backup_implant"
	var/stored_mind = null

/obj/item/implant/get_data()
	var/dat = {"
<b>Implant Specifications:</b><BR>
<b>Name:</b> Galactic Immortality Initiative Mirror Implant<BR>
<b>Life:</b> Indefinite.<BR>
<b>Important Notes:</b> Implant updates when the user sleeps, or when manually done by an update chamber. Loss of implant complicates resleeving.<BR>
<HR>
<b>Implant Details:</b><BR>
<b>Function:</b> A self-contained disk that can store the conciousness of a living creature.<BR>
<b>Special Features:</b> Allows the user to transfer their mind to another body in the event of death, or the desire to change sleeves.<BR>
<b>Integrity:</b> Extremely sturdy, at risk of damage through sustained high frequency or direct energy attacks."}
	return dat

/obj/item/implant/mirror/post_implant(var/mob/living/carbon/human/H)
	if(istype(H))
		stored_mind = SStranscore.m_backup(H.mind, one_time = TRUE)

/obj/item/implant/mirror/afterattack(var/obj/machinery/computer/transhuman/resleeving/target, mob/user)
	target.active_mr = stored_mind
	. = ..()
