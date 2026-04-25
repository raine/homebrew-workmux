class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.187"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.187/workmux-darwin-arm64.tar.gz"
      sha256 "bb5dde188eb346c0b9f9181ad8da7aca2180c35ca8aa217b8167866ee2522667"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.187/workmux-darwin-amd64.tar.gz"
      sha256 "f0be27cf3de1a19b959939f0f3c22273d9e70f8326a2e0c49e29585f66b1dbf1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.187/workmux-linux-arm64.tar.gz"
      sha256 "35ba315d2f9d6348198ec6be58d38cc8714f9797ae8003d6c56fe0b61063ff3d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.187/workmux-linux-amd64.tar.gz"
      sha256 "d9a67f85d8cc9c017143dea23b10afc16c0f4c043ab6270bf1564236bdc8523f"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
