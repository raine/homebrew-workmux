class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.27-test"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.27-test/aarch64-apple-darwin.tar.gz"
      sha256 "912db745f17869e5aa3ad30c1014d8a95663c8a60d9e3bb1de294a876a2199c6"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.27-test/x86_64-apple-darwin.tar.gz"
      sha256 "80d0eef462a1b5fcdc45e6ee0b0d354eca57c2df2f4ebf279a3f7b7f372d9a0e"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.27-test/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cafb419732003a2edcc559483ab581f47766cf1866e847a96300c93b433c5757"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/workmux --version")
  end
end
