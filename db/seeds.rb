10.times do |magic|
  Magic.create!(
    title:"#{magic} Bananas",
    body:"MAny bannansa and more abandasns."
  )
end

puts "10 portfolios created."

5.times do |lassy|
  Skill.create!(title:"#{lassy}",
  percent_utilized:"10")
end

puts "5 portfolios created."

8.times do |lassy|
  Portfolio.create!(
    subtitle:"#{lassy}",
    body:"Kopplye janes and marty.",
    main_image:"http://placehold.it/800x600",
    thumb_image:"http://placehold.it/200x100"
    )
end

puts "8 portfolios created."