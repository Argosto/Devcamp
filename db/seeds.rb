3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

puts "3 Topics created."

10.times do |magic|
  Magic.create!(
    title:"#{magic} Bananas",
    body:"MAny bannansa and more abandasns.",
    topic_id: Topic.last.id
  )
end

puts "10 magics created."

5.times do |lassy|
  Skill.create!(title:"#{lassy}",
  percent_utilized:"10")
end

puts "5 portfolios created."

8.times do |lassy|
  Portfolio.create!(
    title:"Portfolio#{lassy}",
    subtitle:"Ruby on Rails",
    body:"Kopplye janes and marty.",
    main_image:"http://placehold.it/600x400",
    thumb_image:"http://placehold.it/250x200"
    )
end

1.times do |lassy|
  Portfolio.create!(
    title:"Portfolio#{lassy}",
    subtitle:"Angular",
    body:"Kopplye janes and marty.",
    main_image:"http://placehold.it/800x600",
    thumb_image:"http://placehold.it/200x100"
    )
end

puts "8 portfolios created."

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: 'Technology #{technology}',
 )
end

puts "3 technologies created"

