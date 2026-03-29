class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.161"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.161/workmux-darwin-arm64.tar.gz"
      sha256 "77e4d9491aa8197ddbd4e832e94395db5f9e8bc2801f48da3e2398802e612091"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.161/workmux-darwin-amd64.tar.gz"
      sha256 "d98c9cdea02301f012ca322e4f03d1477e3279e5b553064f4d50fdaa85c5159e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.161/workmux-linux-arm64.tar.gz"
      sha256 "2f53a9a46f9543796168fbbbdf1df83d0e12fe92ee6e1619763905e34f88b2bf"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.161/workmux-linux-amd64.tar.gz"
      sha256 "d86e3fd6f3bb1c5ab58d14c98718680fa3d6d1361f2103a648cda64b6055a49d"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
