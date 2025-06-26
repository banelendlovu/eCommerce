# Banele Ndlovu - Personal Website

A modern, responsive personal website built with HTML, CSS, and JavaScript. This website showcases Banele's professional experience, projects, and personal brand.

## Features

- **Responsive Design**: Works perfectly on desktop, tablet, and mobile devices
- **Modern UI/UX**: Clean, professional design with smooth animations
- **Interactive Elements**: Hover effects, smooth scrolling, and dynamic navigation
- **Performance Optimized**: Fast loading with optimized code and debounced scroll events
- **Accessibility**: Semantic HTML and keyboard navigation support

## Sections

1. **Hero Section**: Eye-catching introduction with call-to-action buttons
2. **About Me**: Personal story and skills showcase
3. **Experience**: Professional timeline with company details
4. **Projects**: Portfolio of work (5 placeholder projects ready for your content)
5. **Blog**: Section for articles and insights (with Substack integration)
6. **Contact**: Multiple ways to get in touch

## Customization Guide

### Personal Information

Update the following in `index.html`:

1. **Email**: Replace `your.email@example.com` with your actual email
2. **Social Links**: Update the href attributes for LinkedIn, GitHub, and Substack
3. **Profile Picture**: Replace the placeholder icon with your actual photo

### Adding Your Projects

In the Projects section, replace the placeholder content:

```html
<div class="project-card">
    <div class="project-image">
        <!-- Add your project screenshot or icon -->
        <img src="path/to/project-image.jpg" alt="Project Name">
    </div>
    <div class="project-content">
        <h3>Your Project Name</h3>
        <p>Description of your project and the technologies used.</p>
        <div class="project-links">
            <a href="https://github.com/yourusername/project" class="project-link">
                <i class="fab fa-github"></i> Code
            </a>
            <a href="https://your-project-url.com" class="project-link">
                <i class="fas fa-external-link-alt"></i> Live
            </a>
        </div>
    </div>
</div>
```

### Adding Blog Posts

When you start writing blog posts, add them to the blog section:

```html
<div class="blog-card">
    <div class="blog-image">
        <!-- Add blog post thumbnail -->
        <img src="path/to/blog-image.jpg" alt="Blog Post Title">
    </div>
    <div class="blog-content">
        <h3>Your Blog Post Title</h3>
        <p>Brief excerpt from your blog post...</p>
        <span class="blog-date">January 15, 2024</span>
    </div>
</div>
```

### Styling Customization

The website uses a modern color scheme with:
- Primary Blue: `#2563eb`
- Gradient Backgrounds: Purple to blue gradients
- Accent Yellow: `#fbbf24`

To change colors, update the CSS variables in `styles.css`:

```css
:root {
    --primary-color: #2563eb;
    --accent-color: #fbbf24;
    --gradient-start: #667eea;
    --gradient-end: #764ba2;
}
```

## File Structure

```
Personal Website/
├── index.html          # Main HTML file
├── styles.css          # All CSS styles
├── script.js           # JavaScript functionality
└── README.md           # This file
```

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
- Mobile browsers

## Performance Features

- **Lazy Loading**: Images and content load as needed
- **Debounced Scroll Events**: Optimized performance on scroll
- **CSS Animations**: Hardware-accelerated animations
- **Minified Assets**: Ready for production optimization

## Deployment Options

### GitHub Pages (Free)
1. Create a GitHub repository
2. Upload your files
3. Go to Settings > Pages
4. Select source branch (usually `main`)
5. Your site will be available at `https://yourusername.github.io/repository-name`

### Netlify (Free)
1. Sign up for Netlify
2. Drag and drop your website folder
3. Get a custom URL instantly
4. Connect your custom domain

### Vercel (Free)
1. Sign up for Vercel
2. Connect your GitHub repository
3. Deploy automatically on every push

## SEO Optimization

The website includes:
- Semantic HTML structure
- Meta tags for social sharing
- Open Graph tags
- Structured data markup
- Fast loading times

## Analytics Integration

To add Google Analytics:

1. Get your tracking ID from Google Analytics
2. Add this script before the closing `</head>` tag:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_TRACKING_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_TRACKING_ID');
</script>
```

## Contact Information

Update these links in the contact section:
- **LinkedIn**: Your LinkedIn profile URL
- **GitHub**: Your GitHub profile URL
- **Substack**: Your Substack newsletter URL
- **Email**: Your email address

## Future Enhancements

Consider adding:
- Dark mode toggle
- Blog post search functionality
- Project filtering by technology
- Contact form with backend integration
- Newsletter signup
- Testimonials section
- Resume download option

## Support

If you need help customizing your website:
1. Check the HTML comments for guidance
2. Review the CSS classes for styling options
3. Modify the JavaScript for additional functionality

## License

This project is open source and available under the MIT License.

---

**Built with ❤️ for showcasing your professional journey** 