//
//  BabyModel.swift
//  InfantoryApp
//
//  Created by Gilbert Nicholas on 06/04/21.
//

import Foundation

struct BabyUser {
    private(set) var name: String
    private(set) var photo: String
    private(set) var gender: String
}

//DUMMY GROWTH

public struct growthModel {
    var month : Int
    var intro : String
    var description : String
    
    static func generateDummy() -> [growthModel] {
        return [growthModel(month: 0 , intro: "Hello Mom, Thank you for bring me to this beautiful world! You are the best mom ever!", description: "Mom, during the first month i am very sensitive to voices. That's one of the reasons that makes me hard to sleep and awake easily. I also getting better in breastfeeding. Mom, i am still holding my fist tight at this moment" ),growthModel(month: 1, intro: "Hello Mom, Thank you for bring me to this beautiful world! You are the best mom ever!", description: "Mom, during the first month i am very sensitive to voices. That's one of the reasons that makes me hard to sleep and awake easily. I also getting better in breastfeeding. Mom, i am still holding my fist tight at this moment because i am so happy to meet you! Mom, i can see faces too, soon i will recognize you right away in every time i see you"), growthModel(month: 2, intro: "Mom, I am now 2 months old! Time sure flies really fast! Thank you for the past one month in taking care of me in the best way possible!", description: "Mom, now i can recognize your face right away! I am also able to bob my head when i am in sitting position. Mom, i can show you a bit of my expression too, like smiling a bit. Mom i can also un-fist my hand for 50% of time now. I am able to grow this well because of you, I love you Mom!"), growthModel(month: 3, intro: "3 months old! Yeay Mom! You did a very good job in taking care of me and i will always be grateful for it.", description: "I can roll to side now Mom! so make sure you already prepare pillow beside me. At this month i can lift my hands to my mouth and reach for faces. I am getting stronger and muscular!"), growthModel(month: 4, intro: "I am 4 month old now! I am so happy Mom to be with you. Mom even though i can't speak yet you have to know that i love you so much!", description: "I can move more freely now! Rolls  front  to back and sit with trunk support! At this month my hands supposed to be open most of the time. If i still can't open my hands yet please bring me to pediatricians Mom! Now, I am very loud too since i love to play with rattle! I also love to vocalizes alone now however all of this is normal Mom! "), growthModel(month: 5, intro: "I am 5 month old now! Thank you so much Mom for all the pretty things that you gave to me and all of the love you pour sincerely!", description: "I know you! Yes, i can recognize you Mom! Finally, i know that you love me and i am really attached to you Mom. This month, i begin to respond when you call my name if i am not, then it is okay I am still learning Mom. Now, i can say Aaah or Goo and express my anger with sounds too instead of crying."), growthModel(month: 6, intro: "Mom, I love you so much! This 6 months is not going to be great without you by my side! Thank you very much for taking care of me even though i cried a lot!", description: "Mom, Who is this?! I don't know! Mom, now i can differ between someone i am familiar with and stranger! I can feed myself cracker now Mom! I am such a good baby right Mom! Let me learn to feed myself! I love to play with toys and shake them too! My waist is getting stronger and now i am able to sit for momentarily!"), growthModel(month: 7, intro: "Mom, i am 7 month old now! Yes, I am so happy to be with you Mom! ", description: "In this month, i can sit steadily! Yes i am now strong enough to support myself sitting. If i am not Don't worry Mom and just take me  to pediatrician. I can refuse foodif my belly is full Mom. I can react  when i hear music since i already know what music is! When i need help i wind my toys or my hand to ask for help! So, please be there for me Mom when i need you! I love you!"), growthModel(month: 8, intro: "Mom, I am 8 month old! Yeah Mom, this month i start the phase of echolalia (repetition of phrases or noises). Thank you so much Mom for always saying nice things to me so that i can learn little by little to get to know more phrases!", description: "Mom, i can crawl now! look! i can hold bottle or spoon steadily too! Yet, this month i love to finger feeds so make sure you put away anything that fit my mouth so that i don't eat them! Mom, i am able to show you when i am happy and upset now! I am happy with you Mom! can you see that in my face? I am feel a bit upset if my pampers is full, can you see my expression? chuckle... chuckle..."), growthModel(month: 9, intro: "9 months old! Look at how far we've come, Mom! Thank you so much for your love and support!", description: "This song changed the way I saw things, things that didn't seem like much before, now are the strongest memories. Every time I heard it, more meaning has for me."), growthModel(month: 10, intro: "I am turning 10 months old! Yes, I am so happy to be with you, Mom!  Thank you for being there for me when I get scared of certain things!", description: "Look, Mom! I can now learn to walk if you hold both of my hands! I still need help to stand so simply hold one of my hands and support me. I can cruise around the furniture and poke on things! I can drink from a child cup and wave goodbye! I will also be able to say Dada and I hope Daddy will appear when I do so because I also love playing peek-a-boo!"), growthModel(month: 11, intro: "Mom, I love you so much! The past 11 months wouldn't be great without you by my side! Thank you very much for taking care of me even though I like to throw objects and behave rudely sometimes!", description: "Mom, I can walk with one hand held now! I can stand on my own for a few seconds too! I am able to cooperate when you dress me and will let you know when I need help! I can stir with a spoon and look at pictures in a book! I will stop when you tell me No but please be patient with me if I don't. I'm still learning after all. I will bounce to music and vocalize to songs too! "), growthModel(month: 12, intro: "12 months! Woohoo! Thank you for teaching me so much and for all the love you pour sincerely, Mom! I love you so much, Mom!", description: "I can now stand well with arms high and legs splayed, Mom! I can take independent steps! I can show objects to you to share my interest and point to objects that I want to have! I can follow your one-step commands! I am also able to hold crayons, scribble, take off my own hat and finger feed part of my meal but before that, make sure to command me to wash my hands before each meal, okay Mom?")
            ]
    }
}
