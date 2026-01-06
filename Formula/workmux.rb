class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.73"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.73/workmux-darwin-arm64.tar.gz"
      sha256 "45e171be39c8372daac1e7057408d84d4f1b1d3a759c0e7e5d1bc57da581e0f4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.73/workmux-darwin-amd64.tar.gz"
      sha256 "12148a3b3b023c820f901d9301b73e8de2bf50c6deefd7175c93d12deb0d107a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.73/workmux-linux-arm64.tar.gz"
      sha256 "741484096c28528743c9f5e76dbc166dad6690f267a78fb818ab680f25523153"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.73/workmux-linux-amd64.tar.gz"
      sha256 "af38da13850df99e390bcfd7f2d0da7c0fd657c2526c084b5ccd9fd273d8de88"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
