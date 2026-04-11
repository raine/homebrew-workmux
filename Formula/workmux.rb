class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.181"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.181/workmux-darwin-arm64.tar.gz"
      sha256 "47e4dd58d98627d190d3f8facae08d3c6546d6f0996a01f4b82d780379539956"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.181/workmux-darwin-amd64.tar.gz"
      sha256 "fe456657ac2d61b0301c1e94874a43d075710ed868e4b28698b1660725945182"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.181/workmux-linux-arm64.tar.gz"
      sha256 "87d33d62633cdee977ff6abf369049dbd21528392f1779fed8964951492fc85a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.181/workmux-linux-amd64.tar.gz"
      sha256 "746a976742633f31c3c454c327c2bddabfb7ecacbec2744775caec5aab6f0732"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
