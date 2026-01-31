class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.105"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.105/workmux-darwin-arm64.tar.gz"
      sha256 "565569075ef3fc51a9f615806f4603d1e6797aacccf19a639e82a61a79ff7aa5"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.105/workmux-darwin-amd64.tar.gz"
      sha256 "224f21674366c691208a00e3c663d5f850dc2dd1720c0b07f217f3cd0ec20f6a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.105/workmux-linux-arm64.tar.gz"
      sha256 "ba3f66fa686f102528f4e3730fbe385e0f569b3e1b42cd3f6f76f90ee330eda4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.105/workmux-linux-amd64.tar.gz"
      sha256 "b94b28219cf1de8b01c199ba2622e1b01c85f3d85608d2e236fc179fdb27e96b"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
