/** @type {import('next').NextConfig} */
const nextConfig = {
  // Enable standalone output for Docker optimization
  output: 'standalone',

  // Optimize images
  images: {
    unoptimized: true, // Disable for Docker builds
  },

  // Experimental features
  experimental: {
    // Enable server components
    serverComponentsExternalPackages: [],
  },

  // Environment variables
  env: {
    NEXT_TELEMETRY_DISABLED: '1',
  },

  // Skip ESLint during `next build` for CI/docker builds
  eslint: {
    ignoreDuringBuilds: true,
  },

  // Webpack configuration
  webpack: (config, { isServer }) => {
    // Add any custom webpack configuration here
    return config;
  },
}

module.exports = nextConfig
