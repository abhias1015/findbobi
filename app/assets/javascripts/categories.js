const categoriesData = [
  {
    id:0,
    name: 'Restaurants',
    image:'restaurants.jpeg'
  },
  {
    id:1,
    name: 'Stays',
    image:'stays.jpeg'
  },
  {
    id:2,
    name: 'Doctors',
    image:'doctors.jpeg'
  },
  {
    id:3,
    name: 'Beauty Salons',
    image:'salons.jpeg'
  },
  {
    id:4,
    name: 'Groceries',
    image:'groceries.jpeg'
  },
  {
    id:5,
    name: 'Lawyers',
    image:'lawyers.jpeg'
  },
  
]

const printCategories = (category, catCount) => {
  for (data in category) {
    const categoryData = category[data]
      document.querySelector('.category-row.row-'+catCount).innerHTML += `
        <a class="category-card" style="background: linear-gradient(180deg, rgba(0, 0, 0, 0) 54.69%, rgba(0, 0, 0, 0.4) 100%), url('assets/${categoryData.image}')">
          <span class="category-card-text">${categoryData.name}</span>
        </a>
      `
    }
  }

const setCategories = ( categories ) => {
  let catCount = 0
  while(categories.length){
    catCount++
    const catArrays = categories.splice(0,3)   
    document.querySelector('.home-category-list').innerHTML += `<div class="category-row row-${catCount}"></div>`
    printCategories(catArrays, catCount)
  }
}

setCategories(categoriesData)
