class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.112"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.112/workmux-darwin-arm64.tar.gz"
      sha256 "e4a05d15ea2461eec75c1fbef8c43e302c24bb3cfe630287dbad0006f1282728"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.112/workmux-darwin-amd64.tar.gz"
      sha256 "88f97ef4e101e07ff7a25d5ede457e3902cc6fd60342e461ce31c50cb74a856a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.112/workmux-linux-arm64.tar.gz"
      sha256 "1f58832b86813c8b98fe0022de59c14b56bfd8237da15f0c7f94f01e9d4ef755"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.112/workmux-linux-amd64.tar.gz"
      sha256 "43cee3c61aa4ea2d6ea45858d035dff28cbd7e134826ef568d0242f028ebe649"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
